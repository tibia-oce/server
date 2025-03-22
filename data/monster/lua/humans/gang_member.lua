-- Version: 8.40
-- Monster: https://tibia.fandom.com/wiki/Gang_Member
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Gang_Member
---


local mType = Game.createMonsterType("Gang Member")
local monster = {}

monster.description = "a gang member"
monster.experience = 70
monster.outfit = {
	lookType = 151,
	lookHead = 114,
	lookBody = 19,
	lookLegs = 23,
	lookFeet = 40,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 295
monster.maxHealth = 295
monster.race = "blood"
monster.corpse = 20403
monster.speed = 95
monster.manaCost = 450

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
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 35,
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
	{ text = "This is our territory!", yell = false },
	{ text = "Help me guys!", yell = false },
	{ text = "I don't like the way you look!", yell = false },
	{ text = "You're wearing the wrong colours!", yell = false },
	{ text = "Don't mess with us!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 49031, minCount = 1, maxCount = 30 },  -- 2148
	{ id = "leather legs", chance = 15148 },  -- 2649
	{ id = "mace", chance = 9379 },  -- 2398
	{ id = "brown bread", chance = 5460 },  -- 2691
	{ id = "studded legs", chance = 4844 },  -- 2468
	{ id = "club ring", chance = 1057 },  -- 2209
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -70 },
}

monster.defenses = {
	defense = 15,
	armor = 8,
	mitigation = 0.38,
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
	{ type = COMBAT_DEATHDAMAGE, percent = -5 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = false },
	{ type = "bleed", condition = false },
}

mType:register(monster)