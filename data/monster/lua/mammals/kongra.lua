-- Version: 7.5
-- Monster: https://tibia.fandom.com/wiki/Kongra
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Kongra
---


local mType = Game.createMonsterType("Kongra")
local monster = {}

monster.description = "a kongra"
monster.experience = 115
monster.outfit = {
	lookType = 116,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 340
monster.maxHealth = 340
monster.race = "blood"
monster.corpse = 6043
monster.speed = 92
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 0,
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
	illusionable = true,
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 10,
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
	{ text = "Ungh! Ungh!", yell = false },
	{ text = "Hugah!", yell = false },
	{ text = "Huaauaauaauaa!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 88004, minCount = 1, maxCount = 40 },  -- 2148
	{ id = "banana", chance = 30809, minCount = 1, maxCount = 12 },  -- 2676
	{ id = "kongra's shoulderpad", chance = 9364 },  -- 12427
	{ id = "protection amulet", chance = 1010 },  -- 2200
	{ id = "plate armor", chance = 999 },  -- 2463
	{ id = "ape fur", chance = 968 },  -- 5883
	{ id = "health potion", chance = 503 },  -- 7618
	{ id = "power ring", chance = 312 },  -- 2166
	{ id = "club ring", chance = 196 },  -- 2209
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -60 },
}

monster.defenses = {
	defense = 20,
	armor = 18,
	mitigation = 0.36,
	{ name = "speed", interval = 2000, chance = 15, effect = CONST_ME_MAGIC_RED, speed = 184},
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 5 },
	{ type = COMBAT_EARTHDAMAGE, percent = 10 },
	{ type = COMBAT_FIREDAMAGE, percent = 20 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -15 },
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