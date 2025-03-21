-- Version: 7.9
-- Monster: https://tibia.fandom.com/wiki/Nightmare
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Nightmare
---


local mType = Game.createMonsterType("Nightmare")
local monster = {}

monster.description = "a nightmare"
monster.experience = 1800
monster.outfit = {
	lookType = 245,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 2700
monster.maxHealth = 2700
monster.race = "blood"
monster.corpse = 6339
monster.speed = 232
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
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 300,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = true}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Close your eyes... I want to show you something.", yell = false },
	{ text = "I will haunt you forever!", yell = false },
	{ text = "Pffffrrrrrrrrrrrr.", yell = false },
	{ text = "I will make you scream.", yell = false },
	{ text = "Take a ride with me.", yell = false },
	{ text = "Weeeheeheeeheee!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 96915, minCount = 1, maxCount = 155 },  -- 2148
	{ id = "ham", chance = 29502 },  -- 2671
	{ id = "soul orb", chance = 21323 },  -- 5944
	{ id = "concentrated demonic blood", chance = 19778 },  -- todo: flask of demonic blood does not exist in items.xml
	{ id = "essence of a bad dream", chance = 15126 },  -- 11223
	{ id = "demonic essence", chance = 10050 },  -- 6500
	{ id = "scythe leg", chance = 10025 },  -- 11229
	{ id = 2547, chance = 7365, minCount = 1, maxCount = 4 },  -- power bolt
	{ id = "platinum coin", chance = 2532, minCount = 1, maxCount = 3 },  -- 2152
	{ id = 6300, chance = 1167 },  -- death ring
	{ id = "ancient shield", chance = 984 },  -- 2532
	{ id = "knight legs", chance = 971 },  -- 2477
	{ id = "skeleton decoration", chance = 342 },  -- 6526
	{ id = "boots of haste", chance = 322 },  -- 2195
	{ id = "war axe", chance = 111 },  -- 2454
	{ id = "mysterious voodoo skull", chance = 103 },  -- 5669
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -150 },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_DEATHDAMAGE, minDamage = -120, maxDamage = -170, range = 7, radius = 1, shootEffect = CONST_ANI_DEATH, effect = CONST_ME_SMALLCLOUDS, target = true },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_EARTHDAMAGE, minDamage = -150, maxDamage = -350, range = 7, radius = 4, shootEffect = CONST_ANI_POISON, effect = CONST_ME_POISONAREA, target = true },
}

monster.defenses = {
	defense = 25,
	armor = 25,
	mitigation = 0.70,
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_HEALING, minDamage = 60, maxDamage = 100, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "speed", interval = 2000, chance = 15, effect = CONST_ME_MAGIC_RED, speed = 464},
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 20 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = 20 },
	{ type = COMBAT_LIFEDRAIN, percent = 100 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 10 },
	{ type = COMBAT_HOLYDAMAGE, percent = -25 },
	{ type = COMBAT_DEATHDAMAGE, percent = 100 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
