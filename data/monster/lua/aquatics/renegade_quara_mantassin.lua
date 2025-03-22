-- Version: 10.70
-- Monster: https://tibia.fandom.com/wiki/Renegade_Quara_Mantassin
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Renegade_Quara_Mantassin
---


local mType = Game.createMonsterType("Renegade Quara Mantassin")
local monster = {}

monster.description = "a renegade quara mantassin"
monster.experience = 1000
monster.outfit = {
	lookType = 72,
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
monster.corpse = 6064
monster.speed = 295
monster.manaCost = 0

monster.changeTarget = {
	interval = 2000,
	chance = 0,
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
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = true,
	canWalkOnPoison = false}

monster.light = {
	level = 2,
	color = 35,
}

monster.voices = {
	interval = 5000,
	chance = 10,
}

monster.loot = {
	{ id = "mantassin tail", chance = 12798 },  -- 12445
	{ id = "mind stone", chance = 9964 },  -- 2178
	{ id = "shrimp", chance = 4491 },  -- 2670
	{ id = "small sapphire", chance = 3452, minCount = 1, maxCount = 3 },  -- 2146
	{ id = "ice rapier", chance = 3115 },  -- 2396
	{ id = "stealth ring", chance = 2750 },  -- 2165
	{ id = "strange helmet", chance = 1600 },  -- 2479
	{ id = "blue crystal shard", chance = 1375 },  -- 18413
	{ id = "two handed sword", chance = 1038 },  -- 2377
	{ id = "energy ring", chance = 842 },  -- 2167
	{ id = "fish fin", chance = 702 },  -- 5895
	{ id = "blue robe", chance = 674 },  -- 2656
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, skill = 40, attack = 55, effect = CONST_ME_DRAWBLOOD },
}

monster.defenses = {
	defense = 15,
	armor = 16,
	mitigation = 0.70,
	{ name = "invisible", interval = 2000, chance = 20, effect = CONST_ME_MAGIC_BLUE },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -25 },
	{ type = COMBAT_EARTHDAMAGE, percent = -10 },
	{ type = COMBAT_FIREDAMAGE, percent = 100 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 100 },
	{ type = COMBAT_ICEDAMAGE, percent = 100 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = false },
	{ type = "bleed", condition = false },
}

mType:register(monster)