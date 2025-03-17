-- Version: 8.10
-- Monster: https://tibia.fandom.com/wiki/Poacher
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Poacher
---


local mType = Game.createMonsterType("Poacher")
local monster = {}

monster.description = "a poacher"
monster.experience = 70
monster.outfit = {
	lookType = 129,
	lookHead = 60,
	lookBody = 118,
	lookLegs = 118,
	lookFeet = 116,
	lookAddons = 1,
	lookMount = 0,
}


monster.health = 90
monster.maxHealth = 90
monster.race = "blood"
monster.corpse = 18206
monster.speed = 99
monster.manaCost = 530

monster.changeTarget = {
	interval = 5000,
	chance = 0,
}

monster.strategiesTarget = {
	nearest = 100,
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
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 5,
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
	{ text = "You will not live to tell anyone!", yell = false },
	{ text = "You are my game today!", yell = false },
	{ text = "Look what has stepped into my trap!", yell = false },
}

monster.loot = {
	{ id = "arrow", chance = 46943, minCount = 1, maxCount = 18 },  -- 2544
	{ id = "leather helmet", chance = 30576 },  -- 2461
	{ id = "leather legs", chance = 27727 },  -- 2649
	{ id = "bow", chance = 15031 },  -- 2456
	{ id = "roll", chance = 11045, minCount = 1, maxCount = 2 },  -- 2690
	{ id = 2050, chance = 5015 },  -- torch
	{ id = "poison arrow", chance = 2581, minCount = 1, maxCount = 3 },  -- 2545
	{ id = "closed trap", chance = 1052 },  -- 2578
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -35 },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -35, range = 7, shootEffect = CONST_ANI_ARROW, target = false },
}

monster.defenses = {
	defense = 15,
	armor = 10,
	mitigation = 0.33,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = false },
	{ type = "bleed", condition = false },
}

mType:register(monster)