-- Version: 7.3
-- Monster: https://tibia.fandom.com/wiki/Morguthis
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Morguthis
---


local mType = Game.createMonsterType("Morguthis")
local monster = {}

monster.description = "Morguthis"
monster.experience = 3000
monster.outfit = {
	lookType = 90,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.health = 4800
monster.maxHealth = 4800
monster.race = "undead"
monster.corpse = 6025
monster.speed = 295
monster.manaCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 8,
}


monster.strategiesTarget = {
	nearest = 80,
	health = 10,
	damage = 10,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = false,
	rewardBoss = false,
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

monster.summon = {
	maxSummons = 3,
	summons = {
		{ name = "Hero", chance = 100, interval = 2000, count = 3 },
	},
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Vengeance!", yell = false },
	{ text = "You will make a fine trophy.", yell = false },
	{ text = "Come and fight me, cowards!", yell = false },
	{ text = "I am the supreme warrior!", yell = false },
	{ text = "Let me hear the music of battle.", yell = false },
	{ text = "Another one to bite the dust!", yell = false },
}

monster.loot = {
	{ id = "sword hilt", chance = 100000 },  -- 2350
	{ id = "gold coin", chance = 91633, minCount = 2, maxCount = 221 },  -- 2148
	{ id = "black pearl", chance = 10890 },  -- 2144
	{ id = "assassin star", chance = 9827, minCount = 1, maxCount = 3 },  -- 7368
	{ id = "great health potion", chance = 9562 },  -- 7591
	{ id = "knight axe", chance = 5710 },  -- 2430
	{ id = "stone skin amulet", chance = 4914 },  -- 2197
	{ id = 2136, chance = 133 },  -- demonbone amulet
	{ id = "mini mummy", chance = 133 },  -- 11207
	{ id = "steel boots", chance = 133 },  -- 2645
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -1000, condition = { type = CONDITION_POISON, totalDamage = 65, interval = 4000 } },
	{ name = "combat", interval = 3000, chance = 7, type = COMBAT_LIFEDRAIN, minDamage = -55, maxDamage = -550, range = 1, target = false },
	{ name = "speed", interval = 1000, chance = 25, speed = -650, range = 7, effect = CONST_ME_MAGIC_RED, target = false, duration = 50000 },
	{ name = "combat", interval = 1000, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = -40, maxDamage = -400, radius = 3, effect = CONST_ME_HITAREA, target = false },
	{ name = "combat", interval = 3000, chance = 7, type = COMBAT_PHYSICALDAMAGE, minDamage = -50, maxDamage = -500, radius = 3, effect = CONST_ME_MORTAREA, target = false },
}

monster.defenses = {
	defense = 25,
	armor = 35,
	{ name = "combat", interval = 1000, chance = 13, type = COMBAT_HEALING, minDamage = 200, maxDamage = 300, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "speed", interval = 1000, chance = 7, effect = CONST_ME_MAGIC_RED, speed = 590},
	{ name = "invisible", interval = 2000, chance = 10, effect = CONST_ME_MAGIC_BLUE },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 52 },
	{ type = COMBAT_EARTHDAMAGE, percent = -15 },
	{ type = COMBAT_FIREDAMAGE, percent = 60 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 62 },
	{ type = COMBAT_HOLYDAMAGE, percent = -22 },
	{ type = COMBAT_DEATHDAMAGE, percent = 100 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
