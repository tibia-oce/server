-- Version: 7.8
-- Monster: https://tibia.fandom.com/wiki/Quara_Pincher
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Quara_Pincher
---


local mType = Game.createMonsterType("Quara Pincher")
local monster = {}

monster.description = "a quara pincher"
monster.experience = 1500
monster.outfit = {
	lookType = 77,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 1800
monster.maxHealth = 1800
monster.race = "blood"
monster.corpse = 6063
monster.speed = 198
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
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = true,
	canWalkOnPoison = false}

monster.light = {
	level = 2,
	color = 35,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Clank! Clank!", yell = false },
	{ text = "Clap!", yell = false },
	{ text = "Crrrk! Crrrk!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 100000, minCount = 1, maxCount = 150 },  -- 2148
	{ id = "platinum coin", chance = 40404 },  -- 2152
	{ id = "quara pincers", chance = 14632 },  -- 12446
	{ id = "great health potion", chance = 10224 },  -- 7591
	{ id = "small ruby", chance = 7654, minCount = 1, maxCount = 2 },  -- 2147
	{ id = 2381, chance = 6911 },  -- halberd
	{ id = "shrimp", chance = 4896 },  -- 2670
	{ id = "fish fin", chance = 1690 },  -- 5895
	{ id = "warrior helmet", chance = 1532 },  -- 2475
	{ id = "crown armor", chance = 270 },  -- 2487
	{ id = "glacier robe", chance = 117 },  -- 7897
	{ id = "giant shrimp", chance = 41 },  -- 13305
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -342, effect = CONST_ME_DRAWBLOOD },
	{ name = "speed", interval = 2000, chance = 20, speed = -600, range = 1, effect = CONST_ME_MAGIC_RED, target = false, duration = 3000 },
}

monster.defenses = {
	defense = 50,
	armor = 85,
	mitigation = 0.99,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -25 },
	{ type = COMBAT_EARTHDAMAGE, percent = -10 },
	{ type = COMBAT_FIREDAMAGE, percent = 100 },
	{ type = COMBAT_LIFEDRAIN, percent = 100 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 100 },
	{ type = COMBAT_ICEDAMAGE, percent = 100 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
