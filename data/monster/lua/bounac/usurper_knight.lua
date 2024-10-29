local mType = Game.createMonsterType("Usurper Knight")
local monster = {}

monster.description = "a usurper knight"
monster.experience = 6900
monster.outfit = {
	lookType = 1060,
	lookHead = 76,
	lookBody = 57,
	lookLegs = 76,
	lookFeet = 95,
	lookAddons = 1,
	lookMount = 0
}


monster.health = 8200
monster.maxHealth = 8200
monster.race = "blood"
monster.corpse = 26691
monster.speed = 330


monster.changeTarget = {
	interval = 4000,
	chance = 10
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
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "This town is ours now!", yell = false},
	{text = "You don't deserv Bounac!", yell = false},
	{text = "My power is fueled by a just cause!", yell = false},
	{text = "This will be the last thing you witness!", yell = false},
	{text = "Change of guard! High time ...!", yell = false},
	{text = "Do you really think you can stand?", yell = false},
	{text = "'Holding breath'", yell = false},
	{text = "Die in the flames of true righteousness.", yell = false}
}

monster.loot = {
	{id = "platinum coin", chance = 89725, maxCount = 5},
	{id = "leather legs", chance = 27060},
	{id = "meat", chance = 16582},
	{id = "lion cloak patch", chance = 11190},
	{id = "violet gem", chance = 6002},
	{id = "gold ingot", chance = 5799},
	{id = "lion crest", chance = 5697},
	{id = "knight legs", chance = 5290},
	{id = "great mana potion", chance = 4680},
	{id = "blue gem", chance = 4171},
	{id = "green gem", chance = 2238},
	{id = "magma legs", chance = 610}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -500, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 6000, chance = 14, type = COMBAT_DEATHDAMAGE, minDamage = -150, maxDamage = -300, radius = 3, effect = CONST_ME_MORTAREA, target = false},
	{name ="combat", interval = 6000, chance = 20, type = COMBAT_ICEDAMAGE, minDamage = -150, maxDamage = -400, length = 4, spread = 0, effect = CONST_ME_ICEATTACK, target = false},
	{name ="singlecloudchain", interval = 8000, chance = 17, minDamage = -200, maxDamage = -450, range = 4, effect = CONST_ME_ENERGYHIT, target = true}
}

monster.defenses = {
	defense = 86,
	armor = 83,
	{name ="combat", interval = 4000, chance = 40, type = COMBAT_HEALING, minDamage = 200, maxDamage = 550, effect = 185, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 35},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 10},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 20},
	{type = COMBAT_HOLYDAMAGE , percent = 15},
	{type = COMBAT_DEATHDAMAGE , percent = -15}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
