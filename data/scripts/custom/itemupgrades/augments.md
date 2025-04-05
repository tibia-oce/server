I am using theforgottenserver (TFS) v1.42 for a custom tibia server.

I am trying to develop a lua script where i can declare an augment and apply it to an item, i need one for attack damage modifiers (i.e. '10% more death damage'), and another for defences (i.e.  'resistances').

```
local modifier = DamageModifier.makeModifier(
    DEFENSE_MODIFIER_RESIST,    -- Type: resist 
    PERCENT_MODIFIER,           -- Factor: percentage
    100,                        -- Chance: always apply
)
augment:addModifier(modifier)
item:addAugment(augment)
return item
```

I do not want to use the toml configuration at all. Can you draft a lua script for an item id '2000' where when it is used on another item, a defence augment at random is appplied to it.


Here is the source code for the augment class and the lua interface:
// src\augment.cpp

#include "augment.h"

Augment::Augment(std::string name, std::string description) : m_name(name), m_description(description) {
	
}

Augment::Augment(std::shared_ptr<Augment>& original) : m_name(original->m_name), m_description(original->m_description) {

    for (const auto& mod : original->m_attack_modifiers) {
        auto copiedMod = std::make_shared<DamageModifier>(*mod);
        m_attack_modifiers.push_back(copiedMod);
    }

    for (const auto& mod : original->m_defense_modifiers) {
        auto copiedMod = std::make_shared<DamageModifier>(*mod);
        m_defense_modifiers.push_back(copiedMod);
    }
}


std::vector<std::shared_ptr<DamageModifier>> Augment::getAttackModifiers(uint8_t modType) {
	std::vector<std::shared_ptr<DamageModifier>> modifiers;
	for (auto& mod : m_attack_modifiers) {

		if (mod->getType() == modType) {
			modifiers.emplace_back(mod);
		}
	}
	return modifiers;
}

std::vector<std::shared_ptr<DamageModifier>> Augment::getDefenseModifiers(uint8_t modType) {
	std::vector<std::shared_ptr<DamageModifier>> modifiers;
	for (auto& mod : m_defense_modifiers) {
		
		if (mod->getType() == modType) {
			modifiers.emplace_back(mod);
		}
	}
	return modifiers;
}

// src\augments.cpp
#include <toml++/toml.hpp>
#include <iostream>
#include <filesystem>
#include <fstream>

#include "augments.h"

static std::unordered_map<std::string, std::shared_ptr<Augment>> global_augments {};

std::shared_ptr<Augment> Augments::MakeAugment(std::string_view augmentName)
{
    auto it = global_augments.find(augmentName.data());

    if (it != global_augments.end()) {
        auto augmentClone = Augment::MakeAugment(it->second);
        return augmentClone;
    }
    std::cout << "Failed to find augment named : " << augmentName;
    return nullptr;
}

