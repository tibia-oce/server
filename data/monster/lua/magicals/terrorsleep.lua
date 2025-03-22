-- Version: 10.30
-- Monster: https://tibia.fandom.com/wiki/Terrorsleep
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Terrorsleep
---


local mType = Game.createMonsterType("Terrorsleep")
local monster = {}

monster.description = "a terrorsleep"
monster.experience = 6900
monster.outfit = {
	lookType = 593,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 7200
monster.maxHealth = 7200
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
	{ text = "Aktat Roshok! Marruk!", yell = false },
	{ text = "I will eat you in your sleep.", yell = false },
	{ text = "I am the darkness around you...", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 99964, minCount = 4, maxCount = 197 },  -- 2148
	{ id = "platinum coin", chance = 99964, minCount = 1, maxCount = 9 },  -- 2152
	{ id = "great mana potion", chance = 34825, minCount = 1, maxCount = 2 },  -- 7590
	{ id = "ultimate health potion", chance = 21361 },  -- 8473
	{ id = "cyan crystal fragment", chance = 16958 },  -- 18419
	{ id = "bowl of terror sweat", chance = 16157 },  -- 22538
	{ id = "small amethyst", chance = 15102, minCount = 1, maxCount = 3 },  -- 2150
	{ id = "small topaz", chance = 14301, minCount = 1, maxCount = 3 },  -- 9970
	{ id = "small emerald", chance = 13501, minCount = 1, maxCount = 3 },  -- 2149
	{ id = "small ruby", chance = 12518, minCount = 1, maxCount = 3 },  -- 2147
	{ id = "blue crystal splinter", chance = 12154 },  -- 18418
	{ id = "trapped bad dream monster", chance = 12118 },  -- 22537
	{ id = "blue crystal shard", chance = 8843 },  -- 18413
	{ id = "white piece of cloth", chance = 4076 },  -- 5909
	{ id = "blue piece of cloth", chance = 3493 },  -- 5912
	{ id = "knight armor", chance = 2402 },  -- 2476
	{ id = "fish fin", chance = 2147 },  -- 5895
	{ id = "broken dream", chance = 2111 },  -- 22363
	{ id = "warrior helmet", chance = 1856 },  -- 2475
	{ id = "giant sword", chance = 1638 },  -- 2393
	{ id = "blue robe", chance = 1128 },  -- 2656
	{ id = "red piece of cloth", chance = 1055 },  -- 5911
	{ id = "cluster of solace", chance = 873 },  -- 22396
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -450 },
	-- poison
	{ name = "condition", type = CONDITION_POISON, interval = 2000, chance = 20, minDamage = -1000, maxDamage = -1500, radius = 7, effect = CONST_ME_YELLOW_RINGS, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_MANADRAIN, minDamage = -100, maxDamage = -300, radius = 5, effect = CONST_ME_MAGIC_RED, target = false },
	{ name = "feversleep skill reducer", interval = 2000, chance = 10, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_LIFEDRAIN, minDamage = -350, maxDamage = -500, length = 6, spread = 0, effect = CONST_ME_YELLOWENERGY, target = true },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_DEATHDAMAGE, minDamage = -200, maxDamage = -450, radius = 1, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA, target = true },
}

monster.defenses = {
	defense = 50,
	armor = 50,
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_HEALING, minDamage = 350, maxDamage = 600, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "invisible", interval = 2000, chance = 15, effect = CONST_ME_HITAREA },
	{ name = "speed", interval = 2000, chance = 15, effect = CONST_ME_MAGIC_RED, speed = 360},
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