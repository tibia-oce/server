-- Version: 10.30
-- Monster: https://tibia.fandom.com/wiki/Frazzlemaw
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Frazzlemaw
---


local mType = Game.createMonsterType("Frazzlemaw")
local monster = {}

monster.description = "a frazzlemaw"
monster.experience = 3740
monster.outfit = {
	lookType = 594,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.events = {
	"RoshamuulKillsDeath",
}


monster.health = 4100
monster.maxHealth = 4100
monster.race = "blood"
monster.corpse = 20233
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
	staticAttackChance = 90,
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
	{ text = "Mwaaahgod! Overmwaaaaah! *gurgle*", yell = false },
	{ text = "Mwaaaahnducate youuuuuu *gurgle*, mwaaah!", yell = false },
	{ text = "MMMWAHMWAHMWAHMWAAAAH!", yell = true },
	{ text = "Mmmwhamwhamwhah, mwaaah!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 100000, minCount = 1, maxCount = 155 },  -- 2148
	{ id = "platinum coin", chance = 100000, minCount = 1, maxCount = 12 },  -- 2152
	{ id = "frazzle tongue", chance = 17971 },  -- 22532
	{ id = "frazzle skin", chance = 15109 },  -- 22533
	{ id = "brown crystal splinter", chance = 15020 },  -- 18417
	{ id = "great mana potion", chance = 14882, minCount = 1, maxCount = 3 },  -- 7590
	{ id = "great health potion", chance = 14861, minCount = 1, maxCount = 2 },  -- 7591
	{ id = 2229, chance = 12101, minCount = 1, maxCount = 2 },  -- skull
	{ id = 5951, chance = 10088 },  -- fish tail
	{ id = "remains of a fish", chance = 10070 },  -- 2240
	{ id = "banana skin", chance = 10042 },  -- 2219
	{ id = 2230, chance = 9942 },  -- bone
	{ id = "fishbone", chance = 9911 },  -- 2226
	{ id = "crystal rubbish", chance = 9806 },  -- 18554
	{ id = "piece of iron", chance = 9805 },  -- 2225
	{ id = 2667 , chance = 6333, minCount = 1, maxCount = 3 },  -- fish
	{ id = "ham", chance = 5972 },  -- 2671
	{ id = "hardened bone", chance = 5249 },  -- 5925
	{ id = 2231, chance = 5033 },  -- big bone
	{ id = "fish fin", chance = 4943 },  -- 5895
	{ id = "red crystal fragment", chance = 4913 },  -- 18420
	{ id = "violet crystal shard", chance = 3092 },  -- 18414
	{ id = "iron ore", chance = 3011 },  -- 5880
	{ id = "two handed sword", chance = 3005 },  -- 2377
	{ id = "gold ingot", chance = 2554 },  -- 9971
	{ id = "haunted blade", chance = 1955 },  -- 7407
	{ id = "sai", chance = 1553 },  -- 11306
	{ id = "assassin dagger", chance = 947 },  -- 7404
	{ id = "nightmare blade", chance = 771 },  -- 7418
	{ id = "cluster of solace", chance = 499 },  -- 22396
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -400 },
	-- bleed
	{ name = "condition", type = CONDITION_BLEEDING, interval = 2000, chance = 10, minDamage = -300, maxDamage = -400, radius = 3, effect = CONST_ME_DRAWBLOOD, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_LIFEDRAIN, minDamage = 0, maxDamage = -700, length = 5, spread = 0, effect = CONST_ME_EXPLOSIONAREA, target = false },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -400, radius = 2, shootEffect = CONST_ANI_LARGEROCK, effect = CONST_ME_STONES, target = true },
	{ name = "speed", interval = 2000, chance = 15, speed = -600, radius = 5, effect = CONST_ME_MAGIC_RED, target = false, duration = 15000 },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_MANADRAIN, minDamage = -80, maxDamage = -150, radius = 4, effect = CONST_ME_MAGIC_RED, target = false },
}

monster.defenses = {
	defense = 30,
	armor = 74,
	mitigation = 2.31,
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_HEALING, minDamage = 250, maxDamage = 425, effect = CONST_ME_HITBYPOISON, target = false },
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