-- Version: 9.60
-- Monster: https://tibia.fandom.com/wiki/Magma_Crawler
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Magma_Crawler
---


local mType = Game.createMonsterType("Magma Crawler")
local monster = {}

monster.description = "a magma crawler"
monster.experience = 3900
monster.outfit = {
	lookType = 492,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 4800
monster.maxHealth = 4800
monster.race = "fire"
monster.corpse = 15991
monster.speed = 230
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 5,
}

monster.strategiesTarget = {
	nearest = 80,
	random = 20,
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
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 4,
	runHealth = 300,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = true,
	canWalkOnPoison = true}

monster.light = {
	level = 5,
	color = 200,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Crrroak!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 100000, minCount = 2, maxCount = 200 },  -- 2148
	{ id = "platinum coin", chance = 99963, minCount = 1, maxCount = 5 },  -- 2152
	{ id = "blazing bone", chance = 12571 },  -- 18425
	{ id = "magma clump", chance = 11635 },  -- 18424
	{ id = "brown crystal splinter", chance = 8861, minCount = 1, maxCount = 2 },  -- 18417
	{ id = "small diamond", chance = 8779, minCount = 1, maxCount = 3 },  -- 2145
	{ id = "fiery heart", chance = 7585 },  -- 10553
	{ id = "great health potion", chance = 7080 },  -- 7591
	{ id = "green crystal fragment", chance = 6988 },  -- 18421
	{ id = "great mana potion", chance = 6520 },  -- 7590
	{ id = "crystalline arrow", chance = 6061, minCount = 1, maxCount = 10 },  -- 18304
	{ id = "iron ore", chance = 4536 },  -- 5880
	{ id = "wand of draconia", chance = 3994 },  -- 8921
	{ id = "blue crystal shard", chance = 3884 },  -- 18413
	{ id = "yellow piece of cloth", chance = 3232 },  -- 5914
	{ id = "magma amulet", chance = 3012 },  -- 7890
	{ id = "white piece of cloth", chance = 2323 },  -- 5909
	{ id = "magma boots", chance = 1956 },  -- 7891
	{ id = "fire sword", chance = 1726 },  -- 2392
	{ id = "energy ring", chance = 1680 },  -- 2167
	{ id = 13757, chance = 1635 },  -- coal
	{ id = "black shield", chance = 1607 },  -- 2529
	{ id = "yellow gem", chance = 1093 },  -- 2154
	{ id = "red piece of cloth", chance = 955 },  -- 5911
	{ id = "wand of everblazing", chance = 670 },  -- 18409
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -203 },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_DEATHDAMAGE, minDamage = -300, maxDamage = -1100, length = 8, spread = 0, effect = CONST_ME_MORTAREA, target = false },
	{ name = "magma crawler wave", interval = 2000, chance = 15, minDamage = -290, maxDamage = -800, target = false },
	{ name = "magma crawler soulfire", interval = 2000, chance = 20, target = false },
	{ name = "soulfire rune", interval = 2000, chance = 10, target = false },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_FIREDAMAGE, minDamage = -140, maxDamage = -180, radius = 3, effect = CONST_ME_HITBYFIRE, target = false },
	{ name = "speed", interval = 2000, chance = 10, speed = -800, radius = 2, effect = CONST_ME_MAGIC_RED, target = false, duration = 20000 },
}

monster.defenses = {
	defense = 45,
	armor = 84,
	mitigation = 2.51,
	{ name = "invisible", interval = 2000, chance = 5, effect = CONST_ME_MAGIC_BLUE },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 5 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 10 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = 100 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 25 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)