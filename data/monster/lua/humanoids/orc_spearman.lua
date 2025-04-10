-- Version: 6.0
-- Monster: https://tibia.fandom.com/wiki/Orc_Spearman
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Orc_Spearman
---


local mType = Game.createMonsterType("Orc Spearman")
local monster = {}

monster.description = "an orc spearman"
monster.experience = 38
monster.outfit = {
	lookType = 50,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 105
monster.maxHealth = 105
monster.race = "blood"
monster.corpse = 5996
monster.speed = 88
monster.manaCost = 310

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
	illusionable = true,
	canPushItems = false,
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 4,
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
	{ text = "Ugaar!", yell = false },
}

monster.loot = {
	{ id = "meat", chance = 29965 },  -- 2666
	{ id = "gold coin", chance = 25127, minCount = 1, maxCount = 11 },  -- 2148
	{ id = "spear", chance = 18201 },  -- 2389
	{ id = "studded legs", chance = 10174 },  -- 2468
	{ id = "studded helmet", chance = 8932 },  -- 2482
	{ id = "machete", chance = 3006 },  -- 2420
	{ id = "orc leather", chance = 2102 },  -- 12435
	{ id = "orc tooth", chance = 105 },  -- 11113
	-- { id = "heavy old tome", chance = 1 },  -- todo: heavy old tome does not exist in items.xml
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -25 },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -30, range = 7, shootEffect = CONST_ANI_SPEAR, target = false },
}

monster.defenses = {
	defense = 10,
	armor = 6,
	mitigation = 0.30,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 20 },
	{ type = COMBAT_EARTHDAMAGE, percent = -10 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
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
