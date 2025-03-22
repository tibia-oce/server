-- Version: 10.80
-- Monster: https://tibia.fandom.com/wiki/Gloom_Wolf
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Gloom_Wolf
---


local mType = Game.createMonsterType("Gloom Wolf")
local monster = {}

monster.description = "a gloom wolf"
monster.experience = 70
monster.outfit = {
	lookType = 716,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 200
monster.maxHealth = 200
monster.race = "blood"
monster.corpse = 24639
monster.speed = 125
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
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
	illusionable = true,
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 8,
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
	{ id = "gold coin", chance = 65938, minCount = 1, maxCount = 15 },  -- 2148
	{ id = "meat", chance = 40591 },  -- 2666
	{ id = "ham", chance = 39911 },  -- 2671
	{ id = "gloom wolf fur", chance = 7858 },  -- 24663
	{ id = "wolf tooth chain", chance = 7149 },  -- 2129
	{ id = "wolf paw", chance = 3309 },  -- 5897
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -92 },
}

monster.defenses = {
	defense = 5,
	armor = 10,
	mitigation = 0.51,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 20 },
	{ type = COMBAT_FIREDAMAGE, percent = -5 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -5 },
	{ type = COMBAT_HOLYDAMAGE, percent = -5 },
	{ type = COMBAT_DEATHDAMAGE, percent = 10 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = false },
	{ type = "bleed", condition = false },
}

mType:register(monster)