-- Version: 10.70
-- Monster: https://tibia.fandom.com/wiki/Renegade_Quara_Pincher
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Renegade_Quara_Pincher
---


local mType = Game.createMonsterType("Renegade Quara Pincher")
local monster = {}

monster.description = "a renegade quara pincher"
monster.experience = 2200
monster.outfit = {
	lookType = 77,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 2800
monster.maxHealth = 2800
monster.race = "blood"
monster.corpse = 6063
monster.speed = 198
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
	{ id = "platinum coin", chance = 80459, minCount = 1, maxCount = 5 },  -- 2152
	{ id = "quara pincers", chance = 18615 },  -- 12446
	{ id = "great mana potion", chance = 10456, minCount = 1, maxCount = 2 },  -- 7590
	{ id = "great health potion", chance = 9393, minCount = 1, maxCount = 2 },  -- 7591
	{ id = "small ruby", chance = 7885, minCount = 1, maxCount = 2 },  -- 2147
	{ id = "small diamond", chance = 7645, minCount = 1, maxCount = 2 },  -- 2145
	{ id = "mind stone", chance = 6582 },  -- 2178
	{ id = "red gem", chance = 5039 },  -- 2156
	{ id = "shrimp", chance = 5039 },  -- 2670
	{ id = "vortex bolt", chance = 3840, minCount = 1, maxCount = 5 },  -- 15649
	{ id = "giant shimmering pearl", chance = 1748 },  -- 7632
	{ id = "warrior helmet", chance = 1543 },  -- 2475
	{ id = "fish fin", chance = 1440 },  -- 5895
	{ id = 2169, chance = 549 },  -- time ring
	{ id = "crown armor", chance = 411 },  -- 2487
	{ id = "talon", chance = 309 },  -- 2151
	{ id = "glacier robe", chance = 206 },  -- 7897
	{ id = "giant shrimp", chance = 103 },  -- 13305
	{ id = "twiceslicer", chance = 34 },  -- 12613
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, skill = 90, attack = 60, effect = CONST_ME_DRAWBLOOD },
	{ name = "speed", interval = 2000, chance = 20, speed = -300, range = 1, effect = CONST_ME_MAGIC_RED, target = false, duration = 3000 },
}

monster.defenses = {
	defense = 50,
	armor = 85,
	mitigation = 1.26,
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
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)