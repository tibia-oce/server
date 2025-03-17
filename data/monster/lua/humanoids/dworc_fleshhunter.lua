

local mType = Game.createMonsterType("Dworc Fleshhunter")
local monster = {}

monster.description = "a dworc fleshhunter"
monster.experience = 40
monster.outfit = {
	lookType = 215,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 85
monster.maxHealth = 85
monster.race = "blood"
monster.corpse = 6058
monster.speed = 74
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 0,
}

monster.strategiesTarget = {
	nearest = 100,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = true,
	rewardBoss = false,
	illusionable = true,
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 8,
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
	{ text = "Grow truk grrrrr.", yell = false },
	{ text = "Brak brrretz!", yell = false },
	{ text = "Prek tars, dekklep zurk.", yell = false },
}

monster.loot = {
	{ id = 2920, chance = 4750 }, -- torch
	{ id = "gold coin", chance = 69000, maxCount = 13 },
	{ id = 3114, chance = 3300, maxCount = 3 }, -- skull
	{ id = "poison dagger", chance = 2250 },
	{ id = "bone shield", chance = 1000 },
	{ id = "cleaver", chance = 9750 },
	{ id = "ripper lance", chance = 90 },
	{ id = "hunting spear", chance = 2000 },
	{ id = "tribal mask", chance = 500 },
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -25, condition = { type = CONDITION_POISON, totalDamage = 20, interval = 4000 } },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -15, range = 7, shootEffect = CONST_ANI_THROWINGKNIFE, target = false },
}

monster.defenses = {
	defense = 10,
	armor = 3,
	mitigation = 0.20,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = -8 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -10 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = -13 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = false },
	{ type = "bleed", condition = false },
}

mType:register(monster)
