

local mType = Game.createMonsterType("Nightfiend")
local monster = {}

monster.description = "a nightfiend"
monster.experience = 2100
monster.outfit = {
	lookType = 556,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 2700
monster.maxHealth = 2700
monster.race = "blood"
monster.corpse = 18952
monster.speed = 112
monster.manaCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 8,
}

monster.strategiesTarget = {
	nearest = 80,
	health = 10,
	damage = 10,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = false,
	rewardBoss = false,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 4,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
}

monster.loot = {
	{ id = "platinum coin", chance = 50000, maxCount = 1 },
	{ id = "gold coin", chance = 50000, maxCount = 148 },
	{ id = 3030, chance = 1052, maxCount = 3 },
	{ id = "tooth file", chance = 564 },
	{ id = "blood preservation", chance = 1000 },
	{ id = "emerald bangle", chance = 120 },
	{ id = "vampire teeth", chance = 10000 },
	{ id = "vampire shield", chance = 50 },
	{ id = "strong health potion", chance = 4761 },
	{ id = "strong mana potion", chance = 5000 },
	{ id = "red gem", chance = 55 }, -- red gem
	{ id = "ring of healing", chance = 1000 }, -- ring of healing
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -45 },
	{ name = "combat", interval = 1000, chance = 10, type = COMBAT_PHYSICALDAMAGE, minDamage = -5, maxDamage = -40, range = 7, shootEffect = CONST_ANI_THROWINGKNIFE, target = false },
}

monster.defenses = {
	defense = 11,
	armor = 46,
	mitigation = 1.43,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 10 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 10 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = -5 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 20 },
	{ type = COMBAT_HOLYDAMAGE, percent = -8 },
	{ type = COMBAT_DEATHDAMAGE, percent = 100 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)