-- Version: 6.4
-- Monster: https://tibia.fandom.com/wiki/Priestess
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Priestess
---


local mType = Game.createMonsterType("Priestess")
local monster = {}

monster.description = "a priestess"
monster.experience = 420
monster.outfit = {
	lookType = 58,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 390
monster.maxHealth = 390
monster.race = "blood"
monster.corpse = 18210
monster.speed = 85
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
	canPushCreatures = true,
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
		{ name = "ghoul", chance = 10, interval = 2000, count = 2 },
	},
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Your energy is mine.", yell = false },
	{ text = "Now your life is come to the end, hahahaha!", yell = false },
	{ text = "Throw the soul on the altar!", yell = false },
}

monster.loot = {
	{ id = "sling herb", chance = 13586 },  -- 2802
	{ id = "goat grass", chance = 12045 },  -- 2760
	{ id = "dark rosary", chance = 9785 },  -- 11220
	{ id = "red apple", chance = 7433, minCount = 1, maxCount = 2 },  -- 2674
	{ id = "powder herb", chance = 6130 },  -- 2803
	{ id = "black hood", chance = 5000 },  -- 10562
	{ id = "wood mushroom", chance = 3336 },  -- 2791
	{ id = "cultish robe", chance = 1814 },  -- 10556
	{ id = "clerical mace", chance = 1495 },  -- 2423
	{ id = 2070, chance = 1395 },  -- wooden flute
	{ id = 2192, chance = 1130 },  -- crystal ball
	{ id = "hailstorm rod", chance = 1094 },  -- 2183
	{ id = 1950, chance = 939 },  -- book (orange)
	{ id = "mana potion", chance = 939 },  -- 7620
	{ id = "talon", chance = 729 },  -- 2151
	{ id = "crystal necklace", chance = 597 },  -- 2125
	{ id = "black shield", chance = 228 },  -- 2529
	{ id = "piggy bank", chance = 77 },  -- 2114
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -75 },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_DEATHDAMAGE, minDamage = -55, maxDamage = -120, range = 7, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA, target = false },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_MANADRAIN, minDamage = -2, maxDamage = -170, range = 7, target = false },
	-- poison
	{ name = "condition", type = CONDITION_POISON, interval = 2000, chance = 15, range = 7, shootEffect = CONST_ANI_POISON, target = false },
}

monster.defenses = {
	defense = 15,
	armor = 30,
	mitigation = 1.32,
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_HEALING, minDamage = 50, maxDamage = 80, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = -10 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 70 },
	{ type = COMBAT_FIREDAMAGE, percent = 40 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = -10 },
	{ type = COMBAT_DEATHDAMAGE, percent = 10 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)