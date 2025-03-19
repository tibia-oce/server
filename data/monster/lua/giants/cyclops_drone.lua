-- Version: 8.10
-- Monster: https://tibia.fandom.com/wiki/Cyclops_Drone
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Cyclops_Drone
---


local mType = Game.createMonsterType("Cyclops Drone")
local monster = {}

monster.description = "a cyclops drone"
monster.experience = 200
monster.outfit = {
	lookType = 280,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 325
monster.maxHealth = 325
monster.race = "blood"
monster.corpse = 771
monster.speed = 99
monster.manaCost = 525

monster.changeTarget = {
	interval = 4000,
	chance = 10,
}

monster.strategiesTarget = {
	nearest = 70,
	damage = 30,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = true,
	pushable = false,
	rewardBoss = false,
	illusionable = true,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 95,
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
	{ text = "Fee! Fie! Foe! Fum!", yell = false },
	{ text = "Luttl pest!", yell = false },
	{ text = "Me makking you pulp!", yell = false },
	{ text = "Humy tasy! Hum hum!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 82028, minCount = 1, maxCount = 30 },  -- 2148
	{ id = "meat", chance = 50283 },  -- 2666
	{ id = "short sword", chance = 7898 },  -- 2406
	{ id = "cyclops toe", chance = 6904 },  -- 10574
	{ id = "plate shield", chance = 2031 },  -- 2510
	{ id = "battle shield", chance = 1579 },  -- 2513
	{ id = 2381, chance = 670 },  -- halberd
	{ id = "strong health potion", chance = 503 },  -- 7588
	{ id = "dark helmet", chance = 193 },  -- 2490
	{ id = 7398, chance = 122 },  -- cyclops trophy
	{ id = "club ring", chance = 71 },  -- 2209
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -105 },
	{ name = "combat", interval = 2000, chance = 35, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -80, range = 7, shootEffect = CONST_ANI_LARGEROCK, target = false },
}

monster.defenses = {
	defense = 20,
	armor = 25,
	mitigation = 0.72,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 10 },
	{ type = COMBAT_EARTHDAMAGE, percent = -10 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 20 },
	{ type = COMBAT_HOLYDAMAGE, percent = 20 },
	{ type = COMBAT_DEATHDAMAGE, percent = -5 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = false },
	{ type = "bleed", condition = false },
}

mType:register(monster)