-- Version: 4.0
-- Monster: https://tibia.fandom.com/wiki/Minotaur
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Minotaur
---


local mType = Game.createMonsterType("Minotaur")
local monster = {}

monster.description = "a minotaur"
monster.experience = 50
monster.outfit = {
	lookType = 25,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 100
monster.maxHealth = 100
monster.race = "blood"
monster.corpse = 5969
monster.speed = 84
monster.manaCost = 330

monster.changeTarget = {
	interval = 4000,
	chance = 0,
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
	illusionable = true,
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
	{ text = "Kaplar!", yell = false },
	{ text = "Hurr", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 66310, minCount = 1, maxCount = 25 },  -- 2148
	{ id = "plate shield", chance = 20043 },  -- 2510
	{ id = "mace", chance = 13073 },  -- 2398
	{ id = "chain armor", chance = 10054 },  -- 2464
	{ id = "brass helmet", chance = 7983 },  -- 2460
	{ id = 2376, chance = 4974 },  -- sword
	{ id = "meat", chance = 4959 },  -- 2666
	{ id = "axe", chance = 3975 },  -- 2386
	{ id = "minotaur horn", chance = 2027, minCount = 1, maxCount = 2 },  -- 12428
	{ id = "minotaur leather", chance = 1007 },  -- 5878
	{ id = 2554, chance = 306 },  -- shovel
	{ id = "bronze amulet", chance = 108 },  -- 2172
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -45 },
}

monster.defenses = {
	defense = 15,
	armor = 11,
	mitigation = 0.28,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 20 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -10 },
	{ type = COMBAT_HOLYDAMAGE, percent = 10 },
	{ type = COMBAT_DEATHDAMAGE, percent = -10 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = false },
	{ type = "bleed", condition = false },
}

mType:register(monster)