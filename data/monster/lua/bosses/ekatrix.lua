-- Version: 10.80
-- Monster: https://tibia.fandom.com/wiki/Ekatrix
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Ekatrix
---


local mType = Game.createMonsterType("Ekatrix")
local monster = {}

monster.description = "Ekatrix"
monster.experience = 200
monster.outfit = {
	lookType = 54,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.health = 500
monster.maxHealth = 500
monster.race = "blood"
monster.corpse = 18254
monster.speed = 51
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
	illusionable = true,
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 4,
	runHealth = 30,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
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
	{ id = "gold coin", chance = 100000, minCount = 1, maxCount = 60 },  -- 2148
	{ id = "witch broom", chance = 100000 },  -- 10569
	{ id = "cape", chance = 61538 },  -- 2654
	{ id = "broom", chance = 35385 },  -- 2551
	{ id = "wolf tooth chain", chance = 35385 },  -- 2129
	{ id = "coat", chance = 32308 },  -- 2651
	{ id = "cookie", chance = 24615, minCount = 1, maxCount = 11 },  -- 2687
	{ id = "star herb", chance = 18462 },  -- 2800
	{ id = "bag of apple slices", chance = 7692 },  -- 13537
	{ id = "garlic necklace", chance = 3077 },  -- 2199
	{ id = "necrotic rod", chance = 1538 },  -- 2185
	{ id = "sickle", chance = 1538 },  -- 2405
	{ id = "stealth ring", chance = 1538 },  -- 2165
	{ id = "witch hat", chance = 1538 },  -- 10570
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -20 },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_FIREDAMAGE, minDamage = -30, maxDamage = -60, range = 5, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_HITBYFIRE, target = false },
	{ name = "firefield", interval = 2000, chance = 10, range = 5, radius = 1, shootEffect = CONST_ANI_FIRE, target = true },
}

monster.defenses = {
	defense = 10,
	armor = 10,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 100 },
	{ type = COMBAT_EARTHDAMAGE, percent = 20 },
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
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)