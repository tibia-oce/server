-- Version: 10.30
-- Monster: https://tibia.fandom.com/wiki/Retching_Horror
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Retching_Horror
---


local mType = Game.createMonsterType("Retching Horror")
local monster = {}

monster.description = "a retching horror"
monster.experience = 4100
monster.outfit = {
	lookType = 588,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 5300
monster.maxHealth = 5300
monster.race = "fire"
monster.corpse = 22508
monster.speed = 180
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
	{ text = "Wait for us, little maggot...", yell = false },
	{ text = "We will devour you...", yell = false },
	{ text = "My little beetles, go forth, eat, feast!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 100000, minCount = 1, maxCount = 100 },  -- 2148
	{ id = "platinum coin", chance = 100000, minCount = 1, maxCount = 9 },  -- 2152
	{ id = "pool of chitinous glue", chance = 15398 },  -- 22541
	{ id = "brown mushroom", chance = 14903, minCount = 1, maxCount = 2 },  -- 2789
	{ id = "goosebump leather", chance = 14748 },  -- 22539
	{ id = "great mana potion", chance = 14639 },  -- 7590
	{ id = "great health potion", chance = 14407 },  -- 7591
	{ id = "broken dream", chance = 5354 },  -- 22363
	{ id = "beastslayer axe", chance = 4983 },  -- 3962
	{ id = "mercenary sword", chance = 2321 },  -- 7386
	{ id = "wand of starstorm", chance = 1578 },  -- 8920
	{ id = "crown shield", chance = 1532 },  -- 2519
	{ id = "underworld rod", chance = 1455 },  -- 8910
	{ id = "spiked squelcher", chance = 1362 },  -- 7452
	{ id = "fire sword", chance = 1253 },  -- 2392
	{ id = "tower shield", chance = 990 },  -- 2528
	{ id = "butcher's axe", chance = 681 },  -- 7412
	{ id = "onyx flail", chance = 573 },  -- 7421
	{ id = "cluster of solace", chance = 433 },  -- 22396
	{ id = "steel boots", chance = 155 },  -- 2645
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -400 },
	{ name = "drunk", interval = 2000, chance = 10, length = 4, spread = 0, effect = CONST_ME_MAGIC_GREEN, target = true, duration = 5000 },
	{ name = "speed", interval = 2000, chance = 15, speed = -700, radius = 4, shootEffect = CONST_ANI_WHIRLWINDCLUB, effect = CONST_ME_STUN, target = true, duration = 15000 },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -110, radius = 4, effect = CONST_ME_HITAREA, target = false },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -200, radius = 1, shootEffect = CONST_ANI_SNIPERARROW, target = true },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_FIREDAMAGE, minDamage = -200, maxDamage = -350, radius = 1, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREATTACK, target = true },
}

monster.defenses = {
	defense = 30,
	armor = 30,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 5 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -3 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = 85 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 15 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 20 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)