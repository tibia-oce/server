-- Version: 8.54
-- Monster: https://tibia.fandom.com/wiki/Undead_Prospector
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Undead_Prospector
---


local mType = Game.createMonsterType("Undead Prospector")
local monster = {}

monster.description = "an undead prospector"
monster.experience = 85
monster.outfit = {
	lookType = 18,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 100
monster.maxHealth = 100
monster.race = "blood"
monster.corpse = 5976
monster.speed = 72
monster.manaCost = 440

monster.changeTarget = {
	interval = 4000,
	chance = 0,
}

monster.strategiesTarget = {
	nearest = 80,
	health = 10,
	damage = 10,
}

monster.flags = {
	summonable = true,
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
	canWalkOnFire = false,
	canWalkOnPoison = false}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Our mine... leave us alone.", yell = false },
	{ text = "Turn back...", yell = false },
	{ text = "These mine is ours... you shall not pass.", yell = false },
}

monster.loot = {
	{ id = "worm", chance = 80404, minCount = 1, maxCount = 6 },  -- 3976
	{ id = "gold coin", chance = 70851, minCount = 1, maxCount = 30 },  -- 2148
	{ id = 2050, chance = 61421 },  -- torch
	{ id = "brass helmet", chance = 18432 },  -- 2460
	{ id = "knife", chance = 14329 },  -- 2403
	{ id = "viking helmet", chance = 5328 },  -- 2473
	{ id = "scale armor", chance = 3674 },  -- 2483
	{ id = 2229, chance = 2878 },  -- skull
	{ id = "brown piece of cloth", chance = 919 },  -- 5913
	{ id = "life ring", chance = 122 },  -- 2168
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -50 },
}

monster.defenses = {
	defense = 0,
	armor = 8,
	mitigation = 0.43,
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_HEALING, minDamage = 5, maxDamage = 15, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 30 },
	{ type = COMBAT_EARTHDAMAGE, percent = 20 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 100 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 100 },
	{ type = COMBAT_ICEDAMAGE, percent = 10 },
	{ type = COMBAT_HOLYDAMAGE, percent = -25 },
	{ type = COMBAT_DEATHDAMAGE, percent = 100 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = false },
	{ type = "bleed", condition = false },
}

mType:register(monster)