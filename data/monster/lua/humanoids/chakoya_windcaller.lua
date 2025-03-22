-- Version: 8.00
-- Monster: https://tibia.fandom.com/wiki/Chakoya_Windcaller
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Chakoya_Windcaller
---


local mType = Game.createMonsterType("Chakoya Windcaller")
local monster = {}

monster.description = "a chakoya windcaller"
monster.experience = 48
monster.outfit = {
	lookType = 260,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 84
monster.maxHealth = 84
monster.race = "blood"
monster.corpse = 7320
monster.speed = 71
monster.manaCost = 305

monster.changeTarget = {
	interval = 60000,
	chance = 0,
}

monster.strategiesTarget = {
	nearest = 100,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = true,
	pushable = false,
	rewardBoss = false,
	illusionable = false,
	canPushItems = false,
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 4,
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
	{ text = "Siqsiq ji jusipa!", yell = false },
	{ text = "Jagura taluka taqua!", yell = false },
	{ text = "Mupi! Si siyoqua jinuma!", yell = false },
	{ text = "Quatu nguraka!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 72228, minCount = 1, maxCount = 27 },  -- 2148
	{ id = 2667 , chance = 29612, minCount = 1, maxCount = 3 },  -- fish
	{ id = "brass helmet", chance = 4684 },  -- 2460
	{ id = "bone shield", chance = 1032 },  -- 2541
	{ id = "fireproof horn", chance = 479 },  -- 22727
	{ id = "green perch", chance = 120 },  -- 7159
	{ id = "northern pike", chance = 75 },  -- 2669
	{ id = "rainbow trout", chance = 45 },  -- 7158
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -22 },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_ICEDAMAGE, minDamage = -16, maxDamage = -32, range = 7, shootEffect = CONST_ANI_ICE, target = false },
	-- freeze
	{ name = "condition", type = CONDITION_FREEZING, interval = 2000, chance = 10, minDamage = -130, maxDamage = -160, radius = 3, effect = CONST_ME_ICEAREA, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_ICEDAMAGE, minDamage = -9, maxDamage = -30, length = 5, spread = 2, effect = CONST_ME_ICEAREA, target = false },
}

monster.defenses = {
	defense = 10,
	armor = 7,
	mitigation = 0.38,
	{ name = "invisible", interval = 2000, chance = 15, effect = CONST_ME_MAGIC_BLUE },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -15 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 50 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 100 },
	{ type = COMBAT_HOLYDAMAGE, percent = 20 },
	{ type = COMBAT_DEATHDAMAGE, percent = -8 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = false },
	{ type = "bleed", condition = false },
}

mType:register(monster)