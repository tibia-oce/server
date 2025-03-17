-- Version: 10.30
-- Monster: https://tibia.fandom.com/wiki/Sight_of_Surrender
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Sight_of_Surrender
---


local mType = Game.createMonsterType("Sight of Surrender")
local monster = {}

monster.description = "a sight of surrender"
monster.experience = 17000
monster.outfit = {
	lookType = 583,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 28000
monster.maxHealth = 28000
monster.race = "undead"
monster.corpse = 20144
monster.speed = 170
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
	{ text = "BOW LOW!", yell = true },
	{ text = "FEEL THE TRUE MEANING OF VANQUISH!", yell = true },
	{ text = "HAHAHAHA DO YOU WANT TO AMUSE YOUR MASTER?", yell = true },
	{ text = "NOW YOU WILL SURRENDER!", yell = true },
}

monster.loot = {
	{ id = "broken visor", chance = 100000 },  -- 22518
	{ id = "platinum coin", chance = 100000, minCount = 1, maxCount = 20 },  -- 2152
	{ id = "sight of surrender's eye", chance = 100000 },  -- 22517
	{ id = "ultimate health potion", chance = 76925, minCount = 1, maxCount = 5 },  -- 8473
	{ id = "great mana potion", chance = 76508, minCount = 1, maxCount = 5 },  -- 7590
	{ id = "great spirit potion", chance = 75565, minCount = 1, maxCount = 5 },  -- 8472
	{ id = "blue crystal splinter", chance = 34328, minCount = 1, maxCount = 5 },  -- 18418
	{ id = "green crystal splinter", chance = 32946, minCount = 1, maxCount = 5 },  -- 18416
	{ id = "brown crystal splinter", chance = 32726, minCount = 1, maxCount = 5 },  -- 18417
	{ id = "blue crystal shard", chance = 25027, minCount = 1, maxCount = 3 },  -- 18413
	{ id = "violet crystal shard", chance = 24742, minCount = 1, maxCount = 3 },  -- 18414
	{ id = "green crystal shard", chance = 23931, minCount = 1, maxCount = 3 },  -- 18415
	{ id = "stone skin amulet", chance = 14389 },  -- 2197
	{ id = "might ring", chance = 5111 },  -- 2164
	{ id = "crystal mace", chance = 5001 },  -- 2445
	{ id = "cluster of solace", chance = 2961, minCount = 1, maxCount = 2 },  -- 22396
	{ id = "steel boots", chance = 2347 },  -- 2645
	{ id = "magic plate armor", chance = 1864 },  -- 2472
	{ id = "onyx flail", chance = 1272 },  -- 7421
	{ id = "jade hammer", chance = 1228 },  -- 7422
	{ id = "tower shield", chance = 1228 },  -- 2528
	{ id = "hammer of wrath", chance = 855 },  -- 2444
	{ id = "crusader helmet", chance = 768 },  -- 2497
	{ id = "crown legs", chance = 483 },  -- 2488
	{ id = "string of mending", chance = 439 },  -- 22542
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -1100 },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_ENERGYDAMAGE, minDamage = -500, maxDamage = -800, length = 8, spread = 0, effect = CONST_ME_YELLOWENERGY, target = true },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -500, radius = 1, shootEffect = CONST_ANI_LARGEROCK, target = true },
}

monster.defenses = {
	defense = 70,
	armor = 92,
	mitigation = 2.31,
	{ name = "combat", interval = 2000, chance = 30, type = COMBAT_HEALING, minDamage = 550, maxDamage = 1100, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "speed", interval = 2000, chance = 15, effect = CONST_ME_MAGIC_RED, speed = 340},
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 30 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 10 },
	{ type = COMBAT_EARTHDAMAGE, percent = 20 },
	{ type = COMBAT_FIREDAMAGE, percent = 35 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 40 },
	{ type = COMBAT_HOLYDAMAGE, percent = -5 },
	{ type = COMBAT_DEATHDAMAGE, percent = 20 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)