-- Version: 10.50
-- Monster: https://tibia.fandom.com/wiki/Glooth_Anemone
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Glooth_Anemone
---


local mType = Game.createMonsterType("Glooth Anemone")
local monster = {}

monster.description = "a glooth anemone"
monster.experience = 1755
monster.outfit = {
	lookType = 604,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 2400
monster.maxHealth = 2400
monster.race = "venom"
monster.corpse = 23359
monster.speed = 90
monster.manaCost = 0

monster.changeTarget = {
	interval = 2000,
	chance = 3,
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
	canWalkOnEnergy = true,
	canWalkOnFire = false,
	canWalkOnPoison = true}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "*shglib*", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 100000, minCount = 2, maxCount = 175 },  -- 2148
	{ id = "platinum coin", chance = 60111, minCount = 1, maxCount = 3 },  -- 2152
	{ id = "slimy leaf tentacle", chance = 17932 },  -- 23568
	{ id = "bowl of glooth soup", chance = 10129 },  -- 23515
	{ id = "small topaz", chance = 8215, minCount = 1, maxCount = 4 },  -- 9970
	{ id = "small emerald", chance = 8130, minCount = 1, maxCount = 4 },  -- 2149
	{ id = "small ruby", chance = 8068, minCount = 1, maxCount = 4 },  -- 2147
	{ id = "strong mana potion", chance = 7940, minCount = 1, maxCount = 2 },  -- 7589
	{ id = "strong health potion", chance = 7455, minCount = 1, maxCount = 2 },  -- 7588
	{ id = "glooth whip", chance = 4071 },  -- 23543
	{ id = "green mushroom", chance = 2928 },  -- 2796
	{ id = "ultimate health potion", chance = 1903, minCount = 1, maxCount = 2 },  -- 8473
	{ id = "glooth axe", chance = 1029 },  -- 23551
	{ id = "glooth amulet", chance = 1025 },  -- 23554
	{ id = "glooth club", chance = 1011 },  -- 23549
	{ id = "glooth spear", chance = 1011 },  -- 23529
	{ id = "glooth blade", chance = 957 },  -- 23550
	{ id = "glooth cape", chance = 849 },  -- 23535
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, skill = 60, attack = 50 },
	{ name = "combat", interval = 2000, chance = 9, type = COMBAT_EARTHDAMAGE, minDamage = -100, maxDamage = -200, range = 7, radius = 4, shootEffect = CONST_ANI_GLOOTHSPEAR, effect = CONST_ME_HITBYPOISON, target = true },
	{ name = "combat", interval = 2000, chance = 7, type = COMBAT_LIFEDRAIN, minDamage = -50, maxDamage = -100, range = 7, radius = 1, shootEffect = CONST_ANI_POISON, effect = CONST_ME_MAGIC_RED, target = true },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_EARTHDAMAGE, radius = 5, effect = CONST_ME_MAGIC_RED, target = false },
}

monster.defenses = {
	defense = 25,
	armor = 42,
	mitigation = 1.02,
	{ name = "combat", interval = 2000, chance = 9, type = COMBAT_HEALING, minDamage = 50, maxDamage = 100, effect = CONST_ME_MAGIC_GREEN, target = false },
	{ name = "glooth anemone summon", interval = 2000, chance = 14, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 10 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = -5 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 35 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)