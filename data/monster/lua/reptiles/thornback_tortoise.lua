-- Version: 7.8
-- Monster: https://tibia.fandom.com/wiki/Thornback_Tortoise
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Thornback_Tortoise
---


local mType = Game.createMonsterType("Thornback Tortoise")
local monster = {}

monster.description = "a thornback tortoise"
monster.experience = 150
monster.outfit = {
	lookType = 198,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 300
monster.maxHealth = 300
monster.race = "blood"
monster.corpse = 6073
monster.speed = 75
monster.manaCost = 490

monster.changeTarget = {
	interval = 5000,
	chance = 0,
}

monster.strategiesTarget = {
	nearest = 100,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = true,
	pushable = false,
	rewardBoss = false,
	illusionable = true,
	canPushItems = true,
	canPushCreatures = true,
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
}

monster.loot = {
	{ id = "gold coin", chance = 87765, minCount = 1, maxCount = 50 },  -- 2148
	{ id = "thorn", chance = 15487 },  -- 10560
	{ id = 2667 , chance = 10286, minCount = 1, maxCount = 2 },  -- fish
	{ id = "health potion", chance = 1504 },  -- 7618
	{ id = "white pearl", chance = 1336 },  -- 2143
	{ id = "white mushroom", chance = 1143 },  -- 2787
	{ id = "turtle shell", chance = 1067 },  -- 5899
	{ id = "tortoise egg", chance = 933, minCount = 1, maxCount = 3 },  -- 5678
	{ id = "brown mushroom", chance = 689 },  -- 2789
	{ id = "black pearl", chance = 613 },  -- 2144
	{ id = "war hammer", chance = 294 },  -- 2391
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -110, condition = { type = CONDITION_POISON, totalDamage = 40, interval = 4000 } },
}

monster.defenses = {
	defense = 40,
	armor = 24,
	mitigation = 0.70,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 30 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 20 },
	{ type = COMBAT_FIREDAMAGE, percent = -10 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 20 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = false },
	{ type = "bleed", condition = false },
}

mType:register(monster)