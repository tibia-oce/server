-- Version: 10.70
-- Monster: https://tibia.fandom.com/wiki/Glooth_Bandit
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Glooth_Bandit
---


local mType = Game.createMonsterType("Glooth Bandit")
local monster = {}

monster.description = "a glooth bandit"
monster.experience = 2000
monster.outfit = {
	lookType = 129,
	lookHead = 115,
	lookBody = 80,
	lookLegs = 114,
	lookFeet = 114,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 2600
monster.maxHealth = 2600
monster.race = "blood"
monster.corpse = 24251
monster.speed = 150
monster.manaCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 5,
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
	targetDistance = 1,
	runHealth = 0,
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
}

monster.loot = {
	{ id = "gold coin", chance = 100000, minCount = 1, maxCount = 100 },  -- 2148
	{ id = "platinum coin", chance = 60027, minCount = 1, maxCount = 3 },  -- 2152
	{ id = "great health potion", chance = 8089 },  -- 7591
	{ id = "tainted glooth capsule", chance = 8018 },  -- 24185
	{ id = "great mana potion", chance = 7427, minCount = 1, maxCount = 2 },  -- 7590
	{ id = "glooth bag", chance = 5088 },  -- 23574
	{ id = "great spirit potion", chance = 3477 },  -- 8472
	{ id = "ultimate health potion", chance = 3432 },  -- 8473
	{ id = "glooth capsule", chance = 3043 },  -- 24183
	{ id = "glooth steak", chance = 2599 },  -- 23517
	{ id = "small topaz", chance = 2533, minCount = 1, maxCount = 2 },  -- 9970
	{ id = "glooth sandwich", chance = 2465 },  -- 23514
	{ id = "small emerald", chance = 2047, minCount = 1, maxCount = 2 },  -- 2149
	{ id = "glooth axe", chance = 1022 },  -- 23551
	{ id = "glooth spear", chance = 1010 },  -- 23529
	{ id = "glooth club", chance = 1004 },  -- 23549
	{ id = "glooth blade", chance = 999 },  -- 23550
	{ id = "glooth amulet", chance = 997 },  -- 23554
	{ id = "beastslayer axe", chance = 804 },  -- 3962
	{ id = "rubber cap", chance = 729 },  -- 23536
	{ id = "terra hood", chance = 606 },  -- 7903
	{ id = "terra mantle", chance = 601 },  -- 7884
	{ id = "glooth cape", chance = 583 },  -- 23535
	{ id = "terra boots", chance = 491 },  -- 7886
	{ id = "terra legs", chance = 482 },  -- 7885
	{ id = "skull staff", chance = 419 },  -- 2436
	{ id = "green gem", chance = 155 },  -- 2155
	{ id = "war axe", chance = 101 },  -- 2454
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, skill = 80, attack = 68 },
	{ name = "combat", interval = 2000, chance = 50, type = COMBAT_PHYSICALDAMAGE, minDamage = -60, maxDamage = -200, range = 8, shootEffect = CONST_ANI_ARROW, target = false },
}

monster.defenses = {
	defense = 32,
	armor = 46,
	mitigation = 1.65,
	{ name = "combat", interval = 3000, chance = 35, type = COMBAT_HEALING, minDamage = 200, maxDamage = 250, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 15 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 20 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = -5 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 10 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 20 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)