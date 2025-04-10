-- Version: 9.50
-- Monster: https://tibia.fandom.com/wiki/Tormentor
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Tormentor
---


local mType = Game.createMonsterType("Tormentor")
local monster = {}

monster.description = "Tormentor"
monster.experience = 3200
monster.outfit = {
	lookType = 245,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.health = 4100
monster.maxHealth = 4100
monster.race = "blood"
monster.corpse = 6339
monster.speed = 120
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
	rewardBoss = true,
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
	{ text = "Take a ride with me.", yell = false },
	{ text = "Pffffrrrrrrrrrrrr.", yell = false },
	{ text = "Close your eyes... I have something for you.", yell = false },
	{ text = "I will make you scream.", yell = false },
}

monster.loot = {
	{ id = 6300, chance = 100000 },  -- death ring
	{ id = "demonic essence", chance = 100000 },  -- 6500
	{ id = "essence of a bad dream", chance = 100000 },  -- 11223
	{ id = "concentrated demonic blood", chance = 100000 },  -- todo: flask of demonic blood does not exist in items.xml
	{ id = "ham", chance = 100000 },  -- 2671
	{ id = "platinum coin", chance = 92647, minCount = 1, maxCount = 10 },  -- 2152
	{ id = "scythe leg", chance = 86765 },  -- 11229
	{ id = "knight legs", chance = 72059 },  -- 2477
	{ id = "mysterious voodoo skull", chance = 42647 },  -- 5669
	{ id = "skeleton decoration", chance = 32353 },  -- 6526
	{ id = "war axe", chance = 16176 },  -- 2454
	{ id = "boots of haste", chance = 11765 },  -- 2195
	{ id = "nightmare blade", chance = 10294 },  -- 7418
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -340 },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_DEATHDAMAGE, minDamage = -130, maxDamage = -170, range = 7, radius = 1, shootEffect = CONST_ANI_DEATH, effect = CONST_ME_SMALLCLOUDS, target = true },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_EARTHDAMAGE, minDamage = -250, maxDamage = -400, range = 7, radius = 4, shootEffect = CONST_ANI_POISON, effect = CONST_ME_POISONAREA, target = true },
}

monster.defenses = {
	defense = 25,
	armor = 25,
	mitigation = 1.23,
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_HEALING, minDamage = 60, maxDamage = 100, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "speed", interval = 2000, chance = 15, effect = CONST_ME_MAGIC_RED, speed = 240},
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
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 100 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)