-- Pirate Cutthroat (Tibia Wiki: https://tibia.fandom.com/wiki/Pirate_Cutthroat)
-- Version: 7.8

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
monster.corpse = 18198
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
	{ id = "gold coin", chance = 78000, maxCount = 50 },
	{ id = "scale armor", chance = 3000 },
	{ id = "steel shield", chance = 2800 },
	{ id = 5090, chance = 1000 }, -- treasure map
	{ id = "rum flask", chance = 90 },
	{ id = "light shovel", chance = 2000 },
	{ id = 5792, chance = 110 }, -- die
	{ id = "pirate knee breeches", chance = 980 },
	{ id = "pirate bag", chance = 1000 },
	{ id = "hook", chance = 550 },
	{ id = "eye patch", chance = 450 },
	{ id = "peg leg", chance = 500 },
	{ id = "compass", chance = 10120 },
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
