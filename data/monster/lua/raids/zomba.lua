-- Version: 10.10
-- Monster: https://tibia.fandom.com/wiki/Zomba
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Zomba
---


local mType = Game.createMonsterType("Zomba")
local monster = {}

monster.description = "Zomba"
monster.experience = 300
monster.outfit = {
	lookType = 570,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 300
monster.maxHealth = 300
monster.race = "blood"
monster.corpse = 19103
monster.speed = 90
monster.manaCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 8,
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
	rewardBoss = true,
	illusionable = true,
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 10,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Groarrrr! Rwarrrr!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 100000, minCount = 1, maxCount = 29 },  -- 2148
	{ id = "lion's mane", chance = 100000, minCount = 1, maxCount = 2 },  -- 10608
	{ id = "platinum coin", chance = 31034 },  -- 2152
	{ id = "life ring", chance = 20690 },  -- 2168
	{ id = "ham", chance = 13793 },  -- 2671
	{ id = "guardian shield", chance = 3448 },  -- 2515
	{ id = "protection amulet", chance = 3448 },  -- 2200
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, skill = 30, attack = 20 },
}

monster.defenses = {
	defense = 13,
	armor = 6,
	mitigation = 0.40,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 40 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -15 },
	{ type = COMBAT_HOLYDAMAGE, percent = 20 },
	{ type = COMBAT_DEATHDAMAGE, percent = -8 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)