void Augments::loadAll() {
    for (const auto& entry : std::filesystem::recursive_directory_iterator(path)) {
        if (entry.is_regular_file() && entry.path().extension() == ".toml") {

            try {

                auto file = toml::parse_file(entry.path().string());

                for (const auto& [index, entry] : file) {

                    toml::table augment_info = *entry.as_table();
                    auto modifier_data = augment_info["modifiers"];
                    std::string name = augment_info["name"].value_or("unknown");
                    std::string description = augment_info["description"].value_or("unknown");

                    if (name == "unknown") {
                        std::cout << "Error: All augments require a name \n";
                        break;
                    }
                    std::shared_ptr<Augment> augment = Augment::MakeAugment(name);
                    augment->setDescription(description);
                    if (auto mod_list = modifier_data.as_array()) {
                        mod_list->for_each([augment, name](auto&& prop) {
                            if (prop.is_table()) {
                                auto& table = *prop.as_table();
                                std::string_view modType =          table["mod"].value_or("none");
                                uint16_t amount =                   table["value"].value_or(0);
                                std::string_view factor =           table["factor"].value_or("none");
                                uint8_t chance =                    table["chance"].value_or(100);
                                std::string_view damageType =       table["damage"].value_or("none");
                                std::string_view originType =       table["origin"].value_or("none");
                                std::string_view creatureType =     table["target"].value_or("none");
                                std::string_view race =             table["race"].value_or("none");
                                std::string_view creatureName =     table["monster"].value_or("none");

                                // To-do: Change all static methods used below to accept const values and use const variables above.
                                // also change the 'Get' methods into 'parse' methods for clarity
                                if (ParseStance(modType) == ATTACK_MOD) {

                                    std::shared_ptr<DamageModifier> damage_modifier = DamageModifier::makeModifier(
                                        ParseStance(modType),
                                        ParseAttackModifier(modType),
                                        amount,
                                        ParseFactor(factor),
                                        chance,
                                        ParseDamage(damageType),
                                        ParseOrigin(originType),
                                        ParseCreatureType(creatureType),
                                        ParseRaceType(race));

                                    // To-do : create a new variable for storing monster names to not conflict with other aux variables
                                    if (modType == "conversion") {
                                        auto convertedType = ParseDamage(table["toDamage"].value_or("none"));
                                        damage_modifier->setTransformDamageType(convertedType);
                                    }

                                    if (creatureName != "none") {
                                        damage_modifier->setCreatureName(creatureName);
                                    }

                                    augment->addModifier(damage_modifier);

                                } else if (ParseStance(modType) == DEFENSE_MOD) {

                                    std::shared_ptr<DamageModifier> damage_modifier = DamageModifier::makeModifier(
                                        ParseStance(modType),
                                        ParseDefenseModifier(modType),
                                        amount,
                                        ParseFactor(factor),
                                        chance,
                                        ParseDamage(damageType),
                                        ParseOrigin(originType),
                                        ParseCreatureType(creatureType),
                                        ParseRaceType(race));

                                    if (modType == "reform") {
                                        auto reformType = ParseDamage(table["toDamage"].value_or("none"));
                                        damage_modifier->setTransformDamageType(reformType);
                                    }

                                    if (creatureName != "none") {
                                        damage_modifier->setCreatureName(creatureName);
                                    }

                                    augment->addModifier(damage_modifier);

                                } else {

                                    std::cout << "Modifier has unknown stance " << table["stance"] << "\n";
                                }
                            }
                        });
                    }
                    AddAugment(augment);
                }
            } catch (const toml::parse_error& err) {
                std::cerr << "Error parsing file " << entry.path() << ": " << err << "\n";
            }
        }
    }
}

void Augments::clearAll()
{
    global_augments.clear();
}

void Augments::reload()
{
    clearAll();
    loadAll();
    // if (config::deleteOldAugments) { CleanPlayerAugments(); }
}

const ModifierStance Augments::ParseStance(std::string_view modName) noexcept
{
    if (ParseAttackModifier(modName) != ATTACK_MODIFIER_NONE) {
        return ATTACK_MOD;
    } else if (ParseDefenseModifier(modName) != DEFENSE_MODIFIER_NONE) {
        return DEFENSE_MOD;
    }
    std::cout << "[::Augment Error::] no such mod by type name : " << std::string{ modName } << " /n";
    return NO_MOD;
}

const ModFactor Augments::ParseFactor(std::string_view factor) noexcept
{
    std::string f_type = std::string{ factor };
    if (f_type == "flat") {
        return FLAT_MODIFIER;
    }
    return PERCENT_MODIFIER;
}

const CombatType_t Augments::ParseDamage(std::string_view damageName) noexcept
{   // Note : If you add values to the list you must increase the size manually
    // current size is : 21
    const std::array<std::pair<std::string_view, CombatType_t>, 21> static_map{ {
        {"none",            COMBAT_NONE},
        {"all",             COMBAT_NONE},
        {"physical",        COMBAT_PHYSICALDAMAGE},
        {"melee",           COMBAT_PHYSICALDAMAGE},
        {"energy",          COMBAT_ENERGYDAMAGE},
        {"electric",        COMBAT_ENERGYDAMAGE},
        {"earth",           COMBAT_EARTHDAMAGE},
        {"poison",          COMBAT_EARTHDAMAGE},
        {"fire",            COMBAT_FIREDAMAGE},
        {"lifedrain",       COMBAT_LIFEDRAIN},
        {"lifesteal",       COMBAT_LIFEDRAIN},
        {"lifeleech",       COMBAT_LIFEDRAIN},
        {"manadrain",       COMBAT_MANADRAIN},
        {"manasteal",       COMBAT_MANADRAIN},
        {"manaleech",       COMBAT_MANADRAIN},
        {"drown",           COMBAT_DROWNDAMAGE},
        {"water",           COMBAT_DROWNDAMAGE},
        {"ice",             COMBAT_ICEDAMAGE},
        {"holy",            COMBAT_HOLYDAMAGE},
        {"death",           COMBAT_DEATHDAMAGE},
        {"curse",           COMBAT_DEATHDAMAGE},
    } };

    for (const auto& [key, value] : static_map) {
        if (key == damageName) {
            return value;
        }
    }

    return COMBAT_NONE;
}

