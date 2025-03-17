-- Version: 7.5
-- Monster: https://tibia.fandom.com/wiki/Sibang
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Sibang
---


local mType = Game.createMonsterType("Sibang")
local monster = {}

monster.description = "a sibang"
monster.experience = 105
monster.outfit = {
	lookType = 118,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 225
monster.maxHealth = 225
monster.race = "blood"
monster.corpse = 6045
monster.speed = 107
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
	illusionable = true,
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 70,
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
	{ text = "Eeeeek! Eeeeek!", yell = false },
	{ text = "Huh! Huh! Huh!", yell = false },
	{ text = "Ahhuuaaa!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 88780, minCount = 1, maxCount = 35 },  -- 2148
	{ id = "banana", chance = 30454, minCount = 1, maxCount = 12 },  -- 2676
	{ id = "small stone", chance = 29964, minCount = 1, maxCount = 3 },  -- 1294
	{ id = "orange", chance = 19966, minCount = 1, maxCount = 5 },  -- 2675
	{ id = "banana sash", chance = 4949 },  -- 12467
	{ id = "coconut", chance = 1967, minCount = 1, maxCount = 3 },  -- 2678
	{ id = "melon", chance = 998 },  -- 2682
	{ id = "ape fur", chance = 987 },  -- 5883
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -40 },
	{ name = "combat", interval = 2000, chance = 35, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -55, range = 7, shootEffect = CONST_ANI_SMALLSTONE, target = false },
}

monster.defenses = {
	defense = 15,
	armor = 15,
	mitigation = 0.83,
	{ name = "speed", interval = 2000, chance = 15, effect = CONST_ME_MAGIC_RED, speed = 214},
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 25 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -15 },
	{ type = COMBAT_HOLYDAMAGE, percent = 10 },
	{ type = COMBAT_DEATHDAMAGE, percent = -5 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = true },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
