-- Version: 10.10
-- Monster: https://tibia.fandom.com/wiki/Elder_Forest_Fury
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Forest_Fury
---


local mType = Game.createMonsterType("Elder Forest Fury")
local monster = {}

monster.description = "an elder forest fury"
monster.experience = 480
monster.outfit = {
	lookType = 569,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 670
monster.maxHealth = 670
monster.race = "blood"
monster.corpse = 19042
monster.speed = 110
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
	targetDistance = 4,
	runHealth = 0,
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
	{ text = "To arms, sisters!", yell = false },
	{ text = "Feel the wrath of mother forest!", yell = false },
	{ text = "By the power of Greenskull!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 87785, minCount = 1, maxCount = 55 },  -- 2148
	{ id = 2543, chance = 50517, minCount = 1, maxCount = 15 },  -- bolt
	{ id = "meat", chance = 24941 },  -- 2666
	{ id = 7363, chance = 14850, minCount = 1, maxCount = 5 },  -- piercing bolt
	{ id = "venison", chance = 12032 },  -- 21312
	{ id = "elven hoof", chance = 7432 },  -- 21311
	{ id = "crossbow", chance = 2588 },  -- 2455
	{ id = "small topaz", chance = 485 },  -- 9970
	{ id = "elvish bow", chance = 83 },  -- 7438
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -125 },
	{ name = "combat", interval = 1500, chance = 40, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -100, range = 7, radius = 4, shootEffect = CONST_ANI_HUNTINGSPEAR, effect = CONST_ME_MAGIC_GREEN, target = true },
	{ name = "forest fury skill reducer", interval = 2000, chance = 20, range = 5, target = false },
}

monster.defenses = {
	defense = 20,
	armor = 19,
	mitigation = 0.80,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = -5 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 10 },
	{ type = COMBAT_DEATHDAMAGE, percent = 40 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = false },
	{ type = "bleed", condition = false },
}

mType:register(monster)
