-- Version: 10.30
-- Monster: https://tibia.fandom.com/wiki/Choking_Fear
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Choking_Fear
---


local mType = Game.createMonsterType("Choking Fear")
local monster = {}

monster.description = "a choking fear"
monster.experience = 4700
monster.outfit = {
	lookType = 586,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 5800
monster.maxHealth = 5800
monster.race = "undead"
monster.corpse = 20159
monster.speed = 190
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 5,
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
	canWalkOnFire = true,
	canWalkOnPoison = true}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Ah, sweet air... don't you miss it?", yell = false },
	{ text = "Murr tat muuza!", yell = false },
	{ text = "kchh", yell = false },
	{ text = "hsssss", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 100000, minCount = 1, maxCount = 100 },  -- 2148
	{ id = "platinum coin", chance = 100000, minCount = 1, maxCount = 8 },  -- 2152
	{ id = "brown crystal splinter", chance = 48943, minCount = 1, maxCount = 2 },  -- 18417
	{ id = "great mana potion", chance = 19967, minCount = 1, maxCount = 3 },  -- 7590
	{ id = "great spirit potion", chance = 19692, minCount = 1, maxCount = 3 },  -- 8472
	{ id = "ultimate health potion", chance = 19404, minCount = 1, maxCount = 3 },  -- 8473
	{ id = "hemp rope", chance = 15401 },  -- 22540
	{ id = "dead weight", chance = 14638 },  -- 22536
	{ id = "blue crystal splinter", chance = 9696, minCount = 1, maxCount = 3 },  -- 18418
	{ id = "life ring", chance = 4967 },  -- 2168
	{ id = "brown piece of cloth", chance = 4879 },  -- 5913
	{ id = "ring of healing", chance = 3541 },  -- 2214
	{ id = "beastslayer axe", chance = 3441 },  -- 3962
	{ id = "energy ring", chance = 3290 },  -- 2167
	{ id = "yellow piece of cloth", chance = 2840 },  -- 5914
	{ id = "green crystal shard", chance = 1689 },  -- 18415
	{ id = "guardian shield", chance = 1614 },  -- 2515
	{ id = "red piece of cloth", chance = 1151 },  -- 5911
	{ id = "shadow sceptre", chance = 1101 },  -- 7451
	{ id = "sai", chance = 951 },  -- 11306
	{ id = "underworld rod", chance = 701 },  -- 8910
	{ id = "spellbook of mind control", chance = 663 },  -- 8902
	{ id = "springsprout rod", chance = 588 },  -- 8912
	{ id = "terra mantle", chance = 588 },  -- 7884
	{ id = "terra boots", chance = 500 },  -- 7886
	{ id = "cluster of solace", chance = 350 },  -- 22396
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -499, condition = { type = CONDITION_POISON, totalDamage = 600, interval = 4000 } },
	-- poison
	{ name = "condition", type = CONDITION_POISON, interval = 2000, chance = 10, minDamage = -700, maxDamage = -900, length = 5, spread = 0, effect = CONST_ME_HITBYPOISON, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -300, radius = 1, shootEffect = CONST_ANI_EXPLOSION, effect = CONST_ME_SLEEP, target = true },
	{ name = "speed", interval = 2000, chance = 20, speed = -800, radius = 1, shootEffect = CONST_ANI_EXPLOSION, effect = CONST_ME_SLEEP, target = true, duration = 15000 },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_MANADRAIN, minDamage = -130, maxDamage = -300, radius = 4, effect = CONST_ME_SOUND_RED, target = false },
	{ name = "choking fear drown", interval = 2000, chance = 20, target = false },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_DEATHDAMAGE, minDamage = -250, maxDamage = -500, radius = 4, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA, target = true },
}

monster.defenses = {
	defense = 35,
	armor = 65,
	mitigation = 1.94,
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_HEALING, minDamage = 80, maxDamage = 150, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 10 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 2 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = 100 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 10 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 55 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)