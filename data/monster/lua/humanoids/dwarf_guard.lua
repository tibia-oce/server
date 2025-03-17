-- Version: 6.1
-- Monster: https://tibia.fandom.com/wiki/Dwarf_Guard
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Dwarf_Guard
---


local mType = Game.createMonsterType("Dwarf Guard")
local monster = {}

monster.description = "a dwarf guard"
monster.experience = 165
monster.outfit = {
	lookType = 70,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 245
monster.maxHealth = 245
monster.race = "blood"
monster.corpse = 6013
monster.speed = 103
monster.manaCost = 650

monster.changeTarget = {
	interval = 4000,
	chance = 10,
}

monster.strategiesTarget = {
	nearest = 70,
	damage = 20,
	random = 10,
}

monster.flags = {
	summonable = true,
	attackable = true,
	hostile = true,
	convinceable = true,
	pushable = false,
	rewardBoss = false,
	illusionable = true,
	canPushItems = true,
	canPushCreatures = true,
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
	{ id = "white mushroom", chance = 55168, minCount = 1, maxCount = 2 },  -- 2787
	{ id = "leather boots", chance = 40112 },  -- 2643
	{ id = "gold coin", chance = 39998, minCount = 1, maxCount = 30 },  -- 2148
	{ id = "scale armor", chance = 8993 },  -- 2483
	{ id = "battle shield", chance = 5999 },  -- 2513
	{ id = "battle hammer", chance = 3843 },  -- 2417
	{ id = "steel helmet", chance = 1539 },  -- 2457
	{ id = "double axe", chance = 617 },  -- 2387
	{ id = "iron ore", chance = 475 },  -- 5880
	{ id = "health potion", chance = 388 },  -- 7618
	{ id = "axe ring", chance = 204 },  -- 2208
	{ id = 13757, chance = 184 },  -- coal
	{ id = "small amethyst", chance = 117 },  -- 2150
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -140 },
}

monster.defenses = {
	defense = 30,
	armor = 15,
	mitigation = 1.02,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 20 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 20 },
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
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)