-- Version: 10.80
-- Monster: https://tibia.fandom.com/wiki/Werebear
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Werebear
---


local mType = Game.createMonsterType("Werebear")
local monster = {}

monster.description = "a werebear"
monster.experience = 2100
monster.outfit = {
	lookType = 720,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 2400
monster.maxHealth = 2400
monster.race = "blood"
monster.corpse = 22010
monster.speed = 110
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
	staticAttackChance = 80,
	targetDistance = 1,
	runHealth = 275,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = false,
	canWalkOnPoison = true}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "GROOOWL", yell = true },
	{ text = "GRRR", yell = true },
}

monster.loot = {
	{ id = "platinum coin", chance = 100000, minCount = 1, maxCount = 3 },  -- 2152
	{ id = "gold coin", chance = 79978, minCount = 1, maxCount = 100 },  -- 2148
	{ id = "werebear skull", chance = 15706 },  -- 24712
	{ id = "werebear fur", chance = 15333 },  -- 24713
	{ id = "ham", chance = 12283 },  -- 2671
	{ id = "great health potion", chance = 4376 },  -- 7591
	{ id = "bear paw", chance = 2821 },  -- 5896
	{ id = "honeycomb", chance = 2507 },  -- 5902
	{ id = "ultimate health potion", chance = 2230 },  -- 8473
	{ id = "werewolf amulet", chance = 1097 },  -- 24716
	{ id = "stone skin amulet", chance = 1025 },  -- 2197
	{ id = "furry club", chance = 916 },  -- 7432
	{ id = "berserk potion", chance = 880 },  -- 7439
	{ id = 2169, chance = 675 },  -- time ring
	{ id = "spiked squelcher", chance = 591 },  -- 7452
	{ id = "relic sword", chance = 567 },  -- 7383
	{ id = "fur armor", chance = 554 },  -- 24741
	{ id = "moonlight crystals", chance = 446 },  -- 24739
	{ id = 24759, chance = 181 },  -- werebear trophy
	{ id = "dreaded cleaver", chance = 145 },  -- 7419
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 50, maxDamage = -485 },
	{ name = "speed", interval = 4000, chance = 20, speed = -200, radius = 7, effect = CONST_ME_POFF, target = true },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_LIFEDRAIN, minDamage = -65, maxDamage = -335, radius = 4, effect = CONST_ME_MAGIC_GREEN, target = false },
}

monster.defenses = {
	defense = 30,
	armor = 38,
	mitigation = 0.91,
	{ name = "combat", interval = 2000, chance = 25, type = COMBAT_HEALING, minDamage = 50, maxDamage = 100, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 5 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 15 },
	{ type = COMBAT_EARTHDAMAGE, percent = 50 },
	{ type = COMBAT_FIREDAMAGE, percent = -5 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 10 },
	{ type = COMBAT_HOLYDAMAGE, percent = -5 },
	{ type = COMBAT_DEATHDAMAGE, percent = 45 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)