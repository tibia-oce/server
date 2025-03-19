-- Version: 10.55
-- Monster: https://tibia.fandom.com/wiki/Troll-Trained_Salamander
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Troll-Trained_Salamander
---


local mType = Game.createMonsterType("Troll-Trained Salamander")
local monster = {}

monster.description = "a troll-trained salamander"
monster.experience = 23
monster.outfit = {
	lookType = 529,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.health = 70
monster.maxHealth = 70
monster.race = "blood"
monster.corpse = 17427
monster.speed = 56
monster.manaCost = 0

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
	{ id = "gold coin", chance = 100000, minCount = 1, maxCount = 11 },  -- 2148
	{ id = "insectoid eggs", chance = 23157 },  -- 19737
	{ id = "simple arrow", chance = 17275, minCount = 1, maxCount = 5 },  -- 23839
	{ id = 14774, chance = 13031, minCount = 2, maxCount = 5 },  -- insectoid eggs
	{ id = "meat", chance = 10648 },  -- 2666
	{ id = "chain helmet", chance = 5733 },  -- 2458
	{ id = "short sword", chance = 4989 },  -- 2406
	{ id = "axe", chance = 4765 },  -- 2386
	{ id = 2554, chance = 4244 },  -- shovel
	{ id = "bone club", chance = 4021 },  -- 2449
	{ id = "poison arrow", chance = 2978, minCount = 1, maxCount = 2 },  -- 2545
	{ id = "studded helmet", chance = 2978 },  -- 2482
	{ id = "health potion", chance = 1191 },  -- 7618
	{ id = "bow", chance = 745 },  -- 2456
	{ id = "spear", chance = 596 },  -- 2389
	{ id = 23723, chance = 521 },  -- lightest missile rune
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, skill = 10, attack = 11, condition = { type = CONDITION_POISON, totalDamage = 5, interval = 4000 } },
	{ name = "combat", interval = 2000, chance = 11, type = COMBAT_EARTHDAMAGE, minDamage = -4, maxDamage = -6, range = 5, shootEffect = CONST_ANI_SMALLEARTH, effect = CONST_ME_HITBYPOISON, target = true },
}

monster.defenses = {
	defense = 0,
	armor = 1,
	mitigation = 0.15,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
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