-- Version: 9.80
-- Monster: https://tibia.fandom.com/wiki/Corym_Vanguard
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Corym_Vanguard
---


local mType = Game.createMonsterType("Corym Vanguard")
local monster = {}

monster.description = "a corym vanguard"
monster.experience = 490
monster.outfit = {
	lookType = 534,
	lookHead = 0,
	lookBody = 19,
	lookLegs = 121,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 700
monster.maxHealth = 700
monster.race = "blood"
monster.corpse = 17454
monster.speed = 100
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
	illusionable = true,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 70,
	targetDistance = 1,
	runHealth = 50,
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
	{ text = "Gimme! Gimme!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 100000, minCount = 1, maxCount = 90 },  -- 2148
	{ id = "soft cheese", chance = 15127 },  -- 20100
	{ id = 2696, chance = 14876 },  -- cheese
	{ id = "rat cheese", chance = 14747 },  -- 20101
	{ id = "cheese cutter", chance = 11821 },  -- 20097
	{ id = "bola", chance = 9715 },  -- 20089
	{ id = "earflap", chance = 9031 },  -- 20099
	{ id = "spiky club", chance = 2220 },  -- 20139
	{ id = "spike shield", chance = 2189 },  -- 20090
	{ id = "cheesy figurine", chance = 2174 },  -- 20098
	{ id = "ratana", chance = 2159 },  -- 20092
	{ id = "life preserver", chance = 1878 },  -- 20093
	{ id = "leather harness", chance = 1498 },  -- 20126
	{ id = "rat god doll", chance = 15 },  -- 20105
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -140 },
	{ name = "corym vanguard wave", interval = 2000, chance = 10, minDamage = -50, maxDamage = -100, target = false },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_DEATHDAMAGE, minDamage = -40, maxDamage = -70, radius = 4, effect = CONST_ME_MORTAREA, target = true },
}

monster.defenses = {
	defense = 20,
	armor = 29,
	mitigation = 0.99,
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_HEALING, minDamage = 30, maxDamage = 60, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 20 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 10 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