const CombatOrigin Augments::ParseOrigin(std::string_view originName) noexcept
{   // Note : If you add values to the list you must increase the size manually
    // current size is : 14
    const std::array<std::pair<std::string_view, CombatOrigin>, 14> static_map{ {
        {"none",            ORIGIN_NONE},
        {"all",             ORIGIN_NONE},
        {"condition",       ORIGIN_CONDITION},
        {"spell",           ORIGIN_SPELL},
        {"melee",           ORIGIN_MELEE},
        {"ranged",          ORIGIN_RANGED},
        {"absorb",          ORIGIN_ABSORB},
        {"restore",         ORIGIN_RESTORE},
        {"reflect",         ORIGIN_REFLECT},
        {"deflect",         ORIGIN_DEFLECT},
        {"ricochet",        ORIGIN_RICOCHET},
        {"piercing",        ORIGIN_PIERCING},
        {"augment",         ORIGIN_AUGMENT},
        {"imbuement",       ORIGIN_IMBUEMENT},
    } };

    for (const auto& [key, value] : static_map) {
        if (key == originName) {
            return value;
        }
    }

    return ORIGIN_NONE;
}

const ModifierAttackType Augments::ParseAttackModifier(std::string_view modName) noexcept {
    // Note : If you add values to the list you must increase the size manually
    // current size is : 8
    const std::array<std::pair<std::string_view, ModifierAttackType>, 8> static_map{ {
        {"none",            ATTACK_MODIFIER_NONE},
        {"lifesteal",       ATTACK_MODIFIER_LIFESTEAL},
        {"manasteal",       ATTACK_MODIFIER_MANASTEAL},
        {"staminasteal",    ATTACK_MODIFIER_STAMINASTEAL},
        {"soulsteal",       ATTACK_MODIFIER_SOULSTEAL},
        {"critical",        ATTACK_MODIFIER_CRITICAL},
        {"piercing",        ATTACK_MODIFIER_PIERCING},
        {"conversion",      ATTACK_MODIFIER_CONVERSION},
    } };

    for (const auto& [key, value] : static_map) {
        if (key == modName) {
            return value;
        }
    }

    return ATTACK_MODIFIER_NONE;
}

const ModifierDefenseType Augments::ParseDefenseModifier(std::string_view modName) noexcept
{   // Note : If you add values to the list you must increase the size manually
    // current size is : 10
    const std::array<std::pair<std::string_view, ModifierDefenseType>, 10> static_map{ {
        {"none",            DEFENSE_MODIFIER_NONE},
        {"absorb",          DEFENSE_MODIFIER_ABSORB},
        {"restore",         DEFENSE_MODIFIER_RESTORE},
        {"replenish",       DEFENSE_MODIFIER_REPLENISH},
        {"revive",          DEFENSE_MODIFIER_REVIVE},
        {"reflect",         DEFENSE_MODIFIER_REFLECT},
        {"deflect",         DEFENSE_MODIFIER_DEFLECT},
        {"ricochet",        DEFENSE_MODIFIER_RICOCHET},
        {"resist",          DEFENSE_MODIFIER_RESIST},
        {"reform",          DEFENSE_MODIFIER_REFORM},
    } };

    for (const auto& [key, value] : static_map) {
        if (key == modName) {
            return value;
        }
    }

    return DEFENSE_MODIFIER_NONE;
}


