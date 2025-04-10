-- Version: 7.8
-- Monster: https://tibia.fandom.com/wiki/Adept_of_the_Cult
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Adept_of_the_Cult
---


local mType = Game.createMonsterType("Adept of the Cult")
local monster = {}

monster.description = "an adept of the cult"
monster.experience = 400
monster.outfit = {
	lookType = 194,
	lookHead = 95,
	lookBody = 94,
	lookLegs = 94,
	lookFeet = 19,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 430
monster.maxHealth = 430
monster.race = "blood"
monster.corpse = 20311
monster.speed = 95
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
	maxSummons = 2,
	summons = {
		{ name = "Ghoul", chance = 10, interval = 2000, count = 2 },
	},
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Feel the power of the cult!", yell = false },
	{ text = "Praise the voodoo!", yell = false },
	{ text = "Power to the cult!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 65398, minCount = 1, maxCount = 60 },  -- 2148
	{ id = "cultish robe", chance = 10233 },  -- 10556
	{ id = "rope belt", chance = 9975 },  -- 12448
	{ id = "pirate voodoo doll", chance = 1477 },  -- 5810
	{ id = "clerical mace", chance = 1019 },  -- 2423
	{ id = "silver amulet", chance = 986 },  -- 2170
	{ id = 1950, chance = 868 },  -- book (orange)
	{ id = 6089, chance = 605 },  -- music sheet (thirdverse)
	{ id = "amber staff", chance = 554 },  -- 7426
	{ id = 2169, chance = 465 },  -- time ring
	{ id = "small ruby", chance = 281 },  -- 2147
	{ id = "hailstorm rod", chance = 174 },  -- 2183
	{ id = "cultish symbol", chance = 85 },  -- 12411
	{ id = "lunar staff", chance = 85 },  -- 7424
	{ id = "broken key ring", chance = 78 },  -- 12608
	{ id = "red robe", chance = 78 },  -- 2655
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -90, condition = { type = CONDITION_POISON, totalDamage = 2, interval = 4000 } },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_LIFEDRAIN, minDamage = -70, maxDamage = -150, range = 7, shootEffect = CONST_ANI_POISON, effect = CONST_ME_POISONAREA, target = true },
	{ name = "drunk", interval = 2000, chance = 10, range = 7, radius = 1, shootEffect = CONST_ANI_HOLY, effect = CONST_ME_HOLYDAMAGE, target = true, duration = 4000 },
}

monster.defenses = {
	defense = 20,
	armor = 33,
	mitigation = 1.13,
	{ name = "combat", interval = 3000, chance = 20, type = COMBAT_HEALING, minDamage = 45, maxDamage = 60, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "invisible", interval = 2000, chance = 10, effect = CONST_ME_YELLOW_RINGS },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -5 },
	{ type = COMBAT_EARTHDAMAGE, percent = 40 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 20 },
	{ type = COMBAT_HOLYDAMAGE, percent = 30 },
	{ type = COMBAT_DEATHDAMAGE, percent = -5 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)