-- Version: 8.00
-- Monster: https://tibia.fandom.com/wiki/Man_in_the_Cave
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Man_in_the_Cave
---


local mType = Game.createMonsterType("Man in the Cave")
local monster = {}

monster.description = "man in the cave"
monster.experience = 777
monster.outfit = {
	lookType = 128,
	lookHead = 77,
	lookBody = 59,
	lookLegs = 20,
	lookFeet = 76,
	lookAddons = 1,
	lookMount = 0,
}


monster.health = 485
monster.maxHealth = 485
monster.race = "blood"
monster.corpse = 20446
monster.speed = 105
monster.manaCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 8,
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
	rewardBoss = true,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 50,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false}

monster.light = {
	level = 0,
	color = 0,
}

monster.summon = {
	maxSummons = 5,
	summons = {
		{ name = "Monk", chance = 20, interval = 2000, count = 2 },
	},
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "THE MONKS ARE MINE!", yell = true },
	{ text = "I will rope you up! All of you!", yell = false },
	{ text = "Have you seen my old pal Frack?", yell = false },
	{ text = "A MIC to rule them all!", yell = false },
	{ text = "Let me put my rope around your neck!", yell = false },
}

monster.loot = {
	{ id = 2120, chance = 100000, minCount = 1, maxCount = 3 },  -- rope
	{ id = "mercenary sword", chance = 34483 },  -- 7386
	{ id = "brown piece of cloth", chance = 31034 },  -- 5913
	{ id = "gold coin", chance = 24138, minCount = 7, maxCount = 59 },  -- 2148
	{ id = "fur cap", chance = 17241 },  -- 7458
	{ id = "shard", chance = 10345 },  -- 7290
	{ id = "brown bread", chance = 3448 },  -- 2691
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -62 },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -95, range = 7, shootEffect = CONST_ANI_SMALLSTONE, target = false },
}

monster.defenses = {
	defense = 15,
	armor = 15,
	mitigation = 1.00,
	{ name = "speed", interval = 2000, chance = 12, effect = CONST_ME_MAGIC_RED, speed = 210},
	{ name = "combat", interval = 2000, chance = 25, type = COMBAT_HEALING, minDamage = 10, maxDamage = 50, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)