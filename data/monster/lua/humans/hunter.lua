-- Version: 5.1
-- Monster: https://tibia.fandom.com/wiki/Hunter
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Hunter
---


local mType = Game.createMonsterType("Hunter")
local monster = {}

monster.description = "a hunter"
monster.experience = 150
monster.outfit = {
	lookType = 129,
	lookHead = 95,
	lookBody = 116,
	lookLegs = 120,
	lookFeet = 115,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 150
monster.maxHealth = 150
monster.race = "blood"
monster.corpse = 20419
monster.speed = 105
monster.manaCost = 530

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
	convinceable = true,
	pushable = false,
	rewardBoss = false,
	illusionable = true,
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 4,
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
	{ text = "Guess who we are hunting!", yell = false },
	{ text = "Guess who we're hunting, hahaha!", yell = false },
	{ text = "Bullseye!", yell = false },
	{ text = "You'll make a nice trophy!", yell = false },
}

monster.loot = {
	{ id = 2544, chance = 82485, minCount = 1, maxCount = 22 },  -- arrow
	{ id = "orange", chance = 20031, minCount = 1, maxCount = 2 },  -- 2675
	{ id = "roll", chance = 11050, minCount = 1, maxCount = 2 },  -- 2690
	{ id = "hunter's quiver", chance = 10138 },  -- 12425
	{ id = "bow", chance = 5832 },  -- 2456
	{ id = 2546, chance = 5163, minCount = 1, maxCount = 3 },  -- burst arrow
	{ id = "brass armor", chance = 5152 },  -- 2465
	{ id = "brass helmet", chance = 4993 },  -- 2460
	{ id = "poison arrow", chance = 4310, minCount = 1, maxCount = 4 },  -- 2545
	{ id = "dragon necklace", chance = 3128 },  -- 2201
	{ id = 2050, chance = 3102 },  -- torch
	{ id = "sniper gloves", chance = 546 },  -- 5875
	{ id = 7397, chance = 423 },  -- deer trophy
	{ id = "small ruby", chance = 177 },  -- 2147
	{ id = 7400, chance = 130 },  -- lion trophy
	{ id = "slingshot", chance = 123 },  -- 5907
	{ id = 7394, chance = 123 },  -- wolf trophy
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -20 },
	{ name = "combat", interval = 2000, chance = 50, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -100, range = 7, shootEffect = CONST_ANI_ARROW, target = false },
}

monster.defenses = {
	defense = 15,
	armor = 8,
	mitigation = 0.25,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = -5 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 20 },
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = false },
	{ type = "bleed", condition = false },
}

mType:register(monster)