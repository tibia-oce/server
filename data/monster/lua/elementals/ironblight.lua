-- Version: 9.60
-- Monster: https://tibia.fandom.com/wiki/Ironblight
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Ironblight
---


local mType = Game.createMonsterType("Ironblight")
local monster = {}

monster.description = "an ironblight"
monster.experience = 5400
monster.outfit = {
	lookType = 498,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 6600
monster.maxHealth = 6600
monster.race = "undead"
monster.corpse = 16079
monster.speed = 143
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10,
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
	rewardBoss = false,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 70,
	targetDistance = 1,
	runHealth = 260,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = true,
	canWalkOnPoison = true}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Yowl!", yell = false },
	{ text = "Clonk!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 100000, minCount = 3, maxCount = 200 },  -- 2148
	{ id = "platinum coin", chance = 100000, minCount = 1, maxCount = 8 },  -- 2152
	{ id = "war crystal", chance = 20730 },  -- 10571
	{ id = "ultimate health potion", chance = 18755 },  -- 8473
	{ id = "crystalline spikes", chance = 17904 },  -- 18432
	{ id = "great mana potion", chance = 17329 },  -- 7590
	{ id = "shiny stone", chance = 14529 },  -- 11227
	{ id = "small amethyst", chance = 14429, minCount = 1, maxCount = 3 },  -- 2150
	{ id = "brown crystal splinter", chance = 13453, minCount = 1, maxCount = 2 },  -- 18417
	{ id = "red crystal fragment", chance = 10503 },  -- 18420
	{ id = "small emerald", chance = 10478, minCount = 1, maxCount = 3 },  -- 2149
	{ id = "green crystal shard", chance = 5451 },  -- 18415
	{ id = "crystal of balance", chance = 4976 },  -- 9942
	{ id = "red gem", chance = 3601 },  -- 2156
	{ id = "crystal of power", chance = 2051 },  -- 9980
	{ id = "springsprout rod", chance = 1500 },  -- 8912
	{ id = "terra legs", chance = 875 },  -- 7885
	{ id = "glacial rod", chance = 850 },  -- 18412
	{ id = "sapphire hammer", chance = 850 },  -- 7437
	{ id = "magic sulphur", chance = 825 },  -- 5904
	{ id = "epee", chance = 575 },  -- 2438
	{ id = "blue gem", chance = 550 },  -- 2158
	{ id = "crystal mace", chance = 425 },  -- 2445
	{ id = "jade hat", chance = 325 },  -- 11368
	{ id = "composite hornbow", chance = 200 },  -- 8855
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -300 },
	-- poison
	{ name = "condition", type = CONDITION_POISON, interval = 2000, chance = 10, minDamage = -460, maxDamage = -480, radius = 6, shootEffect = CONST_ANI_POISON, effect = CONST_ME_POISONAREA, target = false },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_ICEDAMAGE, minDamage = -260, maxDamage = -350, length = 7, spread = 0, shootEffect = CONST_ANI_ICE, effect = CONST_ME_ICEATTACK, target = false },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_EARTHDAMAGE, minDamage = -180, maxDamage = -250, radius = 2, shootEffect = CONST_ANI_GREENSTAR, effect = CONST_ME_BIGPLANTS, target = true },
	{ name = "speed", interval = 2000, chance = 10, speed = -800, length = 5, spread = 0, effect = CONST_ME_BLOCKHIT, target = false, duration = 30000 },
}

monster.defenses = {
	defense = 35,
	armor = 84,
	mitigation = 2.40,
	{ name = "invisible", interval = 2000, chance = 20, effect = CONST_ME_MAGIC_BLUE },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 15 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 25 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = 60 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 20 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 40 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)