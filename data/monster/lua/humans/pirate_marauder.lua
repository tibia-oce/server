-- Version: 7.8
-- Monster: https://tibia.fandom.com/wiki/Pirate_Marauder
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Pirate_Marauder
---


local mType = Game.createMonsterType("Pirate Marauder")
local monster = {}

monster.description = "a pirate marauder"
monster.experience = 125
monster.outfit = {
	lookType = 93,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 210
monster.maxHealth = 210
monster.race = "blood"
monster.corpse = 18202
monster.speed = 105
monster.manaCost = 490

monster.changeTarget = {
	interval = 4000,
	chance = 15,
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
	illusionable = true,
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 20,
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
	{ text = "Plundeeeeer!", yell = false },
	{ text = "Hiyaa!", yell = false },
	{ text = "Give up!", yell = false },
}

monster.loot = {
	{ id = 2920, chance = 9880 }, -- torch
	{ id = "gold coin", chance = 77670, maxCount = 40 },
	{ id = "spear", chance = 5140, maxCount = 2 },
	{ id = "chain armor", chance = 3000 },
	{ id = "plate shield", chance = 5000 },
	{ id = 5090, chance = 910 }, -- treasure map
	{ id = "rum flask", chance = 110 },
	{ id = "die", chance = 90 }, -- die
	{ id = "bandana", chance = 880 },
	{ id = "pirate bag", chance = 430 },
	{ id = "empty goldfish bowl", chance = 80 },
	{ id = "hook", chance = 520 },
	{ id = "eye patch", chance = 530 },
	{ id = "peg leg", chance = 520 },
	{ id = "compass", chance = 9720 },
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -140 },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -40, range = 7, shootEffect = CONST_ANI_SPEAR, target = false },
}

monster.defenses = {
	defense = 15,
	armor = 8,
	mitigation = 0.56,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -3 },
	{ type = COMBAT_EARTHDAMAGE, percent = 10 },
	{ type = COMBAT_FIREDAMAGE, percent = -10 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 20 },
	{ type = COMBAT_DEATHDAMAGE, percent = -5 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)