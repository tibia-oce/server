-- Version: 7.5
-- Monster: https://tibia.fandom.com/wiki/Dark_Monk
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Dark_Monk
---


local mType = Game.createMonsterType("Dark Monk")
local monster = {}

monster.description = "a dark monk"
monster.experience = 145
monster.outfit = {
	lookType = 225,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 190
monster.maxHealth = 190
monster.race = "blood"
monster.corpse = 18281
monster.speed = 115
monster.manaCost = 480

monster.changeTarget = {
	interval = 5000,
	chance = 0,
}

monster.strategiesTarget = {
	nearest = 70,
	health = 20,
	damage = 10,
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
	{ text = "You are no match to us!", yell = false },
	{ text = "Your end has come!", yell = false },
	{ text = "This is where your path will end!", yell = false },
}

monster.loot = {
	{ id = "bread", chance = 20424 },  -- 2689
	{ id = "gold coin", chance = 14453, minCount = 1, maxCount = 18 },  -- 2148
	{ id = "dark rosary", chance = 10180 },  -- 11220
	{ id = "rope belt", chance = 6021 },  -- 12448
	{ id = "book of prayers", chance = 1943 },  -- 10563
	{ id = 1949, chance = 1853 },  -- scroll
	{ id = "life crystal", chance = 990 },  -- 2177
	{ id = "safety pin", chance = 944 },  -- 12449
	{ id = "ankh", chance = 940 },  -- 2193
	{ id = "sandals", chance = 872 },  -- 2642
	{ id = "mana potion", chance = 831 },  -- 7620
	{ id = 2044, chance = 572 },  -- lamp
	{ id = "brown flask", chance = 377 },  -- 2015
	{ id = "power ring", chance = 118 },  -- 2166
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -100 },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_LIFEDRAIN, minDamage = -20, maxDamage = -50, range = 1, effect = CONST_ME_MAGIC_RED, target = false },
}

monster.defenses = {
	defense = 25,
	armor = 22,
	mitigation = 1.13,
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_HEALING, minDamage = 25, maxDamage = 49, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "speed", interval = 2000, chance = 15, effect = CONST_ME_MAGIC_RED, speed = 230},
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = -10 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = -10 },
	{ type = COMBAT_DEATHDAMAGE, percent = 40 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)