-- Version: 10.80
-- Monster: https://tibia.fandom.com/wiki/Werebadger
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Werebadger
---


local mType = Game.createMonsterType("Werebadger")
local monster = {}

monster.description = "a werebadger"
monster.experience = 1600
monster.outfit = {
	lookType = 729,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 1700
monster.maxHealth = 1700
monster.race = "blood"
monster.corpse = 22067
monster.speed = 130
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
	canWalkOnFire = true,
	canWalkOnPoison = true}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "SNUFFLE", yell = true },
	{ text = "Sniff Sniff", yell = false },
}

monster.loot = {
	{ id = "platinum coin", chance = 100000, minCount = 1, maxCount = 3 },  -- 2152
	{ id = "gold coin", chance = 81905, minCount = 1, maxCount = 75 },  -- 2148
	{ id = "beetroot", chance = 25578 },  -- 8845
	{ id = "werebadger skull", chance = 15986 },  -- 24711
	{ id = "werebadger claws", chance = 12381 },  -- 24707
	{ id = "brown mushroom", chance = 5714 },  -- 2789
	{ id = "troll green", chance = 5510 },  -- 2805
	{ id = "mana potion", chance = 5238 },  -- 7620
	{ id = "strong mana potion", chance = 4286 },  -- 7589
	{ id = "great mana potion", chance = 1497 },  -- 7590
	{ id = "moonlight crystals", chance = 1497 },  -- 24739
	{ id = "badger boots", chance = 952 },  -- 24742
	{ id = "ring of healing", chance = 884 },  -- 2214
	{ id = "wand of voodoo", chance = 612 },  -- 8922
	{ id = "werewolf amulet", chance = 476 },  -- 24716
	{ id = "platinum amulet", chance = 340 },  -- 2171
	{ id = "underworld rod", chance = 340 },  -- 8910
	{ id = 24757, chance = 272 },  -- werebadger trophy
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, skill = 50, attack = 60, condition = { type = CONDITION_POISON, totalDamage = 140, interval = 4000 } },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_LIFEDRAIN, minDamage = -21, maxDamage = -150, range = 7, shootEffect = CONST_ANI_EARTH, effect = CONST_ME_CARNIPHILA, target = true },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_EARTHDAMAGE, minDamage = -10, maxDamage = -100, length = 8, spread = 0, effect = CONST_ME_CARNIPHILA, target = false },
	{ name = "speed", interval = 4000, speed = -500, chance = 20, radius = 7, effect = CONST_ME_POFF, target = true },
}

monster.defenses = {
	defense = 30,
	armor = 31,
	mitigation = 0.75,
	{ name = "combat", interval = 2000, chance = 25, type = COMBAT_HEALING, minDamage = 50, maxDamage = 100, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "invisible", interval = 2000, chance = 20, effect = CONST_ME_MAGIC_BLUE },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 5 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 10 },
	{ type = COMBAT_EARTHDAMAGE, percent = 50 },
	{ type = COMBAT_FIREDAMAGE, percent = -5 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -5 },
	{ type = COMBAT_HOLYDAMAGE, percent = -5 },
	{ type = COMBAT_DEATHDAMAGE, percent = 40 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)