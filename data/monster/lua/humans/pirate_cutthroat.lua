-- Version: 7.8
-- Monster: https://tibia.fandom.com/wiki/Pirate_Cutthroat
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Pirate_Cutthroat
---


local mType = Game.createMonsterType("Pirate Cutthroat")
local monster = {}

monster.description = "a pirate cutthroat"
monster.experience = 175
monster.outfit = {
	lookType = 96,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 325
monster.maxHealth = 325
monster.race = "blood"
monster.corpse = 20479
monster.speed = 107
monster.manaCost = 0

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
	convinceable = false,
	pushable = false,
	rewardBoss = false,
	illusionable = true,
	canPushItems = true,
	canPushCreatures = false,
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
	{ text = "Give up!", yell = false },
	{ text = "Plundeeeeer!", yell = false },
	{ text = "Hiyaa!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 77504, minCount = 1, maxCount = 50 },  -- 2148
	{ id = "compass", chance = 10076 },  -- 11219
	{ id = "scale armor", chance = 3046 },  -- 2483
	{ id = "steel shield", chance = 2893 },  -- 2509
	{ id = "light shovel", chance = 1952 },  -- 5710
	{ id = 5706, chance = 1082 },  -- treasure map (pirate)
	{ id = "pirate knee breeches", chance = 1028 },  -- 5918
	{ id = "pirate bag", chance = 1000 },  -- 5927
	{ id = "hook", chance = 531 },  -- 6097
	{ id = "peg leg", chance = 527 },  -- 6126
	{ id = "eye patch", chance = 471 },  -- 6098
	{ id = 5792, chance = 95 },  -- die
	{ id = "rum flask", chance = 86 },  -- 5553
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -170, condition = { type = CONDITION_POISON, totalDamage = 10, interval = 4000 } },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -95, range = 3, radius = 1, shootEffect = CONST_ANI_EXPLOSION, effect = CONST_ME_EXPLOSIONAREA, target = true },
}

monster.defenses = {
	defense = 25,
	armor = 15,
	mitigation = 0.72,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 10 },
	{ type = COMBAT_FIREDAMAGE, percent = -5 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -5 },
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