-- Version: 7.9
-- Monster: https://tibia.fandom.com/wiki/Diabolic_Imp
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Diabolic_Imp
---


local mType = Game.createMonsterType("Diabolic Imp")
local monster = {}

monster.description = "a diabolic imp"
monster.experience = 2900
monster.outfit = {
	lookType = 237,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 1950
monster.maxHealth = 1950
monster.race = "fire"
monster.corpse = 6363
monster.speed = 105
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
	staticAttackChance = 90,
	targetDistance = 4,
	runHealth = 400,
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
	{ text = "Muahaha!", yell = false },
	{ text = "He he he.", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 99406, minCount = 1, maxCount = 200 },  -- 2148
	{ id = "pitchfork", chance = 50620 },  -- 2548
	{ id = "concentrated demonic blood", chance = 24722 },  -- todo: flask of demonic blood does not exist in items.xml
	{ id = "blank rune", chance = 14952, minCount = 1, maxCount = 2 },  -- 2260
	{ id = "cleaver", chance = 8917 },  -- 2568
	{ id = "guardian shield", chance = 8335 },  -- 2515
	{ id = "demonic essence", chance = 7754 },  -- 6500
	{ id = "soul orb", chance = 6940 },  -- 5944
	{ id = 2419, chance = 5350 },  -- scimitar
	{ id = "platinum coin", chance = 3438, minCount = 1, maxCount = 7 },  -- 2152
	{ id = "stealth ring", chance = 2727 },  -- 2165
	{ id = "small amethyst", chance = 2546, minCount = 1, maxCount = 3 },  -- 2150
	{ id = "double axe", chance = 1758 },  -- 2387
	{ id = "necrotic rod", chance = 801 },  -- 2185
	{ id = "magma monocle", chance = 530 },  -- 7900
	{ id = "magma coat", chance = 323 },  -- 7899
	{ id = 6300, chance = 103 },  -- death ring
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -240, condition = { type = CONDITION_POISON, totalDamage = 160, interval = 4000 } },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_FIREDAMAGE, minDamage = -100, maxDamage = -240, range = 7, radius = 4, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = true },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_FIREDAMAGE, minDamage = -300, maxDamage = -430, range = 7, radius = 2, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREATTACK, target = true },
	{ name = "diabolic imp skill reducer", interval = 2000, chance = 5, range = 5, target = false },
}

monster.defenses = {
	defense = 25,
	armor = 29,
	mitigation = 1.46,
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_HEALING, minDamage = 650, maxDamage = 800, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "speed", interval = 2000, chance = 15, effect = CONST_ME_MAGIC_RED, speed = 210},
	{ name = "invisible", interval = 2000, chance = 10, effect = CONST_ME_TELEPORT },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 50 },
	{ type = COMBAT_FIREDAMAGE, percent = 100 },
	{ type = COMBAT_LIFEDRAIN, percent = 100 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -10 },
	{ type = COMBAT_HOLYDAMAGE, percent = -5 },
	{ type = COMBAT_DEATHDAMAGE, percent = 10 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)