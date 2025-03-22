-- Version: 8.00
-- Monster: https://tibia.fandom.com/wiki/Barbarian_Headsplitter
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Barbarian_Headsplitter
---


local mType = Game.createMonsterType("Barbarian Headsplitter")
local monster = {}

monster.description = "a barbarian headsplitter"
monster.experience = 85
monster.outfit = {
	lookType = 253,
	lookHead = 115,
	lookBody = 86,
	lookLegs = 119,
	lookFeet = 113,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 100
monster.maxHealth = 100
monster.race = "blood"
monster.corpse = 20343
monster.speed = 84
monster.manaCost = 450

monster.changeTarget = {
	interval = 60000,
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
	convinceable = true,
	pushable = false,
	rewardBoss = false,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 70,
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
	{ text = "I will regain my honor with your blood!", yell = false },
	{ text = "Surrender is not option!", yell = false },
	{ text = "Its you or me!", yell = false },
	{ text = "Die! Die! Die!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 75160, minCount = 1, maxCount = 30 },  -- 2148
	{ id = 2050, chance = 59845 },  -- torch
	{ id = "brass helmet", chance = 20147 },  -- 2460
	{ id = "knife", chance = 14838 },  -- 2403
	{ id = "viking helmet", chance = 4944 },  -- 2473
	{ id = "scale armor", chance = 4041 },  -- 2483
	{ id = 2229, chance = 3156 },  -- skull
	{ id = "brown piece of cloth", chance = 953 },  -- 5913
	{ id = "health potion", chance = 527 },  -- 7618
	{ id = "life ring", chance = 230 },  -- 2168
	{ id = "krimhorn helmet", chance = 112 },  -- 7461
	{ id = "fur boots", chance = 91 },  -- 7457
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -50 },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -60, range = 7, radius = 1, shootEffect = CONST_ANI_WHIRLWINDAXE, target = true },
}

monster.defenses = {
	defense = 0,
	armor = 7,
	mitigation = 0.36,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 20 },
	{ type = COMBAT_EARTHDAMAGE, percent = -10 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 50 },
	{ type = COMBAT_HOLYDAMAGE, percent = 20 },
	{ type = COMBAT_DEATHDAMAGE, percent = -10 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = false },
	{ type = "bleed", condition = false },
}

mType:register(monster)