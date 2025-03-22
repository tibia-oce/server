-- Version: 10.50
-- Monster: https://tibia.fandom.com/wiki/Metal_Gargoyle
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Metal_Gargoyle
---


local mType = Game.createMonsterType("Metal Gargoyle")
local monster = {}

monster.description = "a metal gargoyle"
monster.experience = 1278
monster.outfit = {
	lookType = 601,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 2100
monster.maxHealth = 2100
monster.race = "venom"
monster.corpse = 23347
monster.speed = 95
monster.manaCost = 0

monster.changeTarget = {
	interval = 2000,
	chance = 5,
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
	{ text = "clonk", yell = false },
	{ text = "*stomp*", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 100000, minCount = 3, maxCount = 200 },  -- 2148
	{ id = "platinum coin", chance = 44848, minCount = 1, maxCount = 2 },  -- 2152
	{ id = "metal jaw", chance = 17827 },  -- 23564
	{ id = "strong health potion", chance = 8996, minCount = 1, maxCount = 2 },  -- 7588
	{ id = "strong mana potion", chance = 8968, minCount = 1, maxCount = 2 },  -- 7589
	{ id = "metal spats", chance = 2997 },  -- 23540
	{ id = 9808, chance = 2677 },  -- rusty armor (todo: slightly rusted does not exist in items.xml)
	{ id = "bronze gear wheel", chance = 2555 },  -- 24124
	{ id = "shiny stone", chance = 1396 },  -- 11227
	{ id = "alloy legs", chance = 1027 },  -- 23539
	{ id = "metal bat", chance = 949 },  -- 23542
	{ id = "underworld rod", chance = 855 },  -- 8910
	{ id = "life ring", chance = 519 },  -- 2168
	{ id = "iron ore", chance = 513 },  -- 5880
	{ id = "energy ring", chance = 497 },  -- 2167
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, skill = 84, attack = 50 },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_DEATHDAMAGE, minDamage = -125, maxDamage = -230, length = 8, spread = 0, effect = CONST_ME_YELLOWENERGY, target = false },
	{ name = "combat", interval = 2000, chance = 9, type = COMBAT_LIFEDRAIN, minDamage = -85, maxDamage = -150, range = 7, radius = 3, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA, target = true },
	{ name = "metal gargoyle curse", interval = 2000, chance = 13, target = false },
}

monster.defenses = {
	defense = 42,
	armor = 60,
	mitigation = 1.57,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 15 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -10 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = 10 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -5 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 80 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)