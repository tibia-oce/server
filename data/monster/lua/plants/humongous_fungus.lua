-- Version: 9.60
-- Monster: https://tibia.fandom.com/wiki/Humongous_Fungus
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Humongous_Fungus
---


local mType = Game.createMonsterType("Humongous Fungus")
local monster = {}

monster.description = "a humongous fungus"
monster.experience = 2900
monster.outfit = {
	lookType = 488,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 3400
monster.maxHealth = 3400
monster.race = "blood"
monster.corpse = 15872
monster.speed = 130
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
	staticAttackChance = 80,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Munch munch munch!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 100000, minCount = 2, maxCount = 200 },  -- 2148
	{ id = "platinum coin", chance = 99995, minCount = 1, maxCount = 6 },  -- 2152
	{ id = "mushroom pie", chance = 16818, minCount = 1, maxCount = 3 },  -- 18397
	{ id = "drill bolt", chance = 14983, minCount = 1, maxCount = 15 },  -- 18436
	{ id = "brown piece of cloth", chance = 14974 },  -- 5913
	{ id = "humongous chunk", chance = 10463 },  -- 18433
	{ id = "white piece of cloth", chance = 10228 },  -- 5909
	{ id = "strong health potion", chance = 5047, minCount = 1, maxCount = 2 },  -- 7588
	{ id = "great health potion", chance = 4937, minCount = 1, maxCount = 2 },  -- 7591
	{ id = "mana potion", chance = 4932, minCount = 1, maxCount = 3 },  -- 7620
	{ id = "strong mana potion", chance = 4932, minCount = 1, maxCount = 2 },  -- 7589
	{ id = "great mana potion", chance = 4860, minCount = 1, maxCount = 2 },  -- 7590
	{ id = "blue piece of cloth", chance = 4530 },  -- 5912
	{ id = "red piece of cloth", chance = 2615 },  -- 5911
	{ id = "terra amulet", chance = 2164 },  -- 7887
	{ id = "terra boots", chance = 2011 },  -- 7886
	{ id = "angelic axe", chance = 1379 },  -- 7436
	{ id = "terra legs", chance = 1063 },  -- 7885
	{ id = "terra mantle", chance = 862 },  -- 7884
	{ id = "muck rod", chance = 666 },  -- 18411
	{ id = "mycological bow", chance = 125 },  -- 18454
	{ id = "mushroom backpack", chance = 14 },  -- 18393
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -330 },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_EARTHDAMAGE, minDamage = -180, maxDamage = -350, range = 7, shootEffect = CONST_ANI_SMALLEARTH, effect = CONST_ME_SMALLPLANTS, target = false },
	{ name = "poisonfield", interval = 2000, chance = 10, radius = 4, target = false },
	-- poison
	{ name = "condition", type = CONDITION_POISON, interval = 2000, chance = 10, minDamage = -500, maxDamage = -1000, length = 8, spread = 0, effect = CONST_ME_GREEN_RINGS, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_LIFEDRAIN, minDamage = -130, maxDamage = -260, length = 5, spread = 0, effect = CONST_ME_MAGIC_RED, target = false },
	-- poison
	{ name = "condition", type = CONDITION_POISON, interval = 2000, chance = 10, minDamage = -400, maxDamage = -640, range = 7, radius = 3, effect = CONST_ME_HITBYPOISON, target = false },
}

monster.defenses = {
	defense = 0,
	armor = 70,
	mitigation = 2.02,
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_HEALING, minDamage = 225, maxDamage = 380, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 15 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = -10 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 15 },
	{ type = COMBAT_HOLYDAMAGE, percent = 5 },
	{ type = COMBAT_DEATHDAMAGE, percent = 35 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
