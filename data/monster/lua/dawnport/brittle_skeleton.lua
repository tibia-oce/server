-- Version: 10.55
-- Monster: https://tibia.fandom.com/wiki/Brittle_Skeleton
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Brittle_Skeleton
---


local mType = Game.createMonsterType("Brittle Skeleton")
local monster = {}

monster.description = "a brittle skeleton"
monster.experience = 35
monster.outfit = {
	lookType = 33,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.health = 50
monster.maxHealth = 50
monster.race = "undead"
monster.corpse = 5972
monster.speed = 73
monster.manaCost = 300

monster.changeTarget = {
	interval = 2000,
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
	canPushItems = false,
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
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
	{ id = "gold coin", chance = 100000, minCount = 1, maxCount = 5 },  -- 2148
	{ id = 2050, chance = 8985 },  -- torch
	{ id = 2376, chance = 5391 },  -- sword
	{ id = "viking helmet", chance = 5180 },  -- 2473
	{ id = "mace", chance = 5074 },  -- 2398
	{ id = "hatchet", chance = 4863 },  -- 2388
	{ id = "brass shield", chance = 4228 },  -- 2511
	{ id = "studded armor", chance = 2220 },  -- 2484
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, skill = 10, attack = 18 },
	{ name = "combat", interval = 2000, chance = 8, type = COMBAT_LIFEDRAIN, minDamage = -7, maxDamage = -13, range = 7, shootEffect = CONST_ANI_SUDDENDEATH, target = false },
}

monster.defenses = {
	defense = 9,
	armor = 2,
	mitigation = 0.23,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)