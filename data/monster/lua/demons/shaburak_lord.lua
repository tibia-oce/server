-- Version: 9.10
-- Monster: https://tibia.fandom.com/wiki/Shaburak_Lord
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Shaburak_Lord
---


local mType = Game.createMonsterType("Shaburak Lord")
local monster = {}

monster.description = "a shaburak lord"
monster.experience = 1200
monster.outfit = {
	lookType = 409,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 2100
monster.maxHealth = 2100
monster.race = "fire"
monster.corpse = 12823
monster.speed = 120
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
	staticAttackChance = 80,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = false}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "GREEN IS MEAN!", yell = true },
	{ text = "WE RULE!", yell = true },
	{ text = "POWER TO THE SHABURAK!", yell = true },
	{ text = "DEATH TO THE ASKARAK!", yell = true },
	{ text = "ONLY WE ARE TRUE DEMONS!", yell = true },
}

monster.loot = {
	{ id = "gold coin", chance = 96059, minCount = 1, maxCount = 178 },  -- 2148
	{ id = "platinum coin", chance = 34301, minCount = 1, maxCount = 2 },  -- 2152
	{ id = "strong mana potion", chance = 6948 },  -- 7589
	{ id = "strong health potion", chance = 6819 },  -- 7588
	{ id = "small ruby", chance = 6326, minCount = 1, maxCount = 5 },  -- 2147
	{ id = "brown mushroom", chance = 5211 },  -- 2789
	{ id = "energy ring", chance = 1426 },  -- 2167
	{ id = "wand of inferno", chance = 985 },  -- 2187
	{ id = "magic sulphur", chance = 415 },  -- 5904
	{ id = "bullseye potion", chance = 389 },  -- 7443
	{ id = "magma coat", chance = 130 },  -- 7899
	{ id = "steel boots", chance = 130 },  -- 2645
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -251 },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_FIREDAMAGE, minDamage = -30, maxDamage = -75, range = 7, radius = 6, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREATTACK, target = false },
	{ name = "shaburak wave", interval = 2000, chance = 15, minDamage = -80, maxDamage = -170, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_FIREDAMAGE, minDamage = -140, maxDamage = -200, length = 4, spread = 0, effect = CONST_ME_FIREATTACK, target = false },
	{ name = "speed", interval = 2000, chance = 10, speed = -650, radius = 1, effect = CONST_ME_MAGIC_RED, target = true, duration = 15000 },
}

monster.defenses = {
	defense = 20,
	armor = 40,
	mitigation = 1.18,
	{ name = "combat", interval = 2000, chance = 5, type = COMBAT_HEALING, minDamage = 100, maxDamage = 150, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 65 },
	{ type = COMBAT_EARTHDAMAGE, percent = -20 },
	{ type = COMBAT_FIREDAMAGE, percent = 100 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 65 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = -5 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)