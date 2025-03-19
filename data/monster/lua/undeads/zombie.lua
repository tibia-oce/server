-- Version: 8.40
-- Monster: https://tibia.fandom.com/wiki/Zombie
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Zombie
---


local mType = Game.createMonsterType("Zombie")
local monster = {}

monster.description = "a zombie"
monster.experience = 280
monster.outfit = {
	lookType = 311,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 500
monster.maxHealth = 500
monster.race = "undead"
monster.corpse = 8961
monster.speed = 90
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10,
}

monster.strategiesTarget = {
	nearest = 80,
	health = 10,
	damage = 10,
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
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
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
	{ text = "Mst.... klll....", yell = false },
	{ text = "Whrrrr... ssss.... mmm.... grrrrl", yell = false },
	{ text = "Dnnnt... cmmm... clsrrr....", yell = false },
	{ text = "Httt.... hmnnsss...", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 82099, minCount = 1, maxCount = 65 },  -- 2148
	{ id = "half-eaten brain", chance = 10290 },  -- 10576
	{ id = "brass helmet", chance = 9783 },  -- 2460
	{ id = "mace", chance = 7979 },  -- 2398
	{ id = "battle hammer", chance = 6869 },  -- 2417
	{ id = 9808, chance = 5851 },  -- rusty armor (todo: heavily rusted does not exist in items.xml)
	{ id = "steel helmet", chance = 4808 },  -- 2457
	{ id = 2381, chance = 3784 },  -- halberd
	{ id = "life ring", chance = 933 },  -- 2168
	{ id = "mana potion", chance = 727 },  -- 7620
	{ id = "simple dress", chance = 502 },  -- 2657
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -130 },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_MANADRAIN, minDamage = -14, maxDamage = -23, range = 1, target = true },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_LIFEDRAIN, minDamage = -15, maxDamage = -24, range = 7, effect = CONST_ME_MAGIC_RED, target = true },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_DEATHDAMAGE, minDamage = -30, maxDamage = -49, range = 1, effect = CONST_ME_SMALLCLOUDS, target = true },
}

monster.defenses = {
	defense = 15,
	armor = 20,
	mitigation = 0.83,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 100 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = 50 },
	{ type = COMBAT_LIFEDRAIN, percent = 100 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 100 },
	{ type = COMBAT_ICEDAMAGE, percent = 100 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 100 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = false },
	{ type = "bleed", condition = false },
}

mType:register(monster)
