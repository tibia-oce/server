-- Version: 7.4
-- Monster: https://tibia.fandom.com/wiki/Crypt_Shambler
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Crypt_Shambler
---


local mType = Game.createMonsterType("Crypt Shambler")
local monster = {}

monster.description = "a crypt shambler"
monster.experience = 195
monster.outfit = {
	lookType = 100,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 330
monster.maxHealth = 330
monster.race = "undead"
monster.corpse = 6029
monster.speed = 70
monster.manaCost = 580

monster.changeTarget = {
	interval = 4000,
	chance = 10,
}

monster.strategiesTarget = {
	nearest = 70,
	damage = 30,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = true,
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
	{ text = "Aaaaahhhh!", yell = false },
	{ text = "Hoooohhh!", yell = false },
	{ text = "Uhhhhhhh!", yell = false },
	{ text = "Chhhhhhh!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 58077, minCount = 1, maxCount = 55 },  -- 2148
	{ id = "worm", chance = 9002, minCount = 1, maxCount = 10 },  -- 3976
	{ id = "half-digested piece of meat", chance = 4942 },  -- 11200
	{ id = 2230, chance = 4933 },  -- bone
	{ id = "iron helmet", chance = 2039 },  -- 2459
	{ id = "two handed sword", chance = 1974 },  -- 2377
	{ id = "rotten meat", chance = 1973 },  -- 2227
	{ id = "bone shield", chance = 1035 },  -- 2541
	{ id = "throwing star", chance = 1001, minCount = 1, maxCount = 3 },  -- 2399
	{ id = "bone sword", chance = 994 },  -- 2450
	{ id = "small diamond", chance = 496 },  -- 2145
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -140 },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_LIFEDRAIN, minDamage = -28, maxDamage = -55, range = 1, target = true },
}

monster.defenses = {
	defense = 25,
	armor = 30,
	mitigation = 0.64,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 100 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 100 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = -25 },
	{ type = COMBAT_DEATHDAMAGE, percent = 100 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = false },
	{ type = "bleed", condition = false },
}

mType:register(monster)
