-- Version: 9.60
-- Monster: https://tibia.fandom.com/wiki/Lost_Berserker
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Lost_Berserker
---


local mType = Game.createMonsterType("Lost Berserker")
local monster = {}

monster.description = "a lost berserker"
monster.experience = 4800
monster.outfit = {
	lookType = 496,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 5900
monster.maxHealth = 5900
monster.race = "blood"
monster.corpse = 16071
monster.speed = 150
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 15,
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
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Kill! Kiill! Kill!", yell = false },
	{ text = "Death! Death! Death!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 100000, minCount = 2, maxCount = 200 },  -- 2148
	{ id = "platinum coin", chance = 99973, minCount = 1, maxCount = 9 },  -- 2152
	{ id = "brown mushroom", chance = 15282, minCount = 1, maxCount = 2 },  -- 2789
	{ id = "great mana potion", chance = 13995 },  -- 7590
	{ id = "great health potion", chance = 13729 },  -- 7591
	{ id = "iron ore", chance = 8706 },  -- 5880
	{ id = "small topaz", chance = 8138, minCount = 1, maxCount = 2 },  -- 9970
	{ id = "drill bolt", chance = 8076, minCount = 1, maxCount = 10 },  -- 18436
	{ id = "brown crystal splinter", chance = 7668, minCount = 1, maxCount = 2 },  -- 18417
	{ id = "green crystal fragment", chance = 6798 },  -- 18421
	{ id = "blue crystal splinter", chance = 4766 },  -- 18418
	{ id = "piggy bank", chance = 4011 },  -- 2114
	{ id = "violet crystal shard", chance = 3701 },  -- 18414
	{ id = "dwarven ring", chance = 2423 },  -- 2213
	{ id = "knight axe", chance = 2334 },  -- 2430
	{ id = 13757, chance = 1997 },  -- coal
	{ id = "guardian shield", chance = 1429 },  -- 2515
	{ id = "clay lump", chance = 1038 },  -- 11339
	{ id = "tower shield", chance = 861 },  -- 2528
	{ id = "spiked squelcher", chance = 843 },  -- 7452
	{ id = "magic sulphur", chance = 719 },  -- 5904
	{ id = "black shield", chance = 657 },  -- 2529
	{ id = "terra boots", chance = 657 },  -- 7886
	{ id = "fire axe", chance = 479 },  -- 2432
	{ id = "chaos mace", chance = 453 },  -- 7427
	{ id = "royal helmet", chance = 248 },  -- 2498
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -501 },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -300, range = 7, shootEffect = CONST_ANI_WHIRLWINDAXE, target = false },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -250, range = 7, radius = 3, shootEffect = CONST_ANI_EXPLOSION, effect = CONST_ME_EXPLOSIONAREA, target = true },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_MANADRAIN, minDamage = -50, maxDamage = -100, radius = 5, effect = CONST_ME_MAGIC_RED, target = false },
	{ name = "speed", interval = 2000, chance = 10, speed = -800, radius = 2, effect = CONST_ME_MAGIC_RED, target = false, duration = 20000 },
}

monster.defenses = {
	defense = 40,
	armor = 80,
	mitigation = 2.40,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 20 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 100 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = 10 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 10 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 15 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = false },
	{ type = "bleed", condition = false },
}

mType:register(monster)