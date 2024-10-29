local mType = Game.createMonsterType("Darklight Striker")
local monster = {}

monster.description = "a Darklight Striker"
monster.experience = 20550
monster.outfit = {
	lookType = 1087,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 29700
monster.maxHealth = 29700
monster.race = "undead"
monster.corpse = 26691
monster.speed = 420
monster.manaCost = 0



monster.changeTarget = {
	interval = 4000,
	chance = 10
}

monster.strategiesTarget = {
	nearest = 80,
	health = 10,
	damage = 10,
}
monster.events = {
	"playerAttackSound"
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

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {

}

monster.loot = {
	{id = "crystal coin", chance = 70540},
	{id = "platinum coin", chance = 81920, maxCount = 33},
	{id = "great spirit potion", chance = 51920, maxCount = 8},
	{id = "violet gem", chance = 74560},
	{id = "spellbook of warding", chance = 41920},
	{id = "umbral slayer", chance = 1500},
	{id = "springsprout rod", chance = 28920},
	{id = "umbral bow", chance = 1300},
	{id = "gold ingot", chance = 54560},
	{id = "blue robe", chance = 44560},
	{id = 27438, chance = 15000},
	{id = 27439, chance = 13500},
	{id = 28332, chance = 500}
}

monster.attacks = {
	{name ="combat", interval = 2000, chance = 17, type = COMBAT_ICEDAMAGE, minDamage = -600, maxDamage = -1100, range = 7, shootEffect = CONST_ANI_FLASHARROW, effect = CONST_ME_GROUNDSHAKER, target = true},
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_HOLYDAMAGE, minDamage = -700, maxDamage = -1100, range = 7, shootEffect = CONST_ANI_SMALLHOLY, effect = CONST_ME_HOLYDAMAGE, target = true},
	{name ="combat", interval = 3000, chance = 20, type = COMBAT_HOLYDAMAGE, minDamage = -650, maxDamage = -900, radius = 4, effect = CONST_ME_EXPLOSIONHIT, target = false},
	{name ="combat", interval = 2000, chance = 25, type = COMBAT_ICEDAMAGE, minDamage = -600, maxDamage = -1000, range = 7, shootEffect = CONST_ANI_ICE, effect = CONST_ME_ICETORNADO, target = true}
}

monster.defenses = {
	defense = 112,
	armor = 112
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 10},
	{type = COMBAT_ENERGYDAMAGE, percent = 35},
	{type = COMBAT_EARTHDAMAGE, percent = -15},
	{type = COMBAT_FIREDAMAGE, percent = -25},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 30},
	{type = COMBAT_HOLYDAMAGE , percent = 10},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
