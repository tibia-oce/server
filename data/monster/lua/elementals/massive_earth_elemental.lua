-- Version: 8.20
-- Monster: https://tibia.fandom.com/wiki/Massive_Earth_Elemental
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Massive_Earth_Elemental
---


local mType = Game.createMonsterType("Massive Earth Elemental")
local monster = {}

monster.description = "a massive earth elemental"
monster.experience = 1100
monster.outfit = {
	lookType = 285,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 1330
monster.maxHealth = 1330
monster.race = "undead"
monster.corpse = 8933
monster.speed = 185
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
	canPushCreatures = false,
	staticAttackChance = 80,
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
}

monster.loot = {
	{ id = "gold coin", chance = 93977, minCount = 1, maxCount = 241 },  -- 2148
	{ id = "lump of earth", chance = 40309 },  -- 11222
	{ id = "small stone", chance = 24492, minCount = 1, maxCount = 10 },  -- 1294
	{ id = 9808, chance = 5001 },  -- todo: rusted armor does not exist in items.xml
	{ id = "small topaz", chance = 4918, minCount = 1, maxCount = 2 },  -- 9970
	{ id = "small diamond", chance = 4642, minCount = 1, maxCount = 2 },  -- 2145
	{ id = "dwarven ring", chance = 2915 },  -- 2213
	{ id = "protection amulet", chance = 1810 },  -- 2200
	{ id = "stone skin amulet", chance = 884 },  -- 2197
	{ id = "terra amulet", chance = 566 },  -- 7887
	{ id = "clay lump", chance = 483 },  -- 11339
	{ id = 13757, chance = 470 },  -- coal
	{ id = "diamond sceptre", chance = 180 },  -- 7387
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -110 },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_EARTHDAMAGE, minDamage = -99, maxDamage = -145, range = 7, shootEffect = CONST_ANI_SMALLEARTH, effect = CONST_ME_GREEN_RINGS, target = true },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_PHYSICALDAMAGE, minDamage = -95, maxDamage = -169, range = 7, radius = 2, shootEffect = CONST_ANI_LARGEROCK, effect = CONST_ME_POFF, target = true },
	-- poison
	{ name = "condition", type = CONDITION_POISON, interval = 2000, chance = 15, minDamage = -300, maxDamage = -320, length = 6, spread = 0, effect = CONST_ME_BIGPLANTS, target = false },
	-- poison
	{ name = "condition", type = CONDITION_POISON, interval = 2000, chance = 10, minDamage = -200, maxDamage = -220, radius = 5, shootEffect = CONST_ANI_POISON, effect = CONST_ME_POISONAREA, target = false },
	{ name = "speed", interval = 2000, chance = 20, speed = -330, range = 5, effect = CONST_ME_SMALLPLANTS, target = true, duration = 5000 },
}

monster.defenses = {
	defense = 35,
	armor = 60,
	mitigation = 1.04,
	{ name = "combat", interval = 2000, chance = 5, type = COMBAT_HEALING, minDamage = 150, maxDamage = 180, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 20 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 90 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = -15 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 15 },
	{ type = COMBAT_HOLYDAMAGE, percent = 50 },
	{ type = COMBAT_DEATHDAMAGE, percent = 45 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)