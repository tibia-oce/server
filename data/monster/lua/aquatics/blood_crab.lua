-- Version: 7.8
-- Monster: https://tibia.fandom.com/wiki/Blood_Crab
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Blood_Crab
---


local mType = Game.createMonsterType("Blood Crab")
local monster = {}

monster.description = "a blood crab"
monster.experience = 160
monster.outfit = {
	lookType = 200,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 290
monster.maxHealth = 290
monster.race = "blood"
monster.corpse = 6075
monster.speed = 80
monster.manaCost = 505

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
	canWalkOnPoison = true}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
}

monster.loot = {
	{ id = "gold coin", chance = 85671, minCount = 1, maxCount = 20 },  -- 2148
	{ id = "fish", chance = 15551 },  -- 2667
	{ id = "bloody pincers", chance = 5976 },  -- 10550
	{ id = "chain armor", chance = 5091 },  -- 2464
	{ id = "brass legs", chance = 2107 },  -- 2478
	{ id = "white pearl", chance = 548 },  -- 2143
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -110, effect = CONST_ME_DRAWBLOOD },
}

monster.defenses = {
	defense = 28,
	armor = 28,
	mitigation = 0.46,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 5 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -5 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = -10 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 100 },
	{ type = COMBAT_ICEDAMAGE, percent = 100 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = false },
	{ type = "bleed", condition = false },
}

mType:register(monster)