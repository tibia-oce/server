-- Version: 9.20
-- Monster: https://tibia.fandom.com/wiki/Kerberos
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Kerberos
---


local mType = Game.createMonsterType("Kerberos")
local monster = {}

monster.description = "Kerberos"
monster.experience = 10000
monster.outfit = {
	lookType = 240,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.health = 11000
monster.maxHealth = 11000
monster.race = "blood"
monster.corpse = 6331
monster.speed = 140
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
	staticAttackChance = 70,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = true,
	canWalkOnPoison = true}

monster.light = {
	level = 3,
	color = 206,
}

monster.voices = {
	interval = 5000,
	chance = 10,
}

monster.loot = {
	{ id = "concentrated demonic blood", chance = 100000 },  -- todo: flask of demonic blood does not exist in items.xml
	{ id = "gold ingot", chance = 100000, minCount = 1, maxCount = 5 },  -- 9971
	{ id = "hellhound slobber", chance = 100000 },  -- 10554
	{ id = "platinum coin", chance = 100000, minCount = 5, maxCount = 19 },  -- 2152
	{ id = "black pearl", chance = 97619, minCount = 1, maxCount = 5 },  -- 2144
	{ id = "great mana potion", chance = 97619, minCount = 1, maxCount = 3 },  -- 7590
	{ id = "magma amulet", chance = 97619 },  -- 7890
	{ id = "knight axe", chance = 71429 },  -- 2430
	{ id = "demonic essence", chance = 69048 },  -- 6500
	{ id = "explorer brooch", chance = 66667 },  -- 4873
	{ id = "fire sword", chance = 52381 },  -- 2392
	{ id = "green gem", chance = 45238 },  -- 2155
	{ id = "golden armor", chance = 28571 },  -- 2466
	{ id = "ruthless axe", chance = 7143 },  -- 6553
	{ id = "executioner", chance = 2381 },  -- 7453
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -508 },
	{ name = "combat", interval = 2000, chance = 5, type = COMBAT_EARTHDAMAGE, minDamage = 0, maxDamage = -700, length = 8, spread = 3, effect = CONST_ME_CARNIPHILA, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_DEATHDAMAGE, minDamage = 0, maxDamage = -498, range = 7, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_SMALLCLOUDS, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_FIREDAMAGE, minDamage = 0, maxDamage = -662, length = 8, spread = 3, effect = CONST_ME_FIREAREA, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_LIFEDRAIN, minDamage = 0, maxDamage = -976, length = 8, spread = 3, effect = CONST_ME_MAGIC_RED, target = false },
	{ name = "combat", interval = 2000, chance = 5, type = COMBAT_EARTHDAMAGE, minDamage = 0, maxDamage = -549, range = 7, shootEffect = CONST_ANI_POISON, effect = CONST_ME_POISONAREA, target = false },
}

monster.defenses = {
	defense = 40,
	armor = 40,
	mitigation = 2.95,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 10 },
	{ type = COMBAT_EARTHDAMAGE, percent = 20 },
	{ type = COMBAT_FIREDAMAGE, percent = 100 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -5 },
	{ type = COMBAT_HOLYDAMAGE, percent = -25 },
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)