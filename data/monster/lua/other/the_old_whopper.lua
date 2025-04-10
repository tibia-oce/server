local mType = Game.createMonsterType("The Old Whopper")
local monster = {}

monster.name = "The Old Whopper"
monster.description = "The Old Whopper"
monster.experience = 750
monster.outfit = {
	lookType = 277,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 785
monster.maxHealth = 785
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 7740
monster.speed = 420
monster.summonCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10
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
	canPushCreatures = true,
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
	interval = 1000,
	chance = 2,
	{text = "Han oydar hot auden oydar", yell = false}
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
	{type = COMBAT_ENERGYDAMAGE, percent = 20},
	{type = COMBAT_EARTHDAMAGE, percent = -10},
	{type = COMBAT_FIREDAMAGE, percent = 10},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 1},
	{type = COMBAT_DEATHDAMAGE , percent = -5}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -175},
	{name ="combat", interval = 2000, chance = 10, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -170, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_WHIRLWINDCLUB},
	{name ="drunk", interval = 2000, chance = 50, drunkenness = 25, duration = 34000, shootEffect = CONST_ANI_WHIRLWINDCLUB, effect = CONST_ME_STUN}
}

monster.defenses = {
	defense = 25,
	armor = 25
}

monster.loot = {
	{id = "gold coin", chance = 100000, maxCount = 100},
	{id = "club ring", chance = 90},
	{id = "battle axe", chance = 5450},
	{id = "double axe", chance = 880},
	{id = "battle hammer", chance = 5200},
	{id = "heavy machete", chance = 2000},
	{id = 2490, chance = 200},
	{id = "plate shield", chance = 2000},
	{id = "battle shield", chance = 6190},
	{id = "meat", chance = 49950},
	{id = 7398, chance = 75000},
	{id = "spiked squelcher", chance = 5150},
	{id = "strong health potion", chance = 390},
	{id = "cyclops toe", chance = 10280}
}

mType:register(monster)
