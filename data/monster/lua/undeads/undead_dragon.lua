-- Version: 7.9
-- Monster: https://tibia.fandom.com/wiki/Undead_Dragon
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Undead_Dragon
---


local mType = Game.createMonsterType("Undead Dragon")
local monster = {}

monster.description = "an undead dragon"
monster.experience = 7500
monster.outfit = {
	lookType = 231,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 8350
monster.maxHealth = 8350
monster.race = "undead"
monster.corpse = 6305
monster.speed = 165
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
	staticAttackChance = 70,
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
	{ text = "FEEEED MY ETERNAL HUNGER!", yell = true },
	{ text = "I SENSE LIFE", yell = true },
}

monster.loot = {
	{ id = "gold coin", chance = 100000, minCount = 2, maxCount = 200 },  -- 2148
	{ id = "platinum coin", chance = 49747, minCount = 1, maxCount = 6 },  -- 2152
	{ id = "unholy bone", chance = 33844 },  -- 11233
	{ id = "small sapphire", chance = 27561, minCount = 1, maxCount = 2 },  -- 2146
	{ id = "assassin star", chance = 25241, minCount = 1, maxCount = 5 },  -- 7368
	{ id = "great health potion", chance = 24664, minCount = 1, maxCount = 3 },  -- 7591
	{ id = "great mana potion", chance = 24664, minCount = 1, maxCount = 3 },  -- 7590
	{ id = "black pearl", chance = 22468, minCount = 1, maxCount = 2 },  -- 2144
	{ id = "demonic essence", chance = 15403 },  -- 6500
	{ id = "hardened bone", chance = 15208 },  -- 5925
	{ id = "power bolt", chance = 14643, minCount = 1, maxCount = 15 },  -- 2547
	{ id = "golden mug", chance = 5187 },  -- 2033
	{ id = "knight armor", chance = 4863 },  -- 2476
	{ id = "dragonbone staff", chance = 4098 },  -- 7430
	{ id = 6300, chance = 1884 },  -- death ring
	{ id = "life crystal", chance = 1578 },  -- 2177
	{ id = "war axe", chance = 1331 },  -- 2454
	{ id = "royal helmet", chance = 1113 },  -- 2498
	{ id = "blue gem", chance = 1089 },  -- 2158
	{ id = "gold ingot", chance = 1060 },  -- 9971
	{ id = "dragon slayer", chance = 972 },  -- 7402
	{ id = "spellweaver's robe", chance = 907 },  -- 11355
	{ id = "golden armor", chance = 665 },  -- 2466
	{ id = "divine plate", chance = 442 },  -- 8885
	{ id = "skullcracker armor", chance = 312 },  -- 8889
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -480 },
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
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_HEALING, minDamage = 200, maxDamage = 250, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 5 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = 100 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 100 },
	{ type = COMBAT_ICEDAMAGE, percent = 90 },
	{ type = COMBAT_HOLYDAMAGE, percent = -25 },
	{ type = COMBAT_DEATHDAMAGE, percent = 100 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
