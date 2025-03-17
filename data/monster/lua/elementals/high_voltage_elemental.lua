-- Version: 10.70
-- Monster: https://tibia.fandom.com/wiki/High_Voltage_Elemental
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:High_Voltage_Elemental
---


local mType = Game.createMonsterType("High Voltage Elemental")
local monster = {}

monster.description = "a high voltage elemental"
monster.experience = 1500
monster.outfit = {
	lookType = 293,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 1500
monster.maxHealth = 1500
monster.race = "blood"
monster.corpse = 8138
monster.speed = 139
monster.manaCost = 0

monster.changeTarget = {
	interval = 2000,
	chance = 0,
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
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = false}

monster.light = {
	level = 4,
	color = 143,
}

monster.voices = {
	interval = 5000,
	chance = 10,
}

monster.loot = {
	{ id = "gold coin", chance = 100000, minCount = 2, maxCount = 189 },  -- 2148
	{ id = "flash arrow", chance = 21246, minCount = 1, maxCount = 20 },  -- 7838
	{ id = "mana potion", chance = 6232 },  -- 7620
	{ id = "crystal sword", chance = 5949 },  -- 7449
	{ id = "obsidian lance", chance = 4249 },  -- 2425
	{ id = "small amethyst", chance = 4249, minCount = 1, maxCount = 3 },  -- 2150
	{ id = 2124, chance = 3966 },  -- crystal ring
	{ id = "energy ring", chance = 3399 },  -- 2167
	{ id = "strong mana potion", chance = 2833 },  -- 7589
	{ id = "lightning pendant", chance = 850 },  -- 7889
	{ id = "spellbook of warding", chance = 850 },  -- 8901
	{ id = "wand of cosmic energy", chance = 850 },  -- 2189
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, skill = 66, attack = 70 },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_ENERGYDAMAGE, minDamage = -205, maxDamage = -497, range = 7, radius = 2, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_ENERGYHIT, target = true },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_ENERGYDAMAGE, minDamage = -201, maxDamage = -277, range = 7, shootEffect = CONST_ANI_ENERGYBALL, effect = CONST_ME_ENERGYHIT, target = true },
}

monster.defenses = {
	defense = 11,
	armor = 35,
	mitigation = 1.60,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 35 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 100 },
	{ type = COMBAT_EARTHDAMAGE, percent = -15 },
	{ type = COMBAT_FIREDAMAGE, percent = -100 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 100 },
	{ type = COMBAT_HOLYDAMAGE, percent = 5 },
	{ type = COMBAT_DEATHDAMAGE, percent = 5 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)