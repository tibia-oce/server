-- Version: 6.2
-- Monster: https://tibia.fandom.com/wiki/Elf_Arcanist
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Elf_Arcanist
---


local mType = Game.createMonsterType("Elf Arcanist")
local monster = {}

monster.description = "an elf arcanist"
monster.experience = 175
monster.outfit = {
	lookType = 63,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 220
monster.maxHealth = 220
monster.race = "blood"
monster.corpse = 6011
monster.speed = 110
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10,
}

monster.strategiesTarget = {
	nearest = 100,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = false,
	rewardBoss = false,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 4,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "I'll bring balance upon you!", yell = false },
	{ text = "Vihil Ealuel!", yell = false },
	{ text = "For the Daughter of the Stars!", yell = false },
	{ text = "Tha'shi Cenath!", yell = false },
	{ text = "Feel my wrath!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 37169, minCount = 1, maxCount = 49 },  -- 2148
	{ id = 1949, chance = 30490 },  -- scroll
	{ id = "melon", chance = 21734 },  -- 2682
	{ id = "blank rune", chance = 17898 },  -- 2260
	{ id = "bread", chance = 13919 },  -- 2689
	{ id = "elvish talisman", chance = 10022 },  -- 10552
	{ id = "elven astral observer", chance = 7743 },  -- 12421
	{ id = "green tunic", chance = 7244 },  -- 2652
	{ id = "arrow", chance = 6101, minCount = 1, maxCount = 3 },  -- 2544
	{ id = "sling herb", chance = 4859 },  -- 2802
	{ id = "health potion", chance = 4038 },  -- 7618
	{ id = "strong mana potion", chance = 2929 },  -- 7589
	{ id = "candlestick", chance = 2166 },  -- 2047
	{ id = "elven amulet", chance = 2029 },  -- 2198
	{ id = "holy orchid", chance = 2008 },  -- 5922
	{ id = "wand of cosmic energy", chance = 1129 },  -- 2189
	{ id = "life crystal", chance = 1030 },  -- 2177
	{ id = "sandals", chance = 979 },  -- 2642
	{ id = "inkwell", chance = 951 },  -- 2600
	{ id = 2747, chance = 801 },  -- grave flower
	{ id = "yellow gem", chance = 44 },  -- 2154
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -35 },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -70, range = 7, shootEffect = CONST_ANI_ARROW, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_ENERGYDAMAGE, minDamage = -30, maxDamage = -50, range = 7, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_ENERGYHIT, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_DEATHDAMAGE, minDamage = -70, maxDamage = -85, range = 7, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA, target = false },
}

monster.defenses = {
	defense = 15,
	armor = 15,
	mitigation = 0.51,
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_HEALING, minDamage = 40, maxDamage = 60, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 20 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 50 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = -10 },
	{ type = COMBAT_DEATHDAMAGE, percent = 20 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)