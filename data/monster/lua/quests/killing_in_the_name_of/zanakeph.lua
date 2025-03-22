-- Version: 9.50
-- Monster: https://tibia.fandom.com/wiki/Zanakeph
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Zanakeph
---


local mType = Game.createMonsterType("Zanakeph")
local monster = {}

monster.description = "Zanakeph"
monster.experience = 9900
monster.outfit = {
	lookType = 231,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.health = 13000
monster.maxHealth = 13000
monster.race = "undead"
monster.corpse = 6305
monster.speed = 165
monster.manaCost = 0

monster.changeTarget = {
	interval = 2000,
	chance = 6,
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
	runHealth = 700,
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
	{ text = "I SENSE LIFE", yell = true },
	{ text = "FEEEED MY ETERNAL HUNGER!", yell = true },
}

monster.loot = {
	{ id = 6300, chance = 100000 },  -- death ring
	{ id = "dragonbone staff", chance = 100000 },  -- 7430
	{ id = "gold coin", chance = 100000, minCount = 1, maxCount = 100 },  -- 2148
	{ id = "golden mug", chance = 100000 },  -- 2033
	{ id = "platinum coin", chance = 100000, minCount = 1, maxCount = 10 },  -- 2152
	{ id = "unholy bone", chance = 100000, minCount = 1, maxCount = 3 },  -- 11233
	{ id = "gold ingot", chance = 78161 },  -- 9971
	{ id = "demonic essence", chance = 52874 },  -- 6500
	{ id = "knight armor", chance = 45977 },  -- 2476
	{ id = "crown helmet", chance = 42529 },  -- 2491
	{ id = "great health potion", chance = 41379, minCount = 1, maxCount = 4 },  -- 7591
	{ id = "small emerald", chance = 39080, minCount = 1, maxCount = 5 },  -- 2149
	{ id = 9808, chance = 36782 },  -- rusty armor (todo: slightly rusted does not exist in items.xml)
	{ id = "great spirit potion", chance = 34483, minCount = 1, maxCount = 3 },  -- 8472
	{ id = "hardened bone", chance = 34483, minCount = 1, maxCount = 5 },  -- 5925
	{ id = "small sapphire", chance = 32184, minCount = 1, maxCount = 5 },  -- 2146
	{ id = "jade hat", chance = 31034 },  -- 11368
	{ id = "great mana potion", chance = 26437, minCount = 1, maxCount = 3 },  -- 7590
	{ id = "golden armor", chance = 13793 },  -- 2466
	{ id = "royal helmet", chance = 5747 },  -- 2498
	{ id = "maxilla maximus", chance = 4598 },  -- 13291
	{ id = "skull helmet", chance = 4598 },  -- 5741
	{ id = "divine plate", chance = 3448 },  -- 8885
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -0, maxDamage = -480 },
	{ name = "combat", interval = 2000, chance = 5, type = COMBAT_PHYSICALDAMAGE, minDamage = -300, maxDamage = -400, range = 7, radius = 4, effect = CONST_ME_HITAREA, target = true },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_DEATHDAMAGE, minDamage = -125, maxDamage = -600, range = 7, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_SMALLCLOUDS, target = false },
	{ name = "combat", interval = 2000, chance = 5, type = COMBAT_EARTHDAMAGE, minDamage = -100, maxDamage = -390, range = 7, radius = 4, shootEffect = CONST_ANI_POISON, effect = CONST_ME_POISONAREA, target = true },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_EARTHDAMAGE, minDamage = 0, maxDamage = -180, range = 7, shootEffect = CONST_ANI_POISON, effect = CONST_ME_POISONAREA, target = true },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_EARTHDAMAGE, minDamage = -150, maxDamage = -690, length = 8, spread = 3, effect = CONST_ME_POISONAREA, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_LIFEDRAIN, minDamage = -300, maxDamage = -700, length = 8, spread = 3, effect = CONST_ME_MAGIC_RED, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_LIFEDRAIN, minDamage = -100, maxDamage = -200, radius = 3, effect = CONST_ME_MAGIC_RED, target = false },
	{ name = "undead dragon curse", interval = 2000, chance = 10, target = false },
}

monster.defenses = {
	defense = 40,
	armor = 40,
	mitigation = 1.94,
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_HEALING, minDamage = 200, maxDamage = 250, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 20 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -10 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = 100 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 50 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 100 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)