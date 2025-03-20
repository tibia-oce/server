-- Version: 10.30
-- Monster: https://tibia.fandom.com/wiki/Guzzlemaw
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Guzzlemaw
---


local mType = Game.createMonsterType("Guzzlemaw")
local monster = {}

monster.description = "a guzzlemaw"
monster.experience = 6050
monster.outfit = {
	lookType = 584,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 6400
monster.maxHealth = 6400
monster.race = "blood"
monster.corpse = 20151
monster.speed = 200
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
	staticAttackChance = 80,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
}

monster.loot = {
	{ id = "gold coin", chance = 100000, minCount = 1, maxCount = 100 },  -- 2148
	{ id = "platinum coin", chance = 100000, minCount = 1, maxCount = 7 },  -- 2152
	{ id = "great health potion", chance = 18240, minCount = 1, maxCount = 2 },  -- 7591
	{ id = "great mana potion", chance = 17265, minCount = 1, maxCount = 3 },  -- 7590
	{ id = "frazzle tongue", chance = 14827 },  -- 22532
	{ id = "frazzle skin", chance = 13760 },  -- 22533
	{ id = "brown crystal splinter", chance = 12583, minCount = 1, maxCount = 2 },  -- 18417
	{ id = 2229, chance = 11497 },  -- skull
	{ id = "fishbone", chance = 10633 },  -- 2226
	{ id = "crystal rubbish", chance = 10568 },  -- 18554
	{ id = "ham", chance = 10265 },  -- 2671
	{ id = 5951, chance = 10145 },  -- fish tail
	{ id = "piece of iron", chance = 10090 },  -- 2225
	{ id = "banana skin", chance = 9952 },  -- 2219
	{ id = "remains of a fish", chance = 9851 },  -- 2240
	{ id = 2230, chance = 9290 },  -- bone
	{ id = "red crystal fragment", chance = 6770 },  -- 18420
	{ id = 2667 , chance = 6439, minCount = 1, maxCount = 3 },  -- fish
	{ id = "fish fin", chance = 5234 },  -- 5895
	{ id = "hardened bone", chance = 5022 },  -- 5925
	{ id = 2231, chance = 4645 },  -- big bone
	{ id = "iron ore", chance = 3072 },  -- 5880
	{ id = "violet crystal shard", chance = 2943 },  -- 18414
	{ id = "two handed sword", chance = 2897 },  -- 2377
	{ id = "haunted blade", chance = 2014 },  -- 7407
	{ id = "sai", chance = 1315 },  -- 11306
	{ id = "assassin dagger", chance = 911 },  -- 7404
	{ id = "cluster of solace", chance = 846 },  -- 22396
	{ id = "nightmare blade", chance = 543 },  -- 7418
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -499 },
	-- bleed
	{ name = "condition", type = CONDITION_BLEEDING, interval = 2000, chance = 10, minDamage = -500, maxDamage = -1000, radius = 3, effect = CONST_ME_DRAWBLOOD, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_LIFEDRAIN, minDamage = 0, maxDamage = -900, length = 8, spread = 0, effect = CONST_ME_EXPLOSIONAREA, target = false },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -500, radius = 2, shootEffect = CONST_ANI_LARGEROCK, effect = CONST_ME_STONES, target = true },
	{ name = "speed", interval = 2000, chance = 15, speed = -800, radius = 6, effect = CONST_ME_MAGIC_RED, target = false, duration = 15000 },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_LIFEDRAIN, minDamage = 0, maxDamage = -800, length = 8, spread = 0, effect = CONST_ME_MAGIC_RED, target = false },
}

monster.defenses = {
	defense = 50,
	armor = 74,
	mitigation = 2.31,
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_HEALING, minDamage = 250, maxDamage = 425, effect = CONST_ME_HITBYPOISON, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 5 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 15 },
	{ type = COMBAT_EARTHDAMAGE, percent = 20 },
	{ type = COMBAT_FIREDAMAGE, percent = 10 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 5 },
	{ type = COMBAT_HOLYDAMAGE, percent = -5 },
	{ type = COMBAT_DEATHDAMAGE, percent = 10 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)