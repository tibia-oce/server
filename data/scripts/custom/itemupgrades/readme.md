# LLM Refactoring Prompt for DDD-based Item Upgrade/Enchantment System

**Context:**  
You are refactoring a custom item upgrade/enchantment system originally implemented for [theforgottenserver version 1.4](https://github.com/otland/forgottenserver/tree/1.4). The existing module uses dofile-based scripts, global tables, and long mixed-responsibility functions (handling upgrades, augments, item conditions, and crystal triggers). The functionality must be preserved exactly; only the code structure and organization should change.

**Objective:**  
Refactor the custom system into a Domain-Driven Design (DDD) approach. The refactoring must result in clearly separated concerns with the following new layers:
- **Domain:** Defines domain models for items, crystals, and enchants.
- **Services:** Implements business logic for attribute upgrades (native and custom bonuses) and for enchantments (augments and modifiers).
- **Managers:** Orchestrates the application of business logic in response to crystal triggers (with separate managers for Attributes and Enchantments).
- **Modules:** Contains bonus modules (for magic level, melee level, weapon attack, weapon defense, extra defense, hit chance, and armor) and logic for creating/handling augments.
- **Top-Level Files:** Single-file modules for configuration, global helpers, event registration, and loot handling.

**Instructions:**  
1. **Preserve Functionality:**  
   - Ensure that no functional behavior is removed or altered. All rules concerning upgrading items, rolling attributes, applying conditions, and processing augments must remain intact.

2. **Directory Restructuring:**  
   - Replace the current directory structure with the following DDD-inspired structure:
     
     **Current Directory Structure:**
     ```
     data/
     └── scripts/
         └── custom/
             └── itemupgrades/
                ├─ 📄augments.lua
                ├─ 📄config.lua
                ├─ 📄core.lua
                ├─ 📄crystals.lua
                ├─ 📄events.lua
                ├─ 📄extractor.lua
                ├─ 📄items.lua
                ├─ 📄loot.lua
                ├─ 📄magiclevel.lua
                └─ 📄readme.md
    ```

     **Proposed Directory Structure:**
     ```
     data/
     └── scripts/
         └── custom/
             └── itemupgrades/
                 ├── config.lua            -- Global configuration (includes BONUS_CONFIG and other constants)
                 ├── domain/
                 │   ├── Item.lua          -- Domain model for items (native stats, bonus attributes, enchants)
                 │   ├── Enchantment.lua   -- Domain logic for augments/enchants
                 │   └── Crystal.lua       -- Domain model representing crystals (triggers)
                 ├── services/
                 │   ├── AttributeService.lua     -- Business logic for applying attribute upgrades (native and custom)
                 │   └── EnchantmentService.lua   -- Business logic for managing augments/modifiers
                 ├── managers/
                 │   ├── AttributeManager.lua     -- Orchestrates attribute upgrades triggered via upgrade crystals
                 │   └── EnchantmentManager.lua   -- Coordinates the lifecycle of augments triggered by other crystals
                 ├── modules/
                 │   ├── bonus/
                 │   │   ├── magicLevelBonus.lua    -- Bonus for magic level increases
                 │   │   ├── meleeLevelBonus.lua    -- Bonus for melee level increases
                 │   │   ├── weaponAttackBonus.lua  -- Bonus for weapon attack increases
                 │   │   ├── weaponDefenseBonus.lua -- Bonus for weapon defense increases
                 │   │   ├── extraDefenseBonus.lua  -- Bonus for extra defense increases
                 │   │   ├── hitChanceBonus.lua     -- Bonus for hit chance increases
                 │   │   └── armorBonus.lua         -- Bonus for armor increases
                 │   └── augments.lua               -- Logic for creating/handling augments (enchantments)
                 ├── events.lua              -- Event registrations (login, item move, etc.)
                 ├── helpers.lua             -- Shared helper functions
                 ├── loot.lua                -- Global loot handling logic
                 └── init.lua                -- Bootstraps the system (initializes services, managers, bonus modules, etc.)
     ```

3. **Key Changes and Refactoring Steps:**
   - **Domain Layer:**  
     - Create `domain/Item.lua` to encapsulate item properties (native attributes, custom bonus containers, augment lists) and operations such as setting/getting upgrade levels.  
     - Create `domain/Enchantment.lua` to represent and handle augments/enchants in a pure domain style.  
     - Create `domain/Crystal.lua` to encapsulate crystal behavior as domain objects.
     
   - **Services:**  
     - In `services/AttributeService.lua`, move all logic for calculating and applying bonus values (using bonus modules) that adjust native attributes (weapon attack, defense, etc.) or update custom attributes (e.g., magic level, melee level).  
     - In `services/EnchantmentService.lua`, include the logic for constructing, applying, and removing augments and modifiers on items.
     
   - **Managers:**  
     - Implement `managers/AttributeManager.lua` to coordinate attribute upgrades when an upgrade crystal is used (validations, upgrading level, applying bonuses through the AttributeService).  
     - Implement `managers/EnchantmentManager.lua` to handle operations around enchanting items with augments, using the EnchantmentService.
     
   - **Modules (Bonus and Augments):**  
     - Create separate bonus modules in `modules/bonus/` for each bonus type:
       - `magicLevelBonus.lua`
       - `meleeLevelBonus.lua`
       - `weaponAttackBonus.lua`
       - `weaponDefenseBonus.lua`
       - `extraDefenseBonus.lua`
       - `hitChanceBonus.lua`
       - `armorBonus.lua`
     - Ensure each bonus module follows a standard interface (e.g., `apply(item, level, options)`).
     - Consolidate the augment-related logic in `modules/augments.lua`.
     
   - **Top-Level Files:**  
     - Flatten files like `config.lua`, `helpers.lua`, `events.lua`, and `loot.lua` into the root of `itemupgrades/` so they are one level deep.
     - In `init.lua`, handle the initialization and registration of bonus modules, services, managers, and event hooks.
     
4. **Maintain Compatibility with TFS:**
   - All event hooks and condition applications must follow TFS 1.4 conventions (use of `CreatureEvent`, `EventCallback`, etc.).
   - Ensure that global variables are minimized and that state is handled using module encapsulation to avoid conflicts.
   - Retain the timing and randomness aspects (for example, upgrade success chances, destroy chance, etc.) exactly as in the original implementation.

5. **Additional Final Improvements:**
   - Centralize bonus calculations in the configuration (read multipliers and additive values from `config.lua`).
   - Enhance error handling and add logging where appropriate to capture any unexpected issues during upgrades/enchantments.
   - Write unit tests for each service, manager, and bonus module (located in a `tests/` directory if needed) to validate that refactoring preserves all behavior.
   - Ensure that all external API calls (like `sendTextMessage`, `addCondition`, etc.) are kept intact and are invoked appropriately.

**Deliverable:**  
Produce the refactored code following the new DDD approach using the proposed directory structure. The output should maintain all current functionality while significantly improving code modularity, testability, and maintainability.  Return the full refactored code files for all modules, services, managers, and top-level files according to the specified structure, with every line of code present in each file.

-----

**Current state of code:**

-- data/scripts/custom/itemupgrades/augments.lua
-- Routines for creating damage/protection augments from enchantments.
ATTACK_MOD = 0
DEFENSE_MOD = 1
ATTACK_MODIFIER_PIERCING = 6
DEFENSE_MODIFIER_RESIST = 8
PERCENT_MODIFIER = 1
FLAT_MODIFIER = 0
COMBAT_NONE = 0
ORIGIN_AUGMENT = 12
CREATURETYPE_ATTACKABLE = 12
RACE_NONE = 0

--- Convert a string-based damage type (e.g., "energy") to its constant.
-- @param typeName string
-- @return number
function getCombatType(typeName)
    local mapping = {
        physical = COMBAT_PHYSICALDAMAGE,
        energy = COMBAT_ENERGYDAMAGE,
        earth = COMBAT_EARTHDAMAGE,
        fire = COMBAT_FIREDAMAGE,
        ice = COMBAT_ICEDAMAGE,
        holy = COMBAT_HOLYDAMAGE,
        death = COMBAT_DEATHDAMAGE
    }
    return mapping[typeName] or COMBAT_NONE
end

--- Check if an enchantment ID is in the OFFENSIVE/DEFENSIVE table.
-- @param id number
-- @return boolean
function isCombatEnchantment(id)
    return ENCHANT_TYPES and
               (ENCHANT_TYPES.OFFENSIVE and ENCHANT_TYPES.OFFENSIVE[id] or ENCHANT_TYPES.DEFENSIVE and
                   ENCHANT_TYPES.DEFENSIVE[id])
end

--- Create a DamageModifier instance.
-- @param stance number
-- @param modType number
-- @param value number
-- @param factor number
-- @param combatType number
-- @return DamageModifier|nil
local function makeModifier(stance, modType, value, factor, combatType)
    local mod = DamageModifier((stance == 0) and 1 or stance, (modType == 0) and 1 or modType,
        (value == 0) and 1 or value, (factor == 0) and 1 or factor, 100, combatType or COMBAT_NONE, ORIGIN_AUGMENT,
        CREATURETYPE_ATTACKABLE, RACE_NONE, "")
    if not mod then
        return nil
    end
    mod:setValue(value)
    mod:setRateFactor(factor)
    mod:setCombatFilter(combatType or COMBAT_NONE)
    mod:setOriginFilter(ORIGIN_AUGMENT)
    return mod
end

--- Create an Augment object from given info.
-- @param info table
-- @param value number
-- @param stance number
-- @param modType number
-- @return Augment
local function createAugment(info, value, stance, modType)
    local modifiers = {}
    local augmentName = info.name
    local types = (info.type == "elemental") and {"energy", "earth", "fire", "ice", "holy", "death"} or {info.type}

    for _, typeName in ipairs(types) do
        local combatType = getCombatType(typeName)
        local modifier = makeModifier(stance, modType, value, PERCENT_MODIFIER, combatType)
        if modifier then
            table.insert(modifiers, modifier)
        end
    end
    return Augment(augmentName, augmentName .. " +" .. value .. "%", modifiers)
end

--- Create a damage-type augment.
-- @param info table
-- @param value number
-- @return Augment
function createDamageAugment(info, value)
    return createAugment(info, value, ATTACK_MOD, ATTACK_MODIFIER_PIERCING)
end

--- Create a protection-type augment.
-- @param info table
-- @param value number
-- @return Augment
function createProtectionAugment(info, value)
    return createAugment(info, value, DEFENSE_MOD, DEFENSE_MODIFIER_RESIST)
end

--- Create an Augment by ID.
-- @param enchantId number
-- @param value number
-- @return Augment|nil
function createAugmentFromEnchantment(enchantId, value)
    local info = ENCHANT_TYPES and ENCHANT_TYPES.OFFENSIVE and ENCHANT_TYPES.OFFENSIVE[enchantId]
    if info then
        return createDamageAugment(info, value)
    end
    info = ENCHANT_TYPES and ENCHANT_TYPES.DEFENSIVE and ENCHANT_TYPES.DEFENSIVE[enchantId]
    if info then
        return createProtectionAugment(info, value)
    end
    return nil
end

--- Ensure item has required augments for its offensive/defensive bonuses.
-- @param item Item
function syncItemAugments(item)
    if not item then
        return
    end
    local bonuses = item:getBonusAttributes()
    if not bonuses then
        return
    end

    local existing = {}
    for _, aug in ipairs(item:getAugments() or {}) do
        existing[aug:getName()] = true
    end

    for _, bonus in ipairs(bonuses) do
        local id, val = bonus[1], bonus[2]
        local info = (ENCHANT_TYPES and ENCHANT_TYPES.OFFENSIVE and ENCHANT_TYPES.OFFENSIVE[id]) or
                         (ENCHANT_TYPES and ENCHANT_TYPES.DEFENSIVE and ENCHANT_TYPES.DEFENSIVE[id])
        if info and not existing[info.name] then
            local augment = createAugmentFromEnchantment(id, val)
            if augment then
                item:addAugment(augment)
            end
        end
    end
end

--- Apply an augment for a given enchantment.
-- @param item Item
-- @param enchantId number
-- @param enchantValue number
function applyAugmentForEnchantment(item, enchantId, enchantValue)
    if isCombatEnchantment(enchantId) then
        local augment = createAugmentFromEnchantment(enchantId, enchantValue)
        if augment then
            item:addAugment(augment)
        end
    end
end

--- Remove all augments from an item.
-- @param item Item
function removeAllAugments(item)
    local augments = item:getAugments()
    if augments then
        for _, augment in ipairs(augments) do
            item:removeAugment(augment)
        end
    end
end

-- data/scripts/custom/itemupgrades/config.lua
ITEM_UPGRADE_CRYSTAL = 1
ITEM_AUGMENTING_CRYSTAL = 2
ITEM_ALTER_CRYSTAL = 3
ITEM_SCOURING_CRYSTAL = 4
ITEM_EXALT_CRYSTAL = 5
ITEM_CHAOS_CRYSTAL = 6
COMMON = 1
RARE = 2
EPIC = 3
LEGENDARY = 4

US_CONFIG = {
    {
        [ITEM_UPGRADE_CRYSTAL] = 26799,
        [ITEM_AUGMENTING_CRYSTAL] = 26801,
        [ITEM_ALTER_CRYSTAL] = 26800,
        [ITEM_SCOURING_CRYSTAL] = 27703,
        [ITEM_EXALT_CRYSTAL] = 27704,
        [ITEM_CHAOS_CRYSTAL] = 27705
    },

    ITEM_MIRRORED_CRYSTAL = 27698,
    ITEM_MIND_CRYSTAL = 27701,
    ITEM_ANNULMENT_CRYSTAL = 27700,
    ITEM_DIVINE_CRYSTAL = 27702,
    ITEM_UPGRADE_CATALYST = 26798,
    CRYSTAL_EXTRACTOR = 27149,
    CRYSTAL_FOSSIL = 27133,
    ITEM_SCROLL_IDENTIFY = 28137,

    IDENTIFY_UPGRADE_LEVEL = false,

    UPGRADE_SUCCESS_CHANCE = {
        [1] = 100,
        [2] = 100,
        [3] = 95,
        [4] = 80,
        [5] = 65,
        [6] = 40
    },
    UPGRADE_LEVEL_DESTROY = 7,
    UPGRADE_DESTROY_CHANCE = {
        [7] = 30,
        [8] = 15,
        [9] = 10,
        [10] = 5
    },

    MAX_ITEM_LEVEL = 300,
    MAX_UPGRADE_LEVEL = 10,
    MAX_PERCENTAGE_ROLL = 10,

    ALLOW_DUPLICATE_ENCHANTS = true,
    REQUIRE_LEVEL = true,

    ATTACK_PER_ITEM_LEVEL = 10,
    ATTACK_FROM_ITEM_LEVEL = 1,

    DEFENSE_PER_ITEM_LEVEL = 10,
    DEFENSE_FROM_ITEM_LEVEL = 1,

    ARMOR_PER_ITEM_LEVEL = 10,
    ARMOR_FROM_ITEM_LEVEL = 1,

    HITCHANCE_PER_ITEM_LEVEL = 10,
    HITCHANCE_FROM_ITEM_LEVEL = 1,

    ITEM_LEVEL_PER_ATTACK = 6,
    ITEM_LEVEL_PER_DEFENSE = 15,
    ITEM_LEVEL_PER_ARMOR = 10,
    ITEM_LEVEL_PER_HITCHANCE = 3,
    ITEM_LEVEL_PER_UPGRADE = 4,

    ATTACK_PER_UPGRADE = 2,
    DEFENSE_PER_UPGRADE = 2,
    EXTRADEFENSE_PER_UPGRADE = 1,
    ARMOR_PER_UPGRADE = 2,
    HITCHANCE_PER_UPGRADE = 3,

    WEAPON_UPGRADES = {
        [WEAPON_SWORD] = {
            attack = 2
        },
        [WEAPON_CLUB] = {
            attack = 2
        },
        [WEAPON_AXE] = {
            attack = 2
        },
        [WEAPON_DISTANCE] = {
            attack = 1,
            hitchance = 3
        },
        [WEAPON_WAND] = {
            attack = 2,
            magic_level = 1
        },
        [WEAPON_SHIELD] = {
            extra_defense = 2,
            armor = 1,
            magic_level = 1
        }
    },

    CRYSTAL_FOSSIL_DROP_CHANCE = 8,
    CRYSTAL_FOSSIL_DROP_LEVEL = 25,
    CRYSTAL_BREAK_CHANCE = 5,
    UNIQUE_CHANCE = 1,

    RARITY = {
        [COMMON] = {
            name = "common",
            maxBonus = 1,
            chance = 1
        },
        [RARE] = {
            name = "rare",
            maxBonus = 2,
            chance = 4
        },
        [EPIC] = {
            name = "epic",
            maxBonus = 3,
            chance = 8
        },
        [LEGENDARY] = {
            name = "legendary",
            maxBonus = 4,
            chance = 16
        }
    }
}

US_ITEM_TYPES = {
    ALL = 1,
    WEAPON_MELEE = 2,
    WEAPON_DISTANCE = 4,
    WEAPON_WAND = 8,
    SHIELD = 16,
    HELMET = 32,
    ARMOR = 64,
    LEGS = 128,
    BOOTS = 256,
    RING = 512,
    NECKLACE = 1024,
    WEAPON_ANY = 14
}

US_UNIQUES = {
    [1] = {
        name = "Flame Spirit",
        attributes = {1, 4, 12, 30},
        minLevel = 100,
        chance = 80,
        itemType = US_ITEM_TYPES.WEAPON_MELEE + US_ITEM_TYPES.SHIELD
    }
}

US_TYPES = {
    CONDITION = 0,
    OFFENSIVE = 1,
    DEFENSIVE = 2,
    TRIGGER = 3
}

US_TRIGGERS = {
    ATTACK = 0,
    HIT = 1,
    KILL = 2
}

US_ENCHANTMENTS = {
    [1] = {
        name = "Max HP",
        combatType = US_TYPES.CONDITION,
        condition = CONDITION_ATTRIBUTES,
        param = CONDITION_PARAM_STAT_MAXHITPOINTSPERCENT,
        VALUES_PER_LEVEL = 1,
        percentage = true,
        format = function(value)
            return "Max HP +" .. value .. "%"
        end,
        itemType = US_ITEM_TYPES.WEAPON_ANY + US_ITEM_TYPES.SHIELD + US_ITEM_TYPES.RING + US_ITEM_TYPES.NECKLACE +
            US_ITEM_TYPES.HELMET + US_ITEM_TYPES.ARMOR + US_ITEM_TYPES.LEGS + US_ITEM_TYPES.BOOTS,
        minLevel = 8
    },
    [2] = {
        name = "Max MP",
        combatType = US_TYPES.CONDITION,
        condition = CONDITION_ATTRIBUTES,
        param = CONDITION_PARAM_STAT_MAXMANAPOINTSPERCENT,
        VALUES_PER_LEVEL = 1,
        percentage = true,
        format = function(value)
            return "Max MP +" .. value .. "%"
        end,
        itemType = US_ITEM_TYPES.WEAPON_WAND + US_ITEM_TYPES.SHIELD + US_ITEM_TYPES.RING + US_ITEM_TYPES.NECKLACE +
            US_ITEM_TYPES.HELMET + US_ITEM_TYPES.ARMOR + US_ITEM_TYPES.LEGS + US_ITEM_TYPES.BOOTS,
        minLevel = 8
    },
    [3] = {
        name = "Magic Level",
        combatType = US_TYPES.CONDITION,
        condition = CONDITION_ATTRIBUTES,
        param = CONDITION_PARAM_STAT_MAGICPOINTSPERCENT,
        VALUES_PER_LEVEL = 1,
        percentage = true,
        format = function(value)
            return "Magic Level +" .. value .. "%"
        end,
        itemType = US_ITEM_TYPES.WEAPON_WAND + US_ITEM_TYPES.SHIELD + US_ITEM_TYPES.RING + US_ITEM_TYPES.NECKLACE +
            US_ITEM_TYPES.HELMET + US_ITEM_TYPES.ARMOR + US_ITEM_TYPES.LEGS + US_ITEM_TYPES.BOOTS,
        minLevel = 8
    },
    [4] = {
        name = "Melee Skills",
        combatType = US_TYPES.CONDITION,
        condition = CONDITION_ATTRIBUTES,
        param = CONDITION_PARAM_SKILL_MELEEPERCENT,
        VALUES_PER_LEVEL = 1,
        percentage = true,
        format = function(value)
            return "Melee Skills +" .. value .. "%"
        end,
        itemType = US_ITEM_TYPES.WEAPON_MELEE + US_ITEM_TYPES.RING + US_ITEM_TYPES.NECKLACE + US_ITEM_TYPES.HELMET +
            US_ITEM_TYPES.ARMOR + US_ITEM_TYPES.LEGS + US_ITEM_TYPES.BOOTS,
        minLevel = 8
    },
    [5] = {
        name = "Distance Fighting",
        combatType = US_TYPES.CONDITION,
        condition = CONDITION_ATTRIBUTES,
        param = CONDITION_PARAM_SKILL_DISTANCEPERCENT,
        VALUES_PER_LEVEL = 1,
        percentage = true,
        format = function(value)
            return "Distance Fighting +" .. value .. "%"
        end,
        itemType = US_ITEM_TYPES.WEAPON_DISTANCE + US_ITEM_TYPES.RING + US_ITEM_TYPES.NECKLACE + US_ITEM_TYPES.HELMET +
            US_ITEM_TYPES.ARMOR + US_ITEM_TYPES.LEGS + US_ITEM_TYPES.BOOTS,
        minLevel = 8
    },
    [6] = {
        name = "Physical Damage",
        combatType = US_TYPES.OFFENSIVE,
        combatDamage = COMBAT_PHYSICALDAMAGE,
        percentage = true,
        VALUES_PER_LEVEL = 1,
        format = function(value)
            return "Physical Damage +" .. value .. "%"
        end,
        itemType = US_ITEM_TYPES.WEAPON_MELEE + US_ITEM_TYPES.RING + US_ITEM_TYPES.WEAPON_DISTANCE +
            US_ITEM_TYPES.NECKLACE + US_ITEM_TYPES.HELMET + US_ITEM_TYPES.BOOTS,
        minLevel = 8
    },
    [7] = {
        name = "Energy Damage",
        combatType = US_TYPES.OFFENSIVE,
        combatDamage = COMBAT_ENERGYDAMAGE,
        percentage = true,
        VALUES_PER_LEVEL = 1,
        format = function(value)
            return "Energy Damage +" .. value .. "%"
        end,
        itemType = US_ITEM_TYPES.WEAPON_ANY + US_ITEM_TYPES.NECKLACE + US_ITEM_TYPES.HELMET + US_ITEM_TYPES.BOOTS,
        minLevel = 8
    },
    [8] = {
        name = "Earth Damage",
        combatType = US_TYPES.OFFENSIVE,
        combatDamage = COMBAT_EARTHDAMAGE,
        percentage = true,
        VALUES_PER_LEVEL = 1,
        format = function(value)
            return "Earth Damage +" .. value .. "%"
        end,
        itemType = US_ITEM_TYPES.WEAPON_ANY + US_ITEM_TYPES.NECKLACE + US_ITEM_TYPES.HELMET + US_ITEM_TYPES.BOOTS,
        minLevel = 8
    },
    [9] = {
        name = "Fire Damage",
        combatType = US_TYPES.OFFENSIVE,
        combatDamage = COMBAT_FIREDAMAGE,
        percentage = true,
        VALUES_PER_LEVEL = 1,
        format = function(value)
            return "Fire Damage +" .. value .. "%"
        end,
        itemType = US_ITEM_TYPES.WEAPON_ANY + US_ITEM_TYPES.NECKLACE + US_ITEM_TYPES.HELMET + US_ITEM_TYPES.BOOTS,
        minLevel = 8
    },
    [10] = {
        name = "Ice Damage",
        combatType = US_TYPES.OFFENSIVE,
        combatDamage = COMBAT_ICEDAMAGE,
        percentage = true,
        VALUES_PER_LEVEL = 1,
        format = function(value)
            return "Ice Damage +" .. value .. "%"
        end,
        itemType = US_ITEM_TYPES.WEAPON_ANY + US_ITEM_TYPES.NECKLACE + US_ITEM_TYPES.HELMET + US_ITEM_TYPES.BOOTS,
        minLevel = 8
    },
    [11] = {
        name = "Holy Damage",
        combatType = US_TYPES.OFFENSIVE,
        combatDamage = COMBAT_HOLYDAMAGE,
        percentage = true,
        VALUES_PER_LEVEL = 1,
        format = function(value)
            return "Holy Damage +" .. value .. "%"
        end,
        itemType = US_ITEM_TYPES.WEAPON_ANY + US_ITEM_TYPES.NECKLACE + US_ITEM_TYPES.HELMET + US_ITEM_TYPES.BOOTS,
        minLevel = 8
    },
    [12] = {
        name = "Death Damage",
        combatType = US_TYPES.OFFENSIVE,
        combatDamage = COMBAT_DEATHDAMAGE,
        percentage = true,
        VALUES_PER_LEVEL = 1,
        format = function(value)
            return "Death Damage +" .. value .. "%"
        end,
        itemType = US_ITEM_TYPES.WEAPON_ANY + US_ITEM_TYPES.NECKLACE + US_ITEM_TYPES.HELMET + US_ITEM_TYPES.BOOTS,
        minLevel = 8
    },
    [13] = {
        name = "Elemental Damage",
        combatType = US_TYPES.OFFENSIVE,
        combatDamage = COMBAT_ENERGYDAMAGE + COMBAT_EARTHDAMAGE + COMBAT_FIREDAMAGE + COMBAT_ICEDAMAGE +
            COMBAT_HOLYDAMAGE + COMBAT_DEATHDAMAGE,
        VALUES_PER_LEVEL = 1,
        percentage = true,
        format = function(value)
            return "Elemental Damage +" .. value .. "%"
        end,
        itemType = US_ITEM_TYPES.WEAPON_WAND + US_ITEM_TYPES.RING + US_ITEM_TYPES.NECKLACE,
        minLevel = 8
    },
    [14] = {
        name = "Physical Protection",
        combatType = US_TYPES.DEFENSIVE,
        combatDamage = COMBAT_PHYSICALDAMAGE,
        percentage = true,
        VALUES_PER_LEVEL = 1,
        format = function(value)
            return "Physical Protection +" .. value .. "%"
        end,
        itemType = US_ITEM_TYPES.ARMOR + US_ITEM_TYPES.SHIELD + US_ITEM_TYPES.BOOTS + US_ITEM_TYPES.HELMET +
            US_ITEM_TYPES.LEGS,
        minLevel = 8
    },
    [15] = {
        name = "Energy Protection",
        combatType = US_TYPES.DEFENSIVE,
        combatDamage = COMBAT_ENERGYDAMAGE,
        percentage = true,
        VALUES_PER_LEVEL = 1,
        format = function(value)
            return "Energy Protection +" .. value .. "%"
        end,
        itemType = US_ITEM_TYPES.ARMOR + US_ITEM_TYPES.SHIELD + US_ITEM_TYPES.BOOTS + US_ITEM_TYPES.HELMET +
            US_ITEM_TYPES.LEGS,
        minLevel = 8
    },
    [16] = {
        name = "Earth Protection",
        combatType = US_TYPES.DEFENSIVE,
        combatDamage = COMBAT_EARTHDAMAGE,
        percentage = true,
        VALUES_PER_LEVEL = 1,
        format = function(value)
            return "Earth Protection +" .. value .. "%"
        end,
        itemType = US_ITEM_TYPES.ARMOR + US_ITEM_TYPES.SHIELD + US_ITEM_TYPES.BOOTS + US_ITEM_TYPES.HELMET +
            US_ITEM_TYPES.LEGS,
        minLevel = 8
    },
    [17] = {
        name = "Fire Protection",
        combatType = US_TYPES.DEFENSIVE,
        combatDamage = COMBAT_FIREDAMAGE,
        percentage = true,
        VALUES_PER_LEVEL = 1,
        format = function(value)
            return "Fire Protection +" .. value .. "%"
        end,
        itemType = US_ITEM_TYPES.ARMOR + US_ITEM_TYPES.SHIELD + US_ITEM_TYPES.BOOTS + US_ITEM_TYPES.HELMET +
            US_ITEM_TYPES.LEGS,
        minLevel = 8
    },
    [18] = {
        name = "Ice Protection",
        combatType = US_TYPES.DEFENSIVE,
        combatDamage = COMBAT_ICEDAMAGE,
        percentage = true,
        VALUES_PER_LEVEL = 1,
        format = function(value)
            return "Ice Protection +" .. value .. "%"
        end,
        itemType = US_ITEM_TYPES.ARMOR + US_ITEM_TYPES.SHIELD + US_ITEM_TYPES.BOOTS + US_ITEM_TYPES.HELMET +
            US_ITEM_TYPES.LEGS,
        minLevel = 8
    },
    [19] = {
        name = "Holy Protection",
        combatType = US_TYPES.DEFENSIVE,
        combatDamage = COMBAT_HOLYDAMAGE,
        percentage = true,
        VALUES_PER_LEVEL = 1,
        format = function(value)
            return "Holy Protection +" .. value .. "%"
        end,
        itemType = US_ITEM_TYPES.ARMOR + US_ITEM_TYPES.SHIELD + US_ITEM_TYPES.BOOTS + US_ITEM_TYPES.HELMET +
            US_ITEM_TYPES.LEGS,
        minLevel = 8
    },
    [20] = {
        name = "Death Protection",
        percentage = true,
        combatType = US_TYPES.DEFENSIVE,
        combatDamage = COMBAT_DEATHDAMAGE,
        VALUES_PER_LEVEL = 1,
        format = function(value)
            return "Death Protection +" .. value .. "%"
        end,
        itemType = US_ITEM_TYPES.ARMOR + US_ITEM_TYPES.SHIELD + US_ITEM_TYPES.BOOTS + US_ITEM_TYPES.HELMET +
            US_ITEM_TYPES.LEGS,
        minLevel = 8
    },
    [23] = {
        name = "Elemental Protection",
        percentage = true,
        combatType = US_TYPES.DEFENSIVE,
        combatDamage = COMBAT_ENERGYDAMAGE + COMBAT_EARTHDAMAGE + COMBAT_FIREDAMAGE + COMBAT_ICEDAMAGE +
            COMBAT_HOLYDAMAGE + COMBAT_DEATHDAMAGE,
        VALUES_PER_LEVEL = 1,
        format = function(value)
            return "Elemental Protection +" .. value .. "%"
        end,
        itemType = US_ITEM_TYPES.ARMOR + US_ITEM_TYPES.SHIELD + US_ITEM_TYPES.BOOTS + US_ITEM_TYPES.HELMET +
            US_ITEM_TYPES.LEGS,
        minLevel = 8
    }
}

-- data/scripts/custom/itemupgrades/core.lua
-- Main bridging code (no TFS event registrations here).
print(">> Loading Upgrade System")

dofile('data/scripts/custom/itemupgrades/augments.lua')
dofile('data/scripts/custom/itemupgrades/magiclevel.lua')

US_CONDITIONS = {}
US_BUFFS = {}
local US_SUBID = {}

--- Checks if two creatures are in the same party.
-- @param creature1 Creature
-- @param creature2 Creature
-- @return boolean
function isInSameParty(creature1, creature2)
    if creature1:isPlayer() and creature2:isPlayer() and creature1:getParty() and creature2:getParty() then
        return creature1:getParty() == creature2:getParty()
    end
    return false
end

--- Process kill triggers for a player when they kill a monster.
-- @param player Player
-- @param center Position
-- @param target Creature
function processKillTriggers(player, center, target)
    for slot = CONST_SLOT_HEAD, CONST_SLOT_AMMO do
        local item = player:getSlotItem(slot)
        if item then
            local values = item:getBonusAttributes()
            if values then
                for _, v in pairs(values) do
                    local attr = US_ENCHANTMENTS[v[1]]
                    if attr and attr.triggerType == US_TRIGGERS.KILL then
                        attr.execute(player, v[2], center, target)
                    end
                end
            end
        end
    end
end

--- Checks if a player's gear should revive them upon death.
-- @param creature Creature
-- @return boolean : True if revived
function checkReviveOnDeath(creature)
    for slot = CONST_SLOT_HEAD, CONST_SLOT_AMMO do
        local item = creature:getSlotItem(slot)
        if item then
            local values = item:getBonusAttributes()
            if values then
                for _, v in pairs(values) do
                    local attr = US_ENCHANTMENTS[v[1]]
                    if attr and attr.name == "Revive on death" then
                        if math.random(100) < v[2] then
                            creature:addHealth(creature:getMaxHealth())
                            creature:addMana(creature:getMaxMana())
                            creature:getPosition():sendMagicEffect(CONST_ME_HOLYAREA)
                            creature:sendTextMessage(MESSAGE_INFO_DESCR, "You have been revived!")
                            return true
                        end
                    end
                end
            end
        end
    end
    return false
end

--- Adjusts experience gained based on equipment bonuses.
-- @param player Player
-- @param exp number
-- @return number : Modified experience
function calculateModifiedExperience(player, exp)
    for slot = CONST_SLOT_HEAD, CONST_SLOT_AMMO do
        local item = player:getSlotItem(slot)
        if item then
            local values = item:getBonusAttributes()
            if values then
                for _, v in pairs(values) do
                    local attr = US_ENCHANTMENTS[v[1]]
                    if attr and attr.name == "Experience" then
                        exp = exp + math.ceil(exp * v[2] / 100)
                    end
                end
            end
        end
    end
    return exp
end

--- Validates and handles item movement, applying equip logic if needed.
-- @param player Player
-- @param item Item
-- @param fromPosition Position
-- @param toPosition Position
-- @return boolean : True if allowed
function handleItemMove(player, item, fromPosition, toPosition)
    if (not item:getType():isUpgradable() and not item:getType():canHaveItemLevel()) or toPosition.y == CONST_SLOT_AMMO then
        return true
    end
    if not item:getType():usesSlot(toPosition.y) then
        return true
    end

    if US_CONFIG.REQUIRE_LEVEL and isEquipPosition(toPosition) then
        if player:getLevel() < item:getItemLevel() and not item:isLimitless() then
            player:sendTextMessage(MESSAGE_STATUS_SMALL, "You need a higher level to equip that item.")
            return false
        end
    end

    -- Equip logic
    if isEquipPosition(toPosition) and (fromPosition.y >= 64 or fromPosition.x ~= CONTAINER_POSITION) then
        local oldItem = player:getSlotItem(toPosition.y)
        if oldItem and oldItem:getType():isUpgradable() then
            removeItemConditions(player, oldItem)
        end

        if item:getType():isUpgradable() then
            local newBonuses = item:getBonusAttributes()
            if newBonuses then
                local bonusML = item:getCustomAttribute("bonus_magiclevel")
                if bonusML and bonusML > 0 then
                    local c = Condition(CONDITION_ATTRIBUTES)
                    c:setParameter(CONDITION_PARAM_STAT_MAGICPOINTS, bonusML)
                    c:setParameter(CONDITION_PARAM_TICKS, -1)
                    c:setParameter(CONDITION_PARAM_SUBID, 70000 + player:getId() % 1000)
                    c:setParameter(CONDITION_PARAM_BUFF_SPELL, true)
                    addEvent(function()
                        local p = Player(player:getId())
                        if p then
                            p:addCondition(c)
                        end
                    end, 100)
                end
                addEvent(us_onEquip, 10, player:getId(), item:getUniqueId(), toPosition.y)
            end
        end
    end
    return true
end

--- Checks if a Position is an equipment slot.
-- @param position Position
-- @return boolean
function isEquipPosition(position)
    return position.y <= CONST_SLOT_AMMO and position.y ~= CONST_SLOT_BACKPACK
end

--- Handles post-move logic, e.g. unequipping items.
-- @param player Player
-- @param item Item
-- @param fromPosition Position
-- @param toPosition Position
function handleItemMoved(player, item, fromPosition, toPosition)
    if not item:getType():isUpgradable() then
        return
    end
    if isEquipPosition(toPosition) then
        return
    end
    if fromPosition.y >= 64 and toPosition.y >= 64 then
        return
    end
    if fromPosition.y >= 64 and toPosition.y == CONST_SLOT_BACKPACK then
        return
    end

    if isEquipPosition(fromPosition) then
        removeItemConditions(player, item)
        local ml = item:getCustomAttribute("bonus_magiclevel")
        if ml and ml > 0 then
            player:removeCondition(CONDITION_ATTRIBUTES, CONDITIONID_COMBAT, 70000 + player:getId() % 1000)
        end
    end
end

--- Removes condition bonuses from a player's item.
-- @param player Player
-- @param item Item
function removeItemConditions(player, item)
    local bonuses = item:getBonusAttributes()
    if bonuses then
        local itemId = item:getId()
        for i = 1, #bonuses do
            local val = bonuses[i]
            local bId = val[1]
            local bVal = val[2]
            local attr = US_ENCHANTMENTS[bId]
            if attr and attr.combatType == US_TYPES.CONDITION then
                if US_CONDITIONS[bId] and US_CONDITIONS[bId][bVal] and US_CONDITIONS[bId][bVal][itemId] then
                    local c = US_CONDITIONS[bId][bVal][itemId]
                    if c:getType() ~= CONDITION_MANASHIELD then
                        player:removeCondition(c:getType(), CONDITIONID_COMBAT, c:getSubId())
                    else
                        player:removeCondition(c:getType(), CONDITIONID_COMBAT)
                    end
                end
            end
        end

        local ml = item:getCustomAttribute("bonus_magiclevel")
        if ml and ml > 0 and US_CONDITIONS[MAGICLEVEL.ATTR_ID] and US_CONDITIONS[MAGICLEVEL.ATTR_ID][ml] and
            US_CONDITIONS[MAGICLEVEL.ATTR_ID][ml][itemId] then
            player:removeCondition(CONDITION_ATTRIBUTES, CONDITIONID_COMBAT,
                US_CONDITIONS[MAGICLEVEL.ATTR_ID][ml][itemId]:getSubId())
        end
    end
end

--- Called when damage is dealt, adjusting final damage or healing based on gear.
-- @param creature Creature
-- @param attacker Creature
-- @param primaryDamage number
-- @param primaryType number
-- @param secondaryDamage number
-- @param secondaryType number
-- @param origin number
-- @return number, number, number, number
function us_onDamaged(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
    if primaryType == COMBAT_HEALING or secondaryType == COMBAT_HEALING then
        return processHealingModifiers(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType)
    end

    if attacker:isPlayer() then
        local mod = processAttackerModifiers(attacker, creature, primaryDamage, primaryType, secondaryDamage,
            secondaryType)
        primaryDamage = mod.primaryDamage
        secondaryDamage = mod.secondaryDamage
    end

    if creature:isPlayer() then
        local mod = processDefenderModifiers(creature, attacker, primaryDamage, primaryType, secondaryDamage,
            secondaryType)
        primaryDamage = mod.primaryDamage
        secondaryDamage = mod.secondaryDamage
    end
    return primaryDamage, primaryType, secondaryDamage, secondaryType
end

--- Adjusts healing amounts based on gear bonuses (attacker and target).
-- @param creature Creature
-- @param attacker Creature
-- @param primaryDamage number
-- @param primaryType number
-- @param secondaryDamage number
-- @param secondaryType number
-- @return number, number, number, number
function processHealingModifiers(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType)
    if attacker:isPlayer() then
        local primeTotal, secTotal = 0, 0
        for slot = CONST_SLOT_HEAD, CONST_SLOT_AMMO do
            local it = attacker:getSlotItem(slot)
            if it and it:getType():usesSlot(slot) then
                local values = it:getBonusAttributes()
                if values then
                    for _, v in pairs(values) do
                        local a = US_ENCHANTMENTS[v[1]]
                        if a and a.name == "Increased Healing" then
                            if primaryType == COMBAT_HEALING then
                                primeTotal = primeTotal + v[2]
                            end
                            if secondaryType == COMBAT_HEALING then
                                secTotal = secTotal + v[2]
                            end
                        end
                    end
                end
            end
        end
        if primaryType == COMBAT_HEALING and primeTotal > 0 then
            primaryDamage = math.floor(primaryDamage + (primaryDamage * primeTotal / 100))
        end
        if secondaryType == COMBAT_HEALING and secTotal > 0 then
            secondaryDamage = math.floor(secondaryDamage + (secondaryDamage * secTotal / 100))
        end
    end

    if creature:isPlayer() then
        local primeTotal, secTotal = 0, 0
        for slot = CONST_SLOT_HEAD, CONST_SLOT_AMMO do
            local it = creature:getSlotItem(slot)
            if it and it:getType():usesSlot(slot) then
                local values = it:getBonusAttributes()
                if values then
                    for _, v in pairs(values) do
                        local a = US_ENCHANTMENTS[v[1]]
                        if a and a.name == "Increased Healing" then
                            if primaryDamage > 0 then
                                primeTotal = primeTotal + v[2]
                            end
                            if secondaryDamage > 0 then
                                secTotal = secTotal + v[2]
                            end
                        end
                    end
                end
            end
        end
        if primeTotal > 0 then
            primaryDamage = math.floor(primaryDamage + (primaryDamage * primeTotal / 100))
        end
        if secTotal > 0 then
            secondaryDamage = math.floor(secondaryDamage + (secondaryDamage * secTotal / 100))
        end
    end

    return primaryDamage, primaryType, secondaryDamage, secondaryType
end

--- Adjusts damage for attacker-based bonuses like life steal or double damage.
-- @param attacker Creature
-- @param target Creature
-- @param primaryDamage number
-- @param primaryType number
-- @param secondaryDamage number
-- @param secondaryType number
-- @return table : {primaryDamage, secondaryDamage}
function processAttackerModifiers(attacker, target, primaryDamage, primaryType, secondaryDamage, secondaryType)
    local doubleDamageTotal, primeTotal, secTotal = 0, 0, 0
    local lifeSteal, manaSteal = 0, 0

    for slot = CONST_SLOT_HEAD, CONST_SLOT_AMMO do
        local it = attacker:getSlotItem(slot)
        if it and it:getType():usesSlot(slot) then
            local values = it:getBonusAttributes()
            if values then
                for _, v in pairs(values) do
                    local a = US_ENCHANTMENTS[v[1]]
                    if a and a.combatType and a.combatType ~= US_TYPES.CONDITION then
                        if a.combatType == US_TYPES.TRIGGER and a.triggerType == US_TRIGGERS.ATTACK then
                            a.execute(attacker, target, v[2])
                        elseif a.name == "Double Damage" then
                            doubleDamageTotal = doubleDamageTotal + v[2]
                        else
                            if a.combatDamage then
                                if primaryType > 0 and a.combatType == US_TYPES.OFFENSIVE then
                                    local match = (a.combatDamage % (primaryType + primaryType) >= primaryType)
                                    if match then
                                        primeTotal = primeTotal + v[2]
                                    end
                                end
                                if secondaryType > 0 and a.combatType == US_TYPES.OFFENSIVE then
                                    local match = (a.combatDamage % (secondaryType + secondaryType) >= secondaryType)
                                    if match then
                                        secTotal = secTotal + v[2]
                                    end
                                end
                            end
                            if a.name == "Life Steal" then
                                lifeSteal = lifeSteal + v[2]
                            elseif a.name == "Mana Steal" then
                                manaSteal = manaSteal + v[2]
                            end
                        end
                    end
                end
            end
        end
    end

    if doubleDamageTotal > 0 and math.random(100) < doubleDamageTotal then
        primaryDamage = primaryDamage * 2
        secondaryDamage = secondaryDamage * 2
    end
    if primeTotal > 0 then
        local bonus = math.floor(primaryDamage * primeTotal / 100)
        primaryDamage = math.floor(primaryDamage + bonus)
    end
    if secTotal > 0 then
        local bonus = math.floor(secondaryDamage * secTotal / 100)
        secondaryDamage = math.floor(secondaryDamage + bonus)
    end

    local total = math.abs(primaryDamage + secondaryDamage)
    if lifeSteal > 0 then
        local heal = math.floor((total * lifeSteal / 100))
        if heal > 0 then
            attacker:addHealth(heal)
        end
    end
    if manaSteal > 0 then
        local mp = math.floor((total * manaSteal / 100))
        if mp > 0 then
            attacker:addMana(mp)
        end
    end

    return {
        primaryDamage = primaryDamage,
        secondaryDamage = secondaryDamage
    }
end

--- Adjusts damage for defender-based bonuses like damage reduction or triggers on being hit.
-- @param defender Creature
-- @param attacker Creature
-- @param primaryDamage number
-- @param primaryType number
-- @param secondaryDamage number
-- @param secondaryType number
-- @return table : {primaryDamage, secondaryDamage}
function processDefenderModifiers(defender, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType)
    local primeTotal, secTotal = 0, 0

    for slot = CONST_SLOT_HEAD, CONST_SLOT_AMMO do
        local it = defender:getSlotItem(slot)
        if it and it:getType():usesSlot(slot) then
            local values = it:getBonusAttributes()
            if values then
                for _, v in pairs(values) do
                    local a = US_ENCHANTMENTS[v[1]]
                    if a and a.combatType and a.combatType ~= US_TYPES.CONDITION then
                        if a.combatType == US_TYPES.TRIGGER and a.triggerType == US_TRIGGERS.HIT then
                            a.execute(defender, attacker, v[2])
                        elseif a.combatDamage then
                            if primaryType ~= 0 and (a.combatDamage % (primaryType + primaryType) >= primaryType) and
                                a.combatType == US_TYPES.DEFENSIVE then
                                primeTotal = primeTotal + v[2]
                            end
                            if secondaryType ~= 0 and
                                (a.combatDamage % (secondaryType + secondaryType) >= secondaryType) and a.combatType ==
                                US_TYPES.DEFENSIVE then
                                secTotal = secTotal + v[2]
                            end
                        end
                    end
                end
            end
        end
    end

    if primeTotal > 0 then
        local reduced = math.floor(primaryDamage * primeTotal / 100)
        primaryDamage = math.floor(primaryDamage - reduced)
    end
    if secTotal > 0 then
        local reduced = math.floor(secondaryDamage * secTotal / 100)
        secondaryDamage = math.floor(secondaryDamage - reduced)
    end

    return {
        primaryDamage = primaryDamage,
        secondaryDamage = secondaryDamage
    }
end

--- Enhances item/creature description with item-level, enchantments, or total item level.
-- @param player Player
-- @param thing Thing
-- @param description string
-- @return string
function enhanceItemDescription(player, thing, description)
    if thing:isItem() then
        if thing.itemid == US_CONFIG.ITEM_MIND_CRYSTAL and thing:hasMemory() then
            description = enhanceMindCrystalDescription(thing, description)
        elseif thing:getType():isUpgradable() then
            description = enhanceUpgradableItemDescription(thing, description)
        elseif thing:getType():canHaveItemLevel() then
            description = enhanceItemLevelDescription(thing, description, 1)
        end
    elseif thing:isPlayer() then
        description = enhancePlayerDescription(player, thing, description)
    end
    return description
end

--- Appends any stored enchant data in a Mind Crystal to its description.
-- @param crystal Item
-- @param description string
-- @return string
function enhanceMindCrystalDescription(crystal, description)
    for i = 4, 1, -1 do
        local e = crystal:getBonusAttribute(i)
        if e then
            local attr = US_ENCHANTMENTS[e[1]]
            if attr then
                description = description:gsub(crystal:getName() .. "%.", "%1\n" .. attr.format(e[2]))
            end
        end
    end
    return description
end

local function overrideRequiredLevelText(description, item)
    description = description:gsub("(It can only be wielded properly by [^%.]- of level )(%d+)( or higher)",
        function(prefix, reqStr, suffix)
            local defaultLevel = tonumber(reqStr) or 0
            local lvl = item:getItemLevel()
            if lvl > defaultLevel then
                return prefix .. lvl .. suffix
            end
            return prefix .. reqStr .. suffix
        end)
    return description
end

local function getIndefiniteArticleFor(text)
    if text:sub(1, 1):lower():match("[aeiou]") then
        return "an"
    end
    return "a"
end

local function buildItemNameWithArticle(rarityName, baseName)
    if rarityName ~= "" then
        return string.format("%s %s %s", getIndefiniteArticleFor(rarityName), rarityName, baseName)
    end
    return string.format("%s %s", getIndefiniteArticleFor(baseName), baseName)
end

--- Extends the description of an upgradable item with upgrade level, item level, rarity, etc.
-- @param item Item
-- @param description string
-- @return string
function enhanceUpgradableItemDescription(item, description)
    local baseName = item:getName()
    local r = item:getRarity()
    local rname = (r and r.name ~= "") and r.name or ""
    local upg = item:getUpgradeLevel() or 0
    local lvl = item:getItemLevel()
    local bonuses = item:getBonusAttributes()

    description = description:gsub("You see (an? )", "You see ")
    description = description:gsub("You see the ", "You see ")
    local forcedName = buildItemNameWithArticle(rname, baseName)
    description = description:gsub("^(You see [^%(\n%.]+)", "You see " .. forcedName)

    if item:isUnique() then
        description = description:gsub(baseName, item:getUniqueName())
    end
    if upg > 0 then
        description = description:gsub("^(You see [^%(%.]+)", "%1 +" .. upg)
        description = description:gsub("(%+%d+)%(", "%1 (")
    end

    description = description:gsub("\nItem Level:%s?%d+", "")
    description = description .. "\n\n[ Attributes ]\nItem Level: " .. lvl
    description = MAGICLEVEL.extendDescription(item, description)

    if bonuses and #bonuses > 0 then
        local e = "\n\n[ Enchantments ]"
        for _, b in ipairs(bonuses) do
            local attrId, val = b[1], b[2]
            local attr = US_ENCHANTMENTS[attrId]
            if attr then
                local f = attr.format(val)
                if f and not description:find(f, 1, true) then
                    e = e .. "\n" .. f
                end
            end
        end
        description = description .. e
    end
    if item:isMirrored() and not description:find("Mirrored") then
        description = description .. "\nMirrored"
    end
    description = overrideRequiredLevelText(description, item)
    description = description:gsub("([^%s])%(", "%1 (")
    return description
end

--- Extends an item description for gear that only has an item level (no upgradable bonus).
-- @param item Item
-- @param description string
-- @param distance number
-- @return string
function enhanceItemLevelDescription(item, description, distance)
    local lvl = item:getItemLevel()
    if not description:match("^You see") then
        description = "You see " .. description
    end
    local it = ItemType(item:getId())
    local defDesc = it and it:getDescription() or ""

    description = description:gsub("\nItem Level: %d+", "")

    if distance <= 1 then
        if defDesc ~= "" and description:find(defDesc, 1, true) then
            description = description:gsub(defDesc, defDesc .. "\nItem Level: " .. lvl)
        else
            if description:find("oz%.", 1, true) then
                description = description:gsub("oz%.", "oz.\nItem Level: " .. lvl)
            else
                if description:find("%)%.?", 1, true) then
                    description = description:gsub("(%)%.?)", "%1\nItem Level: " .. lvl)
                else
                    description = description .. "\nItem Level: " .. lvl
                end
            end
        end
    else
        if description:find("%)%.?", 1, true) then
            description = description:gsub("(%)%.?)", "%1\nItem Level: " .. lvl)
        else
            description = description .. "\nItem Level: " .. lvl
        end
    end
    return description
end

--- Shows total item level on a looked-at player.
-- @param observer Player
-- @param player Player
-- @param description string
-- @return string
function enhancePlayerDescription(observer, player, description)
    local sum = 0
    for slot = CONST_SLOT_HEAD, CONST_SLOT_AMMO do
        local it = player:getSlotItem(slot)
        if it then
            sum = sum + it:getItemLevel()
        end
    end
    return description .. "\nTotal Item Level: " .. sum
end

--- Applies item conditions on equip after a short delay.
-- @param cid number : Player ID
-- @param iuid number : Item UniqueID
-- @param slot number : Equipment slot
function us_onEquip(cid, iuid, slot)
    local player = Player(cid)
    if not player or not player:getSlotItem(slot) then
        return
    end

    local slotUid = player:getSlotItem(slot):getUniqueId()
    if (iuid + 1) ~= slotUid then
        return
    end

    local item = Item(slotUid)
    if not item then
        return
    end

    local newBonuses = item:getBonusAttributes()
    if newBonuses then
        local maxHP = player:getMaxHealth()
        local maxMP = player:getMaxMana()

        for i = 1, #newBonuses do
            local bId = newBonuses[i][1]
            local bVal = newBonuses[i][2]
            local attr = US_ENCHANTMENTS[bId]
            if attr and attr.combatType == US_TYPES.CONDITION then
                applyConditionBonus(player, item, bId, bVal, attr, slot, i, maxHP, maxMP)
            end
        end
        syncItemAugments(item)
    end
end

--- Applies a condition bonus from an attribute (e.g. Max HP%, Mana Shield).
-- @param player Player
-- @param item Item
-- @param bonusId number
-- @param bonusValue number
-- @param attr table
-- @param slot number
-- @param index number
-- @param maxHP number
-- @param maxMP number
function applyConditionBonus(player, item, bonusId, bonusValue, attr, slot, index, maxHP, maxMP)
    if not US_CONDITIONS[bonusId] then
        US_CONDITIONS[bonusId] = {}
    end
    local itemId = item:getId()
    if not US_CONDITIONS[bonusId][bonusValue] then
        US_CONDITIONS[bonusId][bonusValue] = {}
    end
    if not US_CONDITIONS[bonusId][bonusValue][itemId] then
        US_CONDITIONS[bonusId][bonusValue][itemId] = Condition(attr.condition)
        if attr.condition ~= CONDITION_MANASHIELD then
            US_CONDITIONS[bonusId][bonusValue][itemId]:setParameter(CONDITION_PARAM_SUBID,
                1000 + player:getNextSubId(slot, index))
            if attr.percentage then
                US_CONDITIONS[bonusId][bonusValue][itemId]:setParameter(attr.param, 100 + bonusValue)
            else
                US_CONDITIONS[bonusId][bonusValue][itemId]:setParameter(attr.param, bonusValue)
            end
            US_CONDITIONS[bonusId][bonusValue][itemId]:setParameter(CONDITION_PARAM_TICKS, -1)
        else
            US_CONDITIONS[bonusId][bonusValue][itemId]:setParameter(CONDITION_PARAM_TICKS, 86400000)
        end
        US_CONDITIONS[bonusId][bonusValue][itemId]:setParameter(CONDITION_PARAM_BUFF_SPELL, true)
        player:addCondition(US_CONDITIONS[bonusId][bonusValue][itemId])
    else
        player:addCondition(US_CONDITIONS[bonusId][bonusValue][itemId])
    end

    if attr.param == CONDITION_PARAM_STAT_MAXHITPOINTS or
        (attr.param == CONDITION_PARAM_STAT_MAXHITPOINTSPERCENT and player:getHealth() == maxHP) then
        player:addHealth(player:getMaxHealth())
    end
    if attr.param == CONDITION_PARAM_STAT_MAXMANAPOINTS or
        (attr.param == CONDITION_PARAM_STAT_MAXMANAPOINTSPERCENT and player:getMana() == maxMP) then
        player:addMana(player:getMaxMana())
    end
end

--- Applies any magic-level bonuses on login (stub here, actual in magiclevel.lua).
-- @param player Player
function applyMagicLevelBonuses(player)
    -- Overridden in magiclevel.lua if needed
end

--- Provides a unique subId for consecutive condition usage.
-- @param self Player
-- @param itemSlot number
-- @param attrSlot number
-- @return number
function Player.getNextSubId(self, itemSlot, attrSlot)
    local cid = self:getId()
    if not US_SUBID[cid] then
        US_SUBID[cid] = {
            current = 0
        }
    end
    US_SUBID[cid].current = US_SUBID[cid].current + 1
    if not US_SUBID[cid][itemSlot] then
        US_SUBID[cid][itemSlot] = {}
    end
    US_SUBID[cid][itemSlot][attrSlot] = US_SUBID[cid].current
    return US_SUBID[cid].current
end

--- Initializes augment synchronization for any existing players (script reload scenario).
function initializeAugmentIntegration()
    local p = Game.getPlayers()
    for _, pl in ipairs(p) do
        for slot = CONST_SLOT_HEAD, CONST_SLOT_AMMO do
            local it = pl:getSlotItem(slot)
            if it then
                syncItemAugments(it)
            end
        end
    end
end

-- Call once on script load
initializeAugmentIntegration()

-- data/scripts/custom/itemupgrades/crystals.lua
-- Logic for all crystal items (upgrading, augments, rerolls, etc.).
dofile('data/scripts/custom/itemupgrades/augments.lua') -- for removeAllAugments, etc.
local CrystalsAction = Action()

--- Basic validation that the target is a valid upgradable item and not equipped.
-- @param player Player
-- @param item Item
-- @param target Item
-- @param toPosition Position
-- @return boolean
local function validateTarget(player, item, target, toPosition)
    if not target or not target:isItem() or not target:getType():isUpgradable() then
        return false
    end
    if toPosition.y <= CONST_SLOT_AMMO then
        player:sendTextMessage(MESSAGE_STATUS_WARNING, "You can't use that on an equipped item!")
        player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
        return false
    end
    return true
end

--- Check if an item is not mirrored.
-- @param player Player
-- @param target Item
-- @return boolean
local function validateNotMirrored(player, target)
    if target:isMirrored() then
        player:sendTextMessage(MESSAGE_STATUS_WARNING, "That item is mirrored and can't be modified.")
        return false
    end
    return true
end

--- Check if an item is not unique.
-- @param player Player
-- @param target Item
-- @return boolean
local function validateNotUnique(player, target)
    if target:isUnique() then
        player:sendTextMessage(MESSAGE_STATUS_WARNING, "Can't modify a Unique item's attributes.")
        return false
    end
    return true
end

--- Handles the Upgrade Crystal (+1 upgrade level attempts).
-- @param player Player
-- @param item Item
-- @param target Item
-- @return boolean
local function handleUpgradeCrystal(player, item, target)
    local it = ItemType(target.itemid)
    if not it:isUpgradable() then
        return false
    end
    local upg = target:getUpgradeLevel()
    if upg >= US_CONFIG.MAX_UPGRADE_LEVEL then
        player:sendTextMessage(MESSAGE_STATUS_WARNING, "Maximum upgrade level reached!")
        return false
    end
    local newLevel = upg + 1

    if newLevel >= US_CONFIG.UPGRADE_LEVEL_DESTROY then
        if math.random(100) > US_CONFIG.UPGRADE_DESTROY_CHANCE[newLevel] then
            if player:getItemCount(US_CONFIG.ITEM_UPGRADE_CATALYST) > 0 then
                player:sendTextMessage(MESSAGE_INFO_DESCR, "Upgrade failed! The catalyst protected your item.")
                player:removeItem(US_CONFIG.ITEM_UPGRADE_CATALYST, 1)
                item:remove(1)
                player:getPosition():sendMagicEffect(CONST_ME_GROUNDSHAKER)
                return true
            end
            player:sendTextMessage(MESSAGE_STATUS_WARNING, "Upgrade failed! Item destroyed.")
            target:remove(1)
            item:remove(1)
            player:getPosition():sendMagicEffect(CONST_ME_GROUNDSHAKER)
            return true
        end
    else
        if math.random(100) > US_CONFIG.UPGRADE_SUCCESS_CHANCE[newLevel] then
            player:sendTextMessage(MESSAGE_STATUS_WARNING, "Upgrade failed! Upgrade level -1.")
            target:reduceUpgradeLevel()
            item:remove(1)
            player:getPosition():sendMagicEffect(CONST_ME_GROUNDSHAKER)
            return true
        end
    end

    target:setUpgradeLevel(newLevel)
    item:remove(1)
    local bonuses = target:getBonusAttributes()

    if target:getItemLevel() == 0 and bonuses and #bonuses > 0 then
        target:setItemLevel(1, true)
    end

    player:sendTextMessage(MESSAGE_INFO_DESCR, "Item upgrade level is now +" .. newLevel .. "!")
    player:getPosition():sendMagicEffect(CONST_ME_GIFT_WRAPS)
    player:getPosition():sendMagicEffect(CONST_ME_FIREWORK_YELLOW)
    return true
end

--- Add a new modifier to a common item (becoming rare if it has 2 modifiers).
-- @param player Player
-- @param item Item
-- @param target Item
-- @return boolean
local function handleAugmentingCrystal(player, item, target)
    if not validateNotUnique(player, target) then
        return false
    end
    local currentRarityId = target:getRarityId()
    if currentRarityId ~= COMMON then
        player:sendTextMessage(MESSAGE_STATUS_WARNING, "Augmentation is only for common items.")
        return false
    end

    local bonuses = target:getBonusAttributes() or {}
    if #bonuses >= 2 then
        player:sendTextMessage(MESSAGE_STATUS_WARNING, "Item already has the max modifiers for common.")
        return false
    end

    local newRarity = (currentRarityId == COMMON and #bonuses == 1) and RARE or currentRarityId
    local currentItemLevel = target:getItemLevel()
    local existingIds = {}
    for _, b in ipairs(bonuses) do
        table.insert(existingIds, b[1])
    end

    local attrId = rollRandomAttribute(existingIds, currentItemLevel, target:getItemType())
    local attr = US_ENCHANTMENTS[attrId]
    local val = calculateAttributeValue(attr, currentItemLevel)
    target:setCustomAttribute("Slot" .. (target:getLastSlot() + 1), attrId .. "|" .. val)
    target:setAttribute(ITEM_ATTRIBUTE_ACTIONID, target:getActionId())

    if newRarity ~= currentRarityId then
        target:setRarity(newRarity)
        player:sendTextMessage(MESSAGE_INFO_DESCR,
            "Your item upgraded from " .. US_CONFIG.RARITY[currentRarityId].name .. " to " ..
                US_CONFIG.RARITY[newRarity].name .. " with a new modifier: " .. attr.name)
    else
        player:sendTextMessage(MESSAGE_INFO_DESCR, "Added a new modifier: " .. attr.name)
    end

    if isCombatEnchantment(attrId) then
        applyAugmentForEnchantment(target, attrId, val)
    end
    item:remove(1)
    return true
end

--- Rerolls the existing modifiers of a (common or rare) item.
-- @param player Player
-- @param item Item
-- @param target Item
-- @return boolean
local function handleAlterationCrystal(player, item, target)
    if not validateNotUnique(player, target) then
        return false
    end
    local r = target:getRarityId()
    if r > RARE then
        player:sendTextMessage(MESSAGE_STATUS_WARNING, "Alteration is only for common/rare items.")
        return false
    end
    local bonuses = target:getBonusAttributes()
    if not bonuses then
        player:sendTextMessage(MESSAGE_STATUS_WARNING, "Item has no modifiers to alter.")
        return false
    end

    removeAllAugments(target)
    for i = 1, #bonuses do
        target:removeCustomAttribute("Slot" .. i)
    end

    local newRarity = math.random(1, 2) -- common or rare
    target:setRarity(newRarity)
    local it = ItemType(target.itemid)
    local wt = it:getWeaponType()
    target:rollAttribute(nil, it, wt, true)

    syncItemAugments(target)
    item:remove(1)
    player:sendTextMessage(MESSAGE_INFO_DESCR, "Item altered to " .. target:getRarity().name .. " rarity.")
    return true
end

--- Remove all modifiers from an item.
-- @param player Player
-- @param item Item
-- @param target Item
-- @return boolean
local function handleScouringCrystal(player, item, target)
    if not validateNotUnique(player, target) then
        return false
    end

    local bonuses = target:getBonusAttributes()
    if not bonuses then
        player:sendTextMessage(MESSAGE_STATUS_WARNING, "Item has no attributes.")
        return false
    end

    removeAllAugments(target)
    for i = 1, #bonuses do
        target:removeCustomAttribute("Slot" .. i)
    end
    target:setRarity(COMMON)

    item:remove(1)
    player:sendTextMessage(MESSAGE_INFO_DESCR, "All modifiers removed (scoured).")
    return true
end

--- Add a new modifier to an item that already has at least one (exaltation).
-- @param player Player
-- @param item Item
-- @param target Item
-- @return boolean
local function handleExaltationCrystal(player, item, target)
    if not validateNotUnique(player, target) then
        return false
    end
    local bonuses = target:getBonusAttributes()
    if not bonuses or #bonuses == 0 then
        player:sendTextMessage(MESSAGE_STATUS_WARNING, "Item needs at least one existing modifier.")
        return false
    end
    if #bonuses >= 4 then
        player:sendTextMessage(MESSAGE_STATUS_WARNING, "Item already has 4 modifiers (max).")
        return false
    end

    local oldRarity = target:getRarityId()
    local newRarity = oldRarity + 1
    if not US_CONFIG.RARITY[newRarity] then
        player:sendTextMessage(MESSAGE_STATUS_WARNING, "Item is already at maximum rarity.")
        return false
    end

    local lvl = target:getItemLevel()
    local existingIds = {}
    for _, b in ipairs(bonuses) do
        table.insert(existingIds, b[1])
    end

    local newId = rollRandomAttribute(existingIds, lvl, target:getItemType())
    local newAttr = US_ENCHANTMENTS[newId]
    local newVal = calculateAttributeValue(newAttr, lvl)

    target:setCustomAttribute("Slot" .. (target:getLastSlot() + 1), newId .. "|" .. newVal)
    target:setRarity(newRarity)
    target:setAttribute(ITEM_ATTRIBUTE_ACTIONID, target:getActionId())
    if isCombatEnchantment(newId) then
        applyAugmentForEnchantment(target, newId, newVal)
    end

    item:remove(1)
    player:sendTextMessage(MESSAGE_INFO_DESCR,
        "Item exalted from " .. US_CONFIG.RARITY[oldRarity].name .. " to " .. US_CONFIG.RARITY[newRarity].name ..
            " with a new modifier: " .. newAttr.name)
    return true
end

--- Reroll all modifiers and rarity of the item (chaos).
-- @param player Player
-- @param item Item
-- @param target Item
-- @return boolean
local function handleChaosCrystal(player, item, target)
    if not validateNotUnique(player, target) then
        return false
    end
    local bonuses = target:getBonusAttributes()
    if not bonuses then
        player:sendTextMessage(MESSAGE_STATUS_WARNING, "Item has no modifiers to chaos-reroll!")
        return false
    end

    removeAllAugments(target)
    for i = 1, #bonuses do
        target:removeCustomAttribute("Slot" .. i)
    end

    target:rollRarity()
    local it = ItemType(target.itemid)
    local wt = it:getWeaponType()
    target:rollAttribute(nil, it, wt, true)

    syncItemAugments(target)
    item:remove(1)
    player:sendTextMessage(MESSAGE_INFO_DESCR,
        "Chaotic energies have rerolled the item to " .. target:getRarity().name .. " rarity!")
    return true
end

--- Copy or apply bonus attributes using the Mind Crystal.
-- @param player Player
-- @param item Item
-- @param target Item
-- @return boolean
local function handleMindCrystal(player, item, target)
    if not item:hasMemory() then
        local b = target:getBonusAttributes()
        if not b then
            player:sendTextMessage(MESSAGE_STATUS_WARNING, "Target has no attributes to store.")
            return false
        end
        if target:isUnique() then
            player:sendTextMessage(MESSAGE_STATUS_WARNING, "Can't copy a Unique item's attributes.")
            return false
        end

        local c = Game.createItem(item.itemid, 1)
        local maxAttr = target:getMaxAttributes()
        for i = 1, maxAttr do
            local a = target:getBonusAttribute(i)
            if a then
                c:addAttribute(i, a[1], a[2])
                target:removeCustomAttribute("Slot" .. i)
            end
        end
        c:setMemory(true)
        if player:addItemEx(c) == RETURNVALUE_NOERROR then
            player:sendTextMessage(MESSAGE_INFO_DESCR, "Attributes saved into the crystal's memory!")
            item:remove(1)
            target:setRarity(COMMON)
            return true
        end
        return false
    else
        if target:getBonusAttributes() then
            player:sendTextMessage(MESSAGE_STATUS_WARNING, "Target already has attributes.")
            return false
        end
        local maxAttr = target:getMaxAttributes()
        for i = 1, maxAttr do
            local a = item:getBonusAttribute(i)
            if a then
                target:addAttribute(i, a[1], a[2])
            end
        end
        target:updateRarityByBonusCount()
        item:remove(1)
        player:sendTextMessage(MESSAGE_INFO_DESCR, "Successfully applied the stored attributes.")
        return true
    end
end

--- Remove one random modifier from the item.
-- @param player Player
-- @param item Item
-- @param target Item
-- @return boolean
local function handleAnnulmentCrystal(player, item, target)
    if not validateNotUnique(player, target) then
        return false
    end
    local bonuses = target:getBonusAttributes()
    if not bonuses or #bonuses == 0 then
        player:sendTextMessage(MESSAGE_STATUS_WARNING, "Item has no attributes to annul.")
        return false
    end
    local slotToRemove = math.random(1, #bonuses)
    local info = target:getBonusAttribute(slotToRemove)
    local attrName = US_ENCHANTMENTS[info[1]].name

    local saved = {}
    for i = 1, #bonuses do
        if i ~= slotToRemove then
            local a = target:getBonusAttribute(i)
            if a then
                saved[#saved + 1] = {
                    id = a[1],
                    value = a[2]
                }
            end
        end
    end

    for i = 1, #bonuses do
        target:removeCustomAttribute("Slot" .. i)
    end

    for i = 1, #saved do
        target:setCustomAttribute("Slot" .. i, saved[i].id .. "|" .. saved[i].value)
    end
    target:updateRarityByBonusCount()

    item:remove(1)
    player:sendTextMessage(MESSAGE_INFO_DESCR, "Annulled the '" .. attrName .. "' modifier from the item.")
    return true
end

--- Duplicate an item (mirroring it).
-- @param player Player
-- @param item Item
-- @param target Item
-- @return boolean
local function handleMirroredCrystal(player, item, target)
    local copy = Game.createItem(target.itemid, 1)
    copy:setRarity(target:getRarityId())
    copy:setCustomAttribute("upgrade", target:getUpgradeLevel())
    copy:setCustomAttribute("item_level", target:getItemLevel())

    local b = target:getBonusAttributes()
    if b then
        for i = 1, target:getMaxAttributes() do
            local a = target:getBonusAttribute(i)
            if a then
                copy:addAttribute(i, a[1], a[2])
            end
        end
    end

    if target:isUnique() then
        copy:setCustomAttribute("unique", target:getUnique())
    end
    if target:isLimitless() then
        copy:setLimitless(true)
    end

    local attributesToCopy = {ITEM_ATTRIBUTE_ATTACK, ITEM_ATTRIBUTE_DEFENSE, ITEM_ATTRIBUTE_EXTRADEFENSE,
                              ITEM_ATTRIBUTE_ARMOR}
    for _, attrType in ipairs(attributesToCopy) do
        local val = target:getAttribute(attrType)
        if val > 0 then
            copy:setAttribute(attrType, val)
        end
    end

    copy:setMirrored(true)
    if player:addItemEx(copy) == RETURNVALUE_NOERROR then
        player:sendTextMessage(MESSAGE_INFO_DESCR, "A mirrored copy has been created.")
        item:remove(1)
        return true
    end
    return false
end

--- Reroll all modifier values (divining).
-- @param player Player
-- @param item Item
-- @param target Item
-- @return boolean
local function handleDiviningCrystal(player, item, target)
    if not validateNotUnique(player, target) then
        return false
    end
    local bonuses = target:getBonusAttributes()
    if not bonuses or #bonuses == 0 then
        player:sendTextMessage(MESSAGE_STATUS_WARNING, "No modifiers to divine!")
        return false
    end

    for i = 1, #bonuses do
        local attr = US_ENCHANTMENTS[bonuses[i][1]]
        local newVal = 1
        if attr.percentage then
            newVal = math.random(1, US_CONFIG.MAX_PERCENTAGE_ROLL)
        elseif attr.VALUES_PER_LEVEL then
            local itemLevel = target:getItemLevel()
            local maxV = math.ceil(itemLevel * attr.VALUES_PER_LEVEL)
            newVal = (maxV < 1) and 1 or math.random(1, maxV)
        end
        target:setCustomAttribute("Slot" .. i, bonuses[i][1] .. "|" .. newVal)
    end

    item:remove(1)
    player:sendTextMessage(MESSAGE_INFO_DESCR, "All modifier values have been divined anew!")
    return true
end

function CrystalsAction.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if not validateTarget(player, item, target, toPosition) then
        return false
    end
    if not validateNotMirrored(player, target) then
        return true
    end

    local crystals = {
        [US_CONFIG[1][ITEM_UPGRADE_CRYSTAL]] = handleUpgradeCrystal,
        [US_CONFIG[1][ITEM_AUGMENTING_CRYSTAL]] = handleAugmentingCrystal,
        [US_CONFIG[1][ITEM_ALTER_CRYSTAL]] = handleAlterationCrystal,
        [US_CONFIG[1][ITEM_SCOURING_CRYSTAL]] = handleScouringCrystal,
        [US_CONFIG[1][ITEM_EXALT_CRYSTAL]] = handleExaltationCrystal,
        [US_CONFIG[1][ITEM_CHAOS_CRYSTAL]] = handleChaosCrystal,
        [US_CONFIG.ITEM_MIND_CRYSTAL] = handleMindCrystal,
        [US_CONFIG.ITEM_ANNULMENT_CRYSTAL] = handleAnnulmentCrystal,
        [US_CONFIG.ITEM_MIRRORED_CRYSTAL] = handleMirroredCrystal,
        [US_CONFIG.ITEM_DIVINE_CRYSTAL] = handleDiviningCrystal
    }
    local handler = crystals[item.itemid]
    if handler then
        return handler(player, item, target)
    end
    return false
end

CrystalsAction:id(US_CONFIG[1][ITEM_UPGRADE_CRYSTAL], US_CONFIG[1][ITEM_AUGMENTING_CRYSTAL],
    US_CONFIG[1][ITEM_ALTER_CRYSTAL], US_CONFIG[1][ITEM_SCOURING_CRYSTAL], US_CONFIG[1][ITEM_EXALT_CRYSTAL],
    US_CONFIG[1][ITEM_CHAOS_CRYSTAL], US_CONFIG.ITEM_MIND_CRYSTAL, US_CONFIG.ITEM_ANNULMENT_CRYSTAL,
    US_CONFIG.ITEM_MIRRORED_CRYSTAL, US_CONFIG.ITEM_DIVINE_CRYSTAL)
CrystalsAction:register()


-- data/scripts/custom/itemupgrades/events.lua
local LoginEvent = CreatureEvent("UpgradeSystemLogin")
local HealthChangeEvent = CreatureEvent("UpgradeSystemHealth")
local ManaChangeEvent = CreatureEvent("UpgradeSystemMana")
local DeathEvent = CreatureEvent("UpgradeSystemDeath")
local KillEvent = CreatureEvent("UpgradeSystemKill")
local PrepareDeathEvent = CreatureEvent("UpgradeSystemPD")
local LogoutEvent = CreatureEvent("MagicLevelLogout")
local GainExperienceEvent = EventCallback
local MoveItemEvent = EventCallback
local ItemMovedEvent = EventCallback
local LookEvent = EventCallback

--- Called when a player logs in.
-- @param player Player
-- @return boolean
function LoginEvent.onLogin(player)
    player:registerEvent("UpgradeSystemKill")
    player:registerEvent("UpgradeSystemHealth")
    player:registerEvent("UpgradeSystemMana")
    player:registerEvent("UpgradeSystemPD")

    local maxHP = player:getMaxHealth()
    local maxMP = player:getMaxMana()

    for slot = CONST_SLOT_HEAD, CONST_SLOT_AMMO do
        local it = player:getSlotItem(slot)
        if it then
            local newBonuses = it:getBonusAttributes()
            if newBonuses then
                for i = 1, #newBonuses do
                    local bId = newBonuses[i][1]
                    local bVal = newBonuses[i][2]
                    local attr = US_ENCHANTMENTS[bId]
                    if attr and attr.combatType == US_TYPES.CONDITION then
                        applyConditionBonus(player, it, bId, bVal, attr, slot, i, maxHP, maxMP)
                    end
                end
                syncItemAugments(it)
            end
        end
    end
    applyMagicLevelBonuses(player)
    return true
end
LoginEvent:type("login")
LoginEvent:register()

--- Called when a creature's health changes.
-- @param creature Creature
-- @param attacker Creature
-- @param primaryDamage number
-- @param primaryType number
-- @param secondaryDamage number
-- @param secondaryType number
-- @param origin number
function HealthChangeEvent.onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage,
    secondaryType, origin)
    if not creature or not attacker then
        return primaryDamage, primaryType, secondaryDamage, secondaryType
    end
    if isInSameParty(creature, attacker) then
        return primaryDamage, primaryType, secondaryDamage, secondaryType
    end
    if primaryType == COMBAT_LIFEDRAIN or secondaryType == COMBAT_LIFEDRAIN then
        return primaryDamage, primaryType, secondaryDamage, secondaryType
    end
    if creature == attacker and primaryType ~= COMBAT_HEALING then
        return primaryDamage, primaryType, secondaryDamage, secondaryType
    end
    if origin == ORIGIN_CONDITION then
        return primaryDamage, primaryType, secondaryDamage, secondaryType
    end
    return us_onDamaged(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
end
HealthChangeEvent:type("healthchange")
HealthChangeEvent:register()

--- Called when a creature's mana changes.
-- @param creature Creature
-- @param attacker Creature
-- @param primaryDamage number
-- @param primaryType number
-- @param secondaryDamage number
-- @param secondaryType number
-- @param origin number
function ManaChangeEvent.onManaChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType,
    origin)
    if not creature or not attacker then
        return primaryDamage, primaryType, secondaryDamage, secondaryType
    end
    if isInSameParty(creature, attacker) then
        return primaryDamage, primaryType, secondaryDamage, secondaryType
    end
    if (primaryType == COMBAT_LIFEDRAIN or secondaryType == COMBAT_LIFEDRAIN or primaryType == COMBAT_MANADRAIN or
        secondaryType == COMBAT_MANADRAIN) then
        return primaryDamage, primaryType, secondaryDamage, secondaryType
    end
    if creature == attacker and primaryType ~= COMBAT_HEALING then
        return primaryDamage, primaryType, secondaryDamage, secondaryType
    end
    if origin == ORIGIN_CONDITION then
        return primaryDamage, primaryType, secondaryDamage, secondaryType
    end
    return us_onDamaged(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
end
ManaChangeEvent:type("manachange")
ManaChangeEvent:register()

--- Called on creature's death.
-- @param creature Creature
-- @param corpse Item
-- @param lasthitkiller Creature
-- @param mostdamagekiller Creature
-- @return boolean
function DeathEvent.onDeath(creature, corpse, lasthitkiller, mostdamagekiller, lasthitunjustified, mostdamageunjustified)
    -- Currently no special logic
    return true
end
DeathEvent:type("death")
DeathEvent:register()

--- Called when a player kills a creature.
-- @param player Player
-- @param target Creature
-- @param lastHit bool
function KillEvent.onKill(player, target, lastHit)
    if player and player:isPlayer() and target and target:isMonster() then
        local center = target:getPosition()
        processKillTriggers(player, center, target)
    end
end
KillEvent:type("kill")
KillEvent:register()

--- Called when a player is about to die (preparedeath).
-- @param creature Creature
-- @param killer Creature
-- @return boolean
function PrepareDeathEvent.onPrepareDeath(creature, killer)
    if creature:isPlayer() then
        if checkReviveOnDeath(creature) then
            return false
        end
    end
    return true
end
PrepareDeathEvent:type("preparedeath")
PrepareDeathEvent:register()

--- Called when a player gains experience.
-- @param player Player
-- @param source Creature|Item
-- @param exp number
-- @param rawExp number
function GainExperienceEvent.onGainExperience(player, source, exp, rawExp)
    return calculateModifiedExperience(player, exp)
end
GainExperienceEvent:register()

--- Called when an item is about to be moved.
-- @param player Player
-- @param item Item
-- @param count number
-- @param fromPosition Position
-- @param toPosition Position
-- @param fromCylinder Cylinder
-- @param toCylinder Cylinder
-- @return boolean
function MoveItemEvent.onMoveItem(player, item, count, fromPosition, toPosition, fromCylinder, toCylinder)
    return handleItemMove(player, item, fromPosition, toPosition)
end
MoveItemEvent:register()

--- Called after an item move completes.
-- @param player Player
-- @param item Item
-- @param count number
-- @param fromPosition Position
-- @param toPosition Position
-- @param fromCylinder Cylinder
-- @param toCylinder Cylinder
function ItemMovedEvent.onItemMoved(player, item, count, fromPosition, toPosition, fromCylinder, toCylinder)
    if isEquipPosition(toPosition) then
        local ml = item:getCustomAttribute("bonus_magiclevel")
        if ml and ml > 0 then
            addEvent(function()
                local p = Player(player:getId())
                if p then
                    local c = Condition(CONDITION_ATTRIBUTES)
                    c:setParameter(CONDITION_PARAM_STAT_MAGICPOINTS, ml)
                    c:setParameter(CONDITION_PARAM_TICKS, -1)
                    c:setParameter(CONDITION_PARAM_SUBID, 70000 + p:getId() % 1000)
                    c:setParameter(CONDITION_PARAM_BUFF_SPELL, true)
                    p:addCondition(c)
                end
            end, 100)
        end
    end
    handleItemMoved(player, item, fromPosition, toPosition)
end
ItemMovedEvent:register()

--- Called when a player looks at an item/creature.
-- @param player Player
-- @param thing Thing
-- @param position Position
-- @param distance number
-- @param description string
function LookEvent.onLook(player, thing, position, distance, description)
    return enhanceItemDescription(player, thing, description)
end
LookEvent:register(10)

--- Called when a player logs out.
-- @param player Player
-- @return boolean
function LogoutEvent.onLogout(player)
    MAGICLEVEL.cleanupOnLogout(player:getId())
    return true
end
LogoutEvent:type("logout")
LogoutEvent:register()


-- data\scripts\custom\itemupgrades\extractor.lua
local CrystalExtractor = Action()

function CrystalExtractor.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if item:getId() == US_CONFIG.CRYSTAL_EXTRACTOR and target:getId() == US_CONFIG.CRYSTAL_FOSSIL then
        local amount = target:getCount()
        for i = 1, amount do
            if math.random(US_CONFIG.CRYSTAL_BREAK_CHANCE) == 1 then
                player:sendTextMessage(MESSAGE_STATUS_WARNING, "Crystal inside broke!")
            else
                local rand = math.random(100)
                local crystals = 1
                if rand <= 20 then
                    crystals = 3
                elseif rand <= 50 then
                    crystals = 2
                end
                for i = 1, crystals do
                    local crystal = math.random(1, #US_CONFIG[1])
                    player:addItem(US_CONFIG[1][crystal])
                end
            end
        end
        target:remove(amount)
    end
    return true
end

CrystalExtractor:id(US_CONFIG.CRYSTAL_EXTRACTOR)
CrystalExtractor:register()


-- Roll a random attribute for an item.
-- @param self Item
-- @param player Player|nil
-- @param itemType ItemType
-- @param weaponType number
-- @param unidentify boolean
-- @return boolean
function Item.rollAttribute(self, player, itemType, weaponType, unidentify)
    if not itemType:isUpgradable() or self:isUnique() then
        return false
    end

    local attrIds = {}
    local item_level = self:getItemLevel()

    if unidentify then
        local bonusCount = self:getRarity().maxBonus
        local usItemType = self:getItemType()
        for i = 1, bonusCount do
            local attrId = rollRandomAttribute(attrIds, item_level, usItemType)
            table.insert(attrIds, attrId)

            local attr = US_ENCHANTMENTS[attrId]
            local value = calculateAttributeValue(attr, item_level)
            self:setCustomAttribute("Slot" .. i, attrId .. "|" .. value)
            if isCombatEnchantment(attrId) then
                applyAugmentForEnchantment(self, attrId, value)
            end
        end
        return true
    else
        local bonuses = self:getBonusAttributes()
        if bonuses then
            local maxPossible = US_CONFIG.RARITY[#US_CONFIG.RARITY].maxBonus
            if #bonuses >= maxPossible then
                if player then
                    player:sendTextMessage(MESSAGE_STATUS_WARNING, "Max number of bonuses reached!")
                end
                return false
            end
            for _, b in pairs(bonuses) do
                table.insert(attrIds, b[1])
            end
        end

        local usItemType = self:getItemType()
        local attrId = rollRandomAttribute(attrIds, item_level, usItemType)
        local attr = US_ENCHANTMENTS[attrId]
        local value = calculateAttributeValue(attr, item_level)
        self:setCustomAttribute("Slot" .. (self:getLastSlot() + 1), attrId .. "|" .. value)

        if isCombatEnchantment(attrId) then
            applyAugmentForEnchantment(self, attrId, value)
        end

        self:updateRarityByBonusCount()
        return true
    end
end

--- Randomly decide an upgrade level (not typically used in your script).
-- @return number
function rollUpgradeLevel()
    local level = 1
    for i = US_CONFIG.MAX_UPGRADE_LEVEL, 1, -1 do
        if i >= US_CONFIG.UPGRADE_LEVEL_DESTROY then
            if math.random(100) <= US_CONFIG.UPGRADE_DESTROY_CHANCE[i] then
                level = i
                break
            end
        else
            if math.random(100) <= US_CONFIG.UPGRADE_SUCCESS_CHANCE[i] then
                level = i
                break
            end
        end
    end
    return level
end

--- Roll a random attribute ID, possibly avoiding duplicates.
-- @param existingAttrIds table
-- @param item_level number
-- @param usItemType number
-- @return number
function rollRandomAttribute(existingAttrIds, item_level, usItemType)
    local attrId = math.random(1, #US_ENCHANTMENTS)
    local attr = US_ENCHANTMENTS[attrId]

    while ((not US_CONFIG.ALLOW_DUPLICATE_ENCHANTS and isInArray(existingAttrIds, attrId)) or
        (bit.band(usItemType, attr.itemType) == 0) or (attr.chance and math.random(100) >= attr.chance)) do
        attrId = math.random(1, #US_ENCHANTMENTS)
        attr = US_ENCHANTMENTS[attrId]
    end
    return attrId
end

--- Compute an attribute's magnitude (percentage or otherwise).
-- @param attr table
-- @param item_level number
-- @return number
function calculateAttributeValue(attr, item_level)
    if attr.percentage then
        return math.random(1, US_CONFIG.MAX_PERCENTAGE_ROLL)
    elseif attr.VALUES_PER_LEVEL then
        local maxValue = math.ceil(item_level * attr.VALUES_PER_LEVEL)
        if maxValue < 1 then
            return 1
        end
        return math.random(1, maxValue)
    else
        return 1
    end
end

--- Add an attribute to a specific slot.
-- @param self Item
-- @param slot number
-- @param attr number
-- @param value number
function Item.addAttribute(self, slot, attr, value)
    self:setCustomAttribute("Slot" .. slot, attr .. "|" .. value)
end

--- Get a single attribute from a slot.
-- @param self Item
-- @param slot number
-- @return table|nil  {attrId, attrValue}
function Item.getBonusAttribute(self, slot)
    local bonuses = self:getCustomAttribute("Slot" .. slot)
    if bonuses then
        local t = {}
        for b in bonuses:gmatch("([^|]+)") do
            t[#t + 1] = tonumber(b)
        end
        return t
    end
    return nil
end

--- Return all bonus attributes from an item.
-- @param self Item
-- @return table|nil
function Item.getBonusAttributes(self)
    local data = {}
    for i = 1, self:getMaxAttributes() do
        local bonuses = self:getCustomAttribute("Slot" .. i)
        if bonuses then
            local t = {}
            for b in bonuses:gmatch("([^|]+)") do
                t[#t + 1] = tonumber(b)
            end
            data[#data + 1] = t
        end
    end
    return (#data > 0) and data or nil
end

--- Get the last slot index that has a bonus.
-- @param self Item
-- @return number
function Item.getLastSlot(self)
    local last = 0
    for i = 1, self:getMaxAttributes() do
        if self:getCustomAttribute("Slot" .. i) then
            last = i
        end
    end
    return last
end

--- Force item rarity based on how many bonuses it has.
-- @param self Item
function Item.updateRarityByBonusCount(self)
    local bonuses = self:getBonusAttributes()
    if bonuses then
        local count = #bonuses
        for i = 1, #US_CONFIG.RARITY do
            if US_CONFIG.RARITY[i].maxBonus == count then
                self:setRarity(i)
                break
            end
        end
    else
        self:setRarity(COMMON)
    end
    self:setAttribute(ITEM_ATTRIBUTE_ACTIONID, self:getActionId())
    syncItemAugments(self)
end

--- Set item level, adjusting stats based on the difference from old level.
-- @param self Item
-- @param level number
-- @param first boolean
-- @return boolean
function Item.setItemLevel(self, level, first)
    local oldLevel = self:getItemLevel()
    local it = ItemType(self.itemid)
    local finalValue = 0

    local function calcValue(diff, perLevel, fromLevel)
        if diff >= perLevel then
            return math.floor((diff / perLevel) * fromLevel)
        end
        return 0
    end

    local diff = (oldLevel < level) and (level - oldLevel) or (oldLevel - level)
    if it:getAttack() > 0 then
        finalValue = calcValue(diff, US_CONFIG.ATTACK_PER_ITEM_LEVEL, US_CONFIG.ATTACK_FROM_ITEM_LEVEL)
        updateItemAttribute(self, ITEM_ATTRIBUTE_ATTACK, it:getAttack(), finalValue, (oldLevel < level))
    end
    if it:getDefense() > 0 then
        finalValue = calcValue(diff, US_CONFIG.DEFENSE_PER_ITEM_LEVEL, US_CONFIG.DEFENSE_FROM_ITEM_LEVEL)
        updateItemAttribute(self, ITEM_ATTRIBUTE_DEFENSE, it:getDefense(), finalValue, (oldLevel < level))
    end
    if it:getArmor() > 0 then
        finalValue = calcValue(diff, US_CONFIG.ARMOR_PER_ITEM_LEVEL, US_CONFIG.ARMOR_FROM_ITEM_LEVEL)
        updateItemAttribute(self, ITEM_ATTRIBUTE_ARMOR, it:getArmor(), finalValue, (oldLevel < level))
    end
    if it:getHitChance() > 0 then
        finalValue = calcValue(diff, US_CONFIG.HITCHANCE_PER_ITEM_LEVEL, US_CONFIG.HITCHANCE_FROM_ITEM_LEVEL)
        updateItemAttribute(self, ITEM_ATTRIBUTE_HITCHANCE, it:getHitChance(), finalValue, (oldLevel < level))
    end

    if first then
        if it:getAttack() > 0 then
            level = level + math.floor(it:getAttack() / US_CONFIG.ITEM_LEVEL_PER_ATTACK)
        end
        if it:getDefense() > 0 then
            level = level + math.floor(it:getDefense() / US_CONFIG.ITEM_LEVEL_PER_DEFENSE)
        end
        if it:getArmor() > 0 then
            level = level + math.floor(it:getArmor() / US_CONFIG.ITEM_LEVEL_PER_ARMOR)
        end
        if it:getHitChance() > 0 then
            level = level + math.floor(it:getHitChance() / US_CONFIG.ITEM_LEVEL_PER_HITCHANCE)
        end
    end
    return self:setCustomAttribute("item_level", level)
end

--- Update a single attribute (attack, defense, etc.) when item level changes.
-- @param item Item
-- @param attrType number
-- @param baseValue number
-- @param changeValue number
-- @param isIncrease boolean
function updateItemAttribute(item, attrType, baseValue, changeValue, isIncrease)
    local currentValue = item:getAttribute(attrType) or 0
    local newValue
    if isIncrease then
        if changeValue == 0 and currentValue < baseValue then
            newValue = baseValue + (US_CONFIG.DEFENSE_PER_UPGRADE or 0) -- fallback if needed
        else
            newValue = (currentValue > 0) and (currentValue + changeValue) or (baseValue + changeValue)
        end
    else
        newValue = (currentValue > 0) and (currentValue - changeValue) or (baseValue - changeValue)
    end
    item:setAttribute(attrType, newValue)
end

--- Get the item level.
-- @param self Item
-- @return number
function Item.getItemLevel(self)
    return self:getCustomAttribute("item_level") or 0
end

--- Set the upgrade level, adjusting stats accordingly.
-- @param self Item
-- @param level number
function Item.setUpgradeLevel(self, level)
    local it = ItemType(self.itemid)
    local oldLevel = self:getUpgradeLevel()
    local config = getUpgradeConfig(self)

    if it:getAttack() > 0 then
        updateUpgradeAttribute(self, ITEM_ATTRIBUTE_ATTACK, config.attack_per_upgrade, oldLevel, level)
    end
    if it:getDefense() > 0 then
        updateUpgradeAttribute(self, ITEM_ATTRIBUTE_DEFENSE, config.defense_per_upgrade, oldLevel, level)
    end
    if it:getExtraDefense() > 0 then
        local extraDef = config.extra_defense_per_upgrade or US_CONFIG.EXTRADEFENSE_PER_UPGRADE
        if oldLevel < level then
            self:setAttribute(ITEM_ATTRIBUTE_EXTRADEFENSE, it:getExtraDefense() + (level - oldLevel) * extraDef)
        else
            self:setAttribute(ITEM_ATTRIBUTE_EXTRADEFENSE,
                self:getAttribute(ITEM_ATTRIBUTE_EXTRADEFENSE) - (oldLevel - level) * extraDef)
        end
    end
    if it:getArmor() > 0 then
        updateUpgradeAttribute(self, ITEM_ATTRIBUTE_ARMOR, config.armor_per_upgrade, oldLevel, level)
    end
    if it:getHitChance() > 0 then
        updateUpgradeAttribute(self, ITEM_ATTRIBUTE_HITCHANCE, config.hitchance_per_upgrade, oldLevel, level)
    end

    MAGICLEVEL.updateBonus(self, oldLevel, level)
    self:setCustomAttribute("upgrade", level)

    if oldLevel < level then
        self:setItemLevel(self:getItemLevel() + (US_CONFIG.ITEM_LEVEL_PER_UPGRADE * (level - oldLevel)))
    end
end

--- Update an attribute by comparing old vs. new upgrade level.
-- @param item Item
-- @param attrType number
-- @param perUpgrade number
-- @param oldLevel number
-- @param newLevel number
function updateUpgradeAttribute(item, attrType, perUpgrade, oldLevel, newLevel)
    local current = item:getAttribute(attrType)
    if oldLevel < newLevel then
        item:setAttribute(attrType, current + (newLevel - oldLevel) * perUpgrade)
    else
        item:setAttribute(attrType, current - (oldLevel - newLevel) * perUpgrade)
    end
end

--- Get the current upgrade level.
-- @param self Item
-- @return number
function Item.getUpgradeLevel(self)
    return self:getCustomAttribute("upgrade") or 0
end

--- Reduce upgrade by one level.
-- @param self Item
function Item.reduceUpgradeLevel(self)
    self:setUpgradeLevel(self:getUpgradeLevel() - 1)
    self:setItemLevel(self:getItemLevel() - US_CONFIG.ITEM_LEVEL_PER_UPGRADE)
end

--- Check if an item is unique.
-- @param self Item
-- @return boolean
function Item.isUnique(self)
    return self:getCustomAttribute("unique") and true or false
end

--- Set an item as unique by ID, adding relevant attributes from US_UNIQUES.
-- @param self Item
-- @param uniqueId number
function Item.setUnique(self, uniqueId)
    self:setCustomAttribute("unique", uniqueId)
    local entry = US_UNIQUES[uniqueId]
    if entry then
        for _, attrId in ipairs(entry.attributes) do
            local attr = US_ENCHANTMENTS[attrId]
            local val = (attr.VALUES_PER_LEVEL and
                            math.random(1, math.ceil(self:getItemLevel() * attr.VALUES_PER_LEVEL))) or 1
            self:setCustomAttribute("Slot" .. (self:getLastSlot() + 1), attrId .. "|" .. val)
        end
    end
end

--- Get the unique ID if present.
-- @param self Item
-- @return number|nil
function Item.getUnique(self)
    return self:getCustomAttribute("unique")
end

--- Get the unique name from US_UNIQUES table.
-- @param self Item
-- @return string
function Item.getUniqueName(self)
    return US_UNIQUES[self:getUnique()].name
end

--- Make the item indefinite for level requirements.
-- @param self Item
-- @param value boolean
function Item.setLimitless(self, value)
    self:setCustomAttribute("limitless", value)
end

--- Check if item is indefinite for level requirements.
-- @param self Item
-- @return boolean
function Item.isLimitless(self)
    return self:getCustomAttribute("limitless")
end

--- Flag an item as mirrored.
-- @param self Item
-- @param value boolean
function Item.setMirrored(self, value)
    self:setCustomAttribute("mirrored", value)
end

--- Check if item is mirrored.
-- @param self Item
-- @return boolean
function Item.isMirrored(self)
    return self:getCustomAttribute("mirrored")
end

--- Return the item type classification for your system.
-- @param self Item
-- @return number
function Item.getItemType(self)
    local it = self:getType()
    local slot = it:getSlotPosition() - SLOTP_LEFT - SLOTP_RIGHT
    local wtype = it:getWeaponType()
    if wtype > 0 then
        if wtype == WEAPON_SHIELD then
            return US_ITEM_TYPES.SHIELD
        elseif wtype == WEAPON_DISTANCE then
            return US_ITEM_TYPES.WEAPON_DISTANCE
        elseif wtype == WEAPON_WAND then
            return US_ITEM_TYPES.WEAPON_WAND
        elseif isInArray({WEAPON_SWORD, WEAPON_CLUB, WEAPON_AXE}, wtype) then
            return US_ITEM_TYPES.WEAPON_MELEE
        end
    else
        if slot == SLOTP_HEAD then
            return US_ITEM_TYPES.HELMET
        elseif slot == SLOTP_ARMOR then
            return US_ITEM_TYPES.ARMOR
        elseif slot == SLOTP_LEGS then
            return US_ITEM_TYPES.LEGS
        elseif slot == SLOTP_FEET then
            return US_ITEM_TYPES.BOOTS
        elseif slot == SLOTP_NECKLACE then
            return US_ITEM_TYPES.NECKLACE
        elseif slot == SLOTP_RING then
            return US_ITEM_TYPES.RING
        end
    end
    return US_ITEM_TYPES.ALL
end

--- Set the item's rarity.
-- @param self Item
-- @param rarity number
function Item.setRarity(self, rarity)
    self:setCustomAttribute("rarity", rarity)
end

--- Randomly roll a rarity from the config chances.
-- @param self Item
function Item.rollRarity(self)
    local r = COMMON
    for i = #US_CONFIG.RARITY, 1, -1 do
        if math.random(US_CONFIG.RARITY[i].chance) == 1 then
            r = i
            break
        end
    end
    self:setRarity(r)
end

--- Get the current rarity from the config.
-- @param self Item
-- @return table
function Item.getRarity(self)
    local r = self:getCustomAttribute("rarity")
    return r and US_CONFIG.RARITY[r] or US_CONFIG.RARITY[COMMON]
end

--- Return the rarity ID.
-- @param self Item
-- @return number
function Item.getRarityId(self)
    return self:getCustomAttribute("rarity") or COMMON
end

--- Return the maximum number of bonus attributes an item can hold.
-- @param self Item
-- @return number
function Item.getMaxAttributes(self)
    if self:isUnique() then
        return #US_UNIQUES[self:getUnique()].attributes
    end
    return self:getRarity().maxBonus
end

--- Check if an item type can be upgraded.
-- @param self ItemType
-- @return boolean
function ItemType.isUpgradable(self)
    if self:isStackable() or self:getTransformEquipId() > 0 or self:getDecayId() > 0 or self:getDestroyId() > 0 or
        self:getCharges() > 0 then
        return false
    end
    local slot = self:getSlotPosition() - SLOTP_LEFT - SLOTP_RIGHT
    local wtype = self:getWeaponType()
    if wtype > 0 then
        if wtype == WEAPON_AMMO then
            return false
        end
        if wtype == WEAPON_SHIELD or wtype == WEAPON_DISTANCE or wtype == WEAPON_WAND or
            isInArray({WEAPON_SWORD, WEAPON_CLUB, WEAPON_AXE}, wtype) then
            return true
        end
    else
        if slot == SLOTP_HEAD or slot == SLOTP_ARMOR or slot == SLOTP_LEGS or slot == SLOTP_FEET or slot ==
            SLOTP_NECKLACE or slot == SLOTP_RING then
            return true
        end
    end
    return false
end

--- Check if an item type can have item level.
-- @param self ItemType
-- @return boolean
function ItemType.canHaveItemLevel(self)
    if self:getTransformEquipId() > 0 or self:getDecayId() > 0 or self:getDestroyId() > 0 or self:getCharges() > 0 then
        return false
    end
    local slot = self:getSlotPosition() - SLOTP_LEFT - SLOTP_RIGHT
    local wtype = self:getWeaponType()
    if wtype > 0 then
        if wtype == WEAPON_AMMO then
            return false
        end
        if wtype == WEAPON_SHIELD or wtype == WEAPON_DISTANCE or wtype == WEAPON_WAND or
            isInArray({WEAPON_SWORD, WEAPON_CLUB, WEAPON_AXE}, wtype) then
            return true
        end
    else
        if slot == SLOTP_HEAD or slot == SLOTP_ARMOR or slot == SLOTP_LEGS or slot == SLOTP_FEET or slot ==
            SLOTP_NECKLACE or slot == SLOTP_RING then
            return true
        end
    end
    return false
end

--- Compute item level for a monster (if dropping an item).
-- @param self MonsterType
-- @return number
function MonsterType.calculateItemLevel(self)
    local monsterValue = self:getMaxHealth() + self:getExperience()
    local level = math.ceil((monsterValue ^ 0.4) / 1.25)
    return math.max(1, math.min(200, level))
end

--- Get the per-upgrade config for an item, if it exists in config.lua.
-- @param item Item
-- @return table
function getUpgradeConfig(item)
    local it = ItemType(item:getId())
    local wtype = it:getWeaponType()
    if wtype > 0 and US_CONFIG.WEAPON_UPGRADES and US_CONFIG.WEAPON_UPGRADES[wtype] then
        return {
            attack_per_upgrade = US_CONFIG.WEAPON_UPGRADES[wtype].attack or US_CONFIG.ATTACK_PER_UPGRADE,
            defense_per_upgrade = US_CONFIG.WEAPON_UPGRADES[wtype].defense or US_CONFIG.DEFENSE_PER_UPGRADE,
            extra_defense_per_upgrade = US_CONFIG.WEAPON_UPGRADES[wtype].extra_defense or
                US_CONFIG.EXTRADEFENSE_PER_UPGRADE,
            armor_per_upgrade = US_CONFIG.WEAPON_UPGRADES[wtype].armor or US_CONFIG.ARMOR_PER_UPGRADE,
            hitchance_per_upgrade = US_CONFIG.WEAPON_UPGRADES[wtype].hitchance or US_CONFIG.HITCHANCE_PER_UPGRADE
        }
    end
    return {
        attack_per_upgrade = US_CONFIG.ATTACK_PER_UPGRADE,
        defense_per_upgrade = US_CONFIG.DEFENSE_PER_UPGRADE,
        extra_defense_per_upgrade = US_CONFIG.EXTRADEFENSE_PER_UPGRADE,
        armor_per_upgrade = US_CONFIG.ARMOR_PER_UPGRADE,
        hitchance_per_upgrade = US_CONFIG.HITCHANCE_PER_UPGRADE
    }
end


-- Registers crystal loot items for the upgrade/crystal system.
-- Drop chance is expressed on a scale of 1 to 100000 (100000 == 100%),
-- and each entry has a minimum required monster/item level to prevent abuse
dofile("data/lib/custom/globalloot.lua")

local crystalGlobalLoot = {
    { itemId = US_CONFIG[1][ITEM_UPGRADE_CRYSTAL], chance = 50000, maxCount = 2, requiredLvl = 10 },
    { itemId = US_CONFIG[1][ITEM_AUGMENTING_CRYSTAL], chance = 50000,  maxCount = 3, requiredLvl = 20 },
    { itemId = US_CONFIG[1][ITEM_ALTER_CRYSTAL], chance = 50000,  maxCount = 3, requiredLvl = 20 },
    { itemId = US_CONFIG[1][ITEM_SCOURING_CRYSTAL], chance = 50000,  maxCount = 2, requiredLvl = 30 },
    { itemId = US_CONFIG[1][ITEM_EXALT_CRYSTAL], chance = 50000,  maxCount = 2, requiredLvl = 30 },
    { itemId = US_CONFIG[1][ITEM_CHAOS_CRYSTAL], chance = 50000,  maxCount = 2, requiredLvl = 30 },
    { itemId = US_CONFIG.ITEM_ANNULMENT_CRYSTAL, chance = 25000,  maxCount = 1, requiredLvl = 20 },
    { itemId = US_CONFIG.ITEM_DIVINE_CRYSTAL, chance = 25000,  maxCount = 1, requiredLvl = 20 },
    { itemId = US_CONFIG.ITEM_UPGRADE_CATALYST, chance = 25000, maxCount = 1, requiredLvl = 20 },
    { itemId = US_CONFIG.ITEM_MIND_CRYSTAL, chance = 50,  maxCount = 1, requiredLvl = 20 },
    { itemId = US_CONFIG.ITEM_MIRRORED_CRYSTAL, chance = 50,  maxCount = 1, requiredLvl = 20 },
}

--- Registers crystal loot entries into the global loot table.
-- @param lootEntries table: A table of crystal loot entry tables.
registerGlobalLoot(crystalGlobalLoot)


-- data/scripts/custom/itemupgrades/magiclevel.lua
-- Logic for handling magic-level bonuses on upgraded items.
MAGICLEVEL = {}
MAGICLEVEL.CONDITIONS = {}

--- Check if an item is considered a spellbook (usually a shield-type with 'spellbook' in name).
-- @param item Item
-- @return boolean
function MAGICLEVEL.isSpellbook(item)
    local it = ItemType(item:getId())
    if it:getWeaponType() == WEAPON_SHIELD then
        local name = it:getName():lower()
        return (name:find("spellbook") or name:find("scroll")) and true or false
    end
    return false
end

--- Determine if an item should get a magic level bonus per upgrade.
-- @param item Item
-- @return boolean, number  True if eligible, plus how much ML per upgrade.
function MAGICLEVEL.shouldGetMagicLevelBonus(item)
    local it = ItemType(item:getId())
    local wtype = it:getWeaponType()
    if wtype == WEAPON_WAND and US_CONFIG.WEAPON_UPGRADES[WEAPON_WAND] and
        US_CONFIG.WEAPON_UPGRADES[WEAPON_WAND].magic_level then
        return true, US_CONFIG.WEAPON_UPGRADES[WEAPON_WAND].magic_level
    end
    if MAGICLEVEL.isSpellbook(item) then
        return true, 1
    end
    if wtype == WEAPON_SHIELD and US_CONFIG.WEAPON_UPGRADES[WEAPON_SHIELD] and
        US_CONFIG.WEAPON_UPGRADES[WEAPON_SHIELD].magic_level then
        return true, US_CONFIG.WEAPON_UPGRADES[WEAPON_SHIELD].magic_level
    end
    return false, 0
end

--- Update magic-level custom attribute on an item when its upgrade level changes.
-- @param item Item
-- @param oldLevel number
-- @param newLevel number
function MAGICLEVEL.updateBonus(item, oldLevel, newLevel)
    local eligible, mlPerUpgrade = MAGICLEVEL.shouldGetMagicLevelBonus(item)
    if not eligible or mlPerUpgrade <= 0 then
        return
    end

    local levelDiff = newLevel - oldLevel
    local currentBonus = item:getCustomAttribute("bonus_magiclevel") or 0
    local newBonus = currentBonus

    if levelDiff > 0 then
        newBonus = currentBonus + (levelDiff * mlPerUpgrade)
    elseif levelDiff < 0 then
        newBonus = math.max(0, currentBonus + (levelDiff * mlPerUpgrade))
    end
    item:setCustomAttribute("bonus_magiclevel", newBonus)
end

--- Extend item description to show magic-level bonus if present.
-- @param item Item
-- @param description string
-- @return string
function MAGICLEVEL.extendDescription(item, description)
    local bonus = item:getCustomAttribute("bonus_magiclevel")
    if bonus and bonus > 0 then
        if description:find("%[ Attributes %]") then
            description = description .. "\nMagic Level: +" .. bonus
        end
    end
    return description
end

--- Apply magic-level bonuses for a player's equipped items on login.
-- @param player Player
function applyMagicLevelBonuses(player)
    for slot = CONST_SLOT_HEAD, CONST_SLOT_AMMO do
        local item = player:getSlotItem(slot)
        if item then
            local bonusMagicLevel = item:getCustomAttribute("bonus_magiclevel")
            if bonusMagicLevel and bonusMagicLevel > 0 then
                local c = Condition(CONDITION_ATTRIBUTES)
                c:setParameter(CONDITION_PARAM_STAT_MAGICPOINTS, bonusMagicLevel)
                c:setParameter(CONDITION_PARAM_TICKS, -1)
                c:setParameter(CONDITION_PARAM_SUBID, 70000 + player:getId() % 1000)
                c:setParameter(CONDITION_PARAM_BUFF_SPELL, true)
                player:addCondition(c)
            end
        end
    end
end

--- Remove references when player logs out (cleanup).
-- @param playerId number
function MAGICLEVEL.cleanupOnLogout(playerId)
    MAGICLEVEL.CONDITIONS[playerId] = nil
end

return MAGICLEVEL