const RaceType_t Augments::ParseRaceType(std::string_view raceType) noexcept {
    // Note : If you add values to the list you must increase the size manually
    // current size is : 6
    const std::array<std::pair<std::string_view, RaceType_t>, 6> static_map{ {
        {"none",            RACE_NONE},
        {"venom",           RACE_VENOM},
        {"blood",           RACE_BLOOD},
        {"undead",          RACE_UNDEAD},
        {"fire",            RACE_FIRE},
        {"energy",          RACE_ENERGY},
    } };

    for (const auto& [key, value] : static_map) {
        if (key == raceType) {
            return value;
        }
    }

    return RACE_NONE;
}

const CreatureType_t Augments::ParseCreatureType(std::string_view creatureType) noexcept {
    // Note : If you add values to the list you must increase the size manually
    // current size is : 14
    const std::array<std::pair<std::string_view, CreatureType_t>, 14> static_map{ {
        {"player",                      CREATURETYPE_PLAYER},
        {"monster",                     CREATURETYPE_MONSTER},
        {"npc",                         CREATURETYPE_NPC},
        {"allsummon",                   CREATURETYPE_SUMMON_ALL},
        {"summons",                     CREATURETYPE_SUMMON_ALL},
        {"ownedsummon",                 CREATURETYPE_SUMMON_OWN},
        {"mysummon",                    CREATURETYPE_SUMMON_OWN},
        {"hostilesummon",               CREATURETYPE_SUMMON_HOSTILE},
        {"enemysummon",                 CREATURETYPE_SUMMON_HOSTILE},
        {"guildsummon",                 CREATURETYPE_SUMMON_GUILD},
        {"partysummon",                 CREATURETYPE_SUMMON_PARTY},
        {"boss",                        CREATURETYPE_BOSS},
        {"none",                        CREATURETYPE_ATTACKABLE},
        {"all",                         CREATURETYPE_ATTACKABLE},
    } };

    for (const auto& [key, value] : static_map) {
        if (key == creatureType) {
            return value;
        }
    }

    return CREATURETYPE_ATTACKABLE;
}

void Augments::AddAugment(std::shared_ptr<Augment> augment) {
    auto [it, inserted] = global_augments.try_emplace(augment->getName().data(), augment);
    if (!inserted) {
        std::cout << "[Warning][Augments] " << augment->getName() << " already exists! \n";
    }
}

void Augments::RemoveAugment(std::shared_ptr<Augment> augment) {
    auto it = global_augments.find(augment->getName().data());
    if (it != global_augments.end()) {
        global_augments.erase(it);
    }
}

void Augments::RemoveAugment(std::string_view augName) {
    auto it = global_augments.find(std::string(augName));
    if (it != global_augments.end()) {
        global_augments.erase(it);
    }
}

void Augments::RemoveAugment(std::string augName) {
    auto it = global_augments.find(augName);
    if (it != global_augments.end()) {
        global_augments.erase(it);
    }
}

std::shared_ptr<Augment> Augments::GetAugment(std::string_view augName)
{
    auto it = global_augments.find(augName.data());
    if (it != global_augments.end()) {
        auto augment = Augment::MakeAugment(it->second);
        return augment;
    }
    return nullptr;
}


// src\luascript.cpp
registerClass("Augment", "", LuaScriptInterface::luaAugmentCreate);
registerMetaMethod("Augment", "__eq", LuaScriptInterface::luaUserdataCompare);
registerMethod("Augment", "setName", LuaScriptInterface::luaAugmentSetName);
registerMethod("Augment", "setDescription", LuaScriptInterface::luaAugmentSetDescription);
registerMethod("Augment", "getName", LuaScriptInterface::luaAugmentGetName);
registerMethod("Augment", "getDescription", LuaScriptInterface::luaAugmentGetDescription);
registerMethod("Augment", "addDamageModifier", LuaScriptInterface::luaAugmentAddDamageModifier);
registerMethod("Augment", "removeDamageModifier", LuaScriptInterface::luaAugmentRemoveDamageModifier);
registerMethod("Augment", "getAttackModifiers", LuaScriptInterface::luaAugmentGetDefenseModifiers);
registerMethod("Augment", "getDefenseModifiers", LuaScriptInterface::luaAugmentGetDefenseModifiers);
registerMethod("Item", "addAugment", LuaScriptInterface::luaItemAddAugment);
registerMethod("Item", "removeAugment", LuaScriptInterface::luaItemRemoveAugment);
registerMethod("Item", "isAugmented", LuaScriptInterface::luaItemIsAugmented);
registerMethod("Item", "hasAugment", LuaScriptInterface::luaItemHasAugment);
registerMethod("Item", "getAugments", LuaScriptInterface::luaItemGetAugments);

