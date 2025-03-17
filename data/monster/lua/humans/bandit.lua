-- Version: 7.5
-- Monster: https://tibia.fandom.com/wiki/Bandit
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Bandit
---


local mType = Game.createMonsterType("Bandit")
local monster = {}

monster.description = "a bandit"
monster.experience = 65
monster.outfit = {
	lookType = 129,
	lookHead = 58,
	lookBody = 40,
	lookLegs = 24,
	lookFeet = 95,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 245
monster.maxHealth = 245
monster.race = "blood"
monster.corpse = 18050
monster.speed = 90
monster.manaCost = 450

monster.changeTarget = {
	interval = 5000,
	chance = 0,
}

monster.strategiesTarget = {
	nearest = 100,
}

monster.flags = {
	summonable = true,
	attackable = true,
	hostile = true,
	convinceable = true,
	pushable = true,
	rewardBoss = false,
	illusionable = true,
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 25,
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
	{ text = "Hand me your purse!", yell = false },
	{ text = "Your money or your life!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 49103, minCount = 1, maxCount = 30 },  -- 2148
	{ id = "axe", chance = 29899 },  -- 2386
	{ id = "brass shield", chance = 16897 },  -- 2511
	{ id = "leather legs", chance = 14976 },  -- 2649
	{ id = "mace", chance = 10322 },  -- 2398
	{ id = "tomato", chance = 7668, minCount = 1, maxCount = 2 },  -- 2685
	{ id = "chain helmet", chance = 4965 },  -- 2458
	{ id = "brass armor", chance = 2370 },  -- 2465
	{ id = "iron helmet", chance = 540 },  -- 2459
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -45 },
}

monster.defenses = {
	defense = 15,
	armor = 11,
	mitigation = 0.43,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = -10 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = -5 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = false },
	{ type = "bleed", condition = false },
}

mType:register(monster)
