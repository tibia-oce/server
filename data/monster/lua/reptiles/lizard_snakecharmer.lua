-- Version: 7.5
-- Monster: https://tibia.fandom.com/wiki/Lizard_Snakecharmer
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Lizard_Snakecharmer
---


local mType = Game.createMonsterType("Lizard Snakecharmer")
local monster = {}

monster.description = "a lizard snakecharmer"
monster.experience = 210
monster.outfit = {
	lookType = 115,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 325
monster.maxHealth = 325
monster.race = "blood"
monster.corpse = 6041
monster.speed = 172
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
	pushable = true,
	rewardBoss = false,
	illusionable = true,
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 80,
	targetDistance = 4,
	runHealth = 15,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = true}

monster.light = {
	level = 0,
	color = 0,
}

monster.summon = {
	maxSummons = 6,
	summons = {
		{ name = "cobra", chance = 20, interval = 2000, count = 6 },
	},
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "I smeeeel warm blood!", yell = false },
	{ text = "Shhhhhhh", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 83096, minCount = 1, maxCount = 54 },  -- 2148
	{ id = 2818, chance = 51634 },  -- dead snake
	{ id = "cape", chance = 9013 },  -- 2654
	{ id = "life crystal", chance = 1200 },  -- 2177
	{ id = "lizard scale", chance = 1089 },  -- 5881
	{ id = "lizard leather", chance = 1067 },  -- 5876
	{ id = "terra rod", chance = 978 },  -- 2181
	{ id = "mana potion", chance = 733 },  -- 7620
	{ id = "small amethyst", chance = 433 },  -- 2150
	{ id = "life ring", chance = 167 },  -- 2168
	{ id = "snakebite rod", chance = 133 },  -- 2182
	{ id = "charmer's tiara", chance = 78 },  -- 3971
	{ id = "yellow gem", chance = 22 },  -- 2154
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -30 },
	-- poison
	{ name = "condition", type = CONDITION_POISON, interval = 2000, chance = 15, minDamage = -100, maxDamage = -200, range = 7, shootEffect = CONST_ANI_POISON, target = false },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_EARTHDAMAGE, minDamage = -50, maxDamage = -110, range = 7, radius = 1, shootEffect = CONST_ANI_POISON, effect = CONST_ME_GREEN_RINGS, target = true },
}

monster.defenses = {
	defense = 15,
	armor = 22,
	mitigation = 0.38,
	{ name = "combat", interval = 2000, chance = 50, type = COMBAT_HEALING, minDamage = 50, maxDamage = 100, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "invisible", interval = 2000, chance = 10, effect = CONST_ME_MAGIC_BLUE },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = -10 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 20 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
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
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)