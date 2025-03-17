-- Version: 7.5
-- Monster: https://tibia.fandom.com/wiki/Smuggler
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Smuggler
---


local mType = Game.createMonsterType("Smuggler")
local monster = {}

monster.description = "a smuggler"
monster.experience = 48
monster.outfit = {
	lookType = 134,
	lookHead = 95,
	lookBody = 0,
	lookLegs = 113,
	lookFeet = 115,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 130
monster.maxHealth = 130
monster.race = "blood"
monster.corpse = 18226
monster.speed = 88
monster.manaCost = 390

monster.changeTarget = {
	interval = 4000,
	chance = 10,
}

monster.strategiesTarget = {
	nearest = 100,
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
	runHealth = 15,
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
	{ text = "You saw something you shouldn't!", yell = false },
	{ text = "I will silence you forever!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 79815, minCount = 1, maxCount = 10 },  -- 2148
	{ id = 2050, chance = 30209, minCount = 1, maxCount = 2 },  -- torch
	{ id = "leather legs", chance = 14821 },  -- 2649
	{ id = "ham", chance = 10191 },  -- 2671
	{ id = "short sword", chance = 10057 },  -- 2406
	{ id = "knife", chance = 10029 },  -- 2403
	{ id = "leather helmet", chance = 10029 },  -- 2461
	{ id = 2376, chance = 5032 },  -- sword
	{ id = "raspberry", chance = 4922, minCount = 1, maxCount = 5 },  -- 8840
	{ id = "combat knife", chance = 4058 },  -- 2404
	{ id = 7397, chance = 111 },  -- deer trophy
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -60 },
}

monster.defenses = {
	defense = 15,
	armor = 8,
	mitigation = 0.33,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = -5 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = -5 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = false },
	{ type = "bleed", condition = false },
}

mType:register(monster)