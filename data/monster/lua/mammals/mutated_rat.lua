-- Version: 8.40
-- Monster: https://tibia.fandom.com/wiki/Mutated_Rat
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Mutated_Rat
---


local mType = Game.createMonsterType("Mutated Rat")
local monster = {}

monster.description = "a mutated rat"
monster.experience = 450
monster.outfit = {
	lookType = 305,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 550
monster.maxHealth = 550
monster.race = "blood"
monster.corpse = 9871
monster.speed = 115
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
	canPushCreatures = true,
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
	{ text = "Grrrrrrrrrrrrrr!", yell = false },
	{ text = "Fcccccchhhhhh", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 78678, minCount = 1, maxCount = 130 },  -- 2148
	{ id = 2229, chance = 20272 },  -- skull
	{ id = "stone herb", chance = 4884 },  -- 2799
	{ id = "mutated rat tail", chance = 3850 },  -- 10585
	{ id = "plate shield", chance = 3778 },  -- 2510
	{ id = 2381, chance = 2936 },  -- halberd
	{ id = "green mushroom", chance = 1404 },  -- 2796
	{ id = "mouldy cheese", chance = 942 },  -- 2235
	{ id = "stealth ring", chance = 569 },  -- 2165
	{ id = "health potion", chance = 502 },  -- 7618
	{ id = "spellbook of enlightenment", chance = 294 },  -- 8900
	{ id = "tower shield", chance = 51 },  -- 2528
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -158, condition = { type = CONDITION_POISON, totalDamage = 100, interval = 4000 } },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_EARTHDAMAGE, minDamage = -45, maxDamage = -85, range = 7, shootEffect = CONST_ANI_POISON, effect = CONST_ME_POISONAREA, target = false },
	-- poison
	{ name = "condition", type = CONDITION_POISON, interval = 2000, chance = 10, minDamage = -80, maxDamage = -100, length = 5, spread = 3, effect = CONST_ME_POISONAREA, target = false },
	{ name = "speed", interval = 2000, chance = 10, speed = -600, range = 7, effect = CONST_ME_MAGIC_RED, target = true, duration = 30000 },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_LIFEDRAIN, minDamage = -30, maxDamage = -70, range = 7, radius = 3, effect = CONST_ME_MAGIC_RED, target = false },
	-- poison
	{ name = "condition", type = CONDITION_POISON, interval = 2000, chance = 10, range = 7, radius = 3, effect = CONST_ME_POISONAREA, target = false },
}

monster.defenses = {
	defense = 15,
	armor = 32,
	mitigation = 0.99,
	{ name = "combat", interval = 2000, chance = 5, type = COMBAT_HEALING, minDamage = 80, maxDamage = 95, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = -10 },
	{ type = COMBAT_LIFEDRAIN, percent = 100 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 100 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 10 },
	{ type = COMBAT_DEATHDAMAGE, percent = 100 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)