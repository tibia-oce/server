-- Version: 7.5
-- Monster: https://tibia.fandom.com/wiki/Necropharus
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Necropharus
---


local mType = Game.createMonsterType("Necropharus")
local monster = {}

monster.description = "Necropharus"
monster.experience = 1050
monster.outfit = {
	lookType = 209,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.health = 750
monster.maxHealth = 750
monster.race = "blood"
monster.corpse = 20574
monster.speed = 180
monster.manaCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 8,
}

monster.strategiesTarget = {
	nearest = 100,
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
	targetDistance = 4,
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

monster.summon = {
	maxSummons = 6,
	summons = {
		{ name = "Ghoul", chance = 20, interval = 1000, count = 2 },
		{ name = "Ghost", chance = 17, interval = 1000, count = 2 },
		{ name = "Mummy", chance = 15, interval = 1000, count = 2 },
	},
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "You will rise as my servant!", yell = false },
	{ text = "Praise to my master Urgith!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 100000, minCount = 1, maxCount = 100 },  -- 2148
	{ id = "soul stone", chance = 100000 },  -- 5809
	{ id = "book of necromantic rituals", chance = 97436 },  -- 11237
	{ id = "necromantic robe", chance = 97436 },  -- 12431
	{ id = "clerical mace", chance = 56410 },  -- 2423
	{ id = "skull staff", chance = 41026 },  -- 2436
	{ id = "bone club", chance = 35897 },  -- 2449
	{ id = "green mushroom", chance = 25641 },  -- 2796
	{ id = 2229, chance = 12821 },  -- skull
	{ id = "mystic turban", chance = 10256 },  -- 2663
	{ id = "bone shield", chance = 7692 },  -- 2541
	{ id = "moonlight rod", chance = 7692 },  -- 2186
	{ id = 2231, chance = 5128 },  -- big bone
	{ id = "boots of haste", chance = 2564 },  -- 2195
	{ id = "short sword", chance = 2564 },  -- 2406
	{ id = "strong mana potion", chance = 2564 },  -- 7589
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -80, condition = { type = CONDITION_POISON, totalDamage = 8, interval = 4000 } },
	{ name = "combat", interval = 3000, chance = 70, type = COMBAT_PHYSICALDAMAGE, minDamage = -60, maxDamage = -217, range = 5, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA, target = false },
	{ name = "combat", interval = 1000, chance = 20, type = COMBAT_LIFEDRAIN, minDamage = -80, maxDamage = -120, range = 1, target = false },
	{ name = "combat", interval = 1000, chance = 17, type = COMBAT_FIREDAMAGE, minDamage = -50, maxDamage = -140, range = 7, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_HITBYFIRE, target = false },
	{ name = "combat", interval = 1000, chance = 17, type = COMBAT_ENERGYDAMAGE, minDamage = -50, maxDamage = -140, range = 7, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_ENERGYHIT, target = false },
}

monster.defenses = {
	defense = 25,
	armor = 25,
	mitigation = 1.18,
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_HEALING, minDamage = 0, maxDamage = 300, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
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