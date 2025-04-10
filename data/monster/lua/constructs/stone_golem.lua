-- Version: 6.4
-- Monster: https://tibia.fandom.com/wiki/Stone_Golem
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Stone_Golem
---


local mType = Game.createMonsterType("Stone Golem")
local monster = {}

monster.description = "a stone golem"
monster.experience = 160
monster.outfit = {
	lookType = 67,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 270
monster.maxHealth = 270
monster.race = "undead"
monster.corpse = 6005
monster.speed = 90
monster.manaCost = 590

monster.changeTarget = {
	interval = 4000,
	chance = 10,
}

monster.strategiesTarget = {
	nearest = 100,
}

monster.flags = {
	summonable = true,
	attackable = true,
	hostile = true,
	convinceable = true,
	pushable = false,
	rewardBoss = false,
	illusionable = true,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = true}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
}

monster.loot = {
	{ id = "gold coin", chance = 95907, minCount = 1, maxCount = 40 },  -- 2148
	{ id = "small stone", chance = 12843, minCount = 1, maxCount = 4 },  -- 1294
	{ id = "sulphurous stone", chance = 10036 },  -- 11232
	{ id = "power ring", chance = 5174 },  -- 2166
	{ id = "carlin sword", chance = 2570 },  -- 2395
	{ id = "iron ore", chance = 2030 },  -- 5880
	{ id = "ancient stone", chance = 1011 },  -- 10549
	{ id = "shiny stone", chance = 785 },  -- 11227
	{ id = 13757, chance = 535 },  -- coal
	{ id = "piece of marble rock", chance = 429 },  -- 11343
	{ id = 2124, chance = 173 },  -- crystal ring
	{ id = "red gem", chance = 47 },  -- 2156
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -110 },
}

monster.defenses = {
	defense = 20,
	armor = 30,
	mitigation = 0.64,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 10 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 15 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = 20 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 100 },
	{ type = COMBAT_ICEDAMAGE, percent = -10 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 20 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = false },
	{ type = "bleed", condition = false },
}

mType:register(monster)