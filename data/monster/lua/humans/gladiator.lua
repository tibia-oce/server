-- Version: 8.40
-- Monster: https://tibia.fandom.com/wiki/Gladiator
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Gladiator
---


local mType = Game.createMonsterType("Gladiator")
local monster = {}

monster.description = "a gladiator"
monster.experience = 90
monster.outfit = {
	lookType = 131,
	lookHead = 78,
	lookBody = 3,
	lookLegs = 79,
	lookFeet = 114,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 185
monster.maxHealth = 185
monster.race = "blood"
monster.corpse = 18126
monster.speed = 98
monster.manaCost = 470

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
	convinceable = true,
	pushable = true,
	rewardBoss = false,
	illusionable = false,
	canPushItems = false,
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
	{ text = "You are no match for me!", yell = false },
	{ text = "Feel my prowess.", yell = false },
	{ text = "Fight!", yell = false },
	{ text = "Take this!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 49441, minCount = 1, maxCount = 30 },  -- 2148
	{ id = "meat", chance = 19391 },  -- 2666
	{ id = 2376, chance = 12168 },  -- sword
	{ id = "mace", chance = 10101 },  -- 2398
	{ id = "plate shield", chance = 10027 },  -- 2510
	{ id = "chain helmet", chance = 5019 },  -- 2458
	{ id = "brass armor", chance = 2636 },  -- 2465
	{ id = "steel shield", chance = 917 },  -- 2509
	{ id = "iron helmet", chance = 590 },  -- 2459
	{ id = "belted cape", chance = 443 },  -- 8872
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -90 },
}

monster.defenses = {
	defense = 25,
	armor = 14,
	mitigation = 0.78,
	{ name = "speed", interval = 2000, chance = 15, effect = CONST_ME_MAGIC_RED, speed = 196},
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 5 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 10 },
	{ type = COMBAT_DEATHDAMAGE, percent = -5 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = false },
	{ type = "bleed", condition = false },
}

mType:register(monster)