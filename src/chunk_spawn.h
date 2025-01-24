#ifndef FS_CHUNK_SPAWN
#define FS_CHUNK_SPAWN

#include "tile.h"
#include "position.h"
#include "spawn.h"
#include "dungeon.h"

class Monster;
class MonsterType;

struct chunkSpawnBlock_t {
	chunkSpawnBlock_t(MonsterType* mType, uint32_t interval, Position pos, Direction direction) :
		mType(mType), interval(interval), pos(std::move(pos)), direction(direction) {}

	// non-copyable
	chunkSpawnBlock_t(const chunkSpawnBlock_t&) = delete;
	chunkSpawnBlock_t& operator=(const chunkSpawnBlock_t&) = delete;

	// moveable
	chunkSpawnBlock_t(chunkSpawnBlock_t&& rhs) noexcept :
		monster(rhs.monster), mType(rhs.mType), lastSpawn(rhs.lastSpawn), interval(rhs.interval), pos(std::move(rhs.pos)), direction(rhs.direction) {
		rhs.monster = nullptr;
		rhs.mType = nullptr;
	}
	chunkSpawnBlock_t& operator=(const chunkSpawnBlock_t&&) = delete;

	Monster* monster = nullptr;
	std::vector<Monster*> pack;
	MonsterType* mType;
	int64_t lastSpawn = 0;
	uint32_t interval;
	Position pos;
	Direction direction;
};

class ChunkSpawn
{
public:
	ChunkSpawn(Position pos) : centerPos(std::move(pos)) {}
	~ChunkSpawn();

	// non-copyable
	ChunkSpawn(const ChunkSpawn&) = delete;
	ChunkSpawn& operator=(const ChunkSpawn&) = delete;

	// moveable
	ChunkSpawn(ChunkSpawn&& rhs) noexcept : spawnMap(std::move(rhs.spawnMap)),
		checkSpawnEvent(rhs.checkSpawnEvent), centerPos(std::move(rhs.centerPos)), interval(rhs.interval) {}
	ChunkSpawn& operator=(ChunkSpawn&& rhs) noexcept {
		if (this != &rhs) {
			spawnMap = std::move(rhs.spawnMap);
			checkSpawnEvent = rhs.checkSpawnEvent;
			centerPos = std::move(rhs.centerPos);
			interval = rhs.interval;
		}
		return *this;
	}

	void cleanup();

	bool addMonster(const std::string& name, const Position& pos, Direction dir);

	void startup(uint16_t& count, uint8_t difficulty);

private:
	std::vector<chunkSpawnBlock_t> spawnMap;
	uint64_t checkSpawnEvent = 0;

	Position centerPos;
	uint32_t interval = 60000;
	uint32_t spawnIndex = 0;
	bool spawned = false;

	bool spawnMonster(chunkSpawnBlock_t& sb, uint16_t& count, uint8_t difficulty = 1);
};

class ChunkSpawns
{
public:
	bool loadFromXml(const std::string& filename, const Position& pos);
	void startup(DungeonInstance* instance, uint8_t difficulty);
	void clear();

	bool isStarted() const {
		return started;
	}

private:
	std::vector<ChunkSpawn> spawnList;
	std::string filename;
	bool loaded = false;
	bool started = false;
};

#endif