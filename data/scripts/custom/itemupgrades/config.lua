-- data\scripts\custom\itemupgrades\config.lua
ITEM_UPGRADE_CRYSTAL = 1
ITEM_ENCHANT_CRYSTAL = 2
ITEM_ALTER_CRYSTAL = 3
ITEM_CLEAN_CRYSTAL = 4
ITEM_FORTUNE_CRYSTAL = 5
ITEM_FAITH_CRYSTAL = 6

COMMON = 1
RARE = 2
EPIC = 3
LEGENDARY = 4

US_CONFIG = {
    {
        -- crystals here can be extracted using Crystal Extractor
        [ITEM_UPGRADE_CRYSTAL] = 26799, -- Upgrade Crystal item id
        [ITEM_ENCHANT_CRYSTAL] = 26801, -- Enchantment Crystal item id
        [ITEM_ALTER_CRYSTAL] = 26800, -- Alteration Crystal item id
        [ITEM_CLEAN_CRYSTAL] = 27703, -- Cleansing Crystal item id
        [ITEM_FORTUNE_CRYSTAL] = 27704, -- Fortune Crystal item id
        [ITEM_FAITH_CRYSTAL] = 27705 -- Faith Crystal item id
    },

    ITEM_MIRRORED_CRYSTAL = 27698, -- Mirrored Crystal item id
    ITEM_MIND_CRYSTAL = 27699, -- Mind Crystal item id
    ITEM_LIMITLESS_CRYSTAL = 27700, -- Limitless Crystal item id
    ITEM_VOID_CRYSTAL = 27702, -- Void Crystal item id
    ITEM_UPGRADE_CATALYST = 26798, -- Upgrade Catalyst item id
    CRYSTAL_EXTRACTOR = 27149, -- Crystal Extractor item id
    CRYSTAL_FOSSIL = 27133, -- Crystal Fossil item id
    ITEM_SCROLL_IDENTIFY = 28137, -- Scrol of Identification item id
    --
    --
    IDENTIFY_UPGRADE_LEVEL = false, -- if true, roll random upgrade level when identifing an item
    UPGRADE_SUCCESS_CHANCE = {
        [1] = 100,
        [2] = 100,
        [3] = 95,
        [4] = 80,
        [5] = 65,
        [6] = 40
    }, -- % chance for the upgrade at given upgrade level, -1 upgrade level on failure
    UPGRADE_LEVEL_DESTROY = 7, -- at which upgrade level should it break if failed, for example if = 7 then upgrading from +6 to +7-9 can destroy item on failure.
    UPGRADE_DESTROY_CHANCE = {
        [7] = 30,
        [8] = 15,
        [9] = 5
    }, -- chance for the item to break at given upgrade level
    --
    MAX_ITEM_LEVEL = 300, -- max that Item Level can be assigned to item
    MAX_UPGRADE_LEVEL = 9, -- max level that item can be upgraded to,
    --
    ATTACK_PER_ITEM_LEVEL = 10, -- every X Item Level +ATTACK_FROM_ITEM_LEVEL attack
    ATTACK_FROM_ITEM_LEVEL = 1, -- +X bonus attack for every ATTACK_PER_ITEM_LEVEL
    DEFENSE_PER_ITEM_LEVEL = 10, -- every X Item Level +DEFENSE_FROM_ITEM_LEVEL defense
    DEFENSE_FROM_ITEM_LEVEL = 1, -- +X bonus defense for every DEFENSE_PER_ITEM_LEVEL
    ARMOR_PER_ITEM_LEVEL = 10, -- every X Item Level +ARMOR_FROM_ITEM_LEVEL armor
    ARMOR_FROM_ITEM_LEVEL = 1, -- +X bonus armor for every ARMOR_PER_ITEM_LEVEL
    HITCHANCE_PER_ITEM_LEVEL = 10, -- every X Item Level +HITCHANCE_FROM_ITEM_LEVEL hit chance
    HITCHANCE_FROM_ITEM_LEVEL = 1, -- +X bonus hit chance for every HITCHANCE_PER_ITEM_LEVEL
    --
    ITEM_LEVEL_PER_ATTACK = 6, -- +1 to Item Level for every X Attack in item
    ITEM_LEVEL_PER_DEFENSE = 15, -- +1 to Item Level for every X Defense in item
    ITEM_LEVEL_PER_ARMOR = 10, -- +1 to Item Level for every X Armor in item
    ITEM_LEVEL_PER_HITCHANCE = 3, -- +1 to Item Level for every X Hit Chance in item
    ITEM_LEVEL_PER_UPGRADE = 4, -- additional item level per upgrade level
    --
    ATTACK_PER_UPGRADE = 2, -- amount of bonus attack per upgrade level
    DEFENSE_PER_UPGRADE = 2, -- amount of bonus defense per upgrade level
    EXTRADEFENSE_PER_UPGRADE = 1, -- amount of bonus extra defense per upgrade level
    ARMOR_PER_UPGRADE = 2, -- amount of bonus armor per upgrade level
    HITCHANCE_PER_UPGRADE = 3, -- amount of bonus hit chance per upgrade level
    --
    CRYSTAL_FOSSIL_DROP_CHANCE = 8, -- 1:X chance that Crystal Fossil will drop from monster, X means that approximately every X monster will drop Crystal Fossil
    CRYSTAL_FOSSIL_DROP_LEVEL = 25, -- X monster level needed to drop Crystal Fossil
    CRYSTAL_BREAK_CHANCE = 5, -- 1:X chance that Crystal will break when extracted from Fossil, X means that approximately every X Crystal will break
    UNIQUE_CHANCE = 1, -- 1:X chance that unidentified item will become Unique, X means that approximately every X unidentified item will become unique
    REQUIRE_LEVEL = true, -- block equipping items with higher Item Level than Player Level
    RARITY = {
        [COMMON] = {
            name = "common",
            maxBonus = 1, -- max amount of bonus attributes
            chance = 1 -- 1:X chance that item will be common (1 = 100%)
        },
        [RARE] = {
            name = "rare",
            maxBonus = 2, -- max amount of bonus attributes
            chance = 4 -- 1:X chance that item will be common (1 = 100%)
        },
        [EPIC] = {
            name = "epic",
            maxBonus = 3, -- max amount of bonus attributes
            chance = 8 -- 1:X chance that item will be common (1 = 100%)
        },
        [LEGENDARY] = {
            name = "legendary",
            maxBonus = 4, -- max amount of bonus attributes
            chance = 16 -- 1:X chance that item will be common (1 = 100%)
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
        attributes = {1, -- Max HP
        4, -- Melee Skills
        12, -- Life Steal
        30 -- Flame Strike on Attack
        },
        minLevel = 100, -- Required Item Level to become Unique
        chance = 80, -- % chance to roll this unique
        itemType = US_ITEM_TYPES.WEAPON_MELEE + US_ITEM_TYPES.SHIELD -- Can be rolled only for items like Swords, Axes and Clubs
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
        param = CONDITION_PARAM_STAT_MAXHITPOINTS,
        VALUES_PER_LEVEL = 3,
        format = function(value)
            return "Max HP +" .. value
        end,
        itemType = US_ITEM_TYPES.HELMET + US_ITEM_TYPES.ARMOR + US_ITEM_TYPES.LEGS + US_ITEM_TYPES.BOOTS
    },
    [2] = {
        name = "Max MP",
        combatType = US_TYPES.CONDITION,
        condition = CONDITION_ATTRIBUTES,
        param = CONDITION_PARAM_STAT_MAXMANAPOINTS,
        VALUES_PER_LEVEL = 4,
        format = function(value)
            return "Max MP +" .. value
        end,
        itemType = US_ITEM_TYPES.WEAPON_ANY + US_ITEM_TYPES.RING + US_ITEM_TYPES.NECKLACE
    },
    [3] = {
        name = "Magic Level",
        combatType = US_TYPES.CONDITION,
        condition = CONDITION_ATTRIBUTES,
        param = CONDITION_PARAM_STAT_MAGICPOINTS,
        VALUES_PER_LEVEL = 0.1,
        format = function(value)
            return "Magic Level +" .. value
        end,
        itemType = US_ITEM_TYPES.WEAPON_ANY + US_ITEM_TYPES.RING + US_ITEM_TYPES.NECKLACE
    },
    [4] = {
        name = "Melee Skills",
        combatType = US_TYPES.CONDITION,
        condition = CONDITION_ATTRIBUTES,
        param = CONDITION_PARAM_SKILL_MELEE,
        VALUES_PER_LEVEL = 0.2,
        format = function(value)
            return "Melee Skills +" .. value
        end,
        itemType = US_ITEM_TYPES.WEAPON_ANY + US_ITEM_TYPES.RING + US_ITEM_TYPES.NECKLACE
    },
    [5] = {
        name = "Distance Fighting",
        combatType = US_TYPES.CONDITION,
        condition = CONDITION_ATTRIBUTES,
        param = CONDITION_PARAM_SKILL_DISTANCE,
        VALUES_PER_LEVEL = 0.2,
        format = function(value)
            return "Distance Fighting +" .. value
        end,
        itemType = US_ITEM_TYPES.WEAPON_ANY + US_ITEM_TYPES.RING + US_ITEM_TYPES.NECKLACE
    },
    [6] = {
        name = "Shielding",
        combatType = US_TYPES.CONDITION,
        condition = CONDITION_ATTRIBUTES,
        param = CONDITION_PARAM_SKILL_SHIELD,
        VALUES_PER_LEVEL = 0.2,
        format = function(value)
            return "Shielding +" .. value
        end,
        itemType = US_ITEM_TYPES.SHIELD + US_ITEM_TYPES.RING + US_ITEM_TYPES.NECKLACE
    },
    [7] = {
        name = "Life Steal",
        combatType = US_TYPES.OFFENSIVE,
        VALUES_PER_LEVEL = 0.1,
        format = function(value)
            return "Heal for " .. value .. "%% of dealt damage"
        end,
        itemType = US_ITEM_TYPES.WEAPON_MELEE + US_ITEM_TYPES.WEAPON_DISTANCE,
        chance = 10
    },
    [8] = {
        name = "Physical Damage",
        combatType = US_TYPES.OFFENSIVE,
        combatDamage = COMBAT_PHYSICALDAMAGE,
        VALUES_PER_LEVEL = 0.3,
        format = function(value)
            return "Physical Damage +" .. value .. "%%"
        end,
        itemType = US_ITEM_TYPES.WEAPON_ANY + US_ITEM_TYPES.HELMET + US_ITEM_TYPES.LEGS
    },
    [9] = {
        name = "Energy Damage",
        combatType = US_TYPES.OFFENSIVE,
        combatDamage = COMBAT_ENERGYDAMAGE,
        VALUES_PER_LEVEL = 0.2,
        format = function(value)
            return "Energy Damage +" .. value .. "%%"
        end,
        itemType = US_ITEM_TYPES.WEAPON_ANY + US_ITEM_TYPES.HELMET + US_ITEM_TYPES.LEGS
    },
    [10] = {
        name = "Earth Damage",
        combatType = US_TYPES.OFFENSIVE,
        combatDamage = COMBAT_EARTHDAMAGE,
        VALUES_PER_LEVEL = 0.2,
        format = function(value)
            return "Earth Damage +" .. value .. "%%"
        end,
        itemType = US_ITEM_TYPES.WEAPON_ANY + US_ITEM_TYPES.HELMET + US_ITEM_TYPES.LEGS
    },
    [11] = {
        name = "Fire Damage",
        combatType = US_TYPES.OFFENSIVE,
        combatDamage = COMBAT_FIREDAMAGE,
        VALUES_PER_LEVEL = 0.2,
        format = function(value)
            return "Fire Damage +" .. value .. "%%"
        end,
        itemType = US_ITEM_TYPES.WEAPON_ANY + US_ITEM_TYPES.HELMET + US_ITEM_TYPES.LEGS
    },
    [12] = {
        name = "Ice Damage",
        combatType = US_TYPES.OFFENSIVE,
        combatDamage = COMBAT_ICEDAMAGE,
        VALUES_PER_LEVEL = 0.2,
        format = function(value)
            return "Ice Damage +" .. value .. "%%"
        end,
        itemType = US_ITEM_TYPES.WEAPON_ANY + US_ITEM_TYPES.HELMET + US_ITEM_TYPES.LEGS
    },
    [13] = {
        name = "Holy Damage",
        combatType = US_TYPES.OFFENSIVE,
        combatDamage = COMBAT_HOLYDAMAGE,
        VALUES_PER_LEVEL = 0.2,
        format = function(value)
            return "Holy Damage +" .. value .. "%%"
        end,
        itemType = US_ITEM_TYPES.WEAPON_ANY + US_ITEM_TYPES.HELMET + US_ITEM_TYPES.LEGS
    },
    [14] = {
        name = "Death Damage",
        combatType = US_TYPES.OFFENSIVE,
        combatDamage = COMBAT_DEATHDAMAGE,
        VALUES_PER_LEVEL = 0.2,
        format = function(value)
            return "Death Damage +" .. value .. "%%"
        end,
        itemType = US_ITEM_TYPES.WEAPON_ANY + US_ITEM_TYPES.HELMET + US_ITEM_TYPES.LEGS
    },
    [15] = {
        name = "Elemental Damage",
        combatType = US_TYPES.OFFENSIVE,
        combatDamage = COMBAT_ENERGYDAMAGE + COMBAT_EARTHDAMAGE + COMBAT_FIREDAMAGE + COMBAT_ICEDAMAGE +
            COMBAT_HOLYDAMAGE + COMBAT_DEATHDAMAGE,
        VALUES_PER_LEVEL = 0.2,
        format = function(value)
            return "Elemental Damage +" .. value .. "%%"
        end,
        itemType = US_ITEM_TYPES.WEAPON_ANY + US_ITEM_TYPES.HELMET + US_ITEM_TYPES.LEGS,
        chance = 10
    },
    [16] = {
        name = "Physical Protection",
        combatType = US_TYPES.DEFENSIVE,
        combatDamage = COMBAT_PHYSICALDAMAGE,
        VALUES_PER_LEVEL = 0.1,
        format = function(value)
            return "Physical Protection +" .. value .. "%%"
        end,
        itemType = US_ITEM_TYPES.ARMOR + US_ITEM_TYPES.SHIELD + US_ITEM_TYPES.BOOTS + US_ITEM_TYPES.HELMET +
            US_ITEM_TYPES.LEGS
    },
    [17] = {
        name = "Energy Protection",
        combatType = US_TYPES.DEFENSIVE,
        combatDamage = COMBAT_ENERGYDAMAGE,
        VALUES_PER_LEVEL = 0.15,
        format = function(value)
            return "Energy Protection +" .. value .. "%%"
        end,
        itemType = US_ITEM_TYPES.ARMOR + US_ITEM_TYPES.SHIELD + US_ITEM_TYPES.BOOTS + US_ITEM_TYPES.HELMET +
            US_ITEM_TYPES.LEGS
    },
    [18] = {
        name = "Earth Protection",
        combatType = US_TYPES.DEFENSIVE,
        combatDamage = COMBAT_EARTHDAMAGE,
        VALUES_PER_LEVEL = 0.15,
        format = function(value)
            return "Earth Protection +" .. value .. "%%"
        end,
        itemType = US_ITEM_TYPES.ARMOR + US_ITEM_TYPES.SHIELD + US_ITEM_TYPES.BOOTS + US_ITEM_TYPES.HELMET +
            US_ITEM_TYPES.LEGS
    },
    [19] = {
        name = "Fire Protection",
        combatType = US_TYPES.DEFENSIVE,
        combatDamage = COMBAT_FIREDAMAGE,
        VALUES_PER_LEVEL = 0.15,
        format = function(value)
            return "Fire Protection +" .. value .. "%%"
        end,
        itemType = US_ITEM_TYPES.ARMOR + US_ITEM_TYPES.SHIELD + US_ITEM_TYPES.BOOTS + US_ITEM_TYPES.HELMET +
            US_ITEM_TYPES.LEGS
    },
    [20] = {
        name = "Ice Protection",
        combatType = US_TYPES.DEFENSIVE,
        combatDamage = COMBAT_ICEDAMAGE,
        VALUES_PER_LEVEL = 0.15,
        format = function(value)
            return "Ice Protection +" .. value .. "%%"
        end,
        itemType = US_ITEM_TYPES.ARMOR + US_ITEM_TYPES.SHIELD + US_ITEM_TYPES.BOOTS + US_ITEM_TYPES.HELMET +
            US_ITEM_TYPES.LEGS
    },
    [21] = {
        name = "Holy Protection",
        combatType = US_TYPES.DEFENSIVE,
        combatDamage = COMBAT_HOLYDAMAGE,
        VALUES_PER_LEVEL = 0.15,
        format = function(value)
            return "Holy Protection +" .. value .. "%%"
        end,
        itemType = US_ITEM_TYPES.ARMOR + US_ITEM_TYPES.SHIELD + US_ITEM_TYPES.BOOTS + US_ITEM_TYPES.HELMET +
            US_ITEM_TYPES.LEGS
    },
    [22] = {
        name = "Death Protection",
        combatType = US_TYPES.DEFENSIVE,
        combatDamage = COMBAT_DEATHDAMAGE,
        VALUES_PER_LEVEL = 0.15,
        format = function(value)
            return "Death Protection +" .. value .. "%%"
        end,
        itemType = US_ITEM_TYPES.ARMOR + US_ITEM_TYPES.SHIELD + US_ITEM_TYPES.BOOTS + US_ITEM_TYPES.HELMET +
            US_ITEM_TYPES.LEGS
    },
    [23] = {
        name = "Elemental Protection",
        combatType = US_TYPES.DEFENSIVE,
        combatDamage = COMBAT_ENERGYDAMAGE + COMBAT_EARTHDAMAGE + COMBAT_FIREDAMAGE + COMBAT_ICEDAMAGE +
            COMBAT_HOLYDAMAGE + COMBAT_DEATHDAMAGE,
        VALUES_PER_LEVEL = 0.05,
        format = function(value)
            return "Elemental Protection +" .. value .. "%%"
        end,
        itemType = US_ITEM_TYPES.ARMOR + US_ITEM_TYPES.SHIELD + US_ITEM_TYPES.BOOTS + US_ITEM_TYPES.HELMET +
            US_ITEM_TYPES.LEGS,
        chance = 10
    },
    [24] = {
        name = "Health on Kill",
        combatType = US_TYPES.TRIGGER,
        triggerType = US_TRIGGERS.KILL,
        VALUES_PER_LEVEL = 2,
        execute = function(player, value, center, target)
            player:addHealth(value)
        end,
        format = function(value)
            return "Regenerate " .. value .. " Health on Kill"
        end,
        itemType = US_ITEM_TYPES.WEAPON_ANY + US_ITEM_TYPES.RING + US_ITEM_TYPES.NECKLACE,
        chance = 25
    },
    [25] = {
        name = "Mana on Kill",
        combatType = US_TYPES.TRIGGER,
        triggerType = US_TRIGGERS.KILL,
        VALUES_PER_LEVEL = 3,
        execute = function(player, value, center, target)
            player:addMana(value)
        end,
        format = function(value)
            return "Regenerate " .. value .. " Mana on Kill"
        end,
        itemType = US_ITEM_TYPES.WEAPON_ANY + US_ITEM_TYPES.RING + US_ITEM_TYPES.NECKLACE,
        chance = 25
    },
    [26] = {
        name = "Mana Steal",
        combatType = US_TYPES.OFFENSIVE,
        VALUES_PER_LEVEL = 0.1,
        format = function(value)
            return "Regenerate Mana for " .. value .. "%% of dealt damage"
        end,
        itemType = US_ITEM_TYPES.WEAPON_WAND + US_ITEM_TYPES.WEAPON_DISTANCE,
        chance = 10
    },
    [27] = {
        name = "Increased Healing",
        VALUES_PER_LEVEL = 0.35,
        format = function(value)
            return value .. "%% more healing from all sources"
        end,
        itemType = US_ITEM_TYPES.RING + US_ITEM_TYPES.NECKLACE,
        minLevel = 25,
        chance = 20
    },
    [28] = {
        name = "Double Damage",
        combatType = US_TYPES.OFFENSIVE,
        combatDamage = COMBAT_ENERGYDAMAGE + COMBAT_EARTHDAMAGE + COMBAT_FIREDAMAGE + COMBAT_ICEDAMAGE +
            COMBAT_HOLYDAMAGE + COMBAT_DEATHDAMAGE + COMBAT_PHYSICALDAMAGE,
        VALUES_PER_LEVEL = 0.05,
        format = function(value)
            return value .. "%% to deal double damage"
        end,
        itemType = US_ITEM_TYPES.WEAPON_ANY,
        minLevel = 80,
        chance = 5
    }
}
