-- Version: 5.1
-- Monster: https://tibia.fandom.com/wiki/Fire_Devil
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Fire_Devil
---


local mType = Game.createMonsterType("Fire Devil")
local monster = {}

monster.description = "a fire devil"
monster.experience = 145
monster.outfit = {
	lookType = 40,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 200
monster.maxHealth = 200
monster.race = "blood"
monster.corpse = 5985
monster.speed = 90
monster.manaCost = 530

monster.changeTarget = {
	interval = 4000,
	chance = 10,
}

monster.strategiesTarget = {
	nearest = 100,
}

monster.flags = {
	summonable = true,
	attackable = true,
	hostile = true,
	convinceable = true,
	pushable = false,
	rewardBoss = false,
	illusionable = true,
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 4,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = true,
	canWalkOnPoison = false}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Hot, eh?", yell = false },
	{ text = "Hell, oh, hell!", yell = false },
}

monster.loot = {
	{ id = "small pitchfork", chance = 19417 },  -- 12469
	{ id = "blank rune", chance = 10963 },  -- 2260
	{ id = 2419, chance = 2933 },  -- scimitar
	{ id = 2050, chance = 1435, minCount = 1, maxCount = 2 },  -- torch
	{ id = "double axe", chance = 1351 },  -- 2387
	{ id = "cleaver", chance = 972 },  -- 2568
	{ id = "necrotic rod", chance = 492 },  -- 2185
	{ id = "small amethyst", chance = 271 },  -- 2150
	{ id = "guardian shield", chance = 226 },  -- 2515
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -35 },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_FIREDAMAGE, minDamage = -60, maxDamage = -90, range = 7, radius = 4, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = true },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_FIREDAMAGE, minDamage = -20, maxDamage = -50, range = 7, radius = 2, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = true },
}

monster.defenses = {
	defense = 10,
	armor = 13,
	mitigation = 0.38,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 10 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 30 },
	{ type = COMBAT_EARTHDAMAGE, percent = 20 },
	{ type = COMBAT_FIREDAMAGE, percent = 100 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -20 },
	{ type = COMBAT_HOLYDAMAGE, percent = -10 },
	{ type = COMBAT_DEATHDAMAGE, percent = 20 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = false },
	{ type = "bleed", condition = false },
}

mType:register(monster)