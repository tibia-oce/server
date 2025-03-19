-- Version: 8.00
-- Monster: https://tibia.fandom.com/wiki/Frost_Dragon
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Frost_Dragon
---


local mType = Game.createMonsterType("Frost Dragon")
local monster = {}

monster.description = "a frost dragon"
monster.experience = 2100
monster.outfit = {
	lookType = 248,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 1800
monster.maxHealth = 1800
monster.race = "undead"
monster.corpse = 7091
monster.speed = 106
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10,
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
	runHealth = 250,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = true,
	canWalkOnPoison = true}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "YOU WILL FREEZE!", yell = true },
	{ text = "ZCHHHHH!", yell = true },
	{ text = "I am so cool.", yell = false },
	{ text = "Chill out!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 95017, minCount = 1, maxCount = 243 },  -- 2148
	{ id = "dragon ham", chance = 79872, minCount = 1, maxCount = 3 },  -- 2672
	{ id = "green mushroom", chance = 12147 },  -- 2796
	{ id = 1976, chance = 8841 },  -- book (gemmed)
	{ id = "power bolt", chance = 5877, minCount = 1, maxCount = 6 },  -- 2547
	{ id = "small sapphire", chance = 5081 },  -- 2146
	{ id = "energy ring", chance = 4950 },  -- 2167
	{ id = 7441, chance = 4074 },  -- ice cube
	{ id = "golden mug", chance = 3078 },  -- 2033
	{ id = "life crystal", chance = 603 },  -- 2177
	{ id = "shard", chance = 524 },  -- 7290
	{ id = "strange helmet", chance = 456 },  -- 2479
	{ id = "ice rapier", chance = 343 },  -- 2396
	{ id = "tower shield", chance = 301 },  -- 2528
	{ id = "royal helmet", chance = 204 },  -- 2498
	{ id = "dragon scale mail", chance = 110 },  -- 2492
	{ id = "dragon slayer", chance = 94 },  -- 7402
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -225 },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_LIFEDRAIN, minDamage = -175, maxDamage = -380, length = 8, spread = 3, effect = CONST_ME_POFF, target = false },
	{ name = "speed", interval = 2000, chance = 5, speed = -700, radius = 3, effect = CONST_ME_POFF, target = false, duration = 12000 },
	{ name = "speed", interval = 2000, chance = 15, speed = -850, length = 7, spread = 3, effect = CONST_ME_ICEATTACK, target = false, duration = 18000 },
	{ name = "combat", interval = 2000, chance = 5, type = COMBAT_ICEDAMAGE, minDamage = -60, maxDamage = -120, radius = 3, effect = CONST_ME_ICETORNADO, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_ICEDAMAGE, minDamage = -100, maxDamage = -240, radius = 4, effect = CONST_ME_ICEAREA, target = true },
	{ name = "combat", interval = 2000, chance = 5, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -220, length = 1, spread = 3, effect = CONST_ME_POFF, target = false },
	{ name = "speed", interval = 2000, chance = 20, speed = -600, radius = 4, effect = CONST_ME_ICEAREA, target = true, duration = 12000 },
}

monster.defenses = {
	defense = 45,
	armor = 38,
	mitigation = 1.07,
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_HEALING, minDamage = 150, maxDamage = 200, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "speed", interval = 2000, chance = 15, effect = CONST_ME_MAGIC_RED, speed = 212},
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 5 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = 100 },
	{ type = COMBAT_LIFEDRAIN, percent = 100 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 100 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 10 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)