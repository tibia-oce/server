-- Version: 7.8
-- Monster: https://tibia.fandom.com/wiki/Novice_of_the_Cult
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Novice_of_the_Cult
---


local mType = Game.createMonsterType("Novice of the Cult")
local monster = {}

monster.description = "a novice of the cult"
monster.experience = 100
monster.outfit = {
	lookType = 133,
	lookHead = 114,
	lookBody = 114,
	lookLegs = 76,
	lookFeet = 114,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 285
monster.maxHealth = 285
monster.race = "blood"
monster.corpse = 18186
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
	illusionable = true,
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 40,
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
		{ name = "Chicken", chance = 10, interval = 2000, count = 1 },
	},
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Fear us!", yell = false },
	{ text = "You will not tell anyone what you have seen!", yell = false },
	{ text = "Your curiosity will be punished!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 43525, minCount = 1, maxCount = 40 },  -- 2148
	{ id = "rope belt", chance = 5930 },  -- 12448
	{ id = "scarf", chance = 2957 },  -- 2661
	{ id = 6087, chance = 1044 },  -- music sheet (first verse)
	{ id = "cultish robe", chance = 998 },  -- 10556
	{ id = 1950, chance = 686 },  -- book (orange)
	{ id = "dwarven ring", chance = 501 },  -- 2213
	{ id = "pirate voodoo doll", chance = 501 },  -- 5810
	{ id = "wand of vortex", chance = 450 },  -- 2190
	{ id = "garlic necklace", chance = 420 },  -- 2199
	{ id = "small diamond", chance = 194 },  -- 2145
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -65, condition = { type = CONDITION_POISON, totalDamage = 1, interval = 4000 } },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_LIFEDRAIN, minDamage = -20, maxDamage = -80, range = 7, radius = 1, shootEffect = CONST_ANI_POISON, effect = CONST_ME_MAGIC_RED, target = true },
}

monster.defenses = {
	defense = 15,
	armor = 15,
	mitigation = 0.62,
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_HEALING, minDamage = 20, maxDamage = 40, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = -10 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -8 },
	{ type = COMBAT_EARTHDAMAGE, percent = 10 },
	{ type = COMBAT_FIREDAMAGE, percent = -5 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 10 },
	{ type = COMBAT_HOLYDAMAGE, percent = 10 },
	{ type = COMBAT_DEATHDAMAGE, percent = -8 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = false },
	{ type = "bleed", condition = false },
}

mType:register(monster)