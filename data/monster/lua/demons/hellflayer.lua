-- Version: 10.90
-- Monster: https://tibia.fandom.com/wiki/Hellflayer
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Hellflayer
---


local mType = Game.createMonsterType("Hellflayer")
local monster = {}

monster.description = "a hellflayer"
monster.experience = 11720
monster.outfit = {
	lookType = 856,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 14000
monster.maxHealth = 14000
monster.race = "blood"
monster.corpse = 22784
monster.speed = 165
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10,
}

monster.strategiesTarget = {
	nearest = 70,
	health = 10,
	damage = 10,
	random = 10,
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
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = true,
	canWalkOnPoison = true}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Your tainted soul belongs to us anyway!", yell = false },
	{ text = "You should consider bargaining for your life!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 100000, minCount = 4, maxCount = 198 },  -- 2148
	{ id = "platinum coin", chance = 100000, minCount = 1, maxCount = 12 },  -- 2152
	{ id = "concentrated demonic blood", chance = 29169 },  -- todo: flask of demonic blood does not exist in items.xml
	{ id = "demonic essence", chance = 23542 },  -- 6500
	{ id = "pair of hellflayer horns", chance = 22354 },  -- 25385
	{ id = "great spirit potion", chance = 19386, minCount = 1, maxCount = 5 },  -- 8472
	{ id = "great mana potion", chance = 19282, minCount = 1, maxCount = 5 },  -- 7590
	{ id = "ultimate health potion", chance = 17398, minCount = 1, maxCount = 5 },  -- 8473
	{ id = "small amethyst", chance = 12210, minCount = 1, maxCount = 5 },  -- 2150
	{ id = "small emerald", chance = 11590, minCount = 1, maxCount = 5 },  -- 2149
	{ id = "small diamond", chance = 10325, minCount = 1, maxCount = 5 },  -- 2145
	{ id = "gold ingot", chance = 9602, minCount = 1, maxCount = 2 },  -- 9971
	{ id = "small ruby", chance = 9499, minCount = 1, maxCount = 5 },  -- 2147
	{ id = "small topaz", chance = 9086, minCount = 1, maxCount = 5 },  -- 9970
	{ id = "giant shimmering pearl", chance = 4724 },
	{ id = "red gem", chance = 2426 },  -- 2156
	{ id = "violet gem", chance = 1807 },  -- 2153
	{ id = "rift lance", chance = 1678 },  -- 25383
	{ id = "magma boots", chance = 1523 },  -- 7891
	{ id = "magma legs", chance = 1213 },  -- 7894
	{ id = "green gem", chance = 826 },  -- 2155
	{ id = "rift shield", chance = 826 },  -- 25382
	{ id = "mastermind shield", chance = 774 },  -- 2514
	{ id = "titan axe", chance = 749 },  -- 7413
	{ id = "rift crossbow", chance = 697 },  -- 25523
	{ id = "golden armor", chance = 490 },  -- 2466
	{ id = "rift bow", chance = 413 },  -- 25522
	{ id = 2136, chance = 232 },  -- demonbone amulet
	{ id = "skull helmet", chance = 232 },  -- 5741
	{ id = "magic plate armor", chance = 52 },  -- 2472
	{ id = "spellbook of mind control", chance = 26 },  -- 8902
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 200, maxDamage = -869, condition = { type = CONDITION_FIRE, totalDamage = 6, interval = 9000 } },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_FIREDAMAGE, minDamage = -170, maxDamage = -300, range = 7, shootEffect = CONST_ANI_POISON, target = false },
	{ name = "choking fear drown", interval = 2000, chance = 20, target = false },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_DEATHDAMAGE, minDamage = -250, maxDamage = -500, radius = 4, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA, target = true },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_LIFEDRAIN, minDamage = -50, maxDamage = -200, length = 8, spread = 0, effect = CONST_ME_PURPLEENERGY, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_FIREDAMAGE, minDamage = -300, maxDamage = -550, radius = 1, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREATTACK, target = true },
	{ name = "warlock skill reducer", interval = 2000, chance = 5, range = 5, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_PHYSICALDAMAGE, minDamage = 300, maxDamage = -500, radius = 1, shootEffect = CONST_ANI_EXPLOSION, effect = CONST_ME_SLEEP, target = true },
}

monster.defenses = {
	defense = 20,
	armor = 55,
	mitigation = 1.60,
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_HEALING, minDamage = 80, maxDamage = 95, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -5 },
	{ type = COMBAT_EARTHDAMAGE, percent = 20 },
	{ type = COMBAT_FIREDAMAGE, percent = 70 },
	{ type = COMBAT_LIFEDRAIN, percent = 100 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 100 },
	{ type = COMBAT_ICEDAMAGE, percent = 5 },
	{ type = COMBAT_HOLYDAMAGE, percent = -5 },
	{ type = COMBAT_DEATHDAMAGE, percent = 25 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)