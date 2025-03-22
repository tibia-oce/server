-- Version: 9.40
-- Monster: https://tibia.fandom.com/wiki/Spitter
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Spitter
---


local mType = Game.createMonsterType("Spitter")
local monster = {}

monster.description = "a spitter"
monster.experience = 1100
monster.outfit = {
	lookType = 461,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 1500
monster.maxHealth = 1500
monster.race = "venom"
monster.corpse = 15392
monster.speed = 135
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
	staticAttackChance = 95,
	targetDistance = 1,
	runHealth = 40,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = true}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Spotz!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 100000, minCount = 2, maxCount = 190 },  -- 2148
	{ id = "platinum coin", chance = 74930 },  -- 2152
	{ id = "spitter nose", chance = 18113 },  -- 15481
	{ id = "compound eye", chance = 14971 },  -- 15486
	{ id = "small amethyst", chance = 8124, minCount = 1, maxCount = 2 },  -- 2150
	{ id = "great mana potion", chance = 8050 },  -- 7590
	{ id = "brown mushroom", chance = 7391, minCount = 1, maxCount = 3 },  -- 2789
	{ id = "great health potion", chance = 4939 },  -- 7591
	{ id = 2169, chance = 2319 },  -- time ring
	{ id = "crystal sword", chance = 1993 },  -- 7449
	{ id = "mastermind potion", chance = 324 },  -- 7440
	{ id = "calopteryx cape", chance = 241 },  -- 15489
	{ id = "platinum amulet", chance = 237 },  -- 2171
	{ id = "green gem", chance = 216 },  -- 2155
	{ id = "crusader helmet", chance = 214 },  -- 2497
	{ id = "grasshopper legs", chance = 112 },  -- 15490
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -150, condition = { type = CONDITION_POISON, totalDamage = 240, interval = 4000 } },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_EARTHDAMAGE, minDamage = -100, maxDamage = -160, range = 7, radius = 3, shootEffect = CONST_ANI_POISON, effect = CONST_ME_POISONAREA, target = true },
	{ name = "speed", interval = 2000, chance = 15, speed = -600, range = 7, shootEffect = CONST_ANI_POISON, target = true, duration = 15000 },
}

monster.defenses = {
	defense = 20,
	armor = 48,
	mitigation = 1.60,
	{ name = "speed", interval = 2000, chance = 15, effect = CONST_ME_MAGIC_RED, speed = 270},
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -11 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = 5 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -5 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 15 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
