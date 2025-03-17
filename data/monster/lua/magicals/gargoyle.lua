-- Version: 7.4
-- Monster: https://tibia.fandom.com/wiki/Gargoyle
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Gargoyle
---


local mType = Game.createMonsterType("Gargoyle")
local monster = {}

monster.description = "a gargoyle"
monster.experience = 150
monster.outfit = {
	lookType = 95,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 250
monster.maxHealth = 250
monster.race = "undead"
monster.corpse = 6027
monster.speed = 100
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10,
}

monster.strategiesTarget = {
	nearest = 70,
	damage = 30,
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
	staticAttackChance = 70,
	targetDistance = 1,
	runHealth = 30,
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
	{ text = "Feel my claws, softskin.", yell = false },
	{ text = "There is a stone in your shoe!", yell = false },
	{ text = "Stone sweet stone.", yell = false },
	{ text = "Harrrr harrrr!", yell = false },
	{ text = "Chhhhhrrrrk!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 87678, minCount = 1, maxCount = 30 },  -- 2148
	{ id = "small stone", chance = 15059, minCount = 1, maxCount = 10 },  -- 1294
	{ id = "stone wing", chance = 11956 },  -- 11195
	{ id = "potato", chance = 9868, minCount = 1, maxCount = 2 },  -- 8838
	{ id = "strawberry", chance = 1995, minCount = 1, maxCount = 5 },  -- 2680
	{ id = "morning star", chance = 1499 },  -- 2394
	{ id = "battle shield", chance = 1383 },  -- 2513
	{ id = "wolf tooth chain", chance = 1069 },  -- 2129
	{ id = "steel helmet", chance = 771 },  -- 2457
	{ id = "piece of marble rock", chance = 489 },  -- 11343
	{ id = "dark armor", chance = 259 },  -- 2489
	{ id = "club ring", chance = 220 },  -- 2209
	{ id = "shiny stone", chance = 207 },  -- 11227
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -65 },
}

monster.defenses = {
	defense = 25,
	armor = 26,
	mitigation = 0.78,
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_HEALING, minDamage = 5, maxDamage = 15, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 20 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = -10 },
	{ type = COMBAT_LIFEDRAIN, percent = 100 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 40 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = false },
	{ type = "bleed", condition = false },
}

mType:register(monster)