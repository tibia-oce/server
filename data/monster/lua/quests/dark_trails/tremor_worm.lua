-- Version: 10.70
-- Monster: https://tibia.fandom.com/wiki/Tremor_Worm
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Tremor_Worm
---


local mType = Game.createMonsterType("Tremor Worm")
local monster = {}

monster.description = "a tremor worm"
monster.experience = 80000
monster.outfit = {
	lookType = 295,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.health = 125000
monster.maxHealth = 125000
monster.race = "blood"
monster.corpse = 0
monster.speed = 85
monster.manaCost = 0

monster.changeTarget = {
	interval = 2000,
	chance = 0,
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
	{ id = "glooth bag", chance = 100000, minCount = 1, maxCount = 3 },  -- 23574
	{ id = "great health potion", chance = 100000, maxCount = 15 },  -- 7591
	{ id = "great mana potion", chance = 100000, maxCount = 15 },  -- 7590
	{ id = "platinum coin", chance = 100000, maxCount = 25 },  -- 2152
	{ id = "ultimate health potion", chance = 100000, maxCount = 10 },  -- 8473
	{ id = "gold coin", chance = 70000, maxCount = 100 },  -- 2148
	{ id = "red crystal fragment", chance = 50000 },  -- 18420
	{ id = "cyan crystal fragment", chance = 30000 },  -- 18419
	{ id = "small diamond", chance = 30000, maxCount = 5 },  -- 2145
	{ id = 2169, chance = 30000 },  -- time ring
	{ id = "glooth cape", chance = 20000 },  -- 23535
	{ id = "great spirit potion", chance = 20000 },  -- 8472
	{ id = "green crystal fragment", chance = 20000 },  -- 18421
	{ id = "green crystal shard", chance = 20000, maxCount = 2 },  -- 18415
	{ id = "ring of healing", chance = 20000 },  -- 2214
	{ id = "violet crystal shard", chance = 20000, maxCount = 2 },  -- 18414
	{ id = "glooth glider crank", chance = 10000 },  -- 24271
	{ id = "red gem", chance = 10000 },  -- 2156
	{ id = "small ruby", chance = 10000 },  -- 2147
	{ id = "yellow gem", chance = 10000 },  -- 2154
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -0, maxDamage = -400 },
}

monster.defenses = {
	defense = 100,
	armor = 100,
	--	mitigation = ???,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 75 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 75 },
	{ type = COMBAT_EARTHDAMAGE, percent = 75 },
	{ type = COMBAT_FIREDAMAGE, percent = 75 },
	{ type = COMBAT_LIFEDRAIN, percent = 75 },
	{ type = COMBAT_MANADRAIN, percent = 75 },
	{ type = COMBAT_DROWNDAMAGE, percent = 75 },
	{ type = COMBAT_ICEDAMAGE, percent = 75 },
	{ type = COMBAT_HOLYDAMAGE, percent = 75 },
	{ type = COMBAT_DEATHDAMAGE, percent = 75 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)