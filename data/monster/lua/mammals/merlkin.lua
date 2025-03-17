-- Version: 7.5
-- Monster: https://tibia.fandom.com/wiki/Merlkin
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Merlkin
---


local mType = Game.createMonsterType("Merlkin")
local monster = {}

monster.description = "a merlkin"
monster.experience = 145
monster.outfit = {
	lookType = 117,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 235
monster.maxHealth = 235
monster.race = "blood"
monster.corpse = 6044
monster.speed = 97
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
	illusionable = true,
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 70,
	targetDistance = 4,
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
	{ text = "Ugh! Ugh! Ugh!", yell = false },
	{ text = "Holy banana!", yell = false },
	{ text = "Chakka! Chakka!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 82965, minCount = 1, maxCount = 45 },  -- 2148
	{ id = "banana", chance = 30417, minCount = 1, maxCount = 12 },  -- 2676
	{ id = 2162, chance = 3017 },  -- magic light wand
	{ id = "banana sash", chance = 1914 },  -- 12467
	{ id = "ape fur", chance = 1012 },  -- 5883
	{ id = "orange", chance = 1010, minCount = 1, maxCount = 5 },  -- 2675
	{ id = "wand of decay", chance = 984 },  -- 2188
	{ id = "mana potion", chance = 693 },  -- 7620
	{ id = "small amethyst", chance = 309 },  -- 2150
	{ id = "banana staff", chance = 103 },  -- 3966
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -30 },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_FIREDAMAGE, minDamage = -60, maxDamage = -90, range = 7, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_HITBYFIRE, target = false },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_ENERGYDAMAGE, minDamage = -15, maxDamage = -45, range = 7, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_ENERGYHIT, target = false },
	{ name = "poisonfield", interval = 2000, chance = 15, range = 7, radius = 1, shootEffect = CONST_ANI_POISON, target = true },
}

monster.defenses = {
	defense = 15,
	armor = 16,
	mitigation = 1.04,
	{ name = "combat", interval = 2000, chance = 25, type = COMBAT_HEALING, minDamage = 30, maxDamage = 40, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 10 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 20 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -15 },
	{ type = COMBAT_HOLYDAMAGE, percent = 10 },
	{ type = COMBAT_DEATHDAMAGE, percent = -5 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = true },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
