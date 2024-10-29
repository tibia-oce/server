local mType = Game.createMonsterType("Savage Darklight Emitter")
local monster = {}

monster.description = "a Savage Darklight Emitter"
monster.experience = 19800
monster.outfit = {
	lookType = 1074,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}



monster.health = 27500
monster.maxHealth = 27500
monster.race = "undead"
monster.corpse = 0
monster.speed = 410
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10
}
monster.events = {
	"playerAttackSound"
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
	targetDistance = 1,
	runHealth = 800,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = true,
	canWalkOnPoison = true
}

monster.getLevel = {
	minLevel = 400,
	maxLevel = 400
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {

}

monster.loot = {

}

monster.attacks = {
	{name ="combat", interval = 3000, chance = 20, type = COMBAT_EARTHDAMAGE, minDamage = -650, maxDamage = -1000, range = 7, radius = 3, shootEffect = CONST_ANI_POISONARROW, effect = CONST_ME_GREEN_RINGS, target = true},
	{name ="combat", interval = 2000, chance = 10, type = COMBAT_EARTHDAMAGE, minDamage = -600, maxDamage = -1050, length = 6, spread = 4, effect = CONST_ME_GREEN_RINGS, target = false},
	{name ="combat", interval = 3000, chance = 20, type = COMBAT_ICEDAMAGE, minDamage = -650, maxDamage = -900, radius = 3, effect = CONST_ME_ICETORNADO, target = false},
	{name ="combat", interval = 3000, chance = 20, type = COMBAT_ICEDAMAGE, minDamage = -650, maxDamage = -900, range = 7, radius = 4, effect = CONST_ME_ICEATTACK, target = true}
}

monster.defenses = {
	defense = 100,
	armor = 120
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = -15},
	{type = COMBAT_ENERGYDAMAGE, percent = -10},
	{type = COMBAT_EARTHDAMAGE, percent = 5},
	{type = COMBAT_FIREDAMAGE, percent = 40},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 25},
	{type = COMBAT_DEATHDAMAGE , percent = -20}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
