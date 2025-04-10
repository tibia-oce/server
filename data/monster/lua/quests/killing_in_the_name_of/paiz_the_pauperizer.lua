-- Version: 9.50
-- Monster: https://tibia.fandom.com/wiki/Paiz_the_Pauperizer
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Paiz_the_Pauperizer
---


local mType = Game.createMonsterType("Paiz the Pauperizer")
local monster = {}

monster.description = "Paiz the Pauperizer"
monster.experience = 6300
monster.outfit = {
	lookType = 362,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.health = 8500
monster.maxHealth = 8500
monster.race = "blood"
monster.corpse = 11653
monster.speed = 140
monster.manaCost = 0

monster.changeTarget = {
	interval = 5000,
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
	rewardBoss = true,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = true,
	canWalkOnPoison = false}

monster.light = {
	level = 3,
	color = 161,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "You will die zhouzandz deazhz!", yell = false },
	{ text = "For ze emperor!", yell = false },
}

monster.loot = {
	{ id = "broken draken mail", chance = 100000 },  -- 12616
	{ id = "broken slicer", chance = 100000 },  -- 12617
	{ id = "draken sulphur", chance = 100000 },  -- 12614
	{ id = "draken wristbands", chance = 100000 },  -- 12615
	{ id = "gold coin", chance = 100000, minCount = 1, maxCount = 99 },  -- 2148
	{ id = "lizard scale", chance = 100000 },  -- 5881
	{ id = "meat", chance = 100000 },  -- 2666
	{ id = "platinum coin", chance = 100000, minCount = 1, maxCount = 10 },  -- 2152
	{ id = "magic sulphur", chance = 43243 },  -- 5904
	{ id = "great mana potion", chance = 41892, minCount = 1, maxCount = 3 },  -- 7590
	{ id = "yellow gem", chance = 37838 },  -- 2154
	{ id = "red gem", chance = 31081 },  -- 2156
	{ id = "great health potion", chance = 29730, minCount = 1, maxCount = 3 },  -- 7591
	{ id = "great spirit potion", chance = 28378, minCount = 1, maxCount = 3 },  -- 8472
	{ id = "sai", chance = 25676 },  -- 11306
	{ id = "Zaoan armor", chance = 18919 },
	{ id = "green gem", chance = 17568 },  -- 2155
	{ id = "Zaoan sword", chance = 16216 },
	{ id = "swamplair armor", chance = 14865 },  -- 8880
	{ id = "twiceslicer", chance = 10811 },  -- 12613
	{ id = "dragon scale mail", chance = 9459 },  -- 2492
	{ id = "blue gem", chance = 8108 },  -- 2158
	{ id = "elite draken mail", chance = 6757 },  -- 12607
	{ id = "small emerald", chance = 5405, minCount = 3, maxCount = 8 },  -- 2149
	{ id = "harness", chance = 2703 },  -- 13294
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -450 },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_FIREDAMAGE, minDamage = -240, maxDamage = -550, length = 5, spread = 3, effect = CONST_ME_EXPLOSIONHIT, target = false },
	{ name = "combat", interval = 2000, chance = 12, type = COMBAT_FIREDAMAGE, minDamage = -200, maxDamage = -350, range = 7, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = false },
	{ name = "combat", interval = 2000, chance = 12, type = COMBAT_EARTHDAMAGE, minDamage = -280, maxDamage = -450, range = 4, radius = 4, shootEffect = CONST_ANI_EARTH, effect = CONST_ME_POFF, target = true },
	{ name = "soulfire rune", interval = 2000, chance = 10, target = false },
	-- poison
	{ name = "condition", type = CONDITION_POISON, interval = 2000, chance = 11, minDamage = -20, maxDamage = -20, range = 7, shootEffect = CONST_ANI_POISON, target = false },
}

monster.defenses = {
	defense = 35,
	armor = 35,
	mitigation = 2.00,
	{ name = "combat", interval = 2000, chance = 25, type = COMBAT_HEALING, minDamage = 230, maxDamage = 330, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 10 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 40 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 100 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)