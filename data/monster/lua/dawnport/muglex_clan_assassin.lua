-- Version: 10.55
-- Monster: https://tibia.fandom.com/wiki/Muglex_Clan_Assassin
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Muglex_Clan_Assassin
---


local mType = Game.createMonsterType("Muglex Clan Assassin")
local monster = {}

monster.description = "a muglex clan assassin"
monster.experience = 48
monster.outfit = {
	lookType = 296,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.health = 75
monster.maxHealth = 75
monster.race = "blood"
monster.corpse = 6002
monster.speed = 70
monster.manaCost = 0
monster.strategiesTarget = {
	nearest = 100,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = true,
	rewardBoss = false,
	illusionable = true,
	canPushItems = false,
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 15,
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
	{ id = "gold coin", chance = 100000, minCount = 1, maxCount = 16 },  -- 2148
	{ id = "dagger", chance = 20312 },  -- 2379
	{ id = 2667 , chance = 18750, minCount = 1, maxCount = 2 },  -- fish
	{ id = "leather helmet", chance = 10938 },  -- 2461
	{ id = "small axe", chance = 10938 },  -- 2559
	{ id = "short sword", chance = 9375 },  -- 2406
	{ id = "small stone", chance = 9375, minCount = 1, maxCount = 2 },  -- 1294
	{ id = "leather armor", chance = 7812 },  -- 2467
	{ id = "bone club", chance = 6250 },  -- 2449
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, skill = 10, attack = 15 },
	{ name = "drunk", interval = 2000, chance = 11, shootEffect = CONST_ANI_POISON, effect = CONST_ME_POISONAREA, target = false, duration = 3000 },
	{ name = "combat", interval = 2000, chance = 9, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -30, range = 6, shootEffect = CONST_ANI_THROWINGKNIFE, target = false },
}

monster.defenses = {
	defense = 5,
	armor = 3,
	{ name = "invisible", interval = 2000, chance = 11, effect = CONST_ME_MAGIC_BLUE },
	{ name = "speed", interval = 2000, chance = 10, effect = CONST_ME_MAGIC_RED, speed = 140},
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
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = false },
	{ type = "bleed", condition = false },
}

mType:register(monster)