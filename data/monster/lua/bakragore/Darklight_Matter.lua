local mType = Game.createMonsterType("Darklight Matter")
local monster = {}

monster.description = "a Darklight Matter"
monster.experience = 20600
monster.outfit = {
	lookType = 1071,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}



monster.health = 30150
monster.maxHealth = 30150
monster.race = "undead"
monster.corpse = 26691
monster.speed = 430
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
	{id = "ultimate health potion", chance = 32220, maxCount = 7},
	{id = "wand of starstorm", chance = 74560},
	{id = "violet gem", chance = 74560},
	{id = "terra helmet", chance = 1190},
	{id = "green gem", chance = 64560},
	{id = "blue gem", chance = 54560},
	{id = "golden armor", chance = 3000},
	{id = "wand of voodoo", chance = 21920},
	{id = "wand of defiance", chance = 10000, maxCount = 3},
	{id = 27437, chance = 15000},
	{id = 27438, chance = 13500},
	{id = 28330, chance = 500},
	{id = 27427, chance = 8500}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -800},
	{name ="combat", interval = 4000, chance = 15, type = COMBAT_ENERGYDAMAGE, minDamage = -800, maxDamage = -1300, range = 7, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_ENERGYHIT, target = true},
	{name ="combat", interval = 3000, chance = 20, type = COMBAT_ENERGYDAMAGE, minDamage = -400, maxDamage = -750, radius = 4, effect = CONST_ME_ENERGYHIT, target = false},
	{name ="combat", interval = 2000, chance = 14, type = COMBAT_HOLYDAMAGE, minDamage = -600, maxDamage = -1000, range = 7, shootEffect = CONST_ANI_SPECTRALBOLT, effect = CONST_ME_HOLYDAMAGE, target = true},
	{name ="combat", interval = 2000, chance = 24, type = COMBAT_HOLYDAMAGE, minDamage = -600, maxDamage = -1000, range = 7, radius = 3, shootEffect = CONST_ANI_SMALLHOLY, effect = CONST_ME_GROUNDSHAKER, target = true}
}

monster.defenses = {
	defense = 100,
	armor = 98
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = -10},
	{type = COMBAT_ENERGYDAMAGE, percent = 40},
	{type = COMBAT_EARTHDAMAGE, percent = -10},
	{type = COMBAT_FIREDAMAGE, percent = -25},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 20},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
