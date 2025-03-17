-- Version: 6.0
-- Monster: https://tibia.fandom.com/wiki/Orc_Leader
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Orc_Leader
---


local mType = Game.createMonsterType("Orc Leader")
local monster = {}

monster.description = "an orc leader"
monster.experience = 270
monster.outfit = {
	lookType = 59,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 450
monster.maxHealth = 450
monster.race = "blood"
monster.corpse = 6001
monster.speed = 115
monster.manaCost = 640

monster.changeTarget = {
	interval = 4000,
	chance = 10,
}

monster.strategiesTarget = {
	nearest = 70,
	health = 15,
	damage = 15,
}

monster.flags = {
	summonable = true,
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
	canWalkOnFire = true,
	canWalkOnPoison = false}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Ulderek futgyr human!", yell = false },
}

monster.loot = {
	{ id = "fish", chance = 30125 },  -- 2667
	{ id = "gold coin", chance = 28238, minCount = 1, maxCount = 35 },  -- 2148
	{ id = "orc leather", chance = 19710 },  -- 12435
	{ id = "plate shield", chance = 10122 },  -- 2510
	{ id = "throwing knife", chance = 9998, minCount = 1, maxCount = 4 },  -- 2410
	{ id = "brown mushroom", chance = 9865 },  -- 2789
	{ id = "sword ring", chance = 3790 },  -- 2207
	{ id = "longsword", chance = 2973 },  -- 2397
	{ id = "royal spear", chance = 2657 },  -- 7378
	{ id = "brass legs", chance = 2450 },  -- 2478
	{ id = 2419, chance = 2164 },  -- scimitar
	{ id = "skull belt", chance = 2084 },  -- 12436
	{ id = "plate armor", chance = 1594 },  -- 2463
	{ id = "orc tooth", chance = 1032 },  -- 11113
	{ id = "broadsword", chance = 757 },  -- 2413
	{ id = "health potion", chance = 581 },  -- 7618
	{ id = "plate legs", chance = 410 },  -- 2647
	{ id = "warrior helmet", chance = 111 },  -- 2475
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -185 },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -70, range = 7, shootEffect = CONST_ANI_THROWINGKNIFE, target = false },
}

monster.defenses = {
	defense = 25,
	armor = 20,
	mitigation = 1.18,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 20 },
	{ type = COMBAT_EARTHDAMAGE, percent = -10 },
	{ type = COMBAT_FIREDAMAGE, percent = 100 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 20 },
	{ type = COMBAT_DEATHDAMAGE, percent = -10 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)