int LuaScriptInterface::luaDamageModifierCreate(lua_State* L)
{	// To-do : DamageModifier(DamageModifier)
	// DamageModifier(stance, type, value, percent/flat, chance, combatType, originType, creatureType, race)
	auto stance = getNumber<ImbuementType>(L, 2);
	auto modType = getNumber<uint8_t>(L, 3);
	auto amount = getNumber<uint16_t>(L, 4);
	auto factor = getNumber<ModFactor>(L, 5);
	auto chance = getNumber<uint8_t>(L, 6);
	auto combatType = getNumber<CombatType_t>(L, 7, COMBAT_NONE);
	auto originType = getNumber<CombatOrigin>(L, 8, ORIGIN_NONE);
	auto creatureType = getNumber<CreatureType_t>(L, 9, CREATURETYPE_ATTACKABLE);
	auto race = getNumber<RaceType_t>(L, 10, RACE_NONE);
	auto creatureName = getString(L, 11);

	// to-do: handle no param defaults and throw error
	if (stance && modType && amount && factor) {
		pushSharedPtr(L, DamageModifier::makeModifier(stance, modType, amount, factor, chance, combatType, originType, creatureType, race, creatureName));
		setMetatable(L, -1, "DamageModifier");
	} else {
		lua_pushnil(L);
	}
	return 1;
}

int LuaScriptInterface::luaDamageModifierSetValue(lua_State* L)
{
	std::shared_ptr<DamageModifier> modifier = getSharedPtr<DamageModifier>(L, 1);
	if (modifier) {
		// to-do: handle no param defaults and throw error
		uint8_t amount = getNumber<uint8_t>(L, 2);
		if (amount) {
			modifier->setValue(amount);
		}
	} else {
		lua_pushnil(L);
	}
	return 1;
}

int LuaScriptInterface::luaDamageModifierSetRateFactor(lua_State* L)
{
	std::shared_ptr<DamageModifier> modifier = getSharedPtr<DamageModifier>(L, 1);
	if (modifier) {
		// to-do: handle no param defaults and throw error
		uint8_t factor = getNumber<uint8_t>(L, 2);
		if (factor >= 0) {
			modifier->setFactor(factor);
		}
	} else {
		lua_pushnil(L);
	}
	return 1;
}

int LuaScriptInterface::luaDamageModifierSetCombatFilter(lua_State* L)
{
	std::shared_ptr<DamageModifier> modifier = getSharedPtr<DamageModifier>(L, 1);
	if (modifier) {
		// to-do: handle no param defaults and throw error
		CombatType_t combatType = getNumber<CombatType_t>(L, 2);
		if (combatType >= 0) {
			modifier->setCombatType(combatType);
		}
	} else {
		lua_pushnil(L);
	}
	return 1;
}

int LuaScriptInterface::luaDamageModifierSetOriginFilter(lua_State* L)
{
	std::shared_ptr<DamageModifier> modifier = getSharedPtr<DamageModifier>(L, 1);
	if (modifier) {
		// to-do: handle no param defaults and throw error
		CombatOrigin origin = getNumber<CombatOrigin>(L, 2);
		if (origin >= 0) {
			modifier->setOriginType(origin);
		}
	} else {
		lua_pushnil(L);
	}
	return 1;
}

