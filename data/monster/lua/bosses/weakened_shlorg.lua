-- Version: 10.20
-- Monster: https://tibia.fandom.com/wiki/Weakened_Shlorg
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Weakened_Shlorg
---


local mType = Game.createMonsterType("Weakened Shlorg")
local monster = {}

monster.description = "Weakened Shlorg"
monster.experience = 6500
monster.outfit = {
	lookType = 565,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.health = 10000
monster.maxHealth = 10000
monster.race = "venom"
monster.corpse = 18982
monster.speed = 135
monster.manaCost = 0

monster.changeTarget = {
	interval = 60000,
	chance = 0,
}

monster.strategiesTarget = {
	nearest = 70,
	health = 10,
	damage = 10,
	random = 10,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = false,
	rewardBoss = true,
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
	canWalkOnPoison = false}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Tchhh!", yell = false },
	{ text = "Slurp!", yell = false },
}

monster.loot = {
	{ id = "boggy dreads", chance = 100000 },  -- 10584
	{ id = "gold coin", chance = 100000, maxCount = 105 },  -- 2148
	{ id = "belted cape", chance = 75000 },  -- 8872
	{ id = "ultimate health potion", chance = 50000, maxCount = 3 },  -- 8473
	{ id = "yellow piece of cloth", chance = 50000 },  -- 5914
	{ id = "great mana potion", chance = 25000, maxCount = 3 },  -- 7590
	{ id = "great spirit potion", chance = 25000, maxCount = 3 },  -- 8472
	{ id = "green piece of cloth", chance = 25000 },  -- 5910
	{ id = "platinum coin", chance = 25000, maxCount = 5 },  -- 2152
	{ id = "serpent sword", chance = 25000 },  -- 2409
	{ id = "small emerald", chance = 25000, maxCount = 5 },  -- 2149
	{ id = "small topaz", chance = 25000, maxCount = 5 },  -- 9970
	{ id = "springsprout rod", chance = 25000 },  -- 8912
	{ id = "yellow gem", chance = 25000 },  -- 2154
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, skill = 150, attack = 50, condition = { type = CONDITION_POISON, totalDamage = 180, interval = 4000 } },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_LIFEDRAIN, minDamage = -90, maxDamage = -180, length = 4, spread = 0, effect = CONST_ME_MAGIC_GREEN, target = false },
	{ name = "combat", interval = 2000, chance = 14, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -150, radius = 5, effect = CONST_ME_GREEN_RINGS, target = false },
	-- poison
	{ name = "condition", type = CONDITION_POISON, interval = 2000, chance = 13, minDamage = -360, maxDamage = -440, radius = 5, effect = CONST_ME_GREEN_RINGS, target = false },
	{ name = "shlorg paralyze", interval = 2000, chance = 11, target = false },
}

monster.defenses = {
	defense = 15,
	armor = 10,
	{ name = "combat", interval = 2000, chance = 35, type = COMBAT_HEALING, minDamage = 95, maxDamage = 150, effect = CONST_ME_MAGIC_RED, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 5 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 40 },
	{ type = COMBAT_FIREDAMAGE, percent = 80 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -10 },
	{ type = COMBAT_HOLYDAMAGE, percent = -5 },
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)