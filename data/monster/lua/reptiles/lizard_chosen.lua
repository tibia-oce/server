-- Version: 8.54
-- Monster: https://tibia.fandom.com/wiki/Lizard_Chosen
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Lizard_Chosen
---


local mType = Game.createMonsterType("Lizard Chosen")
local monster = {}

monster.description = "a lizard chosen"
monster.experience = 2200
monster.outfit = {
	lookType = 344,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 3050
monster.maxHealth = 3050
monster.race = "blood"
monster.corpse = 11288
monster.speed = 136
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
	staticAttackChance = 80,
	targetDistance = 1,
	runHealth = 50,
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
	{ text = "Grzzzzzzz!", yell = false },
	{ text = "Kzzzzzzz!", yell = false },
	{ text = "Garrrblarrrrzzzz!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 97520, minCount = 1, maxCount = 236 },  -- 2148
	{ id = "spiked iron ball", chance = 10021 },  -- 11325
	{ id = "great health potion", chance = 6890, minCount = 1, maxCount = 3 },  -- 7591
	{ id = "cursed shoulder spikes", chance = 5951 },  -- 11327
	{ id = "platinum coin", chance = 3014, minCount = 1, maxCount = 5 },  -- 2152
	{ id = "scale of corruption", chance = 2988 },  -- 12629
	{ id = "corrupted flag", chance = 2972 },  -- 11326
	{ id = "small diamond", chance = 2547, minCount = 1, maxCount = 5 },  -- 2145
	{ id = "lizard leather", chance = 2006 },  -- 5876
	{ id = "tower shield", chance = 1111 },  -- 2528
	{ id = "lizard scale", chance = 1044 },  -- 5881
	{ id = "Zaoan armor", chance = 985 },
	{ id = "Zaoan legs", chance = 895 },
	{ id = "Zaoan shoes", chance = 798 },
	{ id = "Zaoan helmet", chance = 130 },
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -360 },
	-- poison
	{ name = "condition", type = CONDITION_POISON, interval = 2000, chance = 15, minDamage = -240, maxDamage = -320, length = 3, spread = 2, effect = CONST_ME_POISONAREA, target = false },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_EARTHDAMAGE, minDamage = -190, maxDamage = -340, radius = 3, effect = CONST_ME_HITBYPOISON, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_EARTHDAMAGE, minDamage = -90, maxDamage = -180, length = 8, spread = 3, effect = CONST_ME_GREEN_RINGS, target = false },
}

monster.defenses = {
	defense = 45,
	armor = 28,
	mitigation = 0.94,
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_HEALING, minDamage = 75, maxDamage = 125, effect = CONST_ME_MAGIC_GREEN, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 20 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = 10 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 10 },
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
