-- Version: 7.1
-- Monster: https://tibia.fandom.com/wiki/Swamp_Troll
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Swamp_Troll
---


local mType = Game.createMonsterType("Swamp Troll")
local monster = {}

monster.description = "a swamp troll"
monster.experience = 25
monster.outfit = {
	lookType = 76,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 55
monster.maxHealth = 55
monster.race = "venom"
monster.corpse = 6018
monster.speed = 64
monster.manaCost = 320

monster.changeTarget = {
	interval = 5000,
	chance = 0,
}

monster.strategiesTarget = {
	nearest = 100,
}

monster.flags = {
	summonable = true,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = true,
	rewardBoss = false,
	illusionable = true,
	canPushItems = false,
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 15,
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
	{ text = "Me strong! Me ate spinach!", yell = false },
	{ text = "Groar!", yell = false },
	{ text = "Grrrr", yell = false },
}

monster.loot = {
	{ id = "fish", chance = 59981 },  -- 2667
	{ id = "gold coin", chance = 50052, minCount = 1, maxCount = 5 },  -- 2148
	{ id = 2050, chance = 15238 },  -- torch
	{ id = "spear", chance = 13059 },  -- 2389
	{ id = "mouldy cheese", chance = 10108 },  -- 2235
	{ id = "leather boots", chance = 9888 },  -- 2643
	{ id = "swamp grass", chance = 3079 },  -- 10603
	{ id = "medicine pouch", chance = 2413 },  -- 13506
	{ id = 5901, chance = 2042 },  -- wood
	{ id = "troll green", chance = 1073 },  -- 2805
	{ id = "fishing rod", chance = 79 },  -- 2580
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -13, condition = { type = CONDITION_POISON, totalDamage = 1, interval = 4000 } },
}

monster.defenses = {
	defense = 15,
	armor = 6,
	mitigation = 0.25,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 15 },
	{ type = COMBAT_FIREDAMAGE, percent = -5 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = false },
	{ type = "bleed", condition = false },
}

mType:register(monster)