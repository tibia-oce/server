-- Version: 10.30
-- Monster: https://tibia.fandom.com/wiki/Feversleep
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Feversleep
---


local mType = Game.createMonsterType("Feversleep")
local monster = {}

monster.description = "a feversleep"
monster.experience = 5060
monster.outfit = {
	lookType = 593,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 5900
monster.maxHealth = 5900
monster.race = "blood"
monster.corpse = 22497
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
}

monster.loot = {
	{ id = "gold coin", chance = 100000, minCount = 1, maxCount = 100 },  -- 2148
	{ id = "platinum coin", chance = 100000, minCount = 1, maxCount = 9 },  -- 2152
	{ id = "great mana potion", chance = 36140, minCount = 1, maxCount = 2 },  -- 7590
	{ id = "ultimate health potion", chance = 20846 },  -- 8473
	{ id = "cyan crystal fragment", chance = 17904 },  -- 18419
	{ id = "small amethyst", chance = 15809, minCount = 1, maxCount = 3 },  -- 2150
	{ id = "bowl of terror sweat", chance = 14632 },  -- 22538
	{ id = "small topaz", chance = 14338, minCount = 1, maxCount = 3 },  -- 9970
	{ id = "small ruby", chance = 12904, minCount = 1, maxCount = 3 },  -- 2147
	{ id = "trapped bad dream monster", chance = 12757 },  -- 22537
	{ id = "blue crystal splinter", chance = 12243 },  -- 18418
	{ id = "small emerald", chance = 10735, minCount = 1, maxCount = 3 },  -- 2149
	{ id = "blue crystal shard", chance = 10147 },  -- 18413
	{ id = "blue robe", chance = 1360 },  -- 2656
	{ id = "cluster of solace", chance = 735 },  -- 22396
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -450 },
	-- poison
	{ name = "condition", type = CONDITION_POISON, interval = 2000, chance = 20, minDamage = -800, maxDamage = -1000, radius = 7, effect = CONST_ME_YELLOW_RINGS, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_MANADRAIN, minDamage = -70, maxDamage = -100, radius = 5, effect = CONST_ME_MAGIC_RED, target = false },
	{ name = "feversleep skill reducer", interval = 2000, chance = 10, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_LIFEDRAIN, minDamage = -250, maxDamage = -300, length = 6, spread = 0, effect = CONST_ME_YELLOWENERGY, target = true },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_DEATHDAMAGE, minDamage = -150, maxDamage = -300, radius = 1, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA, target = true },
}

monster.defenses = {
	defense = 45,
	armor = 73,
	mitigation = 1.10,
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_HEALING, minDamage = 250, maxDamage = 425, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "invisible", interval = 2000, chance = 10, effect = CONST_ME_HITAREA },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 15 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 10 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = 35 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 20 },
	{ type = COMBAT_HOLYDAMAGE, percent = -10 },
	{ type = COMBAT_DEATHDAMAGE, percent = 55 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
