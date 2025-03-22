-- Version: 7.8
-- Monster: https://tibia.fandom.com/wiki/Quara_Predator_Scout
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Quara_Predator_Scout
---


local mType = Game.createMonsterType("Quara Predator Scout")
local monster = {}

monster.description = "a quara predator scout"
monster.experience = 400
monster.outfit = {
	lookType = 20,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 890
monster.maxHealth = 890
monster.race = "blood"
monster.corpse = 6067
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
	{ id = "gold coin", chance = 98954, minCount = 1, maxCount = 132 },  -- 2148
	{ id = "quara bone", chance = 10103 },  -- 12447
	{ id = "scale armor", chance = 8959 },  -- 2483
	{ id = "double axe", chance = 5789 },  -- 2387
	{ id = "shrimp", chance = 5064 },  -- 2670
	{ id = "small diamond", chance = 5020, minCount = 1, maxCount = 2 },  -- 2145
	{ id = "two handed sword", chance = 2992 },  -- 2377
	{ id = "fish fin", chance = 1058 },  -- 5895
	{ id = "northwind rod", chance = 947 },  -- 8911
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -193, effect = CONST_ME_DRAWBLOOD },
}

monster.defenses = {
	defense = 30,
	armor = 30,
	mitigation = 1.04,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -10 },
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
