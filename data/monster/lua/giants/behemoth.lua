-- Version: 6.4
-- Monster: https://tibia.fandom.com/wiki/Behemoth
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Behemoth
---


local mType = Game.createMonsterType("Behemoth")
local monster = {}

monster.description = "a behemoth"
monster.experience = 2500
monster.outfit = {
	lookType = 55,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 4000
monster.maxHealth = 4000
monster.race = "blood"
monster.corpse = 5999
monster.speed = 170
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10,
}

monster.strategiesTarget = {
	nearest = 70,
	damage = 30,
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
	staticAttackChance = 70,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = true,
	canWalkOnPoison = true}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Crush the intruders!", yell = false },
	{ text = "You're so little!", yell = false },
	{ text = "Human flesh -  delicious!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 100000, minCount = 1, maxCount = 200 },  -- 2148
	{ id = "platinum coin", chance = 60177, minCount = 1, maxCount = 5 },  -- 2152
	{ id = "meat", chance = 29625 },  -- 2666
	{ id = "battle stone", chance = 14989 },  -- 12403
	{ id = "double axe", chance = 10046 },  -- 2387
	{ id = "assassin star", chance = 9952, minCount = 1, maxCount = 5 },  -- 7368
	{ id = "small amethyst", chance = 6049, minCount = 1, maxCount = 5 },  -- 2150
	{ id = "two handed sword", chance = 6038 },  -- 2377
	{ id = "great health potion", chance = 5052 },  -- 7591
	{ id = "dark armor", chance = 4148 },  -- 2489
	{ id = "plate armor", chance = 4077 },  -- 2463
	{ id = "crystal necklace", chance = 2563 },  -- 2125
	{ id = "perfect behemoth fang", chance = 999 },  -- 5893
	{ id = "giant sword", chance = 959 },  -- 2393
	{ id = "strange symbol", chance = 823 },  -- 2174
	{ id = 2231, chance = 680 },  -- big bone
	{ id = 2553, chance = 611 },  -- pick
	{ id = "behemoth claw", chance = 461 },  -- 5930
	{ id = "steel boots", chance = 442 },  -- 2645
	{ id = "crowbar", chance = 128 },  -- 2416
	{ id = 7396, chance = 113 },  -- behemoth trophy
	{ id = "amphora", chance = 101 },  -- 2023
	{ id = "titan axe", chance = 71 },  -- 7413
	{ id = "war axe", chance = 67 },  -- 2454
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -450 },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -200, range = 7, shootEffect = CONST_ANI_LARGEROCK, target = false },
}

monster.defenses = {
	defense = 45,
	armor = 50,
	mitigation = 1.74,
	{ name = "speed", interval = 2000, chance = 15, effect = CONST_ME_MAGIC_RED, speed = 340},
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 10 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 10 },
	{ type = COMBAT_EARTHDAMAGE, percent = 80 },
	{ type = COMBAT_FIREDAMAGE, percent = 30 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -10 },
	{ type = COMBAT_HOLYDAMAGE, percent = 30 },
	{ type = COMBAT_DEATHDAMAGE, percent = -5 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)