-- Version: 10.50
-- Monster: https://tibia.fandom.com/wiki/Devourer
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Devourer
---


local mType = Game.createMonsterType("Devourer")
local monster = {}

monster.description = "a devourer"
monster.experience = 1755
monster.outfit = {
	lookType = 617,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 1900
monster.maxHealth = 1900
monster.race = "venom"
monster.corpse = 21113
monster.speed = 100
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
	level = 4,
	color = 139,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "*gulp*", yell = false },
	{ text = "*Bruaarrr!*", yell = false },
	{ text = "*omnnommm nomm*", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 100000, minCount = 2, maxCount = 165 },  -- 2148
	{ id = "platinum coin", chance = 60028, minCount = 1, maxCount = 2 },  -- 2152
	{ id = "glob of glooth", chance = 14854 },  -- 23553
	{ id = "small emerald", chance = 6057, minCount = 1, maxCount = 3 },  -- 2149
	{ id = "small sapphire", chance = 6057, minCount = 1, maxCount = 3 },  -- 2146
	{ id = "small ruby", chance = 6037, minCount = 1, maxCount = 3 },  -- 2147
	{ id = "small topaz", chance = 6007, minCount = 1, maxCount = 3 },  -- 9970
	{ id = "small diamond", chance = 6002, minCount = 1, maxCount = 3 },  -- 2145
	{ id = "small amethyst", chance = 5929, minCount = 1, maxCount = 3 },  -- 2150
	{ id = "glooth axe", chance = 3041 },  -- 23551
	{ id = "glooth club", chance = 2994 },  -- 23549
	{ id = "glooth blade", chance = 2956 },  -- 23550
	{ id = "talon", chance = 2525 },  -- 2151
	{ id = "glooth spear", chance = 2004 },  -- 23529
	{ id = "yellow gem", chance = 1802, minCount = 1, maxCount = 2 },  -- 2154
	{ id = "springsprout rod", chance = 1221 },  -- 8912
	{ id = "glooth amulet", chance = 987 },  -- 23554
	{ id = "terra rod", chance = 707 },  -- 2181
	{ id = "glooth cape", chance = 240 },  -- 23535
	{ id = "green gem", chance = 105 },  -- 2155
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, skill = 62, attack = 50, condition = { type = CONDITION_POISON, totalDamage = 360, interval = 4000 } },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_LIFEDRAIN, minDamage = -40, maxDamage = -125, range = 7, shootEffect = CONST_ANI_POISON, effect = CONST_ME_MAGIC_RED, target = true },
	{ name = "combat", interval = 2000, chance = 8, type = COMBAT_EARTHDAMAGE, minDamage = -50, maxDamage = -160, range = 7, shootEffect = CONST_ANI_POISON, effect = CONST_ME_GREEN_RINGS, target = true },
	{ name = "devourer wave", interval = 2000, chance = 5, minDamage = -50, maxDamage = -150, target = false },
	{ name = "devourer paralyze", interval = 2000, chance = 9, target = false },
	{ name = "combat", interval = 2000, chance = 11, type = COMBAT_EARTHDAMAGE, minDamage = -50, maxDamage = -150, length = 1, spread = 0, effect = CONST_ME_SMOKE, target = false },
	{ name = "combat", interval = 2000, chance = 7, type = COMBAT_EARTHDAMAGE, minDamage = -120, maxDamage = -135, radius = 4, effect = CONST_ME_GREEN_RINGS, target = false },
}

monster.defenses = {
	defense = 25,
	armor = 45,
	mitigation = 1.46,
	{ name = "combat", interval = 2000, chance = 6, type = COMBAT_HEALING, minDamage = 100, maxDamage = 150, effect = CONST_ME_MAGIC_GREEN, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -5 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 15 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 10 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)