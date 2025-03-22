-- Version: 8.20
-- Monster: https://tibia.fandom.com/wiki/Teleskor
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Teleskor
---


local mType = Game.createMonsterType("Teleskor")
local monster = {}

monster.description = "Teleskor"
monster.experience = 70
monster.outfit = {
	lookType = 298,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.health = 80
monster.maxHealth = 80
monster.race = "undead"
monster.corpse = 5972
monster.speed = 75
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 5,
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
	{ text = "Who Disturbs my slumber?", yell = false },
	{ text = "Mourn the dead, do not hunt them!", yell = false },
}

monster.loot = {
	{ id = "pelvis bone", chance = 100000 },  -- 12437
	{ id = "viking helmet", chance = 71429 },  -- 2473
	{ id = "gold coin", chance = 60714, minCount = 8, maxCount = 79 },  -- 2148
	{ id = "mace", chance = 57143 },  -- 2398
	{ id = "brass shield", chance = 42857 },  -- 2511
	{ id = "hatchet", chance = 42857 },  -- 2388
	{ id = 2376, chance = 28571 },  -- sword
	{ id = 2050, chance = 17857 },  -- torch
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -30 },
}

monster.defenses = {
	defense = 15,
	armor = 15,
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
	{ type = COMBAT_HOLYDAMAGE, percent = -5 },
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = false },
	{ type = "bleed", condition = false },
}

mType:register(monster)