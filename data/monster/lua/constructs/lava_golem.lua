-- Version: 9.60
-- Monster: https://tibia.fandom.com/wiki/Lava_Golem
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Lava_Golem
---


local mType = Game.createMonsterType("Lava Golem")
local monster = {}

monster.description = "a lava golem"
monster.experience = 7900
monster.outfit = {
	lookType = 491,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 9000
monster.maxHealth = 9000
monster.race = "fire"
monster.corpse = 15988
monster.speed = 210
monster.manaCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 0,
}

monster.strategiesTarget = {
	nearest = 80,
	random = 20,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = false,
	rewardBoss = false,
	illusionable = false,
	canPushItems = false,
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
	level = 10,
	color = 206,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Grrrrunt", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 100000, minCount = 3, maxCount = 200 },  -- 2148
	{ id = "platinum coin", chance = 99985, minCount = 1, maxCount = 11 },  -- 2152
	{ id = "mana potion", chance = 20182, minCount = 1, maxCount = 2 },  -- 7620
	{ id = "strong health potion", chance = 18772, minCount = 1, maxCount = 2 },  -- 7588
	{ id = "strong mana potion", chance = 17524, minCount = 1, maxCount = 2 },  -- 7589
	{ id = "great mana potion", chance = 16730, minCount = 1, maxCount = 2 },  -- 7590
	{ id = "ultimate health potion", chance = 15085 },  -- 8473
	{ id = "magma clump", chance = 14924, minCount = 1, maxCount = 2 },  -- 18424
	{ id = "blazing bone", chance = 14527 },  -- 18425
	{ id = "green crystal splinter", chance = 13895, minCount = 1, maxCount = 2 },  -- 18416
	{ id = "fiery heart", chance = 13469 },  -- 10553
	{ id = "prismatic bolt", chance = 12250, minCount = 1, maxCount = 5 },  -- 18435
	{ id = "iron ore", chance = 11795 },  -- 5880
	{ id = "red crystal fragment", chance = 10488 },  -- 18420
	{ id = "yellow piece of cloth", chance = 7183 },  -- 5914
	{ id = "yellow gem", chance = 6184 },  -- 2154
	{ id = "violet crystal shard", chance = 5920 },  -- 18414
	{ id = "white piece of cloth", chance = 4818 },  -- 5909
	{ id = "red piece of cloth", chance = 3481 },  -- 5911
	{ id = "magma amulet", chance = 3276 },  -- 7890
	{ id = "wand of inferno", chance = 3158 },  -- 2187
	{ id = "magma boots", chance = 2438 },  -- 7891
	{ id = "fire sword", chance = 1807 },  -- 2392
	{ id = "fire axe", chance = 1425 },  -- 2432
	{ id = "crown shield", chance = 1366 },  -- 2519
	{ id = "wand of everblazing", chance = 1337 },  -- 18409
	{ id = "red gem", chance = 1190 },  -- 2156
	{ id = "spellbook of mind control", chance = 558 },  -- 8902
	{ id = "magma coat", chance = 514 },  -- 7899
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -400 },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_FIREDAMAGE, minDamage = -350, maxDamage = -700, length = 8, spread = 0, effect = CONST_ME_FIREATTACK, target = false },
	{ name = "lava golem soulfire", interval = 2000, chance = 15, target = false },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_FIREDAMAGE, minDamage = -220, maxDamage = -350, radius = 4, effect = CONST_ME_FIREAREA, target = true },
	{ name = "speed", interval = 2000, chance = 10, speed = -800, length = 5, spread = 3, effect = CONST_ME_BLOCKHIT, target = false, duration = 30000 },
	{ name = "combat", interval = 2000, chance = 30, type = COMBAT_FIREDAMAGE, minDamage = -280, maxDamage = -350, radius = 3, effect = CONST_ME_HITBYFIRE, target = false },
}

monster.defenses = {
	defense = 60,
	armor = 84,
	mitigation = 2.51,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 30 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 30 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = 100 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -5 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 35 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)