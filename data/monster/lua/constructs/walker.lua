-- Version: 10.50
-- Monster: https://tibia.fandom.com/wiki/Walker
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Walker
---


local mType = Game.createMonsterType("Walker")
local monster = {}

monster.description = "a walker"
monster.experience = 2200
monster.outfit = {
	lookType = 605,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 3000
monster.maxHealth = 3000
monster.race = "venom"
monster.corpse = 20972
monster.speed = 150
monster.manaCost = 0

monster.changeTarget = {
	interval = 2000,
	chance = 5,
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
	canWalkOnFire = true,
	canWalkOnPoison = true}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "*clop clop*", yell = false },
	{ text = "*slosh*", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 100000, minCount = 1, maxCount = 200 },  -- 2148
	{ id = "platinum coin", chance = 51547, minCount = 1, maxCount = 3 },  -- 2152
	{ id = "metal toe", chance = 20677 },  -- 23569
	{ id = "small topaz", chance = 10666, minCount = 1, maxCount = 6 },  -- 9970
	{ id = "great health potion", chance = 8118 },  -- 7591
	{ id = "great spirit potion", chance = 7244 },  -- 8472
	{ id = "small amethyst", chance = 5060, minCount = 1, maxCount = 3 },  -- 2150
	{ id = "small emerald", chance = 4259, minCount = 1, maxCount = 3 },  -- 2149
	{ id = "metal spats", chance = 3604 },  -- 23540
	{ id = "gearwheel chain", chance = 2184 },  -- 23541
	{ id = "crystal mace", chance = 619 },  -- 2445
	{ id = "steel boots", chance = 510 },  -- 2645
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, skill = 70, attack = 50 },
	{ name = "walker skill reducer", interval = 2000, chance = 21, target = false },
	{ name = "combat", interval = 2000, chance = 17, type = COMBAT_FIREDAMAGE, minDamage = -125, maxDamage = -245, length = 8, spread = 0, effect = CONST_ME_EXPLOSIONHIT, target = false },
}

monster.defenses = {
	defense = 45,
	armor = 47,
	mitigation = 1.62,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 5 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 50 },
	{ type = COMBAT_FIREDAMAGE, percent = 35 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 5 },
	{ type = COMBAT_HOLYDAMAGE, percent = 40 },
	{ type = COMBAT_DEATHDAMAGE, percent = 15 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)