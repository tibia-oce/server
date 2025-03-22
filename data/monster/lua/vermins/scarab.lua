-- Version: 7.3
-- Monster: https://tibia.fandom.com/wiki/Scarab
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Scarab
---


local mType = Game.createMonsterType("Scarab")
local monster = {}

monster.description = "a scarab"
monster.experience = 120
monster.outfit = {
	lookType = 83,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 320
monster.maxHealth = 320
monster.race = "venom"
monster.corpse = 6024
monster.speed = 80
monster.manaCost = 395

monster.changeTarget = {
	interval = 4000,
	chance = 0,
}

monster.strategiesTarget = {
	nearest = 100,
}

monster.flags = {
	summonable = true,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = true,
	rewardBoss = false,
	illusionable = true,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 80,
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
}

monster.loot = {
	{ id = "gold coin", chance = 87304, minCount = 1, maxCount = 52 },  -- 2148
	{ id = "meat", chance = 39932 },  -- 2666
	{ id = "piece of scarab shell", chance = 5035 },  -- 10558
	{ id = "scarab coin", chance = 1108 },  -- 2159
	{ id = "small amethyst", chance = 507 },  -- 2150
	{ id = "small emerald", chance = 348 },  -- 2149
	{ id = "daramian mace", chance = 303 },  -- 2439
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -75 },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_EARTHDAMAGE, minDamage = 0, maxDamage = -35, range = 1, shootEffect = CONST_ANI_POISON, target = false },
	{ name = "poisonfield", interval = 2000, chance = 10, radius = 1, target = false },
}

monster.defenses = {
	defense = 15,
	armor = 21,
	mitigation = 0.67,
	{ name = "speed", interval = 2000, chance = 15, effect = CONST_ME_MAGIC_RED, speed = 160},
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 5 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 10 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = -18 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 20 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = false },
	{ type = "bleed", condition = false },
}

mType:register(monster)
