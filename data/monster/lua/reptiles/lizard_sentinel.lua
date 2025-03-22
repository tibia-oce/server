-- Version: 7.5
-- Monster: https://tibia.fandom.com/wiki/Lizard_Sentinel
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Lizard_Sentinel
---


local mType = Game.createMonsterType("Lizard Sentinel")
local monster = {}

monster.description = "a lizard sentinel"
monster.experience = 110
monster.outfit = {
	lookType = 114,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 265
monster.maxHealth = 265
monster.race = "blood"
monster.corpse = 6040
monster.speed = 90
monster.manaCost = 560

monster.changeTarget = {
	interval = 4000,
	chance = 10,
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
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 4,
	runHealth = 10,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = true}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Tssss!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 86618, minCount = 1, maxCount = 55 },  -- 2148
	{ id = "spear", chance = 10076, minCount = 1, maxCount = 3 },  -- 2389
	{ id = "chain armor", chance = 9206 },  -- 2464
	{ id = "scale armor", chance = 8061 },  -- 2483
	{ id = "hunting spear", chance = 4695 },  -- 3965
	{ id = "lizard leather", chance = 2099 },  -- 5876
	{ id = "lizard scale", chance = 2031 },  -- 5881
	{ id = 2381, chance = 1542 },  -- halberd
	{ id = "health potion", chance = 1298 },  -- 7618
	{ id = "obsidian lance", chance = 1260 },  -- 2425
	{ id = "sentinel shield", chance = 344 },  -- 3974
	{ id = "small diamond", chance = 99 },  -- 2145
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -45 },
	{ name = "combat", interval = 2000, chance = 30, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -70, range = 7, shootEffect = CONST_ANI_SPEAR, target = false },
}

monster.defenses = {
	defense = 15,
	armor = 17,
	mitigation = 0.62,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 10 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
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
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
