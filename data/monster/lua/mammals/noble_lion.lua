-- Version: 10.70
-- Monster: https://tibia.fandom.com/wiki/Noble_Lion
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Noble_Lion
---


local mType = Game.createMonsterType("Noble Lion")
local monster = {}

monster.description = "a noble lion"
monster.experience = 400
monster.outfit = {
	lookType = 570,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 1000
monster.maxHealth = 1000
monster.race = "blood"
monster.corpse = 21863
monster.speed = 115
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
	canPushCreatures = false,
	staticAttackChance = 90,
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
	{ text = "Groarrrr! Rwarrrr", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 100000, minCount = 1, maxCount = 74 },  -- 2148
	{ id = "meat", chance = 25109 },  -- 2666
	{ id = "ham", chance = 23885 },  -- 2671
	{ id = "lion's mane", chance = 20529 },  -- 10608
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, skill = 70, attack = 40 },
}

monster.defenses = {
	defense = 26,
	armor = 27,
	mitigation = 1.02,
	{ name = "speed", interval = 2000, chance = 15, effect = CONST_ME_MAGIC_RED, speed = 230},
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 5 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 20 },
	{ type = COMBAT_FIREDAMAGE, percent = 20 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 50 },
	{ type = COMBAT_DEATHDAMAGE, percent = 10 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)