-- Version: 9.10
-- Monster: https://tibia.fandom.com/wiki/Askarak_Demon
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Askarak_Demon
---


local mType = Game.createMonsterType("Askarak Demon")
local monster = {}

monster.description = "an askarak demon"
monster.experience = 900
monster.outfit = {
	lookType = 420,
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
monster.corpse = 12659
monster.speed = 115
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
	staticAttackChance = 80,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = false,
	canWalkOnPoison = true}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "DEATH TO THE SHABURAK!", yell = true },
	{ text = "GREEN WILL RULE!", yell = true },
	{ text = "ONLY WE ARE TRUE DEMONS!", yell = true },
	{ text = "RED IS MAD!", yell = true },
	{ text = "WE RULE!", yell = true },
}

monster.loot = {
	{ id = "gold coin", chance = 94691, minCount = 1, maxCount = 244 },  -- 2148
	{ id = "small emerald", chance = 6111, minCount = 1, maxCount = 4 },  -- 2149
	{ id = "strong health potion", chance = 5283 },  -- 7588
	{ id = "strong mana potion", chance = 5042 },  -- 7589
	{ id = "assassin star", chance = 4869, minCount = 1, maxCount = 5 },  -- 7368
	{ id = "brown mushroom", chance = 3852, minCount = 1, maxCount = 5 },  -- 2789
	{ id = "piggy bank", chance = 1090 },  -- 2114
	{ id = "energy ring", chance = 991 },  -- 2167
	{ id = "mastermind potion", chance = 477 },  -- 7440
	{ id = "springsprout rod", chance = 472 },  -- 8912
	{ id = "terra legs", chance = 131 },  -- 7885
	{ id = "magic sulphur", chance = 105 },  -- 5904
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -143 },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_EARTHDAMAGE, minDamage = -20, maxDamage = -60, range = 7, radius = 6, shootEffect = CONST_ANI_POISON, effect = CONST_ME_GREEN_RINGS, target = false },
	{ name = "askarak wave", interval = 2000, chance = 15, minDamage = -75, maxDamage = -140, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_EARTHDAMAGE, minDamage = -130, maxDamage = -170, length = 4, spread = 0, effect = CONST_ME_GREEN_RINGS, target = false },
	{ name = "speed", interval = 2000, chance = 10, speed = -600, radius = 1, effect = CONST_ME_MAGIC_RED, target = true, duration = 15000 },
}

monster.defenses = {
	defense = 15,
	armor = 35,
	mitigation = 1.04,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 60 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = -25 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 60 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = -5 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)