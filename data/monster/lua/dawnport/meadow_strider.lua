-- Version: 10.55
-- Monster: https://tibia.fandom.com/wiki/Meadow_Strider
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Meadow_Strider
---


local mType = Game.createMonsterType("Meadow Strider")
local monster = {}

monster.description = "a meadow strider"
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
monster.corpse = 21450
monster.speed = 68
monster.manaCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 8,
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
	{ id = "gold coin", chance = 100000, minCount = 1, maxCount = 10 },  -- 2148
	{ id = "fish", chance = 25410, minCount = 1, maxCount = 2 },  -- 2667
	{ id = "meat", chance = 23156 },  -- 2666
	{ id = "worm", chance = 17008, minCount = 1, maxCount = 2 },  -- 3976
	{ id = "hatchet", chance = 9836 },  -- 2388
	{ id = "longsword", chance = 7582 },  -- 2397
	{ id = "mace", chance = 6352 },  -- 2398
	{ id = 2120, chance = 4098 },  -- rope
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, skill = 10, attack = 13 },
	{ name = "combat", interval = 2000, chance = 11, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -10, range = 7, shootEffect = CONST_ANI_SMALLSTONE, effect = CONST_ME_EXPLOSIONAREA, target = false },
}

monster.defenses = {
	defense = 2,
	armor = 1,
	--	mitigation = ???,
	{ name = "speed", interval = 2000, chance = 13, effect = CONST_ME_HITAREA, speed = 136},
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
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)