-- Global configuration for the Item Upgrade System
-- Contains constants, settings, and configuration tables
-- Crystal type constants
ITEM_UPGRADE_CRYSTAL = 1
ITEM_AUGMENTING_CRYSTAL = 2
ITEM_ALTER_CRYSTAL = 3
ITEM_SCOURING_CRYSTAL = 4
ITEM_EXALT_CRYSTAL = 5
ITEM_CHAOS_CRYSTAL = 6

-- Rarity constants
COMMON = 1
RARE = 2
EPIC = 3
LEGENDARY = 4

-- Combat constants (added here to ensure they're available globally)
COMBAT_NONE = 0
ATTACK_MOD = 0
DEFENSE_MOD = 1
ATTACK_MODIFIER_PIERCING = 6
DEFENSE_MODIFIER_RESIST = 8
PERCENT_MODIFIER = 1
FLAT_MODIFIER = 0
ORIGIN_AUGMENT = 12
CREATURETYPE_ATTACKABLE = 12
RACE_NONE = 0

-- Main configuration
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
            hitchance = 0
        },
        [WEAPON_WAND] = {
            attack = 2,
            magic_level = 1
        },
        [WEAPON_SHIELD] = {
            extra_defense = 0,
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

-- Item types
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

-- Unique items
US_UNIQUES = {
    [1] = {
        name = "Flame Spirit",
        attributes = {1, 4, 12, 30},
        minLevel = 100,
        chance = 80,
        itemType = US_ITEM_TYPES.WEAPON_MELEE + US_ITEM_TYPES.SHIELD
    }
}

-- Enchantment types
US_TYPES = {
    CONDITION = 0,
    OFFENSIVE = 1,
    DEFENSIVE = 2,
    TRIGGER = 3
}

-- Trigger types
US_TRIGGERS = {
    ATTACK = 0,
    HIT = 1,
    KILL = 2
}

-- Bonus configuration
BONUS_CONFIG = {
    MAGIC_LEVEL = {
        ATTR_ID = 3,
        CONDITIONS = {}
    }
}

-- Enchantment definitions
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

-- For access to enchantment types by category
ENCHANT_TYPES = {
    OFFENSIVE = {},
    DEFENSIVE = {}
}

-- Initialize ENCHANT_TYPES tables
for id, enchant in pairs(US_ENCHANTMENTS) do
    if enchant.combatType == US_TYPES.OFFENSIVE then
        ENCHANT_TYPES.OFFENSIVE[id] = {
            name = enchant.name,
            type = enchant.combatDamage == COMBAT_ENERGYDAMAGE + COMBAT_EARTHDAMAGE + COMBAT_FIREDAMAGE +
                COMBAT_ICEDAMAGE + COMBAT_HOLYDAMAGE + COMBAT_DEATHDAMAGE and "elemental" or enchant.combatDamage ==
                COMBAT_PHYSICALDAMAGE and "physical" or enchant.combatDamage == COMBAT_ENERGYDAMAGE and "energy" or
                enchant.combatDamage == COMBAT_EARTHDAMAGE and "earth" or enchant.combatDamage == COMBAT_FIREDAMAGE and
                "fire" or enchant.combatDamage == COMBAT_ICEDAMAGE and "ice" or enchant.combatDamage ==
                COMBAT_HOLYDAMAGE and "holy" or enchant.combatDamage == COMBAT_DEATHDAMAGE and "death"
        }
    elseif enchant.combatType == US_TYPES.DEFENSIVE then
        ENCHANT_TYPES.DEFENSIVE[id] = {
            name = enchant.name,
            type = enchant.combatDamage == COMBAT_ENERGYDAMAGE + COMBAT_EARTHDAMAGE + COMBAT_FIREDAMAGE +
                COMBAT_ICEDAMAGE + COMBAT_HOLYDAMAGE + COMBAT_DEATHDAMAGE and "elemental" or enchant.combatDamage ==
                COMBAT_PHYSICALDAMAGE and "physical" or enchant.combatDamage == COMBAT_ENERGYDAMAGE and "energy" or
                enchant.combatDamage == COMBAT_EARTHDAMAGE and "earth" or enchant.combatDamage == COMBAT_FIREDAMAGE and
                "fire" or enchant.combatDamage == COMBAT_ICEDAMAGE and "ice" or enchant.combatDamage ==
                COMBAT_HOLYDAMAGE and "holy" or enchant.combatDamage == COMBAT_DEATHDAMAGE and "death"
        }
    end
end

-- Table of global conditions for item attributes
US_CONDITIONS = {}
US_BUFFS = {}
