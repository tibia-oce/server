-- Hunter (Tibia Wiki: https://tibia.fandom.com/wiki/Hunter)
-- Version: 5.1

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
monster.corpse = 18138
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
	{ id = 2920, chance = 3300 }, -- torch
	{ id = "small ruby", chance = 150 },
	{ id = "dragon necklace", chance = 3000 },
	{ id = "bow", chance = 5770 },
	{ id = "brass helmet", chance = 5050 },
	{ id = "brass armor", chance = 5070 },
	{ id = "arrow", chance = 82000, maxCount = 22 },
	{ id = "poison arrow", chance = 4500, maxCount = 4 },
	{ id = 3449, chance = 5360, maxCount = 3 }, -- burst arrow
	{ id = "orange", chance = 20300, maxCount = 2 },
	{ id = "roll", chance = 11370, maxCount = 2 },
	{ id = "sniper gloves", chance = 540 },
	{ id = "slingshot", chance = 120 },
	{ id = 7394, chance = 190 }, -- wolf trophy
	{ id = 7397, chance = 520 }, -- deer trophy
	{ id = 7400, chance = 70 }, -- lion trophy
	{ id = "hunter's quiver", chance = 10240 },
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
