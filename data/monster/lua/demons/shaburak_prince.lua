-- Version: 9.10
-- Monster: https://tibia.fandom.com/wiki/Shaburak_Prince
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Shaburak_Prince
---


local mType = Game.createMonsterType("Shaburak Prince")
local monster = {}

monster.description = "a shaburak prince"
monster.experience = 1700
monster.outfit = {
	lookType = 418,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 2600
monster.maxHealth = 2600
monster.race = "fire"
monster.corpse = 12834
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
	canWalkOnPoison = false}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "GREEN IS MEAN!", yell = true },
	{ text = "WE RULE!", yell = true },
	{ text = "POWER TO THE SHABURAK!", yell = true },
	{ text = "DEATH TO THE ASKARAK!", yell = true },
	{ text = "ONLY WE ARE TRUE DEMONS!", yell = true },
}

monster.loot = {
	{ id = "gold coin", chance = 96072, minCount = 1, maxCount = 178 },  -- 2148
	{ id = "platinum coin", chance = 33969, minCount = 1, maxCount = 4 },  -- 2152
	{ id = "strong mana potion", chance = 15488 },  -- 7589
	{ id = "strong health potion", chance = 15114 },  -- 7588
	{ id = "small ruby", chance = 12832, minCount = 1, maxCount = 5 },  -- 2147
	{ id = "brown mushroom", chance = 5125 },  -- 2789
	{ id = "stealth ring", chance = 4938 },  -- 2165
	{ id = "wand of inferno", chance = 935 },  -- 2187
	{ id = "magma coat", chance = 711 },  -- 7899
	{ id = "magic sulphur", chance = 561 },  -- 5904
	{ id = "bullseye potion", chance = 524 },  -- 7443
	{ id = "butcher's axe", chance = 224 },  -- 7412
	{ id = "demonic finger", chance = 187 },  -- 13530
	{ id = "steel boots", chance = 75 },  -- 2645
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -319 },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_FIREDAMAGE, minDamage = -40, maxDamage = -90, range = 7, radius = 6, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREATTACK, target = false },
	{ name = "shaburak wave", interval = 2000, chance = 15, minDamage = -100, maxDamage = -200, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_FIREDAMAGE, minDamage = -150, maxDamage = -250, length = 4, spread = 0, effect = CONST_ME_HITBYFIRE, target = false },
	{ name = "speed", interval = 2000, chance = 15, speed = -700, radius = 1, effect = CONST_ME_MAGIC_RED, target = true, duration = 15000 },
}

monster.defenses = {
	defense = 30,
	armor = 45,
	mitigation = 1.32,
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_HEALING, minDamage = 100, maxDamage = 150, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 70 },
	{ type = COMBAT_EARTHDAMAGE, percent = -15 },
	{ type = COMBAT_FIREDAMAGE, percent = 100 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 70 },
	{ type = COMBAT_HOLYDAMAGE, percent = -5 },
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)