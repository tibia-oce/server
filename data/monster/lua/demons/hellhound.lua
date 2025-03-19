-- Version: 7.9
-- Monster: https://tibia.fandom.com/wiki/Hellhound
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Hellhound
---


local mType = Game.createMonsterType("Hellhound")
local monster = {}

monster.description = "a hellhound"
monster.experience = 5440
monster.outfit = {
	lookType = 240,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 7500
monster.maxHealth = 7500
monster.race = "blood"
monster.corpse = 6331
monster.speed = 180
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
	staticAttackChance = 70,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true}

monster.light = {
	level = 3,
	color = 206,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "GROOOOWL!", yell = true },
}

monster.loot = {
	{ id = "platinum coin", chance = 100000, minCount = 3, maxCount = 7 },  -- 2152
	{ id = "great mana potion", chance = 30165, minCount = 1, maxCount = 3 },  -- 7590
	{ id = "ham", chance = 30087 },  -- 2671
	{ id = "assassin star", chance = 25445, minCount = 1, maxCount = 10 },  -- 7368
	{ id = "great spirit potion", chance = 20530 },  -- 8472
	{ id = "demonic essence", chance = 20491 },  -- 6500
	{ id = "soul orb", chance = 20010 },  -- 5944
	{ id = "hellhound slobber", chance = 19412 },  -- 10554
	{ id = "concentrated demonic blood", chance = 19035 },  -- todo: flask of demonic blood does not exist in items.xml
	{ id = "ultimate health potion", chance = 15668 },  -- 8473
	{ id = "blazing bone", chance = 12885, minCount = 1, maxCount = 2 },  -- 18425
	{ id = "small emerald", chance = 10480, minCount = 1, maxCount = 3 },  -- 2149
	{ id = "small topaz", chance = 10454, minCount = 1, maxCount = 3 },  -- 9970
	{ id = "small ruby", chance = 9973, minCount = 1, maxCount = 3 },  -- 2147
	{ id = "fiery heart", chance = 9960 },  -- 10553
	{ id = "hardened bone", chance = 9882 },  -- 5925
	{ id = "black pearl", chance = 9661, minCount = 1, maxCount = 4 },  -- 2144
	{ id = "knight axe", chance = 7515 },  -- 2430
	{ id = "wand of inferno", chance = 7255 },  -- 2187
	{ id = "fire sword", chance = 6527 },  -- 2392
	{ id = "yellow piece of cloth", chance = 5890 },  -- 5914
	{ id = "green piece of cloth", chance = 5331 },  -- 5910
	{ id = "red gem", chance = 5058 },  -- 2156
	{ id = "yellow gem", chance = 4421 },  -- 2154
	{ id = "red piece of cloth", chance = 3394 },  -- 5911
	{ id = "magma amulet", chance = 2795 },  -- 7890
	{ id = "amber staff", chance = 2184 },  -- 7426
	{ id = "gold ingot", chance = 2054 },  -- 9971
	{ id = "magma boots", chance = 1508 },  -- 7891
	{ id = "magma legs", chance = 1157 },  -- 7894
	{ id = "green gem", chance = 1118 },  -- 2155
	{ id = "magma monocle", chance = 1027 },  -- 7900
	{ id = "onyx flail", chance = 962 },  -- 7421
	{ id = 2231, chance = 949 },  -- big bone
	{ id = "ruthless axe", chance = 871 },  -- 6553
	{ id = "giant sword", chance = 793 },  -- 2393
	{ id = "magma coat", chance = 793 },  -- 7899
	{ id = "explorer brooch", chance = 351 },  -- 4873
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -520, condition = { type = CONDITION_POISON, totalDamage = 800, interval = 4000 } },
	{ name = "combat", interval = 2000, chance = 5, type = COMBAT_EARTHDAMAGE, minDamage = -300, maxDamage = -700, length = 8, spread = 3, effect = CONST_ME_CARNIPHILA, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_DEATHDAMAGE, minDamage = -395, maxDamage = -498, range = 7, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_SMALLCLOUDS, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_FIREDAMAGE, minDamage = -350, maxDamage = -660, length = 8, spread = 3, effect = CONST_ME_FIREAREA, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_LIFEDRAIN, minDamage = -350, maxDamage = -976, length = 8, spread = 3, effect = CONST_ME_MAGIC_RED, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_FIREDAMAGE, minDamage = -200, maxDamage = -403, radius = 1, effect = CONST_ME_HITBYFIRE, target = true },
	{ name = "combat", interval = 2000, chance = 5, type = COMBAT_EARTHDAMAGE, minDamage = -300, maxDamage = -549, range = 7, shootEffect = CONST_ANI_POISON, effect = CONST_ME_POISONAREA, target = false },
}

monster.defenses = {
	defense = 40,
	armor = 60,
	mitigation = 2.75,
	{ name = "speed", interval = 2000, chance = 15, effect = CONST_ME_MAGIC_RED, speed = 360},
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_HEALING, minDamage = 220, maxDamage = 425, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 10 },
	{ type = COMBAT_EARTHDAMAGE, percent = 20 },
	{ type = COMBAT_FIREDAMAGE, percent = 100 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -5 },
	{ type = COMBAT_HOLYDAMAGE, percent = -5 },
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = true },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)