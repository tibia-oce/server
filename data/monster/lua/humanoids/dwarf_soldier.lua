-- Version: 6.1
-- Monster: https://tibia.fandom.com/wiki/Dwarf_Soldier
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Dwarf_Soldier
---


local mType = Game.createMonsterType("Dwarf Soldier")
local monster = {}

monster.description = "a dwarf soldier"
monster.experience = 70
monster.outfit = {
	lookType = 71,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 135
monster.maxHealth = 135
monster.race = "blood"
monster.corpse = 6014
monster.speed = 88
monster.manaCost = 360

monster.changeTarget = {
	interval = 4000,
	chance = 10,
}

monster.strategiesTarget = {
	nearest = 100,
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
	{ id = "white mushroom", chance = 39971, minCount = 1, maxCount = 2 },  -- 2787
	{ id = 2543, chance = 37961, minCount = 1, maxCount = 7 },  -- bolt
	{ id = "gold coin", chance = 28408, minCount = 1, maxCount = 12 },  -- 2148
	{ id = "soldier helmet", chance = 11810 },  -- 2481
	{ id = 2554, chance = 10030 },  -- shovel
	{ id = "chain armor", chance = 7506 },  -- 2464
	{ id = 7363, chance = 3803, minCount = 1, maxCount = 3 },  -- piercing bolt
	{ id = "dwarven shield", chance = 3046 },  -- 2525
	{ id = "crossbow", chance = 3011 },  -- 2455
	{ id = "battle axe", chance = 2483 },  -- 2378
	{ id = "iron ore", chance = 309 },  -- 5880
	{ id = "axe ring", chance = 114 },  -- 2208
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -70 },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -60, range = 7, shootEffect = CONST_ANI_BOLT, target = false },
}

monster.defenses = {
	defense = 15,
	armor = 9,
	mitigation = 0.51,
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