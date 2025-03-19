-- Version: 10.70
-- Monster: https://tibia.fandom.com/wiki/Glooth_Brigand
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Glooth_Brigand
---


local mType = Game.createMonsterType("Glooth Brigand")
local monster = {}

monster.description = "a glooth brigand"
monster.experience = 1900
monster.outfit = {
	lookType = 137,
	lookHead = 114,
	lookBody = 114,
	lookLegs = 110,
	lookFeet = 114,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 2400
monster.maxHealth = 2400
monster.race = "blood"
monster.corpse = 21888
monster.speed = 160
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
	{ id = "platinum coin", chance = 79916, minCount = 1, maxCount = 3 },  -- 2152
	{ id = "glooth bag", chance = 9807, minCount = 1, maxCount = 2 },  -- 23574
	{ id = "tainted glooth capsule", chance = 8032 },  -- 24185
	{ id = "great spirit potion", chance = 3547 },  -- 8472
	{ id = "great mana potion", chance = 3486 },  -- 7590
	{ id = "ultimate health potion", chance = 3446 },  -- 8473
	{ id = "glooth capsule", chance = 3112 },  -- 24183
	{ id = "glooth steak", chance = 2499 },  -- 23517
	{ id = "glooth sandwich", chance = 2483 },  -- 23514
	{ id = "giant shimmering pearl", chance = 1495 },
	{ id = "glooth club", chance = 1003 },  -- 23549
	{ id = "glooth spear", chance = 999 },  -- 23529
	{ id = "glooth blade", chance = 997 },  -- 23550
	{ id = "glooth axe", chance = 985 },  -- 23551
	{ id = "glooth amulet", chance = 971 },  -- 23554
	{ id = "terra hood", chance = 703 },  -- 7903
	{ id = "rubber cap", chance = 637 },  -- 23536
	{ id = "terra mantle", chance = 600 },  -- 7884
	{ id = "terra legs", chance = 498 },  -- 7885
	{ id = "terra boots", chance = 485 },  -- 7886
	{ id = "terra amulet", chance = 398 },  -- 7887
	{ id = "green gem", chance = 200 },  -- 2155
	{ id = "heat core", chance = 155 },  -- 23538
	{ id = "mercenary sword", chance = 147 },  -- 7386
	{ id = "dreaded cleaver", chance = 101 },  -- 7419
	{ id = "butcher's axe", chance = 53 },  -- 7412
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, skill = 80, attack = 68 },
	{ name = "combat", interval = 2000, chance = 50, type = COMBAT_PHYSICALDAMAGE, minDamage = -40, maxDamage = -200, range = 8, shootEffect = CONST_ANI_ARROW, target = false },
}

monster.defenses = {
	defense = 26,
	armor = 51,
	mitigation = 1.74,
	{ name = "combat", interval = 3000, chance = 35, type = COMBAT_HEALING, minDamage = 200, maxDamage = 245, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 10 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 25 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 10 },
	{ type = COMBAT_HOLYDAMAGE, percent = -5 },
	{ type = COMBAT_DEATHDAMAGE, percent = 15 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)