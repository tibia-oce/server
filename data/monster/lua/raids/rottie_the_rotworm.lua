-- Version: 8.50
-- Monster: https://tibia.fandom.com/wiki/Rottie_the_Rotworm
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Rottie_the_Rotworm
---


local mType = Game.createMonsterType("Rottie the Rotworm")
local monster = {}

monster.description = "Rottie the Rotworm"
monster.experience = 40
monster.outfit = {
	lookType = 26,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.health = 65
monster.maxHealth = 65
monster.race = "blood"
monster.corpse = 5967
monster.speed = 90
monster.manaCost = 0

monster.changeTarget = {
	interval = 2000,
	chance = 0,
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
	canPushItems = false,
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
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
}

monster.loot = {
	{ id = "lump of dirt", chance = 100000 },  -- 10609
	{ id = "gold coin", chance = 84783, minCount = 1, maxCount = 18 },  -- 2148
	{ id = "worm", chance = 45652, minCount = 1, maxCount = 5 },  -- 3976
	{ id = "mace", chance = 43478 },  -- 2398
	{ id = 2376, chance = 28261 },  -- sword
	{ id = "ham", chance = 17391 },  -- 2671
	{ id = "meat", chance = 17391 },  -- 2666
	{ id = "copper shield", chance = 15217 },  -- 2530
	{ id = "legion helmet", chance = 10870 },  -- 2480
	{ id = "katana", chance = 8696 },  -- 2412
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, skill = 30, attack = 30 },
}

monster.defenses = {
	defense = 11,
	armor = 8,
	mitigation = 0.38,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = false },
	{ type = "bleed", condition = false },
}

mType:register(monster)