-- Version: 10.50
-- Monster: https://tibia.fandom.com/wiki/Glooth_Golem
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Glooth_Golem
---


local mType = Game.createMonsterType("Glooth Golem")
local monster = {}

monster.description = "a glooth golem"
monster.experience = 1606
monster.outfit = {
	lookType = 600,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 2700
monster.maxHealth = 2700
monster.race = "venom"
monster.corpse = 23343
monster.speed = 130
monster.manaCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 8,
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
	canWalkOnFire = false,
	canWalkOnPoison = true}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "*slosh*", yell = false },
	{ text = "*clank*", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 100000, minCount = 2, maxCount = 200 },  -- 2148
	{ id = "platinum coin", chance = 60180, minCount = 1, maxCount = 4 },  -- 2152
	{ id = "glooth injection tube", chance = 15108 },  -- 23474
	{ id = "great mana potion", chance = 11966 },  -- 7590
	{ id = "glooth sandwich", chance = 10029 },  -- 23514
	{ id = "small emerald", chance = 8074, minCount = 1, maxCount = 4 },  -- 2149
	{ id = "small topaz", chance = 8016, minCount = 1, maxCount = 4 },  -- 9970
	{ id = "ultimate health potion", chance = 4997 },  -- 8473
	{ id = "bronze gear wheel", chance = 2987 },  -- 24124
	{ id = "iron ore", chance = 1987 },  -- 5880
	{ id = "glooth spear", chance = 1555 },  -- 23529
	{ id = "glooth amulet", chance = 1529 },  -- 23554
	{ id = "glooth axe", chance = 1522 },  -- 23551
	{ id = "heat core", chance = 1520 },  -- 23538
	{ id = 9690, chance = 1495 },  -- gear wheel
	{ id = "glooth blade", chance = 1483 },  -- 23550
	{ id = "gearwheel chain", chance = 994 },  -- 23541
	{ id = "rubber cap", chance = 984 },  -- 23536
	{ id = "glooth club", chance = 942 },  -- 23549
	{ id = "yellow gem", chance = 835 },  -- 2154
	{ id = "green gem", chance = 103 },  -- 2155
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, skill = 60, attack = 50 },
	{ name = "melee", interval = 2000, chance = 2, skill = 86, attack = 100 },
	{ name = "combat", interval = 2000, chance = 25, type = COMBAT_ENERGYDAMAGE, minDamage = -125, maxDamage = -245, range = 7, shootEffect = CONST_ANI_ENERGY, target = false },
	{ name = "war golem skill reducer", interval = 2000, chance = 16, target = false },
	{ name = "war golem electrify", interval = 2000, chance = 9, range = 7, target = false },
}

monster.defenses = {
	defense = 45,
	armor = 43,
	mitigation = 1.37,
	{ name = "speed", interval = 2000, chance = 13, effect = CONST_ME_MAGIC_RED, speed = 260},
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_HEALING, minDamage = 200, maxDamage = 250, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 5 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 5 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = -5 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 15 },
	{ type = COMBAT_DEATHDAMAGE, percent = 30 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)