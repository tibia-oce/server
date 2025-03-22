-- Version: 9.50
-- Monster: https://tibia.fandom.com/wiki/Grave_Robber
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Grave_Robber
---


local mType = Game.createMonsterType("Grave Robber")
local monster = {}

monster.description = "a grave robber"
monster.experience = 65
monster.outfit = {
	lookType = 146,
	lookHead = 57,
	lookBody = 95,
	lookLegs = 57,
	lookFeet = 19,
	lookAddons = 3,
	lookMount = 0,
}


monster.health = 165
monster.maxHealth = 165
monster.race = "blood"
monster.corpse = 20411
monster.speed = 95
monster.manaCost = 435

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
	convinceable = true,
	pushable = true,
	rewardBoss = false,
	illusionable = false,
	canPushItems = false,
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 15,
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
}

monster.loot = {
	{ id = "gold coin", chance = 55689, minCount = 1, maxCount = 38 },  -- 2148
	{ id = "rope belt", chance = 6198 },  -- 12448
	{ id = "potato", chance = 5412, minCount = 1, maxCount = 3 },  -- 8838
	{ id = "axe", chance = 2868 },  -- 2386
	{ id = "dirty turban", chance = 1943 },  -- 12412
	{ id = "brass armor", chance = 1850 },  -- 2465
	{ id = "mace", chance = 1434 },  -- 2398
	{ id = "steel shield", chance = 786 },  -- 2509
	{ id = "iron helmet", chance = 694 },  -- 2459
	{ id = "nomad parchment", chance = 324 },  -- 8267
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -90 },
	-- poison
	{ name = "condition", type = CONDITION_POISON, interval = 2000, chance = 15, minDamage = -100, maxDamage = -160, range = 7, radius = 1, shootEffect = CONST_ANI_POISON, target = true },
}

monster.defenses = {
	defense = 15,
	armor = 7,
	mitigation = 0.38,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = -10 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 20 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -10 },
	{ type = COMBAT_HOLYDAMAGE, percent = 20 },
	{ type = COMBAT_DEATHDAMAGE, percent = -10 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = false },
	{ type = "bleed", condition = false },
}

mType:register(monster)