int LuaScriptInterface::luaAugmentCreate(lua_State* L)
{	// To-do : Augment(augment) and Augment(name) <-- where name is looked up from global collection.
	// Augment(name, description, modifier or table_of_modifiers)

	if (isString(L, 2)) {
		auto name = getString(L, 2);
		auto augment = Augments::GetAugment(name);

		if (augment) {
			pushSharedPtr(L, augment);
			setMetatable(L, -1, "Augment");
			return 1; // return early here because we found a global augment with this name
		}

		auto description = getString(L, 3);
		if (isUserdata(L, 4)) {
			auto modifier = getSharedPtr<DamageModifier>(L, 4);
			if (modifier) {
				auto augment = Augment::MakeAugment(name, description);
				augment->addModifier(modifier);
				pushSharedPtr(L, augment);
				setMetatable(L, -1, "Augment");
			} else {
				reportError(__FUNCTION__, "Invalid Userdata For Modifier Parameter used during Augment Creation \n");
				lua_pushnil(L);
			}
		} else if (isTable(L, 4)) {
			auto list = std::vector<std::shared_ptr<DamageModifier>>();
			list.reserve(24);

			// Iterate over the table at index 4
			lua_pushnil(L);  // First key for lua_next
			while (lua_next(L, 4) != 0) {
				// Check if the value is userdata and of type DamageModifier
				if (isUserdata(L, -1)) {
					auto modifier = getSharedPtr<DamageModifier>(L, -1);
					if (modifier) {
						list.emplace_back(modifier);
					} else {
						reportError(__FUNCTION__, "Invalid userdata in table element\n");
					}
				} else {
					reportError(__FUNCTION__, "Non-userdata found in table element\n");
				}
				// Remove the value, keep the key for lua_next
				lua_pop(L, 1);
			}

			// Create augment with all modifiers
			// To-do : Add augments created this particular way to global table
			auto augment = Augment::MakeAugment(name, description);
			for (auto& modifier : list) {
				augment->addModifier(modifier);
			}
			pushSharedPtr(L, augment);
			setMetatable(L, -1, "Augment");
		} else {
			reportError(__FUNCTION__, "Invalid parameter for Augment Creation\n");
			lua_pushnil(L);
		}
	}
	
	
	return 1;
}

	
int LuaScriptInterface::luaAugmentSetName(lua_State* L)
{
	// Augment:setName(newName)
	auto augment = getSharedPtr<Augment>(L, 1);
	if (!augment) {
		reportError(__FUNCTION__, "Invalid Augment userdata\n");
		return 0;
	}

	auto newName = getString(L, 2);
	augment->setName(newName);
	return 0;
}

int LuaScriptInterface::luaAugmentSetDescription(lua_State* L)
{
	// Augment:getDescription(newDescription)
	auto augment = getSharedPtr<Augment>(L, 1);
	if (!augment) {
		reportError(__FUNCTION__, "Invalid Augment userdata\n");
		return 0;
	}

	auto newDescription = getString(L, 2);
	augment->setDescription(newDescription);
	return 0;
}

int LuaScriptInterface::luaAugmentGetName(lua_State* L) {
	// Augment:getName()
	auto augment = getSharedPtr<Augment>(L, 1); // Get augment object
	if (!augment) {
		reportError(__FUNCTION__, "Invalid Augment userdata\n");
		lua_pushnil(L);
		return 1;
	}

	std::string name = augment->getName();
	pushString(L, name);
	return 1;
}

int LuaScriptInterface::luaAugmentGetDescription(lua_State* L) {
	// Augment:getDescription()
	auto augment = getSharedPtr<Augment>(L, 1);
	if (!augment) {
		reportError(__FUNCTION__, "Invalid Augment userdata\n");
		lua_pushnil(L);
		return 1;
	}

	std::string description = augment->getDescription();
	pushString(L, description);
	return 1;
}

// To-do : The following methods that return 0 should all be converted to return something (boolean for most).
int LuaScriptInterface::luaAugmentAddDamageModifier(lua_State* L)
{
	// Augment:addDamageModifier(modifier)
	auto augment = getSharedPtr<Augment>(L, 1);
	if (!augment) {
		reportError(__FUNCTION__, "Invalid Augment userdata\n");
		return 0;
	}

	auto modifier = getSharedPtr<DamageModifier>(L, 2);
	if (!modifier) {
		reportError(__FUNCTION__, "Invalid DamageModifier userdata\n");
		return 0;
	}

	augment->addModifier(modifier);
	return 0;
}

