-- Version: 10.30
-- Monster: https://tibia.fandom.com/wiki/Mawhawk
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Mawhawk
---


local mType = Game.createMonsterType("Mawhawk")
local monster = {}

monster.description = "Mawhawk"
monster.experience = 14000
monster.outfit = {
	lookType = 595,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 45000
monster.maxHealth = 45000
monster.race = "blood"
monster.corpse = 20295
monster.speed = 135
monster.manaCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 8,
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
	canPushItems = false,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Better flee now!", yell = false },
	{ text = "Watch my maws!", yell = false },
}

monster.loot = {
	{ id = "frazzle tongue", chance = 100000 },  -- 22532
	{ id = "gold coin", chance = 100000, maxCount = 101 },  -- 2148
	{ id = "platinum coin", chance = 100000, minCount = 10, maxCount = 25 },  -- 2152
	{ id = "unrealized dream", chance = 98058, minCount = 1, maxCount = 2 },  -- 22598
	{ id = "cluster of solace", chance = 98058, minCount = 1, maxCount = 2 },  -- 22396
	{ id = "brown crystal splinter", chance = 35922, maxCount = 5 },  -- 18417
	{ id = "green crystal splinter", chance = 33981, maxCount = 5 },  -- 18416
	{ id = "blue crystal splinter", chance = 30097, maxCount = 5 },  -- 18418
	{ id = "fish fin", chance = 16505 },  -- 5895
	{ id = "hardened bone", chance = 15534 },  -- 5925
	{ id = "iron ore", chance = 14563 },  -- 5880
	{ id = "red piece of cloth", chance = 12621 },  -- 5911
	{ id = "fire sword", chance = 10680 },  -- 2392
	{ id = "violet crystal shard", chance = 10680, maxCount = 3 },  -- 18414
	{ id = "blue crystal shard", chance = 9709, maxCount = 3 },  -- 18413
	{ id = "green crystal shard", chance = 7767, maxCount = 3 },  -- 18415
	{ id = "nightmare blade", chance = 7767 },  -- 7418
	{ id = "assassin dagger", chance = 3883 },  -- 7404
	{ id = "haunted blade", chance = 3883 },  -- 7407
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, skill = 90, attack = 90 },
	{ name = "combat", interval = 1800, chance = 10, type = COMBAT_EARTHDAMAGE, minDamage = -300, maxDamage = -685, length = 7, spread = 0, effect = CONST_ME_STONES, target = false },
	{ name = "combat", interval = 2000, chance = 9, type = COMBAT_EARTHDAMAGE, minDamage = -250, maxDamage = -590, radius = 6, effect = CONST_ME_BIGPLANTS, target = false },
}

monster.defenses = {
	defense = 55,
	armor = 55,
	--	mitigation = ???,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 20 },
	{ type = COMBAT_FIREDAMAGE, percent = 20 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 15 },
	{ type = COMBAT_HOLYDAMAGE, percent = -5 },
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)