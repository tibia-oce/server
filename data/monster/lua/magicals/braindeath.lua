-- Version: 8.00
-- Monster: https://tibia.fandom.com/wiki/Braindeath
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Braindeath
---


local mType = Game.createMonsterType("Braindeath")
local monster = {}

monster.description = "a braindeath"
monster.experience = 985
monster.outfit = {
	lookType = 256,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 1225
monster.maxHealth = 1225
monster.race = "undead"
monster.corpse = 7256
monster.speed = 109
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
	targetDistance = 4,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true}

monster.light = {
	level = 3,
	color = 180,
}

monster.summon = {
	maxSummons = 2,
	summons = {
		{ name = "Vampire", chance = 10, interval = 2000, count = 2 },
	},
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "You have disturbed my thoughts!", yell = false },
	{ text = "I will turn you into something more useful!", yell = false },
	{ text = "Let me taste your brain!", yell = false },
	{ text = "You will be punished!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 99453, minCount = 1, maxCount = 90 },  -- 2148
	{ id = "bone sword", chance = 15005 },  -- 2450
	{ id = 7364, chance = 9591, minCount = 1, maxCount = 4 },  -- sniper arrow
	{ id = "steel shield", chance = 5910 },  -- 2509
	{ id = "piece of dead brain", chance = 5049 },  -- 10580
	{ id = "bonelord eye", chance = 2967 },  -- 5898
	{ id = "clerical mace", chance = 1976 },  -- 2423
	{ id = "haunted blade", chance = 1457 },  -- 7407
	{ id = 2175, chance = 962 },  -- spellbook
	{ id = "spiked squelcher", chance = 179 },  -- 7452
	{ id = "bonelord shield", chance = 104 },  -- 2518
	{ id = "bonelord helmet", chance = 98 },  -- 3972
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -100 },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_ENERGYDAMAGE, minDamage = -93, maxDamage = -170, range = 7, shootEffect = CONST_ANI_ENERGY, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_FIREDAMAGE, minDamage = -75, maxDamage = -125, range = 7, shootEffect = CONST_ANI_FIRE, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_DEATHDAMAGE, minDamage = -85, maxDamage = -170, range = 7, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_SMALLCLOUDS, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_EARTHDAMAGE, minDamage = -65, maxDamage = -125, range = 7, shootEffect = CONST_ANI_POISON, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_LIFEDRAIN, minDamage = -75, maxDamage = -85, range = 7, effect = CONST_ME_MAGIC_RED, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_MANADRAIN, minDamage = 0, maxDamage = -155, range = 7, target = false },
}

monster.defenses = {
	defense = 12,
	armor = 12,
	mitigation = 0.67,
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_HEALING, minDamage = 150, maxDamage = 200, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "speed", interval = 2000, chance = 15, effect = CONST_ME_MAGIC_RED, speed = 218},
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 15 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 10 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = -15 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 20 },
	{ type = COMBAT_HOLYDAMAGE, percent = -20 },
	{ type = COMBAT_DEATHDAMAGE, percent = 100 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)