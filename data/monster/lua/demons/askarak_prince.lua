-- Version: 9.10
-- Monster: https://tibia.fandom.com/wiki/Askarak_Prince
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Askarak_Prince
---


local mType = Game.createMonsterType("Askarak Prince")
local monster = {}

monster.description = "an askarak prince"
monster.experience = 1700
monster.outfit = {
	lookType = 419,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 2600
monster.maxHealth = 2600
monster.race = "venom"
monster.corpse = 12822
monster.speed = 125
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
	{ text = "DEATH TO THE SHABURAK!", yell = true },
	{ text = "GREEN WILL RULE!", yell = true },
	{ text = "ONLY WE ARE TRUE DEMONS!", yell = true },
	{ text = "RED IS MAD!", yell = true },
	{ text = "WE RULE!", yell = true },
}

monster.loot = {
	{ id = "gold coin", chance = 95527, minCount = 1, maxCount = 186 },  -- 2148
	{ id = "platinum coin", chance = 35410, minCount = 1, maxCount = 4 },  -- 2152
	{ id = "strong mana potion", chance = 15761 },  -- 7589
	{ id = "strong health potion", chance = 13951 },  -- 7588
	{ id = "small emerald", chance = 11981, minCount = 1, maxCount = 5 },  -- 2149
	{ id = "brown mushroom", chance = 6550, minCount = 1, maxCount = 4 },  -- 2789
	{ id = "stealth ring", chance = 5378 },  -- 2165
	{ id = "mastermind potion", chance = 1651 },  -- 7440
	{ id = "magic sulphur", chance = 958 },  -- 5904
	{ id = "springsprout rod", chance = 799 },  -- 8912
	{ id = "terra mantle", chance = 692 },  -- 7884
	{ id = "demonic finger", chance = 373 },  -- 13530
	{ id = "giant sword", chance = 319 },  -- 2393
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -353 },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_EARTHDAMAGE, minDamage = -70, maxDamage = -250, range = 7, radius = 6, shootEffect = CONST_ANI_POISON, effect = CONST_ME_GREEN_RINGS, target = false },
	{ name = "askarak wave", interval = 2000, chance = 15, minDamage = -100, maxDamage = -200, target = false },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_EARTHDAMAGE, minDamage = -100, maxDamage = -200, length = 4, spread = 0, effect = CONST_ME_GREEN_RINGS, target = false },
	{ name = "speed", interval = 2000, chance = 15, speed = -700, radius = 1, effect = CONST_ME_MAGIC_RED, target = true, duration = 15000 },
}

monster.defenses = {
	defense = 30,
	armor = 45,
	mitigation = 1.32,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 70 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = -15 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 70 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = -5 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)