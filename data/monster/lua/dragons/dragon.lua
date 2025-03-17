-- Version: 4.0
-- Monster: https://tibia.fandom.com/wiki/Dragon
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Dragon
---


local mType = Game.createMonsterType("Dragon")
local monster = {}

monster.description = "a dragon"
monster.experience = 700
monster.outfit = {
	lookType = 34,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.events = {
	"TheGreatDragonHuntDeath",
	"TheFirstDragonDragonTaskDeath",
}


monster.health = 1000
monster.maxHealth = 1000
monster.race = "blood"
monster.corpse = 5973
monster.speed = 86
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
	illusionable = true,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 80,
	targetDistance = 1,
	runHealth = 300,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "FCHHHHH", yell = true },
	{ text = "GROOAAARRR", yell = true },
}

monster.loot = {
	{ id = "gold coin", chance = 90085, minCount = 1, maxCount = 105 },  -- 2148
	{ id = "dragon ham", chance = 65089 },  -- 2672
	{ id = "steel shield", chance = 14906 },  -- 2509
	{ id = "crossbow", chance = 10094 },  -- 2455
	{ id = "dragon's tail", chance = 9849 },  -- 12413
	{ id = 2546, chance = 7991, minCount = 1, maxCount = 10 },  -- burst arrow
	{ id = "longsword", chance = 4027 },  -- 2397
	{ id = "steel helmet", chance = 3019 },  -- 2457
	{ id = "broadsword", chance = 1991 },  -- 2413
	{ id = "plate legs", chance = 1914 },  -- 2647
	{ id = "strong health potion", chance = 1054 },  -- 7588
	{ id = "wand of inferno", chance = 1048 },  -- 2187
	{ id = "green dragon scale", chance = 1037 },  -- 5920
	{ id = "green dragon leather", chance = 1014 },  -- 5877
	{ id = "double axe", chance = 1002 },  -- 2387
	{ id = "dragon hammer", chance = 515 },  -- 2434
	{ id = "serpent sword", chance = 505 },  -- 2409
	{ id = "small diamond", chance = 377 },  -- 2145
	{ id = "dragon shield", chance = 305 },  -- 2516
	{ id = "life crystal", chance = 110 },  -- 2177
	{ id = "dragonbone staff", chance = 106 },  -- 7430
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -120 },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_FIREDAMAGE, minDamage = -60, maxDamage = -140, range = 7, radius = 4, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = true },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_FIREDAMAGE, minDamage = -100, maxDamage = -170, length = 8, spread = 3, effect = CONST_ME_FIREAREA, target = false },
}

monster.defenses = {
	defense = 30,
	armor = 25,
	mitigation = 0.99,
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_HEALING, minDamage = 40, maxDamage = 70, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 20 },
	{ type = COMBAT_EARTHDAMAGE, percent = 80 },
	{ type = COMBAT_FIREDAMAGE, percent = 100 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -10 },
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