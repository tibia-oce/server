-- Version: 9.60
-- Monster: https://tibia.fandom.com/wiki/Cliff_Strider
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Cliff_Strider
---


local mType = Game.createMonsterType("Cliff Strider")
local monster = {}

monster.description = "a cliff strider"
monster.experience = 7100
monster.outfit = {
	lookType = 497,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 9400
monster.maxHealth = 9400
monster.race = "undead"
monster.corpse = 17420
monster.speed = 123
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
	canPushCreatures = false,
	staticAttackChance = 80,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = false,
	canWalkOnPoison = false}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Knorrrr", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 100000, minCount = 3, maxCount = 198 },  -- 2148
	{ id = "platinum coin", chance = 100000, minCount = 1, maxCount = 10 },  -- 2152
	{ id = "great mana potion", chance = 34219, minCount = 1, maxCount = 4 },  -- 7590
	{ id = "ultimate health potion", chance = 23634, minCount = 1, maxCount = 2 },  -- 8473
	{ id = "vein of ore", chance = 18360, minCount = 1, maxCount = 2 },  -- 18429
	{ id = "soul orb", chance = 17513 },  -- 5944
	{ id = "cliff strider claw", chance = 15666 },  -- 18428
	{ id = "pulverized ore", chance = 15204 },  -- 18427
	{ id = "iron ore", chance = 14704 },  -- 5880
	{ id = "shiny stone", chance = 12510 },  -- 11227
	{ id = "black pearl", chance = 10162 },  -- 2144
	{ id = "prismatic bolt", chance = 9815, minCount = 1, maxCount = 8 },  -- 18435
	{ id = "white pearl", chance = 9353, minCount = 1, maxCount = 3 },  -- 2143
	{ id = "blue crystal splinter", chance = 9122, minCount = 1, maxCount = 2 },  -- 18418
	{ id = "cyan crystal fragment", chance = 8507 },  -- 18419
	{ id = "blue crystal shard", chance = 5658 },  -- 18413
	{ id = "red gem", chance = 5427 },  -- 2156
	{ id = "crystal of balance", chance = 2694 },  -- 9942
	{ id = "wand of defiance", chance = 1848 },  -- 18390
	{ id = "sapphire hammer", chance = 1732 },  -- 7437
	{ id = "magic sulphur", chance = 1424 },  -- 5904
	{ id = "spiked squelcher", chance = 1347 },  -- 7452
	{ id = "glacial rod", chance = 1270 },  -- 18412
	{ id = "crystal of power", chance = 885 },  -- 9980
	{ id = "giant sword", chance = 885 },  -- 2393
	{ id = "knight legs", chance = 885 },  -- 2477
	{ id = "crystal crossbow", chance = 770 },  -- 18453
	{ id = "blue gem", chance = 693 },  -- 2158
	{ id = "crystalline sword", chance = 500 },  -- 18450
	{ id = "crusader helmet", chance = 462 },  -- 2497
	{ id = "crown armor", chance = 385 },  -- 2487
	{ id = "steel boots", chance = 77 },  -- 2645
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -499 },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -800, radius = 4, shootEffect = CONST_ANI_LARGEROCK, effect = CONST_ME_STONES, target = true },
	{ name = "cliff strider skill reducer", interval = 2000, chance = 10, target = false },
	{ name = "cliff strider electrify", interval = 2000, chance = 15, range = 1, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -1000, length = 6, spread = 0, effect = CONST_ME_GROUNDSHAKER, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_MANADRAIN, minDamage = -100, maxDamage = -300, radius = 4, effect = CONST_ME_YELLOWENERGY, target = false },
}

monster.defenses = {
	defense = 55,
	armor = 89,
	mitigation = 2.60,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 10 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 5 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = 20 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 20 },
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