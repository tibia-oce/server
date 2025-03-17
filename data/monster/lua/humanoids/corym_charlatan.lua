-- Version: 9.80
-- Monster: https://tibia.fandom.com/wiki/Corym_Charlatan
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Corym_Charlatan
---


local mType = Game.createMonsterType("Corym Charlatan")
local monster = {}

monster.description = "a corym charlatan"
monster.experience = 150
monster.outfit = {
	lookType = 532,
	lookHead = 0,
	lookBody = 78,
	lookLegs = 59,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 250
monster.maxHealth = 250
monster.race = "blood"
monster.corpse = 17445
monster.speed = 95
monster.manaCost = 490

monster.changeTarget = {
	interval = 5000,
	chance = 0,
}

monster.strategiesTarget = {
	nearest = 70,
	health = 10,
	damage = 10,
	random = 10,
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
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 1,
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
	{ text = "Mehehe!", yell = false },
	{ text = "Beware! Me hexing you!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 81450, minCount = 1, maxCount = 35 },  -- 2148
	{ id = "rat cheese", chance = 14772 },  -- 20101
	{ id = "soft cheese", chance = 12358 },  -- 20100
	{ id = "cheese", chance = 9755 },  -- 2696
	{ id = "bola", chance = 7873 },  -- 20089
	{ id = "earflap", chance = 7409 },  -- 20099
	{ id = "cheese cutter", chance = 6519 },  -- 20097
	{ id = "ratana", chance = 606 },  -- 20092
	{ id = "life preserver", chance = 565 },  -- 20093
	{ id = "cheesy figurine", chance = 514 },  -- 20098
	{ id = "leather harness", chance = 450 },  -- 20126
	{ id = "spike shield", chance = 450 },  -- 20090
	{ id = "rat god doll", chance = 5 },  -- 20105
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -105 },
}

monster.defenses = {
	defense = 10,
	armor = 17,
	mitigation = 0.62,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 25 },
	{ type = COMBAT_EARTHDAMAGE, percent = 25 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = -5 },
	{ type = COMBAT_DEATHDAMAGE, percent = 15 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = false },
	{ type = "bleed", condition = false },
}

mType:register(monster)
