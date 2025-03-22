-- Version: 7.8
-- Monster: https://tibia.fandom.com/wiki/Quara_Hydromancer
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Quara_Hydromancer
---


local mType = Game.createMonsterType("Quara Hydromancer")
local monster = {}

monster.description = "a quara hydromancer"
monster.experience = 950
monster.outfit = {
	lookType = 47,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 1100
monster.maxHealth = 1100
monster.race = "blood"
monster.corpse = 6066
monster.speed = 245
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
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = true,
	canWalkOnPoison = false}

monster.light = {
	level = 2,
	color = 35,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Qua hah tsh!", yell = false },
	{ text = "Teech tsha tshul!", yell = false },
	{ text = "Quara tsha Fach!", yell = false },
	{ text = "Tssssha Quara!", yell = false },
	{ text = "Blubber.", yell = false },
	{ text = "Blup.", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 90508, minCount = 1, maxCount = 110 },  -- 2148
	{ id = "quara eye", chance = 15751 },  -- 12444
	{ id = "small emerald", chance = 5134, minCount = 1, maxCount = 2 },  -- 2149
	{ id = "white pearl", chance = 5126 },  -- 2143
	{ id = "shrimp", chance = 4830 },  -- 2670
	{ id = "black pearl", chance = 3004 },  -- 2144
	{ id = "great mana potion", chance = 2936 },  -- 7590
	{ id = "fish fin", chance = 1529 },  -- 5895
	{ id = "ring of healing", chance = 1179 },  -- 2214
	{ id = "wand of cosmic energy", chance = 996 },  -- 2189
	{ id = "knight armor", chance = 236 },  -- 2476
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -80, effect = CONST_ME_DRAWBLOOD, condition = { type = CONDITION_POISON, totalDamage = 100, interval = 4000 } },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_ICEDAMAGE, minDamage = -100, maxDamage = -180, length = 8, spread = 0, effect = CONST_ME_BUBBLES, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_ICEDAMAGE, minDamage = -90, maxDamage = -150, radius = 3, effect = CONST_ME_BUBBLES, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_LIFEDRAIN, minDamage = -170, maxDamage = -240, length = 8, spread = 0, effect = CONST_ME_HITBYPOISON, target = false },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_LIFEDRAIN, minDamage = 0, maxDamage = -170, range = 7, effect = CONST_ME_MAGIC_RED, target = true },
	{ name = "speed", interval = 2000, chance = 15, speed = -600, range = 7, effect = CONST_ME_MAGIC_RED, target = false, duration = 15000 },
}

monster.defenses = {
	defense = 15,
	armor = 30,
	mitigation = 1.04,
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_HEALING, minDamage = 100, maxDamage = 120, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -25 },
	{ type = COMBAT_EARTHDAMAGE, percent = -10 },
	{ type = COMBAT_FIREDAMAGE, percent = 100 },
	{ type = COMBAT_LIFEDRAIN, percent = 100 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 100 },
	{ type = COMBAT_ICEDAMAGE, percent = 100 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)