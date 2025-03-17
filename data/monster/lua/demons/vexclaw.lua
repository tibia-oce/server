-- Version: 10.90
-- Monster: https://tibia.fandom.com/wiki/Vexclaw
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Vexclaw
---


local mType = Game.createMonsterType("Vexclaw")
local monster = {}

monster.description = "a vexclaw"
monster.experience = 6248
monster.outfit = {
	lookType = 854,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 8500
monster.maxHealth = 8500
monster.race = "fire"
monster.corpse = 22776
monster.speed = 135
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 20,
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
	{ text = "Weakness must be culled!", yell = false },
	{ text = "Power is miiiiine!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 100000, minCount = 3, maxCount = 200 },  -- 2148
	{ id = "platinum coin", chance = 100000, minCount = 1, maxCount = 9 },  -- 2152
	{ id = "great spirit potion", chance = 26109, minCount = 1, maxCount = 5 },  -- 8472
	{ id = "great mana potion", chance = 24850, minCount = 1, maxCount = 5 },  -- 7590
	{ id = "vexclaw talon", chance = 21144 },  -- 25384
	{ id = "demonic essence", chance = 20343 },  -- 6500
	{ id = "ultimate health potion", chance = 19943, minCount = 1, maxCount = 5 },  -- 8473
	{ id = "fire mushroom", chance = 19928, minCount = 1, maxCount = 6 },  -- 2795
	{ id = "small emerald", chance = 10043, minCount = 1, maxCount = 5 },  -- 2149
	{ id = "small amethyst", chance = 10000, minCount = 1, maxCount = 5 },  -- 2150
	{ id = "small topaz", chance = 9728, minCount = 1, maxCount = 5 },  -- 9970
	{ id = "small ruby", chance = 9700, minCount = 1, maxCount = 5 },  -- 2147
	{ id = "yellow gem", chance = 5021 },  -- 2154
	{ id = "red gem", chance = 4807 },  -- 2156
	{ id = "ice rapier", chance = 4778 },  -- 2396
	{ id = "fire axe", chance = 3562 },  -- 2432
	{ id = "might ring", chance = 2246 },  -- 2164
	{ id = "energy ring", chance = 1946 },  -- 2167
	{ id = "giant sword", chance = 1845 },  -- 2393
	{ id = "ring of healing", chance = 1359 },  -- 2214
	{ id = "rift lance", chance = 1288 },  -- 25383
	{ id = "devil helmet", chance = 887 },  -- 2462
	{ id = "platinum amulet", chance = 887 },  -- 2171
	{ id = "demon shield", chance = 572 },  -- 2520
	{ id = "mastermind shield", chance = 544 },  -- 2514
	{ id = "rift shield", chance = 501 },  -- 25382
	{ id = "golden legs", chance = 486 },  -- 2470
	{ id = "rift bow", chance = 472 },  -- 25522
	{ id = "rift crossbow", chance = 372 },  -- 25523
	{ id = "magic plate armor", chance = 72 },  -- 2472
	{ id = "demonrage sword", chance = 57 },  -- 7382
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, skill = 75, attack = 150 },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_MANADRAIN, minDamage = 0, maxDamage = -120, range = 7, target = false },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_FIREDAMAGE, minDamage = -150, maxDamage = -250, range = 7, radius = 7, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = true },
	{ name = "choking fear drown", interval = 2000, chance = 20, target = false },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_DEATHDAMAGE, minDamage = -150, maxDamage = -400, radius = 4, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA, target = true },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_LIFEDRAIN, minDamage = -50, maxDamage = -200, length = 8, spread = 0, effect = CONST_ME_PURPLEENERGY, target = false },
	{ name = "firefield", interval = 2000, chance = 10, range = 7, radius = 1, shootEffect = CONST_ANI_FIRE, target = true },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_LIFEDRAIN, minDamage = -300, maxDamage = -490, length = 8, spread = 0, effect = CONST_ME_PURPLEENERGY, target = false },
	{ name = "energy strike", interval = 2000, chance = 10, minDamage = -210, maxDamage = -300, range = 1, target = false },
	{ name = "speed", interval = 2000, chance = 15, speed = -300, radius = 1, effect = CONST_ME_MAGIC_RED, target = true, duration = 30000 },
}

monster.defenses = {
	defense = 55,
	armor = 55,
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_HEALING, minDamage = 180, maxDamage = 250, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "speed", interval = 2000, chance = 15, effect = CONST_ME_MAGIC_RED, speed = 270},
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 5 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 10 },
	{ type = COMBAT_EARTHDAMAGE, percent = 40 },
	{ type = COMBAT_FIREDAMAGE, percent = 75 },
	{ type = COMBAT_LIFEDRAIN, percent = 100 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 100 },
	{ type = COMBAT_ICEDAMAGE, percent = -5 },
	{ type = COMBAT_HOLYDAMAGE, percent = -10 },
	{ type = COMBAT_DEATHDAMAGE, percent = 20 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)