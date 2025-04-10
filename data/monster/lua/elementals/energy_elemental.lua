-- Version: 8.20
-- Monster: https://tibia.fandom.com/wiki/Energy_Elemental
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Energy_Elemental
---


local mType = Game.createMonsterType("Energy Elemental")
local monster = {}

monster.description = "an energy elemental"
monster.experience = 550
monster.outfit = {
	lookType = 293,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 500
monster.maxHealth = 500
monster.race = "venom"
monster.corpse = 8966
monster.speed = 115
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
	illusionable = true,
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 85,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = false}

monster.light = {
	level = 4,
	color = 143,
}

monster.voices = {
	interval = 5000,
	chance = 10,
}

monster.loot = {
	{ id = "gold coin", chance = 98068, minCount = 1, maxCount = 170 },  -- 2148
	{ id = "mana potion", chance = 11963 },  -- 7620
	{ id = "flash arrow", chance = 10096, minCount = 1, maxCount = 10 },  -- 7838
	{ id = "throwing star", chance = 10015, minCount = 1, maxCount = 5 },  -- 2399
	{ id = "strong mana potion", chance = 7946 },  -- 7589
	{ id = "crystal sword", chance = 6052 },  -- 7449
	{ id = "small amethyst", chance = 5035, minCount = 1, maxCount = 2 },  -- 2150
	{ id = "obsidian lance", chance = 3652 },  -- 2425
	{ id = 2124, chance = 2052 },  -- crystal ring
	{ id = "silver amulet", chance = 1089 },  -- 2170
	{ id = "energy ring", chance = 925 },  -- 2167
	{ id = "wand of cosmic energy", chance = 593 },  -- 2189
	{ id = "guardian shield", chance = 278 },  -- 2515
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -175 },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_ENERGYDAMAGE, minDamage = -125, maxDamage = -252, range = 7, radius = 2, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_ENERGYHIT, target = true },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_ENERGYDAMAGE, minDamage = -100, maxDamage = -130, range = 7, shootEffect = CONST_ANI_ENERGYBALL, effect = CONST_ME_ENERGYHIT, target = true },
	{ name = "energy elemental electrify", interval = 2000, chance = 20, target = false },
}

monster.defenses = {
	defense = 15,
	armor = 25,
	mitigation = 0.72,
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_HEALING, minDamage = 90, maxDamage = 150, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 35 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 100 },
	{ type = COMBAT_EARTHDAMAGE, percent = -15 },
	{ type = COMBAT_FIREDAMAGE, percent = 100 },
	{ type = COMBAT_LIFEDRAIN, percent = 100 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 100 },
	{ type = COMBAT_HOLYDAMAGE, percent = 5 },
	{ type = COMBAT_DEATHDAMAGE, percent = 5 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)