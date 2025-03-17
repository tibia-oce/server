

local mType = Game.createMonsterType("Crazed Beggar")
local monster = {}

monster.description = "a crazed beggar"
monster.experience = 35
monster.outfit = {
	lookType = 153,
	lookHead = 40,
	lookBody = 19,
	lookLegs = 21,
	lookFeet = 97,
	lookAddons = 3,
	lookMount = 0,
}


monster.health = 100
monster.maxHealth = 100
monster.race = "blood"
monster.corpse = 18070
monster.speed = 77
monster.manaCost = 300

monster.changeTarget = {
	interval = 4000,
	chance = 0,
}

monster.strategiesTarget = {
	nearest = 100,
}

monster.flags = {
	summonable = true,
	attackable = true,
	hostile = true,
	convinceable = true,
	pushable = true,
	rewardBoss = false,
	illusionable = false,
	canPushItems = false,
	canPushCreatures = false,
	staticAttackChance = 80,
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
	{ text = "Hehehe!", yell = false },
	{ text = "Raahhh!", yell = false },
	{ text = "You are one of THEM! Die!", yell = false },
	{ text = "Wanna buy roses??", yell = false },
	{ text = "Make it stop!", yell = false },
	{ text = "They're coming! They're coming!", yell = false },
	{ text = "Gimme money!", yell = false },
}

monster.loot = {
	{ id = "small blue pillow", chance = 420 },
	{ id = 2950, chance = 360 }, -- lute
	{ id = "gold coin", chance = 99000, maxCount = 9 },
	{ id = "dwarven ring", chance = 120 }, -- dwarven ring
	{ id = "dirty cape", chance = 55000 }, -- dirty cape
	{ id = "wooden hammer", chance = 6500 },
	{ id = "wooden spoon", chance = 9750 },
	{ id = 3473, chance = 5650 }, -- rolling pin
	{ id = "meat", chance = 9500 },
	{ id = "roll", chance = 22500 },
	{ id = "red rose", chance = 4700 },
	{ id = "sling herb", chance = 420 },
	{ id = "rum flask", chance = 420 },
	{ id = 6091, chance = 300 }, -- very noble-looking watch
	{ id = 8894, chance = 80 }, -- heavily rusted armor
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -25 },
}

monster.defenses = {
	defense = 15,
	armor = 4,
	mitigation = 0.20,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 5 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 20 },
	{ type = COMBAT_EARTHDAMAGE, percent = -10 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 10 },
	{ type = COMBAT_DEATHDAMAGE, percent = -10 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = false },
	{ type = "bleed", condition = false },
}

mType:register(monster)