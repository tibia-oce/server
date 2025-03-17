-- Version: 7.8
-- Monster: https://tibia.fandom.com/wiki/Quara_Predator
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Quara_Predator
---


local mType = Game.createMonsterType("Quara Predator")
local monster = {}

monster.description = "a quara predator"
monster.experience = 1850
monster.outfit = {
	lookType = 20,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 2200
monster.maxHealth = 2200
monster.race = "blood"
monster.corpse = 6067
monster.speed = 225
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
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = true,
	canWalkOnPoison = false}

monster.light = {
	level = 2,
	color = 35,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Gnarrr!", yell = false },
	{ text = "Tcharrr!", yell = false },
	{ text = "Rrrah!", yell = false },
	{ text = "Rraaar!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 78081, minCount = 1, maxCount = 154 },  -- 2148
	{ id = "quara bone", chance = 9929 },  -- 12447
	{ id = "royal spear", chance = 9334, minCount = 1, maxCount = 7 },  -- 7378
	{ id = "small diamond", chance = 5300, minCount = 1, maxCount = 2 },  -- 2145
	{ id = "shrimp", chance = 5044 },  -- 2670
	{ id = "double axe", chance = 2998 },  -- 2387
	{ id = "fish fin", chance = 1947 },  -- 5895
	{ id = "great health potion", chance = 1047 },  -- 7591
	{ id = "relic sword", chance = 644 },  -- 7383
	{ id = "assassin star", chance = 512 },  -- 7368
	{ id = "glacier robe", chance = 475 },  -- 7897
	{ id = "skull helmet", chance = 396 },  -- 5741
	{ id = "giant shrimp", chance = 19 },  -- 13305
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -473, effect = CONST_ME_DRAWBLOOD },
}

monster.defenses = {
	defense = 45,
	armor = 40,
	mitigation = 1.46,
	{ name = "speed", interval = 2000, chance = 15, effect = CONST_ME_MAGIC_GREEN, speed = 450},
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_HEALING, minDamage = 25, maxDamage = 75, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -25 },
	{ type = COMBAT_EARTHDAMAGE, percent = -10 },
	{ type = COMBAT_FIREDAMAGE, percent = 100 },
	{ type = COMBAT_LIFEDRAIN, percent = 100 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 100 },
	{ type = COMBAT_ICEDAMAGE, percent = 100 },
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
