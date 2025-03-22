-- Version: 9.80
-- Monster: https://tibia.fandom.com/wiki/Marsh_Stalker
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Marsh_Stalker
---


local mType = Game.createMonsterType("Marsh Stalker")
local monster = {}

monster.description = "a marsh stalker"
monster.experience = 50
monster.outfit = {
	lookType = 530,
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
monster.corpse = 19708
monster.speed = 75
monster.manaCost = 0

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
	convinceable = false,
	pushable = false,
	rewardBoss = false,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 10,
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
	{ text = "Rrrawk! Rrrrawk!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 63949, minCount = 1, maxCount = 25 },  -- 2148
	{ id = 2667 , chance = 20246, minCount = 1, maxCount = 2 },  -- fish
	{ id = "meat", chance = 19876 },  -- 2666
	{ id = "worm", chance = 14739, minCount = 1, maxCount = 2 },  -- 3976
	{ id = "marsh stalker feather", chance = 8647 },  -- 19742
	{ id = "longsword", chance = 7522 },  -- 2397
	{ id = "marsh stalker beak", chance = 6032 },  -- 19741
	{ id = 2120, chance = 4898 },  -- rope
	{ id = "seeds", chance = 98 },  -- 7732
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -10 },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -8, range = 7, radius = 1, shootEffect = CONST_ANI_EXPLOSION, effect = CONST_ME_EXPLOSIONAREA, target = true },
}

monster.defenses = {
	defense = 3,
	armor = 3,
	mitigation = 0.23,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = -5 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 5 },
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