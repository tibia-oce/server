-- Version: 6.1
-- Monster: https://tibia.fandom.com/wiki/Dwarf
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Dwarf
---


local mType = Game.createMonsterType("Dwarf")
local monster = {}

monster.description = "a dwarf"
monster.experience = 45
monster.outfit = {
	lookType = 69,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 90
monster.maxHealth = 90
monster.race = "blood"
monster.corpse = 6007
monster.speed = 85
monster.manaCost = 320

monster.changeTarget = {
	interval = 4000,
	chance = 0,
}

monster.strategiesTarget = {
	nearest = 100,
}

monster.flags = {
	summonable = true,
	attackable = true,
	hostile = true,
	convinceable = true,
	pushable = true,
	rewardBoss = false,
	illusionable = true,
	canPushItems = false,
	canPushCreatures = false,
	staticAttackChance = 90,
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
	{ text = "Hail Durin!", yell = false },
}

monster.loot = {
	{ id = "white mushroom", chance = 50085 },  -- 2787
	{ id = "gold coin", chance = 35223, minCount = 1, maxCount = 8 },  -- 2148
	{ id = "hatchet", chance = 24705 },  -- 2388
	{ id = "axe", chance = 14610 },  -- 2386
	{ id = 2553, chance = 10137 },  -- pick
	{ id = "copper shield", chance = 10088 },  -- 2530
	{ id = "leather legs", chance = 9731 },  -- 2649
	{ id = "studded armor", chance = 8040 },  -- 2484
	{ id = 2597, chance = 7960 },  -- letter
	{ id = "dwarven ring", chance = 103 },  -- 2213
	{ id = "iron ore", chance = 82 },  -- 5880
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -30 },
}

monster.defenses = {
	defense = 10,
	armor = 8,
	mitigation = 0.36,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 10 },
	{ type = COMBAT_FIREDAMAGE, percent = -5 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = -5 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = false },
	{ type = "bleed", condition = false },
}

mType:register(monster)