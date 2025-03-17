-- Version: 7.4
-- Monster: https://tibia.fandom.com/wiki/Bonebeast
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Bonebeast
---


local mType = Game.createMonsterType("Bonebeast")
local monster = {}

monster.description = "a bonebeast"
monster.experience = 580
monster.outfit = {
	lookType = 101,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 515
monster.maxHealth = 515
monster.race = "undead"
monster.corpse = 6030
monster.speed = 109
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
	{ text = "Knooorrrrr!", yell = false },
	{ text = "Cccchhhhhhhhh!", yell = false },
}

monster.loot = {
	{ id = 2230, chance = 49631 },  -- bone
	{ id = "gold coin", chance = 29755, minCount = 1, maxCount = 90 },  -- 2148
	{ id = 2229, chance = 19998 },  -- skull
	{ id = "bony tail", chance = 9964 },  -- 11194
	{ id = "plate armor", chance = 7959 },  -- 2463
	{ id = "bone club", chance = 4956 },  -- 2449
	{ id = "bone shield", chance = 2075 },  -- 2541
	{ id = "green mushroom", chance = 1423 },  -- 2796
	{ id = "hardened bone", chance = 1020 },  -- 5925
	{ id = "health potion", chance = 512 },  -- 7618
	{ id = "bonebeast trophy", chance = 100 },  -- 11161
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -200, condition = { type = CONDITION_POISON, totalDamage = 100, interval = 4000 } },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_EARTHDAMAGE, minDamage = -50, maxDamage = -90, range = 7, shootEffect = CONST_ANI_POISON, effect = CONST_ME_POISONAREA, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_LIFEDRAIN, minDamage = -25, maxDamage = -47, radius = 3, effect = CONST_ME_MAGIC_RED, target = false },
	-- poison
	{ name = "condition", type = CONDITION_POISON, interval = 2000, chance = 10, minDamage = -50, maxDamage = -60, radius = 3, effect = CONST_ME_POISONAREA, target = false },
	-- poison
	{ name = "condition", type = CONDITION_POISON, interval = 2000, chance = 10, minDamage = -70, maxDamage = -80, length = 6, spread = 0, effect = CONST_ME_POISONAREA, target = false },
	{ name = "speed", interval = 2000, chance = 15, speed = -600, target = true, duration = 13000 },
}

monster.defenses = {
	defense = 30,
	armor = 40,
	mitigation = 1.15,
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_HEALING, minDamage = 50, maxDamage = 60, effect = CONST_ME_HITBYPOISON, target = false },
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
	{ type = COMBAT_HOLYDAMAGE, percent = -25 },
	{ type = COMBAT_DEATHDAMAGE, percent = 100 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
