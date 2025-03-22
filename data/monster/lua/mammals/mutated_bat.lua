-- Version: 8.40
-- Monster: https://tibia.fandom.com/wiki/Mutated_Bat
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Mutated_Bat
---


local mType = Game.createMonsterType("Mutated Bat")
local monster = {}

monster.description = "a mutated bat"
monster.experience = 750
monster.outfit = {
	lookType = 307,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 900
monster.maxHealth = 900
monster.race = "blood"
monster.corpse = 9829
monster.speed = 93
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
	runHealth = 300,
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
	{ text = "Shriiiiiek", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 92550, minCount = 1, maxCount = 130 },  -- 2148
	{ id = 9808, chance = 12633, minCount = 1, maxCount = 2 },  -- rusty armor
	{ id = "battle shield", chance = 7801 },  -- 2513
	{ id = "obsidian lance", chance = 7114 },  -- 2425
	{ id = "bat wing", chance = 5102, minCount = 1, maxCount = 2 },  -- 5894
	{ id = "star herb", chance = 5046 },  -- 2800
	{ id = "mutated bat ear", chance = 5004 },  -- 10579
	{ id = "energy ring", chance = 916 },  -- 2167
	{ id = "black pearl", chance = 788, minCount = 1, maxCount = 3 },  -- 2144
	{ id = "small amethyst", chance = 498, minCount = 1, maxCount = 2 },  -- 2150
	{ id = "mercenary sword", chance = 117 },  -- 7386
	{ id = "black shield", chance = 109 },  -- 2529
	{ id = "batwing hat", chance = 104 },  -- 10016
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -168, condition = { type = CONDITION_POISON, totalDamage = 120, interval = 4000 } },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_EARTHDAMAGE, minDamage = -70, maxDamage = -180, range = 7, shootEffect = CONST_ANI_POISON, target = false },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_DROWNDAMAGE, minDamage = -30, maxDamage = -90, radius = 6, effect = CONST_ME_SOUND_WHITE, target = false },
	{ name = "mutated bat curse", interval = 2000, chance = 10, target = false },
	-- poison
	{ name = "condition", type = CONDITION_POISON, interval = 2000, chance = 15, minDamage = -190, maxDamage = -240, length = 4, spread = 3, effect = CONST_ME_POISONAREA, target = false },
}

monster.defenses = {
	defense = 20,
	armor = 19,
	mitigation = 1.74,
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_HEALING, minDamage = 80, maxDamage = 95, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 100 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 100 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)