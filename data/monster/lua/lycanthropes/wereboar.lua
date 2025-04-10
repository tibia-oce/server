-- Version: 10.80
-- Monster: https://tibia.fandom.com/wiki/Wereboar
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Wereboar
---


local mType = Game.createMonsterType("Wereboar")
local monster = {}

monster.description = "a wereboar"
monster.experience = 2000
monster.outfit = {
	lookType = 721,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 2200
monster.maxHealth = 2200
monster.race = "blood"
monster.corpse = 22066
monster.speed = 150
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
	{ text = "GRUNT", yell = true },
}

monster.loot = {
	{ id = "platinum coin", chance = 100000, minCount = 1, maxCount = 3 },  -- 2152
	{ id = "gold coin", chance = 80679, minCount = 1, maxCount = 75 },  -- 2148
	{ id = "wereboar tusks", chance = 14929 },  -- 24710
	{ id = "wereboar hooves", chance = 14556 },  -- 24709
	{ id = "brown mushroom", chance = 7209, minCount = 1, maxCount = 2 },  -- 2789
	{ id = "strong health potion", chance = 4737 },  -- 7588
	{ id = "ultimate health potion", chance = 1878 },  -- 8473
	{ id = "wereboar loincloth", chance = 1616 },  -- 24743
	{ id = "berserk potion", chance = 939 },  -- 7439
	{ id = "werewolf amulet", chance = 691 },  -- 24716
	{ id = "furry club", chance = 677 },  -- 7432
	{ id = "stone skin amulet", chance = 663 },  -- 2197
	{ id = "moonlight crystals", chance = 483 },  -- 24739
	{ id = "fur armor", chance = 290 },  -- 24741
	{ id = 24758, chance = 138 },  -- wereboar trophy
	{ id = "dreaded cleaver", chance = 124 },  -- 7419
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, skill = 50, attack = 60, condition = { type = CONDITION_POISON, totalDamage = 140, interval = 4000 } },
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -385 },
	{ name = "speed", interval = 4000, speed = -200, chance = 20, radius = 7, effect = CONST_ME_POFF, target = true },
}

monster.defenses = {
	defense = 30,
	armor = 32,
	mitigation = 0.78,
	{ name = "combat", interval = 2000, chance = 25, type = COMBAT_HEALING, minDamage = 50, maxDamage = 100, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "invisible", interval = 2000, chance = 20, effect = CONST_ME_MAGIC_BLUE },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 15 },
	{ type = COMBAT_EARTHDAMAGE, percent = 50 },
	{ type = COMBAT_FIREDAMAGE, percent = -5 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 5 },
	{ type = COMBAT_HOLYDAMAGE, percent = -5 },
	{ type = COMBAT_DEATHDAMAGE, percent = 50 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)