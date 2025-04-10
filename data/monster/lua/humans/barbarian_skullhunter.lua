-- Version: 8.00
-- Monster: https://tibia.fandom.com/wiki/Barbarian_Skullhunter
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Barbarian_Skullhunter
---


local mType = Game.createMonsterType("Barbarian Skullhunter")
local monster = {}

monster.description = "a barbarian skullhunter"
monster.experience = 85
monster.outfit = {
	lookType = 254,
	lookHead = 0,
	lookBody = 77,
	lookLegs = 96,
	lookFeet = 114,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 135
monster.maxHealth = 135
monster.race = "blood"
monster.corpse = 20347
monster.speed = 84
monster.manaCost = 450

monster.changeTarget = {
	interval = 60000,
	chance = 0,
}

monster.strategiesTarget = {
	nearest = 70,
	health = 10,
	damage = 10,
	random = 10,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = true,
	pushable = false,
	rewardBoss = false,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 70,
	targetDistance = 1,
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
	{ text = "You will become my trophy.", yell = false },
	{ text = "Fight harder, coward.", yell = false },
	{ text = "Show that you are a worthy opponent.", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 74307, minCount = 1, maxCount = 30 },  -- 2148
	{ id = 2050, chance = 60236 },  -- torch
	{ id = "brass helmet", chance = 19946 },  -- 2460
	{ id = "knife", chance = 14922 },  -- 2403
	{ id = "viking helmet", chance = 7871 },  -- 2473
	{ id = "scale armor", chance = 3991 },  -- 2483
	{ id = 2229, chance = 2978 },  -- skull
	{ id = "health potion", chance = 928 },  -- 7618
	{ id = "brown piece of cloth", chance = 522 },  -- 5913
	{ id = "life ring", chance = 248 },  -- 2168
	{ id = "fur boots", chance = 104 },  -- 7457
	{ id = "ragnir helmet", chance = 101 },  -- 7462
	{ id = "crystal sword", chance = 85 },  -- 7449
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -60 },
}

monster.defenses = {
	defense = 0,
	armor = 8,
	mitigation = 0.33,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 10 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 20 },
	{ type = COMBAT_EARTHDAMAGE, percent = -10 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 50 },
	{ type = COMBAT_HOLYDAMAGE, percent = 10 },
	{ type = COMBAT_DEATHDAMAGE, percent = -5 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = false },
	{ type = "bleed", condition = false },
}

mType:register(monster)