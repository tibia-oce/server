#include "otpch.h"

#include "chunk_spawn.h"
#include "game.h"
#include "monster.h"
#include "configmanager.h"
#include "events.h"

#include "pugicast.h"

extern ConfigManager g_config;
extern Monsters g_monsters;
extern Game g_game;
extern Events* g_events;

bool ChunkSpawns::loadFromXml(const std::string& filename, const Position& offset)
{
	spawnList.reserve(300);

	pugi::xml_document doc;
	pugi::xml_parse_result result = doc.load_file(filename.c_str());
	if (!result) {
		printXMLError("Error - Spawns::loadFromXml", filename, result);
		return false;
	}

	this->filename = filename;
	loaded = true;
	started = false;

	for (auto spawnNode : doc.child("spawns").children()) {
		Position centerPos(
			pugi::cast<uint16_t>(spawnNode.attribute("centerx").value()),
			pugi::cast<uint16_t>(spawnNode.attribute("centery").value()),
			pugi::cast<uint16_t>(spawnNode.attribute("centerz").value())
		);

		int32_t radius;
		pugi::xml_attribute radiusAttribute = spawnNode.attribute("radius");
		if (radiusAttribute) {
			radius = pugi::cast<int32_t>(radiusAttribute.value());
		}
		else {
			radius = -1;
		}

		if (!spawnNode.first_child()) {
			std::cout << "[Warning - Spawns::loadFromXml] Empty spawn at position: " << centerPos << " with radius: " << radius << '.' << std::endl;
			continue;
		}

		spawnList.emplace_back(centerPos);
		ChunkSpawn& spawn = spawnList.back();

		for (auto childNode : spawnNode.children()) {
			if (strcasecmp(childNode.name(), "monster") == 0) {
				pugi::xml_attribute nameAttribute = childNode.attribute("name");
				if (!nameAttribute) {
					continue;
				}

				Direction dir;

				pugi::xml_attribute directionAttribute = childNode.attribute("direction");
				if (directionAttribute) {
					dir = static_cast<Direction>(pugi::cast<uint16_t>(directionAttribute.value()));
				}
				else {
					dir = DIRECTION_NORTH;
				}

				Position pos(
					centerPos.x + pugi::cast<uint16_t>(childNode.attribute("x").value()) + offset.x,
					centerPos.y + pugi::cast<uint16_t>(childNode.attribute("y").value()) + offset.y,
					centerPos.z
				);
				spawn.addMonster(nameAttribute.as_string(), pos, dir);
			}
		}
	}
	return true;
}

void ChunkSpawns::startup(DungeonInstance* instance, uint8_t difficulty)
{
	if (!loaded || isStarted()) {
		return;
	}

	uint16_t count = 0;
	for (ChunkSpawn& spawn : spawnList) {
		spawn.startup(count, difficulty);
	}
	instance->setMonstersTotalCount(count);
	g_events->eventDungeonOnMonstersCount(instance, count);

	started = true;
}

void ChunkSpawns::clear()
{
	for (ChunkSpawn& spawn : spawnList) {
		spawn.cleanup();
	}

	spawnList.clear();

	loaded = false;
	started = false;
	filename.clear();
}

ChunkSpawn::~ChunkSpawn()
{
	for (chunkSpawnBlock_t& sb : spawnMap) {
		if (sb.monster) {
			sb.monster->decrementReferenceCounter();
		}

		for (int i = 0; i < sb.pack.size(); i++) {
			sb.pack[i]->decrementReferenceCounter();
		}
		sb.pack.clear();
	}
}

bool ChunkSpawn::spawnMonster(chunkSpawnBlock_t& sb, uint16_t& count, uint8_t difficulty)
{
	std::unique_ptr<Monster> monster_ptr(new Monster(sb.mType));
	monster_ptr->setDirection(sb.direction);
	if (!g_game.internalPlaceCreature(monster_ptr.get(), sb.pos, true)) {
		std::cout << "[Warning - ChunkSpawn::spawnMonster] Couldn't spawn monster \"" << monster_ptr->getName() << "\" on position: " << sb.pos << '.' << std::endl;
		return false;
	}

	sb.monster = monster_ptr.release();
	sb.monster->registerCreatureEvent("DungeonMonsterDeath");
	sb.monster->setDifficulty(difficulty);
	sb.monster->incrementReferenceCounter();
	count++;

	return true;
}

void ChunkSpawn::startup(uint16_t& count, uint8_t difficulty)
{
	if (spawned) return;

	spawnMap.shrink_to_fit();
	for (chunkSpawnBlock_t& sb : spawnMap) {
		spawnMonster(sb, count, difficulty);
	}

	spawned = true;
}

void ChunkSpawn::cleanup()
{
	for (chunkSpawnBlock_t& sb : spawnMap) {
		if (sb.monster) {
			if (sb.monster->isRemoved()) {
				sb.monster->decrementReferenceCounter();
				sb.monster = nullptr;
			}
			else {
				if (g_game.removeCreature(sb.monster)) {
					sb.monster->decrementReferenceCounter();
					sb.monster = nullptr;
				}
			}

			auto it = sb.pack.begin();
			while (it != sb.pack.end())
			{
				if ((*it)->isRemoved()) {
					(*it)->decrementReferenceCounter();
					it = sb.pack.erase(it);
				}
				else {
					if (g_game.removeCreature((*it))) {
						it = sb.pack.erase(it);
					}
					else {
						++it;
					}
				}
			}
		}
	}
}

bool ChunkSpawn::addMonster(const std::string& name, const Position& pos, Direction dir)
{
	MonsterType* mType = g_monsters.getMonsterType(name);
	if (!mType) {
		std::cout << "[Warning - ChunkSpawn::addMonster] Can not find " << name << std::endl;
		return false;
	}

	spawnMap.emplace_back(mType, 0, pos, dir);
	return true;
}