int LuaScriptInterface::luaAugmentRemoveDamageModifier(lua_State* L)
{
	// Augment:RemoveDamageModifier(modifier)
	auto augment = getSharedPtr<Augment>(L, 1);
	if (!augment) {
		reportError(__FUNCTION__, "Invalid Augment userdata\n");
		return 0;
	}

	auto modifier = getSharedPtr<DamageModifier>(L, 2);
	if (!modifier) {
		reportError(__FUNCTION__, "Invalid DamageModifier userdata\n");
		return 0;
	}

	augment->removeModifier(modifier);
	return 0;
}

int LuaScriptInterface::luaAugmentGetAttackModifiers(lua_State* L) {
	// Augment:GetAttackModifiers([modType])
	auto augment = getSharedPtr<Augment>(L, 1);
	if (!augment) {
		reportError(__FUNCTION__, "Invalid Augment userdata\n");
		lua_pushnil(L);
		return 1;
	}

	std::vector<std::shared_ptr<DamageModifier>> modifiers;

	if (lua_gettop(L) > 1 && lua_isinteger(L, 2)) {
		uint8_t modType = static_cast<uint8_t>(lua_tointeger(L, 2));
		modifiers = augment->getAttackModifiers(modType);
	} else {
		modifiers = augment->getAttackModifiers();
	}

	lua_newtable(L);
	int index = 1;
	for (const auto& modifier : modifiers) {
		pushSharedPtr(L, modifier);
		setMetatable(L, -1, "DamageModifier");
		lua_rawseti(L, -2, index++);
	}

	return 1;
}

int LuaScriptInterface::luaAugmentGetDefenseModifiers(lua_State* L) {
	// Augment:GetDefenseModifiers([modType])
	auto augment = getSharedPtr<Augment>(L, 1);
	if (!augment) {
		reportError(__FUNCTION__, "Invalid Augment userdata\n");
		lua_pushnil(L);
		return 1;
	}

	std::vector<std::shared_ptr<DamageModifier>> modifiers;

	if (lua_gettop(L) > 1 && lua_isinteger(L, 2)) {
		uint8_t modType = static_cast<uint8_t>(lua_tointeger(L, 2));
		modifiers = augment->getDefenseModifiers(modType);
	} else {
		modifiers = augment->getDefenseModifiers();
	}

	lua_newtable(L);
	int index = 1;
	for (const auto& modifier : modifiers) {
		pushSharedPtr(L, modifier);
		setMetatable(L, -1, "DamageModifier");
		lua_rawseti(L, -2, index++);
	}

	return 1;
}


int LuaScriptInterface::luaItemAddAugment(lua_State* L)
{
	Item* item = getUserdata<Item>(L, 1);
	if (!item) {
		lua_pushnil(L);
		return 1;
	}

	if (item->isStackable() || item->canDecay() || !item->canTransform() || item->getCharges() || !item->hasProperty(CONST_PROP_MOVEABLE)) {
		lua_pushboolean(L, false);
		return 1;
	}

	if (isString(L, 2)) {
		std::cout << getString(L, 2) << " \n";
		if (auto augment = Augments::GetAugment(getString(L, 2))) {
			lua_pushboolean(L, item->addAugment(augment));
		} else {
			lua_pushnil(L);
			reportError(__FUNCTION__, "Item::addAugment() argument not found as any name in augments loaded on startup! \n");
		}
	} else if (isUserdata(L, 2)) {
		if (std::shared_ptr augment = getSharedPtr<Augment>(L, 2)) {
			lua_pushboolean(L, item->addAugment(augment));
		} else {
			lua_pushnil(L);
			reportError(__FUNCTION__, "Item::addAugment() invalid userdata passed as argument! \n");
		}
	} else {
		reportError(__FUNCTION__, "Item::addAugment() passed invalid type, must be string or userdata! \n");
		lua_pushnil(L);
	}
	return 1;
}

