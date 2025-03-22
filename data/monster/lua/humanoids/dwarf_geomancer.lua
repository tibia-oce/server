-- Version: 7.0
-- Monster: https://tibia.fandom.com/wiki/Dwarf_Geomancer
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Dwarf_Geomancer
---


local mType = Game.createMonsterType("Dwarf Geomancer")
local monster = {}

monster.description = "a dwarf geomancer"
monster.experience = 265
monster.outfit = {
	lookType = 66,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 380
monster.maxHealth = 380
monster.race = "blood"
monster.corpse = 6015
monster.speed = 100
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10,
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
	illusionable = true,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 70,
	targetDistance = 4,
	runHealth = 110,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = true,
	canWalkOnPoison = false}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Hail Durin!", yell = false },
	{ text = "Earth is the strongest element.", yell = false },
	{ text = "Dust to dust.", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 75224, minCount = 1, maxCount = 45 },  -- 2148
	{ id = "white mushroom", chance = 59304, minCount = 1, maxCount = 2 },  -- 2787
	{ id = "blank rune", chance = 33568 },  -- 2260
	{ id = "pear", chance = 24968 },  -- 2673
	{ id = 2162, chance = 13828 },  -- magic light wand
	{ id = "geomancer's robe", chance = 8024 },  -- 12414
	{ id = "geomancer's staff", chance = 6573 },  -- 12419
	{ id = "clerical mace", chance = 1003 },  -- 2423
	{ id = "dwarven ring", chance = 704 },  -- 2213
	{ id = "small sapphire", chance = 598 },  -- 2146
	{ id = 2175, chance = 512 },  -- spellbook
	{ id = "terra boots", chance = 405 },  -- 7886
	{ id = "iron ore", chance = 320 },  -- 5880
}

monster.attacks = {
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_EARTHDAMAGE, minDamage = -50, maxDamage = -110, range = 7, shootEffect = CONST_ANI_SMALLEARTH, effect = CONST_ME_GREEN_RINGS, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_MANADRAIN, minDamage = -50, maxDamage = -80, range = 7, target = false },
}

monster.defenses = {
	defense = 15,
	armor = 15,
	mitigation = 0.91,
	{ name = "combat", interval = 2000, chance = 40, type = COMBAT_HEALING, minDamage = 75, maxDamage = 125, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 10 },
	{ type = COMBAT_EARTHDAMAGE, percent = 20 },
	{ type = COMBAT_FIREDAMAGE, percent = 60 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -5 },
	{ type = COMBAT_HOLYDAMAGE, percent = 10 },
	{ type = COMBAT_DEATHDAMAGE, percent = -10 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)