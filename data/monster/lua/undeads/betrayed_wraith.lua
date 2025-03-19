-- Version: 7.9
-- Monster: https://tibia.fandom.com/wiki/Betrayed_Wraith
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Betrayed_Wraith
---


local mType = Game.createMonsterType("Betrayed Wraith")
local monster = {}

monster.description = "a betrayed wraith"
monster.experience = 3500
monster.outfit = {
	lookType = 233,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 4200
monster.maxHealth = 4200
monster.race = "undead"
monster.corpse = 6315
monster.speed = 173
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 15,
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
	runHealth = 300,
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
	{ text = "Rrrah!", yell = false },
	{ text = "Gnarr!", yell = false },
	{ text = "Tcharrr!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 100000, minCount = 2, maxCount = 200 },  -- 2148
	{ id = "platinum coin", chance = 100000, minCount = 1, maxCount = 8 },  -- 2152
	{ id = "concentrated demonic blood", chance = 65559 },  -- todo: flask of demonic blood does not exist in items.xml
	{ id = "power bolt", chance = 49859, minCount = 1, maxCount = 15 },  -- 2547
	{ id = "demonic essence", chance = 20390 },  -- 6500
	{ id = "unholy bone", chance = 19585 },  -- 11233
	{ id = "ultimate health potion", chance = 15112 },  -- 8473
	{ id = "great mana potion", chance = 14767, minCount = 1, maxCount = 3 },  -- 7590
	{ id = "small diamond", chance = 11808, minCount = 1, maxCount = 4 },  -- 2145
	{ id = "assassin star", chance = 9668, minCount = 1, maxCount = 5 },  -- 7368
	{ id = "soul orb", chance = 9361 },  -- 5944
	{ id = "orichalcum pearl", chance = 6403, minCount = 1, maxCount = 2 },  -- 5022
	{ id = "mercenary sword", chance = 1508 },  -- 7386
	{ id = 6300, chance = 396 },  -- death ring
	{ id = "skull helmet", chance = 377 },  -- 5741
	{ id = "golden figurine", chance = 128 },  -- 5799
	{ id = "bloody edge", chance = 102 },  -- 7416
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -450 },
	{ name = "betrayed wraith skill reducer", interval = 2000, chance = 10, target = false },
	{ name = "speed", interval = 2000, chance = 20, speed = -600, range = 7, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_SMALLCLOUDS, target = true, duration = 3000 },
}

monster.defenses = {
	defense = 55,
	armor = 42,
	mitigation = 1.46,
	{ name = "combat", interval = 2000, chance = 30, type = COMBAT_HEALING, minDamage = 350, maxDamage = 600, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "invisible", interval = 2000, chance = 10 },
	{ name = "speed", interval = 2000, chance = 15, effect = CONST_ME_MAGIC_RED, speed = 346},
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 10 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = 100 },
	{ type = COMBAT_LIFEDRAIN, percent = 100 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 50 },
	{ type = COMBAT_HOLYDAMAGE, percent = -20 },
	{ type = COMBAT_DEATHDAMAGE, percent = 100 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