int LuaScriptInterface::luaItemRemoveAugment(lua_State* L)
{
	Item* item = getUserdata<Item>(L, 1);
	if (!item) {
		lua_pushnil(L);
		return 1;
	}

	if (isString(L, 2)) {
		auto name = getString(L, 2);
		lua_pushboolean(L, item->removeAugment(name));
	} else if (isUserdata(L, 2)) {
		if (std::shared_ptr<Augment> augment = getSharedPtr<Augment>(L, 2)) {
			lua_pushboolean(L, item->removeAugment(augment));
		} else {
			reportError(__FUNCTION__, "Item::removeAugment() invalid userdata type passed as argument! \n");
			lua_pushnil(L);
		}
	} else {
		reportError(__FUNCTION__, "Item::removeAugment() passed invalid type, must be string or userdata! \n");
		lua_pushnil(L);
	}
	return 1;
}

int LuaScriptInterface::luaItemIsAugmented(lua_State* L)
{
	Item* item = getUserdata<Item>(L, 1);
	if (!item) {
		lua_pushnil(L);
		return 1;
	}
	lua_pushboolean(L, item->isAugmented());
	return 1;
}

int LuaScriptInterface::luaItemHasAugment(lua_State* L)
{
	Item* item = getUserdata<Item>(L, 1);
	if (!item) {
		lua_pushnil(L);
		return 1;
	}
	
	if (isString(L, 2)) {
		auto name = getString(L, 2);
		lua_pushboolean(L, item->hasAugment(name));
	} else if (isUserdata(L, 2)) {
		if (std::shared_ptr<Augment> augment = getSharedPtr<Augment>(L, 2)) {
			lua_pushboolean(L, item->hasAugment(augment));
		} else {
			reportError(__FUNCTION__, "Item::hasAugment() invalid userdata type passed as argument! \n");
			lua_pushnil(L);
		}
	} else {
		reportError(__FUNCTION__, "Item::hasAugment() passed invalid type, must be string or userdata! \n");
		lua_pushnil(L);
	}
	return 1;
}

int LuaScriptInterface::luaItemGetAugments(lua_State* L)
{
	Item* item = getUserdata<Item>(L, 1);
	if (!item) {
		lua_pushnil(L);
		return 1;
	}

	std::vector<std::shared_ptr<Augment>> augments = item->getAugments();
	lua_createtable(L, augments.size(), 0);

	int index = 0;
	for (std::shared_ptr<Augment> augment : augments) {
		pushSharedPtr(L, augment);
		setMetatable(L, -1, "Augment");
		lua_rawseti(L, -2, ++index);
	}
	return 1;
}


// src\item.cpp
const bool Item::addAugment(std::shared_ptr<Augment>& augment)
{
	if (std::find(augments.begin(), augments.end(), augment) != augments.end()) {
		return false;
	}

	augments.push_back(augment);
	g_events->eventItemOnAugment(this, augment);
	return true;
}

const bool Item::addAugment(std::string_view augmentName)
{
	if (auto augment = Augments::GetAugment(augmentName)) {
		augments.emplace_back(augment);
		g_events->eventItemOnAugment(this, augment);
		return true;
	}
	return false;
}

const bool Item::removeAugment(std::shared_ptr<Augment>& augment)
{
	auto originalSize = augments.size();
	augments.erase(std::remove(augments.begin(), augments.end(), augment), augments.end());
	auto removed = (augments.size() - originalSize) > 0 ? true : false;
	if (removed) {
		g_events->eventItemOnRemoveAugment(this, augment);
	}
	return removed;
}

const bool Item::removeAugment(std::string_view name) {
	auto originalSize = augments.size();
    
	augments.erase(std::remove_if(augments.begin(), augments.end(),
		[this, &name](const std::shared_ptr<Augment>& augment) {
			auto match = augment->getName() == name;
			if (match) {
				g_events->eventItemOnRemoveAugment(this, augment);
			}
			return match;
		}), augments.end());
        
	return augments.size() < originalSize;
}

bool Item::isAugmented() const
{
	return augments.size() > 0;
}

bool Item::hasAugment(std::string_view name) const
{
	for (const auto& aug : augments) {
		if (aug->getName() == name) {
			return true;
		}
	}
	return false;
}

bool Item::hasAugment(const std::shared_ptr<Augment>& augment) const
{
	for (const auto& aug : augments) {
		if (aug == augment) {
			return true;
		}
	}
	return false;
}


const std::vector<std::shared_ptr<Augment>>& Item::getAugments()
{
	return augments;


}