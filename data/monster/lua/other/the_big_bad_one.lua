local mType = Game.createMonsterType("The Big Bad One")
local monster = {}

monster.name = "The Big Bad One"
monster.description = "The Big Bad One"
monster.experience = 170
monster.outfit = {
	lookType = 3,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 300
monster.maxHealth = 300
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6009
monster.speed = 264
monster.summonCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 5
}

monster.flags = {
	attackable = true,
	hostile = true,
	summonable = false,
	convinceable = false,
	illusionable = false,
	boss = true,
	ignoreSpawnBlock = false,
	pushable = false,
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 80,
	targetDistance = 1,
	healthHidden = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	interval = 1000,
	chance = 2,
	{text = "Grrrrrrr", yell = false},
	{text = "Yoooohhuuuu!", yell = true}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = true},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 20},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -10},
	{type = COMBAT_HOLYDAMAGE , percent = 10},
	{type = COMBAT_DEATHDAMAGE , percent = -10}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -100}
}

monster.defenses = {
	defense = 18,
	armor = 18
}

monster.maxSummons = 2
monster.summons = {
	{name = "Wolf", chance = 40, interval = 2000, max = 2}
}

monster.loot = {
	{id = 7394, chance = 50000},
	{id = 2671, chance = 25000},
	{id = "meat", chance = 25000, maxCount = 4},
	{id = "wolf paw", chance = 15000, maxCount = 2},
	{id = "warwolf fur", chance = 5000}
}

mType:register(monster)
