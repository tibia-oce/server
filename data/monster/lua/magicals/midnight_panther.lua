-- Version: 8.70
-- Monster: https://tibia.fandom.com/wiki/Midnight_Panther
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Midnight_Panther
---


local mType = Game.createMonsterType("Midnight Panther")
local monster = {}

monster.description = "a midnight panther"
monster.experience = 900
monster.outfit = {
	lookType = 385,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 1200
monster.maxHealth = 1200
monster.race = "blood"
monster.corpse = 12340
monster.speed = 290
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
	staticAttackChance = 80,
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

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Groooooooar", yell = false },
	{ text = "MEOW", yell = true },
	{ text = "Groarrrrrrrr", yell = false },
	{ text = "Purrrrrrr", yell = false },
}

monster.loot = {
	{ id = "panther paw", chance = 100000 },  -- 13027
	{ id = "gold coin", chance = 94118, minCount = 10, maxCount = 86 },  -- 2148
	{ id = "meat", chance = 26471 },  -- 2666
	{ id = "panther head", chance = 17647 },  -- 13026
	{ id = "life ring", chance = 2941 },  -- 2168
	{ id = "sabretooth", chance = 2941 },  -- 11228
	{ id = "strong health potion", chance = 2941 },  -- 7588
}

monster.attacks = {
	{ name = "melee", interval = 1500, chance = 100, minDamage = 0, maxDamage = -90 },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_ENERGYDAMAGE, minDamage = -75, maxDamage = -215, range = 7, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_ENERGYAREA, target = false },
}

monster.defenses = {
	defense = 30,
	armor = 30,
	mitigation = 0.99,
	{ name = "speed", interval = 2000, chance = 15, effect = CONST_ME_MAGIC_RED, speed = 580},
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_HEALING, minDamage = 50, maxDamage = 125, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "invisible", interval = 2000, chance = 15, effect = CONST_ME_MAGIC_BLUE },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 100 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 20 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = -5 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)