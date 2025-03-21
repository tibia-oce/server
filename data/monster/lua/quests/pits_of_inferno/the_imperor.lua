-- Version: 7.9
-- Monster: https://tibia.fandom.com/wiki/The_Imperor
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:The_Imperor
---


local mType = Game.createMonsterType("The Imperor")
local monster = {}

monster.description = "The Imperor"
monster.experience = 8000
monster.outfit = {
	lookType = 237,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 15000
monster.maxHealth = 15000
monster.race = "blood"
monster.corpse = 6363
monster.speed = 155
monster.manaCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 5,
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
	targetDistance = 4,
	runHealth = 1500,
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
	{ text = "Poke! Poke! <chuckle>", yell = false },
	{ text = "Let me tickle you with my trident!", yell = false },
	{ text = "I am so bad today", yell = false },
}

monster.loot = {
	{ id = "demonic essence", chance = 100000 },  -- 6500
	{ id = "gold coin", chance = 100000, minCount = 21, maxCount = 148 },  -- 2148
	{ id = "soul orb", chance = 100000 },  -- 5944
	{ id = "the Imperor's trident", chance = 100000 },  -- 6534
	{ id = "pitchfork", chance = 55000 },  -- 2548
	{ id = "platinum coin", chance = 45000, minCount = 1, maxCount = 3 },  -- 2152
	{ id = "small amethyst", chance = 40000, minCount = 1, maxCount = 4 },  -- 2150
	{ id = "crown legs", chance = 30000 },  -- 2488
	{ id = 2136, chance = 10000 },  -- demonbone amulet
	{ id = "magma coat", chance = 10000 },  -- 7899
	{ id = "fire axe", chance = 5000 },  -- 2432
	{ id = "golden legs", chance = 5000 },  -- 2470
	{ id = "small ruby", chance = 5000, maxCount = 4 },  -- 2147
	{ id = "tempest shield", chance = 5000 },  -- 2542
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, skill = 90, attack = 100, condition = { type = CONDITION_POISON, totalDamage = 280, interval = 4000 } },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_FIREDAMAGE, minDamage = -100, maxDamage = -350, range = 7, radius = 4, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = true },
	{ name = "combat", interval = 2500, chance = 12, type = COMBAT_FIREDAMAGE, minDamage = -100, maxDamage = -460, range = 7, radius = 2, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREATTACK, target = true },
	{ name = "diabolic imp skill reducer", interval = 2000, chance = 10, range = 7, target = false },
}

monster.defenses = {
	defense = 15,
	armor = 15,
	--	mitigation = ???,
	{ name = "combat", interval = 2000, chance = 35, type = COMBAT_HEALING, minDamage = 275, maxDamage = 840, effect = CONST_ME_MAGIC_RED, target = false },
	{ name = "the imperor summon", interval = 2000, chance = 21, target = false },
	{ name = "speed", interval = 2000, chance = 12, effect = CONST_ME_MAGIC_RED, speed = 310},
	{ name = "invisible", interval = 2000, chance = 11, effect = CONST_ME_TELEPORT },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 100 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = true },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)