-- Version: 6.0
-- Monster: https://tibia.fandom.com/wiki/Mummy
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Mummy
---


local mType = Game.createMonsterType("Mummy")
local monster = {}

monster.description = "a mummy"
monster.experience = 150
monster.outfit = {
	lookType = 65,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 240
monster.maxHealth = 240
monster.race = "undead"
monster.corpse = 6004
monster.speed = 75
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10,
}

monster.strategiesTarget = {
	nearest = 100,
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
	canWalkOnFire = false,
	canWalkOnPoison = true}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "I will ssswallow your sssoul!", yell = false },
	{ text = "Mort ulhegh dakh visss.", yell = false },
	{ text = "Flesssh to dussst!", yell = false },
	{ text = "I will tassste life again!", yell = false },
	{ text = "Ahkahra exura belil mort!", yell = false },
	{ text = "Yohag Sssetham!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 39564, minCount = 1, maxCount = 80 },  -- 2148
	{ id = "worm", chance = 19864, minCount = 1, maxCount = 3 },  -- 3976
	{ id = "flask of embalming fluid", chance = 12113 },  -- 12422
	{ id = "gauze bandage", chance = 10031 },  -- 10566
	{ id = 2162, chance = 6053 },  -- magic light wand
	{ id = "strange talisman", chance = 4986 },  -- 2161
	{ id = "silver brooch", chance = 3936 },  -- 2134
	{ id = 2124, chance = 1511 },  -- crystal ring
	{ id = "black pearl", chance = 993 },  -- 2144
	{ id = "yellow piece of cloth", chance = 945 },  -- 5914
	{ id = "poison dagger", chance = 510 },  -- 2411
	{ id = "black shield", chance = 185 },  -- 2529
	{ id = "silver amulet", chance = 89 },  -- 2170
	{ id = "mini mummy", chance = 2 },  -- 11207
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -85, condition = { type = CONDITION_POISON, totalDamage = 4, interval = 4000 } },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_DEATHDAMAGE, minDamage = -30, maxDamage = -40, range = 1, effect = CONST_ME_SMALLCLOUDS, target = true },
	{ name = "speed", interval = 2000, chance = 15, speed = -226, range = 7, effect = CONST_ME_MAGIC_RED, target = true, duration = 10000 },
}

monster.defenses = {
	defense = 15,
	armor = 14,
	mitigation = 0.59,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 100 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 100 },
	{ type = COMBAT_ICEDAMAGE, percent = 20 },
	{ type = COMBAT_HOLYDAMAGE, percent = -25 },
	{ type = COMBAT_DEATHDAMAGE, percent = 100 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
