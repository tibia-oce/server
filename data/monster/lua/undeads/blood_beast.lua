-- Version: 10.50
-- Monster: https://tibia.fandom.com/wiki/Blood_Beast
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Blood_Beast
---


local mType = Game.createMonsterType("Blood Beast")
local monster = {}

monster.description = "a blood beast"
monster.experience = 1000
monster.outfit = {
	lookType = 602,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 1600
monster.maxHealth = 1600
monster.race = "venom"
monster.corpse = 23351
monster.speed = 110
monster.manaCost = 0

monster.changeTarget = {
	interval = 2000,
	chance = 4,
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
	staticAttackChance = 90,
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
	{ text = "Roarr!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 100000, minCount = 2, maxCount = 150 },  -- 2148
	{ id = "slime heart", chance = 19642 },  -- 23565
	{ id = "poisoned fang", chance = 16464 },  -- 23566
	{ id = "viper star", chance = 7977, minCount = 1, maxCount = 5 },  -- 7366
	{ id = "strong health potion", chance = 7442 },  -- 7588
	{ id = "poisonous slime", chance = 4976 },  -- 10557
	{ id = "glooth steak", chance = 3451 },  -- 23517
	{ id = "glooth axe", chance = 942 },  -- 23551
	{ id = "glooth amulet", chance = 899 },  -- 23554
	{ id = "glooth club", chance = 844 },  -- 23549
	{ id = "glooth spear", chance = 838 },  -- 23529
	{ id = "glooth blade", chance = 784 },  -- 23550
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, skill = 82, attack = 50, condition = { type = CONDITION_POISON, totalDamage = 260, interval = 4000 } },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_EARTHDAMAGE, minDamage = -65, maxDamage = -105, range = 5, shootEffect = CONST_ANI_GREENSTAR, effect = CONST_ME_POISONAREA, target = true },
	-- poison
	{ name = "condition", type = CONDITION_POISON, interval = 2000, chance = 17, minDamage = -300, maxDamage = -400, radius = 4, effect = CONST_ME_MAGIC_GREEN, target = false },
}

monster.defenses = {
	defense = 36,
	armor = 32,
	mitigation = 1.18,
	{ name = "speed", interval = 2000, chance = 8, effect = CONST_ME_MAGIC_RED, speed = 220},
	{ name = "combat", interval = 2000, chance = 7, type = COMBAT_HEALING, minDamage = 80, maxDamage = 120, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 10 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = -10 },
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