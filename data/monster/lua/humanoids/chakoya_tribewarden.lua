

local mType = Game.createMonsterType("Chakoya Tribewarden")
local monster = {}

monster.description = "a chakoya tribewarden"
monster.experience = 40
monster.outfit = {
	lookType = 249,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 68
monster.maxHealth = 68
monster.race = "blood"
monster.corpse = 7320
monster.speed = 62
monster.manaCost = 305

monster.changeTarget = {
	interval = 60000,
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
	illusionable = false,
	canPushItems = false,
	canPushCreatures = false,
	staticAttackChance = 80,
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
	{ text = "Quisavu tukavi!", yell = false },
	{ text = "Si siyoqua jamjam!", yell = false },
	{ text = "Achuq! jinuma!", yell = false },
	{ text = "Si ji jusipa!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 79590, maxCount = 20 },
	{ id = "short sword", chance = 4810 },
	{ id = "bone shield", chance = 1030 },
	{ id = "fish", chance = 19370 }, -- fish
	{ id = "northern pike", chance = 60 },
	{ id = "rainbow trout", chance = 50 },
	{ id = "green perch", chance = 100 },
	{ id = "mammoth whopper", chance = 130 },
	{ id = "fireproof horn", chance = 350 },
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -30 },
}

monster.defenses = {
	defense = 10,
	armor = 9,
	mitigation = 0.33,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -15 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 25 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 100 },
	{ type = COMBAT_HOLYDAMAGE, percent = 10 },
	{ type = COMBAT_DEATHDAMAGE, percent = -5 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = false },
	{ type = "bleed", condition = false },
}

mType:register(monster)