-- Version: 4.0
-- Monster: https://tibia.fandom.com/wiki/Demon
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Demon
---


local mType = Game.createMonsterType("Demon")
local monster = {}

monster.description = "a demon"
monster.experience = 6000
monster.outfit = {
	lookType = 35,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 8200
monster.maxHealth = 8200
monster.race = "fire"
monster.corpse = 6002
monster.speed = 128
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 20,
}

monster.strategiesTarget = {
	nearest = 70,
	health = 10,
	damage = 10,
	random = 10,
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
	staticAttackChance = 70,
	targetDistance = 1,
	runHealth = 0,
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
		{ name = "fire elemental", chance = 10, interval = 2000, count = 1 },
	},
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Your soul will be mine!", yell = false },
	{ text = "CHAMEK ATH UTHUL ARAK!", yell = true },
	{ text = "I SMELL FEEEEAAAAAR!", yell = true },
	{ text = "Your resistance is futile!", yell = false },
	{ text = "MUHAHAHAHA!", yell = true },
}

monster.loot = {
	{ id = "gold coin", chance = 99582, minCount = 1, maxCount = 200 },  -- 2148
	{ id = "platinum coin", chance = 99578, minCount = 1, maxCount = 8 },  -- 2152
	{ id = "great mana potion", chance = 25148, minCount = 1, maxCount = 3 },  -- 7590
	{ id = "great spirit potion", chance = 24656, minCount = 1, maxCount = 3 },  -- 8472
	{ id = "ultimate health potion", chance = 20008, minCount = 1, maxCount = 3 },  -- 8473
	{ id = "demon horn", chance = 20001 },  -- 5954
	{ id = "fire mushroom", chance = 19837, minCount = 1, maxCount = 6 },  -- 2795
	{ id = "demonic essence", chance = 19647 },  -- 6500
	{ id = "assassin star", chance = 15347, minCount = 1, maxCount = 10 },  -- 7368
	{ id = "small topaz", chance = 10104, minCount = 1, maxCount = 5 },  -- 9970
	{ id = "small ruby", chance = 10041, minCount = 1, maxCount = 5 },  -- 2147
	{ id = "small emerald", chance = 9933, minCount = 1, maxCount = 5 },  -- 2149
	{ id = "small amethyst", chance = 9796, minCount = 1, maxCount = 5 },  -- 2150
	{ id = "fire axe", chance = 4064 },  -- 2432
	{ id = "talon", chance = 3440 },  -- 2151
	{ id = "red gem", chance = 2946 },  -- 2156
	{ id = "orb", chance = 2854 },  -- 2176
	{ id = "ring of healing", chance = 2616 },  -- 2214
	{ id = "might ring", chance = 2445 },  -- 2164
	{ id = "stealth ring", chance = 2364 },  -- 2165
	{ id = "giant sword", chance = 1953 },  -- 2393
	{ id = "ice rapier", chance = 1942 },  -- 2396
	{ id = "golden sickle", chance = 1363 },  -- 2418
	{ id = "purple tome", chance = 1266 },  -- 1982
	{ id = "devil helmet", chance = 1239 },  -- 2462
	{ id = "gold ring", chance = 1049 },  -- 2179
	{ id = "demon shield", chance = 727 },  -- 2520
	{ id = "platinum amulet", chance = 703 },  -- 2171
	{ id = "mastermind shield", chance = 501 },  -- 2514
	{ id = "golden legs", chance = 384 },  -- 2470
	{ id = 7393, chance = 94 },  -- demon trophy
	{ id = "magic plate armor", chance = 83 },  -- 2472
	{ id = "demonrage sword", chance = 56 },  -- 7382
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -520 },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_MANADRAIN, minDamage = 0, maxDamage = -120, range = 7, target = false },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_FIREDAMAGE, minDamage = -150, maxDamage = -250, range = 7, radius = 7, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = true },
	{ name = "firefield", interval = 2000, chance = 10, range = 7, radius = 1, shootEffect = CONST_ANI_FIRE, target = true },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_LIFEDRAIN, minDamage = -300, maxDamage = -490, length = 8, spread = 0, effect = CONST_ME_PURPLEENERGY, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_ENERGYDAMAGE, minDamage = -210, maxDamage = -300, range = 1, shootEffect = CONST_ANI_ENERGY, target = true },
	{ name = "speed", interval = 2000, chance = 15, speed = -700, radius = 1, effect = CONST_ME_MAGIC_RED, target = true, duration = 30000 },
}

monster.defenses = {
	defense = 55,
	armor = 44,
	mitigation = 1.74,
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_HEALING, minDamage = 180, maxDamage = 250, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "speed", interval = 2000, chance = 15, effect = CONST_ME_MAGIC_RED, speed = 256},
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 25 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 50 },
	{ type = COMBAT_EARTHDAMAGE, percent = 40 },
	{ type = COMBAT_FIREDAMAGE, percent = 100 },
	{ type = COMBAT_LIFEDRAIN, percent = 100 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 100 },
	{ type = COMBAT_ICEDAMAGE, percent = -12 },
	{ type = COMBAT_HOLYDAMAGE, percent = -12 },
	{ type = COMBAT_DEATHDAMAGE, percent = 20 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)