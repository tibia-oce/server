-- Version: 8.54
-- Monster: https://tibia.fandom.com/wiki/Lizard_High_Guard
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Lizard_High_Guard
---


local mType = Game.createMonsterType("Lizard High Guard")
local monster = {}

monster.description = "a lizard high guard"
monster.experience = 1450
monster.outfit = {
	lookType = 337,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 1800
monster.maxHealth = 1800
monster.race = "blood"
monster.corpse = 11272
monster.speed = 119
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
	illusionable = false,
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
	{ text = "Hizzzzzzz!", yell = false },
	{ text = "To armzzzz!", yell = false },
	{ text = "Engage zze aggrezzor!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 96076, minCount = 1, maxCount = 281 },  -- 2148
	{ id = "strong health potion", chance = 11947 },  -- 7588
	{ id = "high guard shoulderplates", chance = 8120 },  -- 11333
	{ id = "great health potion", chance = 7065 },  -- 7591
	{ id = "spiked iron ball", chance = 6976 },  -- 11325
	{ id = "bunch of ripe rice", chance = 4921 },  -- 11245
	{ id = "platinum coin", chance = 4915, minCount = 1, maxCount = 2 },  -- 2152
	{ id = "high guard flag", chance = 2999 },  -- 11332
	{ id = "small emerald", chance = 2483, minCount = 1, maxCount = 4 },  -- 2149
	{ id = "red lantern", chance = 1202 },  -- 11206
	{ id = "tower shield", chance = 1030 },  -- 2528
	{ id = "lizard leather", chance = 997 },  -- 5876
	{ id = "lizard scale", chance = 958 },  -- 5881
	{ id = "Zaoan legs", chance = 729 },
	{ id = "Zaoan shoes", chance = 689 },
	{ id = "Zaoan armor", chance = 76 },
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -306 },
}

monster.defenses = {
	defense = 35,
	armor = 40,
	mitigation = 1.18,
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_HEALING, minDamage = 25, maxDamage = 75, effect = CONST_ME_MAGIC_GREEN, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = 45 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -10 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
