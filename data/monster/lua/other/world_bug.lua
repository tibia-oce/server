local mType = Game.createMonsterType("World Bug")
local monster = {}

monster.name = "World Bug"
monster.description = "a world bug"
monster.experience = 50
monster.outfit = {
	lookType = 45,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 270
monster.maxHealth = 270
monster.runHealth = 0
monster.race = "venom"
monster.corpse = 5990
monster.speed = 240
monster.summonCost = 0

monster.changeTarget = {
	interval = 2000,
	chance = 0
}

monster.flags = {
	attackable = true,
	hostile = true,
	summonable = false,
	convinceable = false,
	illusionable = false,
	boss = false,
	ignoreSpawnBlock = false,
	pushable = true,
	canPushItems = false,
	canPushCreatures = false,
	staticAttackChance = 90,
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
	interval = 2000,
	chance = 7,
	{text = "My father was a year 2k bug.", yell = false},
	{text = "Psst, I'll make you rich.", yell = false},
	{text = "You are bugged ... by me!", yell = false}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -35},
	{name ="combat", interval = 1000, chance = 13, type = COMBAT_ENERGYDAMAGE, minDamage = -5, maxDamage = -35, length = 4, spread = 0, effect = CONST_ME_ENERGYHIT}
}

monster.defenses = {
	defense = 15,
	armor = 15,
	{name ="invisible", interval = 4000, chance = 27, duration = 4000, effect = CONST_ME_MAGIC_BLUE}
}

monster.maxSummons = 10
monster.summons = {
	{name = "world bug", chance = 15, interval = 1000, max = 10}
}

monster.loot = {
	{id = "gold coin", chance = 100000, maxCount = 11},
	{id = 6570, chance = 6000, description2 = "surprise bag (blue)"},
	{id = 6571, chance = 800, description2 = "surprise bag (red)"}
}

mType:register(monster)
