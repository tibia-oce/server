-- Version: 10.55
-- Monster: https://tibia.fandom.com/wiki/Salamander_Trainer
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Salamander_Trainer
---


local mType = Game.createMonsterType("Salamander Trainer")
local monster = {}

monster.description = "a salamander trainer"
monster.experience = 70
monster.outfit = {
	lookType = 15,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.health = 220
monster.maxHealth = 220
monster.race = "blood"
monster.corpse = 5960
monster.speed = 145
monster.manaCost = 0

monster.changeTarget = {
	interval = 2000,
	chance = 0,
}

monster.strategiesTarget = {
	nearest = 100,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = true,
	rewardBoss = false,
	illusionable = false,
	canPushItems = false,
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 1,
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
}

monster.loot = {
	{ id = "gold coin", chance = 100000, minCount = 1, maxCount = 14 },  -- 2148
	{ id = "meat", chance = 35714 },  -- 2666
	{ id = "short sword", chance = 28571 },  -- 2406
	{ id = "axe", chance = 25000 },  -- 2386
	{ id = "spear", chance = 17857, minCount = 1, maxCount = 3 },  -- 2389
	{ id = "bone club", chance = 7143 },  -- 2449
	{ id = 2120, chance = 3571 },  -- rope
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, skill = 10, attack = 25 },
}

monster.defenses = {
	defense = 13,
	armor = 7,
	mitigation = 0.38,
	{ name = "combat", interval = 2000, chance = 25, type = COMBAT_HEALING, minDamage = 10, maxDamage = 25, effect = CONST_ME_MAGIC_GREEN, target = false },
	{ name = "salamander trainer summon", interval = 2000, chance = 30, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 15 },
	{ type = COMBAT_EARTHDAMAGE, percent = 15 },
	{ type = COMBAT_FIREDAMAGE, percent = 15 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)