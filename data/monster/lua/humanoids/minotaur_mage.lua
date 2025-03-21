-- Version: 5.1
-- Monster: https://tibia.fandom.com/wiki/Minotaur_Mage
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Minotaur_Mage
---


local mType = Game.createMonsterType("Minotaur Mage")
local monster = {}

monster.description = "a minotaur mage"
monster.experience = 150
monster.outfit = {
	lookType = 23,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 155
monster.maxHealth = 155
monster.race = "blood"
monster.corpse = 5981
monster.speed = 85
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
	staticAttackChance = 90,
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
	{ text = "Learrn tha secrret uf deathhh!", yell = false },
	{ text = "Kaplar!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 85333, minCount = 1, maxCount = 35 },  -- 2148
	{ id = 2684, chance = 14658, minCount = 1, maxCount = 8 },  -- carrot
	{ id = "purple robe", chance = 6070 },  -- 12429
	{ id = 2050, chance = 4991 },  -- torch
	{ id = "leather legs", chance = 4870 },  -- 2649
	{ id = "leather helmet", chance = 3194 },  -- 2461
	{ id = "minotaur horn", chance = 3078, minCount = 1, maxCount = 2 },  -- 12428
	{ id = "minotaur leather", chance = 2052 },  -- 5878
	{ id = "taurus mace", chance = 986 },  -- 7425
	{ id = "wand of cosmic energy", chance = 569 },  -- 2189
	{ id = "mana potion", chance = 457 },  -- 7620
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -20 },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_ENERGYDAMAGE, minDamage = -20, maxDamage = -59, range = 7, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_ENERGYHIT, target = false },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_FIREDAMAGE, minDamage = -50, maxDamage = -105, range = 7, radius = 1, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = true },
	{ name = "energyfield", interval = 2000, chance = 10, range = 7, radius = 1, shootEffect = CONST_ANI_ENERGYBALL, target = true },
}

monster.defenses = {
	defense = 15,
	armor = 18,
	mitigation = 1.04,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 20 },
	{ type = COMBAT_EARTHDAMAGE, percent = 20 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -10 },
	{ type = COMBAT_HOLYDAMAGE, percent = 10 },
	{ type = COMBAT_DEATHDAMAGE, percent = -5 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
