-- Version: 10.70
-- Monster: https://tibia.fandom.com/wiki/Renegade_Quara_Predator
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Renegade_Quara_Predator
---


local mType = Game.createMonsterType("Renegade Quara Predator")
local monster = {}

monster.description = "a renegade quara predator"
monster.experience = 2700
monster.outfit = {
	lookType = 20,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 3250
monster.maxHealth = 3250
monster.race = "blood"
monster.corpse = 6067
monster.speed = 225
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
	illusionable = true,
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
	{ id = "platinum coin", chance = 80571, minCount = 1, maxCount = 4 },  -- 2152
	{ id = "quara bone", chance = 10326 },  -- 12447
	{ id = "royal spear", chance = 8035, minCount = 1, maxCount = 7 },  -- 7378
	{ id = "mind stone", chance = 6874 },  -- 2178
	{ id = "great health potion", chance = 6215, minCount = 1, maxCount = 2 },  -- 7591
	{ id = "assassin star", chance = 5148, minCount = 1, maxCount = 10 },  -- 7368
	{ id = "shrimp", chance = 4771 },  -- 2670
	{ id = "small diamond", chance = 3610, minCount = 1, maxCount = 3 },  -- 2145
	{ id = "fish fin", chance = 2103 },  -- 5895
	{ id = "blue crystal shard", chance = 1099 },  -- 18413
	{ id = "relic sword", chance = 942 },  -- 7383
	{ id = "glacier robe", chance = 628 },  -- 7897
	{ id = "abyss hammer", chance = 408 },  -- 7414
	{ id = "skull helmet", chance = 345 },  -- 5741
	{ id = "frozen plate", chance = 157 },  -- 8887
	{ id = "giant shrimp", chance = 31 },  -- 13305
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, skill = 100, attack = 82, effect = CONST_ME_DRAWBLOOD },
}

monster.defenses = {
	defense = 45,
	armor = 40,
	mitigation = 1.46,
	{ name = "speed", interval = 2000, chance = 15, effect = CONST_ME_MAGIC_GREEN, speed = 450},
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_HEALING, minDamage = 50, maxDamage = 100, effect = CONST_ME_MAGIC_BLUE, target = false },
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
