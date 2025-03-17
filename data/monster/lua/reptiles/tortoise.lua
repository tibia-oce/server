-- Version: 7.8
-- Monster: https://tibia.fandom.com/wiki/Tortoise
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Tortoise
---


local mType = Game.createMonsterType("Tortoise")
local monster = {}

monster.description = "a tortoise"
monster.experience = 90
monster.outfit = {
	lookType = 197,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 185
monster.maxHealth = 185
monster.race = "blood"
monster.corpse = 6072
monster.speed = 65
monster.manaCost = 445

monster.changeTarget = {
	interval = 5000,
	chance = 0,
}

monster.strategiesTarget = {
	nearest = 100,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = true,
	pushable = false,
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
}

monster.loot = {
	{ id = "gold coin", chance = 60219, minCount = 1, maxCount = 30 },  -- 2148
	{ id = "fish", chance = 5058 },  -- 2667
	{ id = "plate shield", chance = 2924 },  -- 2510
	{ id = "tortoise egg", chance = 1086, minCount = 1, maxCount = 2 },  -- 5678
	{ id = "battle hammer", chance = 861 },  -- 2417
	{ id = "turtle shell", chance = 787 },  -- 5899
	{ id = "tortoise shield", chance = 164 },  -- 6131
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -50 },
}

monster.defenses = {
	defense = 30,
	armor = 22,
	mitigation = 0.51,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 20 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 20 },
	{ type = COMBAT_FIREDAMAGE, percent = -10 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 20 },
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