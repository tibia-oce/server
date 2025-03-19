-- Version: 9.20
-- Monster: https://tibia.fandom.com/wiki/Flameborn
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Flameborn
---


local mType = Game.createMonsterType("Flameborn")
local monster = {}

monster.description = "Flameborn"
monster.experience = 2550
monster.outfit = {
	lookType = 322,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.health = 3500
monster.maxHealth = 3500
monster.race = "fire"
monster.corpse = 9009
monster.speed = 130
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
	canWalkOnFire = false,
	canWalkOnPoison = false}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
}

monster.loot = {
	{ id = "hellspawn tail", chance = 100000 },  -- 11221
	{ id = "platinum coin", chance = 98750, minCount = 2, maxCount = 14 },  -- 2152
	{ id = "ultimate health potion", chance = 78750 },  -- 8473
	{ id = "great health potion", chance = 75000 },  -- 7591
	{ id = "red mushroom", chance = 67500, minCount = 1, maxCount = 2 },  -- 2788
	{ id = "knight legs", chance = 60000 },  -- 2477
	{ id = "small topaz", chance = 43750, minCount = 1, maxCount = 4 },  -- 9970
	{ id = "demonic essence", chance = 36250 },  -- 6500
	{ id = "berserk potion", chance = 32500 },  -- 7439
	{ id = "crown shield", chance = 27500 },  -- 2519
	{ id = "assassin star", chance = 23750, minCount = 1, maxCount = 5 },  -- 7368
	{ id = "black skull", chance = 20000 },  -- 9969
	{ id = "warrior helmet", chance = 20000 },  -- 2475
	{ id = "carrot on a stick", chance = 6250 },  -- 13298
	{ id = "spiked squelcher", chance = 5000 },  -- 7452
	{ id = "onyx flail", chance = 3750 },  -- 7421
	{ id = 9948, chance = 1250 },  -- dracoyle statue
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -350 },
	{ name = "fireball rune", interval = 2000, chance = 20, minDamage = -150, maxDamage = -175, target = false },
	{ name = "hellspawn soulfire", interval = 2000, chance = 10, range = 5, target = false },
}

monster.defenses = {
	defense = 40,
	armor = 40,
	mitigation = 1.52,
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_HEALING, minDamage = 120, maxDamage = 230, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "speed", interval = 2000, chance = 15, effect = CONST_ME_MAGIC_RED, speed = 260},
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 20 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 10 },
	{ type = COMBAT_EARTHDAMAGE, percent = 80 },
	{ type = COMBAT_FIREDAMAGE, percent = 40 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -10 },
	{ type = COMBAT_HOLYDAMAGE, percent = 30 },
	{ type = COMBAT_DEATHDAMAGE, percent = -5 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)