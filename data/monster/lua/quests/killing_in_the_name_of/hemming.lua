-- Version: 9.50
-- Monster: https://tibia.fandom.com/wiki/Hemming
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Hemming
---


local mType = Game.createMonsterType("Hemming")
local monster = {}

monster.description = "Hemming"
monster.experience = 2850
monster.outfit = {
	lookType = 308,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.health = 3000
monster.maxHealth = 3000
monster.race = "blood"
monster.corpse = 18289
monster.speed = 105
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
	rewardBoss = true,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 80,
	targetDistance = 1,
	runHealth = 300,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false}

monster.light = {
	level = 0,
	color = 0,
}

monster.summon = {
	maxSummons = 2,
	summons = {
		{ name = "War Wolf", chance = 100, interval = 2000, count = 2 },
	},
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "GRRR", yell = true },
	{ text = "GRROARR", yell = true },
}

monster.loot = {
	{ id = "gold coin", chance = 100000, minCount = 1, maxCount = 99 },  -- 2148
	{ id = "werewolf fur", chance = 100000 },  -- 11234
	{ id = "wolf paw", chance = 100000 },  -- 5897
	{ id = "ultimate health potion", chance = 98611 },  -- 8473
	{ id = "brown mushroom", chance = 95833, minCount = 1, maxCount = 5 },  -- 2789
	{ id = "platinum coin", chance = 95833, minCount = 1, maxCount = 10 },  -- 2152
	{ id = "berserk potion", chance = 81944 },  -- 7439
	{ id = "stone skin amulet", chance = 63889 },  -- 2197
	{ id = "black pearl", chance = 56944, minCount = 1, maxCount = 5 },  -- 2144
	{ id = "cat's paw", chance = 34722 },  -- 5480
	{ id = "troll green", chance = 23611 },  -- 2805
	{ id = "sai", chance = 18056 },  -- 11306
	{ id = "dreaded cleaver", chance = 9722 },  -- 7419
	{ id = "bonebreaker", chance = 4167 },  -- 7428
	{ id = 2169, chance = 4167 },  -- time ring
	{ id = "platinum amulet", chance = 2778 },  -- 2171
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -450 },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_LIFEDRAIN, minDamage = -180, maxDamage = -265, radius = 3, effect = CONST_ME_SOUND_RED, target = false },
	{ name = "outfit", interval = 2000, chance = 5, effect = CONST_ME_SOUND_BLUE, target = false, duration = 2000, outfitMonster = "Werewolf" },
	{ name = "combat", interval = 2000, chance = 40, type = COMBAT_PHYSICALDAMAGE, radius = 3, effect = CONST_ME_SOUND_WHITE, target = false },
	{ name = "werewolf skill reducer", interval = 2000, chance = 15, range = 1, target = false },
}

monster.defenses = {
	defense = 40,
	armor = 40,
	mitigation = 1.03,
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_HEALING, minDamage = 50, maxDamage = 200, effect = CONST_ME_MAGIC_GREEN, target = false },
	{ name = "speed", interval = 2000, chance = 15, range = 7, effect = CONST_ME_SOUND_PURPLE, speed = 210},
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 30 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 50 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)