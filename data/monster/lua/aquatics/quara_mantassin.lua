-- Quara Mantassin (Tibia Wiki: https://tibia.fandom.com/wiki/Quara_Mantassin)
-- Version: 7.8

local mType = Game.createMonsterType("Quara Mantassin")
local monster = {}

monster.description = "a quara mantassin"
monster.experience = 600
monster.outfit = {
	lookType = 72,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 800
monster.maxHealth = 800
monster.race = "blood"
monster.corpse = 6064
monster.speed = 295
monster.manaCost = 480

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
	convinceable = true,
	pushable = false,
	rewardBoss = false,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 80,
	targetDistance = 1,
	runHealth = 40,
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
	{ text = "Shrrrr", yell = false },
	{ text = "Zuerk Pachak!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 5000, maxCount = 100 },
	{ id = "gold coin", chance = 29000, maxCount = 29 },
	{ id = "mantassin tail", chance = 12600 },
	{ id = "shrimp", chance = 5170, maxCount = 5 },
	{ id = "halberd", chance = 4970 },
	{ id = "small sapphire", chance = 1130 },
	{ id = "cape", chance = 1090 },
	{ id = 3049, chance = 1050 }, -- stealth ring
	{ id = "two handed sword", chance = 990 },
	{ id = "fish fin", chance = 610 },
	{ id = "strange helmet", chance = 100 },
	{ id = "blue robe", chance = 60 },
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -138, effect = CONST_ME_DRAWBLOOD },
}

monster.defenses = {
	defense = 15,
	armor = 16,
	mitigation = 0.70,
	{ name = "invisible", interval = 2000, chance = 20, effect = CONST_ME_MAGIC_BLUE },
	{ name = "speed", interval = 2000, chance = 15, effect = CONST_ME_MAGIC_RED, speed = 590},
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
	{ type = "invisible", condition = false },
	{ type = "bleed", condition = false },
}

mType:register(monster)
