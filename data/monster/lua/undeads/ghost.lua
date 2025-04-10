-- Version: 6.61-6.97
-- Monster: https://tibia.fandom.com/wiki/Ghost
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Ghost
---
-- Ghost (Tibia Wiki: https://tibia.fandom.com/wiki/Ghost)
-- Version: 6.61-6.97

local mType = Game.createMonsterType("Ghost")
local monster = {}

monster.description = "a ghost"
monster.experience = 120
monster.outfit = {
	lookType = 48,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 150
monster.maxHealth = 150
monster.race = "undead"
monster.corpse = 5993
monster.speed = 80
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
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = true}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Huh!", yell = false },
	{ text = "Shhhhhh", yell = false },
	{ text = "Buuuuuh", yell = false },
}

monster.loot = {
	{ id = "shadow herb", chance = 14602 },  -- 2804
	{ id = "morning star", chance = 10713 },  -- 2394
	{ id = "cape", chance = 8966 },  -- 2654
	{ id = "combat knife", chance = 7014 },  -- 2404
	{ id = "white piece of cloth", chance = 1935 },  -- 5909
	{ id = "ghostly tissue", chance = 1853 },  -- 10607
	{ id = 1950, chance = 1437 },  -- book (orange)
	{ id = "ancient shield", chance = 821 },  -- 2532
	{ id = "stealth ring", chance = 180 },  -- 2165
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -80 },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_LIFEDRAIN, minDamage = -20, maxDamage = -45, range = 1, effect = CONST_ME_MAGIC_RED, target = false },
}

monster.defenses = {
	defense = 5,
	armor = 10,
	mitigation = 0.51,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 100 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 100 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 100 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 100 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = false },
	{ type = "bleed", condition = false },
}

mType:register(monster)