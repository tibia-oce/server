-- Version: 9.50
-- Monster: https://tibia.fandom.com/wiki/Crypt_Defiler
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Crypt_Defiler
---


local mType = Game.createMonsterType("Crypt Defiler")
local monster = {}

monster.description = "a crypt defiler"
monster.experience = 70
monster.outfit = {
	lookType = 146,
	lookHead = 62,
	lookBody = 132,
	lookLegs = 42,
	lookFeet = 75,
	lookAddons = 3,
	lookMount = 0,
}


monster.health = 185
monster.maxHealth = 185
monster.race = "blood"
monster.corpse = 18078
monster.speed = 95
monster.manaCost = 450

monster.changeTarget = {
	interval = 4000,
	chance = 10,
}

monster.strategiesTarget = {
	nearest = 100,
}

monster.flags = {
	summonable = true,
	attackable = true,
	hostile = true,
	convinceable = true,
	pushable = true,
	rewardBoss = false,
	illusionable = false,
	canPushItems = false,
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 15,
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
	{ text = "I smell gold!", yell = false },
	{ text = "You'll make a fine fake-mummy to be sold!", yell = false },
	{ text = "Untold riches are awaiting me!", yell = false },
	{ text = "I don't like competition!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 50900, maxCount = 39 },
	{ id = "axe", chance = 2730 },
	{ id = "mace", chance = 1800 },
	{ id = "iron helmet", chance = 450 },
	{ id = "brass armor", chance = 2240 },
	{ id = "steel shield", chance = 450 },
	{ id = "nomad parchment", chance = 220 },
	{ id = "potato", chance = 4840, maxCount = 3 },
	{ id = "dirty turban", chance = 1570 },
	{ id = "rope belt", chance = 4040 },
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -90 },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -40, range = 7, radius = 1, shootEffect = CONST_ANI_THROWINGSTAR, target = true },
}

monster.defenses = {
	defense = 15,
	armor = 6,
	mitigation = 0.41,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = -10 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 20 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -10 },
	{ type = COMBAT_HOLYDAMAGE, percent = 20 },
	{ type = COMBAT_DEATHDAMAGE, percent = -10 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = false },
	{ type = "bleed", condition = false },
}

mType:register(monster)
