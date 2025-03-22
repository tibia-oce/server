-- Version: 9.10
-- Monster: https://tibia.fandom.com/wiki/Golden_Servant
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Golden_Servant
---


local mType = Game.createMonsterType("Golden Servant")
local monster = {}

monster.description = "a golden servant"
monster.experience = 450
monster.outfit = {
	lookType = 396,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 550
monster.maxHealth = 550
monster.race = "venom"
monster.corpse = 13489
monster.speed = 105
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
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 50,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = false,
	canWalkOnPoison = true}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Error. LOAD 'PROGRAM',8,1", yell = false },
	{ text = "Remain. Obedient.", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 85017, minCount = 1, maxCount = 140 },  -- 2148
	{ id = "health potion", chance = 4979 },  -- 7618
	{ id = "mana potion", chance = 4900 },  -- 7620
	{ id = 2381, chance = 3066 },  -- halberd
	{ id = "green mushroom", chance = 1550 },  -- 2796
	{ id = 9690, chance = 973 },  -- gear wheel
	{ id = "spellbook of enlightenment", chance = 509 },  -- 8900
	{ id = "stealth ring", chance = 489 },  -- 2165
	{ id = "slime mould", chance = 356 },  -- 13758
	{ id = "golden can of oil", chance = 32 },  -- 13938
	{ id = "golden armor", chance = 16 },  -- 2466
	{ id = "gold ring", chance = 9 },  -- 2179
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -100 },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_ENERGYDAMAGE, minDamage = -60, maxDamage = -100, radius = 4, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_YELLOWENERGY, target = true },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_ENERGYDAMAGE, minDamage = -80, maxDamage = -110, radius = 4, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_ENERGYHIT, target = true },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_ENERGYDAMAGE, minDamage = -90, maxDamage = -150, length = 5, spread = 2, effect = CONST_ME_YELLOWENERGY, target = false },
}

monster.defenses = {
	defense = 20,
	armor = 29,
	mitigation = 0.88,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 25 },
	{ type = COMBAT_EARTHDAMAGE, percent = 80 },
	{ type = COMBAT_FIREDAMAGE, percent = 15 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -5 },
	{ type = COMBAT_HOLYDAMAGE, percent = 100 },
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)