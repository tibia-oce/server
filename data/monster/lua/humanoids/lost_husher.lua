-- Version: 9.80
-- Monster: https://tibia.fandom.com/wiki/Lost_Husher
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Lost_Husher
---


local mType = Game.createMonsterType("Lost Husher")
local monster = {}

monster.description = "a lost husher"
monster.experience = 1100
monster.outfit = {
	lookType = 537,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 1600
monster.maxHealth = 1600
monster.race = "blood"
monster.corpse = 17684
monster.speed = 125
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
	runHealth = 0,
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
	{ text = "Arr far zwar!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 100000, minCount = 1, maxCount = 100 },  -- 2148
	{ id = "platinum coin", chance = 59847, minCount = 1, maxCount = 2 },  -- 2152
	{ id = "red hair dye", chance = 15354 },  -- 20135
	{ id = "brown mushroom", chance = 15166, minCount = 1, maxCount = 2 },  -- 2789
	{ id = "wimp tooth chain", chance = 12072 },  -- 20127
	{ id = 13757, chance = 11893 },  -- coal
	{ id = "holy ash", chance = 11645 },  -- 20130
	{ id = "strong health potion", chance = 10494, minCount = 1, maxCount = 3 },  -- 7588
	{ id = "great mana potion", chance = 10350, minCount = 1, maxCount = 2 },  -- 7590
	{ id = "small topaz", chance = 9829 },  -- 9970
	{ id = "lost husher's staff", chance = 9216 },  -- 20128
	{ id = "skull shatterer", chance = 9045 },  -- 20129
	{ id = "bonecarving knife", chance = 8474 },  -- 20110
	{ id = "basalt figurine", chance = 7741 },  -- 20137
	{ id = "bone fetish", chance = 7656 },  -- 20111
	{ id = "basalt fetish", chance = 5908 },  -- 20136
	{ id = "dwarven ring", chance = 2711 },  -- 2213
	{ id = "guardian shield", chance = 963 },  -- 2515
	{ id = "clay lump", chance = 887 },  -- 11339
	{ id = "knight axe", chance = 767 },  -- 2430
	{ id = "buckle", chance = 708 },  -- 20109
	{ id = "terra boots", chance = 639 },  -- 7886
	{ id = "skull staff", chance = 486 },  -- 2436
	{ id = "fire axe", chance = 273 },  -- 2432
	{ id = "spiked squelcher", chance = 273 },  -- 7452
	{ id = "terra legs", chance = 213 },  -- 7885
	{ id = "tower shield", chance = 188 },  -- 2528
}

monster.attacks = {
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_DEATHDAMAGE, minDamage = -150, maxDamage = -300, length = 6, spread = 0, effect = CONST_ME_BLACKSMOKE, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_DEATHDAMAGE, minDamage = -150, maxDamage = -200, range = 7, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_EARTHDAMAGE, minDamage = -150, maxDamage = -250, range = 7, radius = 2, shootEffect = CONST_ANI_SMALLEARTH, effect = CONST_ME_MAGIC_GREEN, target = true },
	{ name = "drunk", interval = 2000, chance = 10, radius = 4, effect = CONST_ME_SOUND_RED, target = false, duration = 6000 },
}

monster.defenses = {
	defense = 25,
	armor = 55,
	mitigation = 1.35,
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_HEALING, minDamage = 75, maxDamage = 92, effect = CONST_ME_YELLOWENERGY, target = false },
	{ name = "invisible", interval = 2000, chance = 15, effect = CONST_ME_TELEPORT },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 5 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 10 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = 25 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = -10 },
	{ type = COMBAT_DEATHDAMAGE, percent = 20 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = false },
	{ type = "bleed", condition = false },
}

mType:register(monster)