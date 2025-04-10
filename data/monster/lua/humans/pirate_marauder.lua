-- Version: 7.8
-- Monster: https://tibia.fandom.com/wiki/Pirate_Marauder
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Pirate_Marauder
---


local mType = Game.createMonsterType("Pirate Marauder")
local monster = {}

monster.description = "a pirate marauder"
monster.experience = 125
monster.outfit = {
	lookType = 93,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 210
monster.maxHealth = 210
monster.race = "blood"
monster.corpse = 20483
monster.speed = 105
monster.manaCost = 490

monster.changeTarget = {
	interval = 4000,
	chance = 15,
}

monster.strategiesTarget = {
	nearest = 100,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = true,
	pushable = false,
	rewardBoss = false,
	illusionable = true,
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 20,
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
	{ text = "Plundeeeeer!", yell = false },
	{ text = "Hiyaa!", yell = false },
	{ text = "Give up!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 77619, minCount = 1, maxCount = 40 },  -- 2148
	{ id = 2050, chance = 9824 },  -- torch
	{ id = "compass", chance = 9723 },  -- 11219
	{ id = "spear", chance = 5073, minCount = 1, maxCount = 2 },  -- 2389
	{ id = "plate shield", chance = 5004 },  -- 2510
	{ id = "chain armor", chance = 3044 },  -- 2464
	{ id = 5706, chance = 948 },  -- treasure map (pirate)
	{ id = "bandana", chance = 931 },  -- 5917
	{ id = "eye patch", chance = 527 },  -- 6098
	{ id = "hook", chance = 515 },  -- 6097
	{ id = "peg leg", chance = 500 },  -- 6126
	{ id = "pirate bag", chance = 464 },  -- 5927
	{ id = 5792, chance = 100 },  -- die
	{ id = "rum flask", chance = 96 },  -- 5553
	{ id = "empty goldfish bowl", chance = 83 },  -- 5928
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -140 },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -40, range = 7, shootEffect = CONST_ANI_SPEAR, target = false },
}

monster.defenses = {
	defense = 15,
	armor = 8,
	mitigation = 0.56,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -3 },
	{ type = COMBAT_EARTHDAMAGE, percent = 10 },
	{ type = COMBAT_FIREDAMAGE, percent = -10 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 20 },
	{ type = COMBAT_DEATHDAMAGE, percent = -5 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)