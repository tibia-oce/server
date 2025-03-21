-- Version: 8.20
-- Monster: https://tibia.fandom.com/wiki/Zarabustor
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Zarabustor
---


local mType = Game.createMonsterType("Zarabustor")
local monster = {}

monster.description = "zarabustor"
monster.experience = 8000
monster.outfit = {
	lookType = 130,
	lookHead = 0,
	lookBody = 77,
	lookLegs = 92,
	lookFeet = 97,
	lookAddons = 1,
	lookMount = 0,
}

monster.health = 5100
monster.maxHealth = 5100
monster.race = "blood"
monster.corpse = 18273
monster.speed = 110
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10,
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
	convinceable = false,
	pushable = false,
	rewardBoss = true,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 4,
	runHealth = 900,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false}

monster.light = {
	level = 0,
	color = 0,
}

monster.summon = {
	maxSummons = 5,
	summons = {
		{ name = "Warlock", chance = 10, interval = 2000, count = 2 },
		{ name = "Green Djinn", chance = 10, interval = 2000, count = 3 },
	},
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Killing is such a splendid diversion from my studies.", yell = false },
	{ text = "Time to test my newest spells!", yell = false },
	{ text = "Ah, practice time once again!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 32000, maxCount = 80 }, -- 2148
	{ id = "poison dagger", chance = 9600 }, -- 2411
	{ id = "skull staff", chance = 8330 }, -- 2436
	{ id = "assassin star", chance = 5500, maxCount = 4 }, -- 7368
	{ id = "blue robe", chance = 3390 }, -- 2656
	{ id = "small sapphire", chance = 3190 }, -- 2146
	{ id = "lightning robe", chance = 3040 }, -- 7898
	{ id = "ring of the sky", chance = 2420 }, -- 2123
	{ id = "golden armor", chance = 2240 }, -- 2466
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -130 },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_FIREDAMAGE, minDamage = 0, maxDamage = -250, range = 7, radius = 3, shootEffect = CONST_ANI_BURSTARROW, effect = CONST_ME_FIREAREA, target = true },
	{ name = "firefield", interval = 2000, chance = 10, range = 7, radius = 2, shootEffect = CONST_ANI_FIRE, target = true },
	{ name = "combat", interval = 2000, chance = 25, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -250, range = 7, shootEffect = CONST_ANI_ENERGY, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_ENERGYDAMAGE, minDamage = -130, maxDamage = -350, length = 8, spread = 0, effect = CONST_ME_BIGCLOUDS, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_MANADRAIN, minDamage = 0, maxDamage = -250, range = 7, target = false },
	{ name = "speed", interval = 2000, chance = 15, speed = -330, range = 7, effect = CONST_ME_MAGIC_RED, target = false, duration = 20000 },
	{ name = "warlock skill reducer", interval = 2000, chance = 5, range = 5, target = false },
}

monster.defenses = {
	defense = 20,
	armor = 20,
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_HEALING, minDamage = 100, maxDamage = 225, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "invisible", interval = 2000, chance = 20, effect = CONST_ME_MAGIC_BLUE },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = -5 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 100 },
	{ type = COMBAT_EARTHDAMAGE, percent = 95 },
	{ type = COMBAT_FIREDAMAGE, percent = 100 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 100 },
	{ type = COMBAT_HOLYDAMAGE, percent = -5 },
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)