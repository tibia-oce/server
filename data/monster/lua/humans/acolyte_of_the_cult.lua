-- Version: 7.8
-- Monster: https://tibia.fandom.com/wiki/Acolyte_of_the_Cult
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Acolyte_of_the_Cult
---


local mType = Game.createMonsterType("Acolyte of the Cult")
local monster = {}

monster.description = "an acolyte of the cult"
monster.experience = 300
monster.outfit = {
	lookType = 194,
	lookHead = 95,
	lookBody = 100,
	lookLegs = 100,
	lookFeet = 19,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 390
monster.maxHealth = 390
monster.race = "blood"
monster.corpse = 18038
monster.speed = 100
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
	canPushCreatures = false,
	staticAttackChance = 90,
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

monster.summon = {
	maxSummons = 1,
	summons = {
		{ name = "Skeleton", chance = 10, interval = 2000, count = 1 },
	},
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Praise the voodoo!", yell = false },
	{ text = "Power to the cult!", yell = false },
	{ text = "Feel the power of the cult!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 65907, minCount = 1, maxCount = 40 },  -- 2148
	{ id = "rope belt", chance = 10119 },  -- 12448
	{ id = "cultish robe", chance = 7994 },  -- 10556
	{ id = "morning star", chance = 4922 },  -- 2394
	{ id = "dragon necklace", chance = 1078 },  -- 2201
	{ id = "pirate voodoo doll", chance = 1052 },  -- 5810
	{ id = 1950, chance = 771 },  -- book (orange)
	{ id = "life ring", chance = 516 },  -- 2168
	{ id = "small emerald", chance = 510 },  -- 2149
	{ id = 6088, chance = 443 },  -- music sheet (second verse)
	{ id = "terra rod", chance = 197 },  -- 2181
	{ id = "cultish symbol", chance = 70 },  -- 12411
	{ id = "broken key ring", chance = 55 },  -- 12608
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -100, condition = { type = CONDITION_POISON, totalDamage = 2, interval = 4000 } },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_LIFEDRAIN, minDamage = -60, maxDamage = -120, range = 7, radius = 1, shootEffect = CONST_ANI_POISON, effect = CONST_ME_MAGIC_RED, target = true },
	{ name = "drunk", interval = 2000, chance = 5, range = 7, radius = 1, shootEffect = CONST_ANI_HOLY, effect = CONST_ME_HOLYDAMAGE, target = true, duration = 3000 },
}

monster.defenses = {
	defense = 15,
	armor = 30,
	mitigation = 1.13,
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_HEALING, minDamage = 40, maxDamage = 60, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = -10 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -10 },
	{ type = COMBAT_EARTHDAMAGE, percent = 20 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 20 },
	{ type = COMBAT_HOLYDAMAGE, percent = 20 },
	{ type = COMBAT_DEATHDAMAGE, percent = -5 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)