-- Version: 5.1
-- Monster: https://tibia.fandom.com/wiki/Warlock
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Warlock
---


local mType = Game.createMonsterType("Warlock")
local monster = {}

monster.description = "a warlock"
monster.experience = 4000
monster.outfit = {
	lookType = 130,
	lookHead = 0,
	lookBody = 52,
	lookLegs = 128,
	lookFeet = 95,
	lookAddons = 1,
	lookMount = 0,
}


monster.health = 3500
monster.maxHealth = 3500
monster.race = "blood"
monster.corpse = 18246
monster.speed = 115
monster.manaCost = 0

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
	convinceable = false,
	pushable = false,
	rewardBoss = false,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 4,
	runHealth = 900,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true}

monster.light = {
	level = 0,
	color = 0,
}

monster.summon = {
	maxSummons = 1,
	summons = {
		{ name = "stone golem", chance = 10, interval = 2000, count = 1 },
	},
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Even a rat is a better mage than you!", yell = false },
	{ text = "Learn the secret of our magic! YOUR death!", yell = false },
	{ text = "We don't like intruders!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 30051, minCount = 1, maxCount = 80 },  -- 2148
	{ id = "cherry", chance = 19607, minCount = 1, maxCount = 4 },  -- 2679
	{ id = "bread", chance = 8922 },  -- 2689
	{ id = "poison dagger", chance = 7698 },  -- 2411
	{ id = "skull staff", chance = 6107 },  -- 2436
	{ id = "great health potion", chance = 5098 },  -- 7591
	{ id = "great mana potion", chance = 4971 },  -- 7590
	{ id = "assassin star", chance = 3272, minCount = 1, maxCount = 4 },  -- 7368
	{ id = "dark mushroom", chance = 2923 },  -- 2792
	{ id = "mind stone", chance = 2118 },  -- 2178
	{ id = "energy ring", chance = 1953 },  -- 2167
	{ id = "candlestick", chance = 1573 },  -- 2047
	{ id = "blue robe", chance = 1566 },  -- 2656
	{ id = "small sapphire", chance = 1281 },  -- 2146
	{ id = "talon", chance = 1053 },  -- 2151
	{ id = "lightning robe", chance = 1002 },  -- 7898
	{ id = "inkwell", chance = 932 },  -- 2600
	{ id = 2124, chance = 729 },  -- crystal ring
	{ id = "luminous orb", chance = 482 },  -- 12410
	{ id = "ring of the sky", chance = 412 },  -- 2123
	{ id = "stone skin amulet", chance = 349 },  -- 2197
	{ id = "red tome", chance = 247 },  -- 1986
	{ id = "golden armor", chance = 203 },  -- 2466
	{ id = "piggy bank", chance = 76 },  -- 2114
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -130 },
	{ name = "combat", interval = 2000, chance = 25, type = COMBAT_ENERGYDAMAGE, minDamage = -90, maxDamage = -180, range = 7, shootEffect = CONST_ANI_ENERGY, target = false },
	{ name = "warlock skill reducer", interval = 2000, chance = 5, range = 5, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_MANADRAIN, minDamage = 0, maxDamage = -120, range = 7, target = false },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_FIREDAMAGE, minDamage = -50, maxDamage = -180, range = 7, radius = 3, shootEffect = CONST_ANI_BURSTARROW, effect = CONST_ME_FIREAREA, target = true },
	{ name = "firefield", interval = 2000, chance = 10, range = 7, radius = 2, shootEffect = CONST_ANI_FIRE, target = true },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_ENERGYDAMAGE, minDamage = -150, maxDamage = -230, length = 8, spread = 0, effect = CONST_ME_BIGCLOUDS, target = false },
	{ name = "speed", interval = 2000, chance = 15, speed = -600, range = 7, effect = CONST_ME_MAGIC_RED, target = false, duration = 20000 },
}

monster.defenses = {
	defense = 20,
	armor = 33,
	mitigation = 1.32,
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_HEALING, minDamage = 100, maxDamage = 225, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "invisible", interval = 2000, chance = 20, effect = CONST_ME_MAGIC_BLUE },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = -5 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 100 },
	{ type = COMBAT_EARTHDAMAGE, percent = 95 },
	{ type = COMBAT_FIREDAMAGE, percent = 100 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 100 },
	{ type = COMBAT_HOLYDAMAGE, percent = -8 },
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)