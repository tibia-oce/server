-- Version: 8.54
-- Monster: https://tibia.fandom.com/wiki/Eternal_Guardian
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Eternal_Guardian
---


local mType = Game.createMonsterType("Eternal Guardian")
local monster = {}

monster.description = "an eternal guardian"
monster.experience = 1800
monster.outfit = {
	lookType = 345,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 2500
monster.maxHealth = 2500
monster.race = "undead"
monster.corpse = 10383
monster.speed = 102
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
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
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
	{ text = "Zzrrkrrch!", yell = false },
	{ text = "<crackle>", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 99959, minCount = 1, maxCount = 100 },  -- 2148
	{ id = "platinum coin", chance = 99731, minCount = 1, maxCount = 4 },  -- 2152
	{ id = "small stone", chance = 30383, minCount = 1, maxCount = 10 },  -- 1294
	{ id = "ancient stone", chance = 19915 },  -- 10549
	{ id = "spiked iron ball", chance = 9919 },  -- 11325
	{ id = "Zaoan halberd", chance = 1988 },
	{ id = "iron ore", chance = 1657 },  -- 5880
	{ id = "shiny stone", chance = 787 },  -- 11227
	{ id = "tower shield", chance = 771 },  -- 2528
	{ id = "clay lump", chance = 756 },  -- 11339
	{ id = "guardian halberd", chance = 595 },  -- 2427
	{ id = "piece of marble rock", chance = 481 },  -- 11343
	{ id = 13757, chance = 461 },  -- coal
	{ id = "Zaoan sword", chance = 119 },
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -300 },
}

monster.defenses = {
	defense = 40,
	armor = 62,
	mitigation = 1.18,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 20 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 10 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = 70 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 100 },
	{ type = COMBAT_ICEDAMAGE, percent = 10 },
	{ type = COMBAT_HOLYDAMAGE, percent = 20 },
	{ type = COMBAT_DEATHDAMAGE, percent = 20 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)