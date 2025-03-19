-- Version: 9.40
-- Monster: https://tibia.fandom.com/wiki/Spidris
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Spidris
---


local mType = Game.createMonsterType("Spidris")
local monster = {}

monster.description = "a spidris"
monster.experience = 2600
monster.outfit = {
	lookType = 457,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 3700
monster.maxHealth = 3700
monster.race = "venom"
monster.corpse = 13870
monster.speed = 195
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10,
}

monster.strategiesTarget = {
	nearest = 100,
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
	staticAttackChance = 95,
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
	{ text = "Eeeeeeyyyyh!", yell = false },
	{ text = "Iiiiieeeeeeh!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 100000, minCount = 2, maxCount = 200 },  -- 2148
	{ id = "platinum coin", chance = 45051, minCount = 1, maxCount = 4 },  -- 2152
	{ id = "spidris mandible", chance = 14801 },  -- 15485
	{ id = "compound eye", chance = 12277 },  -- 15486
	{ id = "small ruby", chance = 12225, minCount = 1, maxCount = 5 },  -- 2147
	{ id = "great mana potion", chance = 11503, minCount = 1, maxCount = 2 },  -- 7590
	{ id = "ultimate health potion", chance = 6229, minCount = 1, maxCount = 2 },  -- 8473
	{ id = 6300, chance = 2556 },  -- death ring
	{ id = "giant shimmering pearl", chance = 1633 },
	{ id = "titan axe", chance = 864 },  -- 7413
	{ id = "violet gem", chance = 777 },  -- 2153
	{ id = "hive scythe", chance = 726 },  -- 15492
	{ id = "carapace shield", chance = 627 },  -- 15491
	{ id = "calopteryx cape", chance = 343 },  -- 15489
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -298 },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_EARTHDAMAGE, minDamage = -150, maxDamage = -310, range = 7, radius = 3, shootEffect = CONST_ANI_POISON, effect = CONST_ME_GREEN_RINGS, target = true },
}

monster.defenses = {
	defense = 30,
	armor = 53,
	mitigation = 1.62,
	{ name = "speed", interval = 2000, chance = 15, effect = CONST_ME_MAGIC_RED, speed = 390},
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -5 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = 15 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -3 },
	{ type = COMBAT_HOLYDAMAGE, percent = -10 },
	{ type = COMBAT_DEATHDAMAGE, percent = 10 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
