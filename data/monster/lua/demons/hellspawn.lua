-- Version: 8.40
-- Monster: https://tibia.fandom.com/wiki/Hellspawn
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Hellspawn
---


local mType = Game.createMonsterType("Hellspawn")
local monster = {}

monster.description = "a hellspawn"
monster.experience = 2550
monster.outfit = {
	lookType = 322,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 3500
monster.maxHealth = 3500
monster.race = "fire"
monster.corpse = 9009
monster.speed = 172
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 15,
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
	canWalkOnEnergy = false,
	canWalkOnFire = true,
	canWalkOnPoison = true}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Your fragile bones are like toothpicks to me.", yell = false },
	{ text = "You little weasel will not live to see another day.", yell = false },
	{ text = "I'm just a messenger of what's yet to come.", yell = false },
	{ text = "HRAAAAAAAAAAAAAAAARRRR!", yell = true },
	{ text = "I'm taking you down with me!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 99364, minCount = 1, maxCount = 236 },  -- 2148
	{ id = "great health potion", chance = 40157 },  -- 7591
	{ id = "hellspawn tail", chance = 19976 },  -- 11221
	{ id = "battle shield", chance = 10144 },  -- 2513
	{ id = "assassin star", chance = 9954, minCount = 1, maxCount = 2 },  -- 7368
	{ id = "demonic essence", chance = 9888 },  -- 6500
	{ id = "morning star", chance = 9844 },  -- 2394
	{ id = "ultimate health potion", chance = 9841 },  -- 8473
	{ id = "red mushroom", chance = 7931, minCount = 1, maxCount = 2 },  -- 2788
	{ id = "small topaz", chance = 6129, minCount = 1, maxCount = 3 },  -- 9970
	{ id = 9808, chance = 3211, minCount = 1, maxCount = 2 },  -- rusty armor
	{ id = "knight legs", chance = 2934 },  -- 2477
	{ id = "warrior helmet", chance = 1865 },  -- 2475
	{ id = "berserk potion", chance = 898 },  -- 7439
	{ id = "spiked squelcher", chance = 862 },  -- 7452
	{ id = "black skull", chance = 178 },  -- 9969
	{ id = 9948, chance = 110 },  -- dracoyle statue
	{ id = "onyx flail", chance = 97 },  -- 7421
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -352 },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_FIREDAMAGE, minDamage = -150, maxDamage = -175, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREATTACK, target = false },
	{ name = "hellspawn soulfire", interval = 2000, chance = 10, range = 5, target = false },
}

monster.defenses = {
	defense = 40,
	armor = 44,
	mitigation = 1.32,
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_HEALING, minDamage = 120, maxDamage = 230, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "speed", interval = 2000, chance = 15, effect = CONST_ME_MAGIC_RED, speed = 344},
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 10 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 10 },
	{ type = COMBAT_EARTHDAMAGE, percent = 80 },
	{ type = COMBAT_FIREDAMAGE, percent = 40 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -10 },
	{ type = COMBAT_HOLYDAMAGE, percent = 30 },
	{ type = COMBAT_DEATHDAMAGE, percent = -5 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)