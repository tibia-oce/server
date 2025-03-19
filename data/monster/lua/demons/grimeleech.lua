-- Version: 10.90
-- Monster: https://tibia.fandom.com/wiki/Grimeleech
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Grimeleech
---


local mType = Game.createMonsterType("Grimeleech")
local monster = {}

monster.description = "a grimeleech"
monster.experience = 7216
monster.outfit = {
	lookType = 855,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 9500
monster.maxHealth = 9500
monster.race = "undead"
monster.corpse = 22780
monster.speed = 170
monster.manaCost = 0

monster.changeTarget = {
	interval = 3000,
	chance = 20,
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
	canWalkOnFire = false,
	canWalkOnPoison = true}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Death... Taste!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 100000, minCount = 2, maxCount = 198 },  -- 2148
	{ id = "platinum coin", chance = 100000, minCount = 1, maxCount = 8 },  -- 2152
	{ id = "great mana potion", chance = 34761, minCount = 1, maxCount = 3 },  -- 7590
	{ id = "great health potion", chance = 34258, minCount = 1, maxCount = 3 },  -- 7591
	{ id = "great spirit potion", chance = 30981, minCount = 1, maxCount = 3 },  -- 8472
	{ id = "concentrated demonic blood", chance = 23769 },  -- todo: flask of demonic blood does not exist in items.xml
	{ id = "some grimeleech wings", chance = 19435 },  -- 25386
	{ id = "demonic essence", chance = 19105 },  -- 6500
	{ id = "fire mushroom", chance = 15586, minCount = 1, maxCount = 5 },  -- 2795
	{ id = "green mushroom", chance = 14840, minCount = 1, maxCount = 5 },  -- 2796
	{ id = "small diamond", chance = 11096, minCount = 1, maxCount = 5 },  -- 2145
	{ id = "small ruby", chance = 10645, minCount = 1, maxCount = 5 },  -- 2147
	{ id = "small topaz", chance = 9726, minCount = 1, maxCount = 5 },  -- 9970
	{ id = "small amethyst", chance = 9466, minCount = 1, maxCount = 5 },  -- 2150
	{ id = "underworld rod", chance = 6987 },  -- 8910
	{ id = "wand of voodoo", chance = 4820 },  -- 8922
	{ id = "red gem", chance = 3936 },  -- 2156
	{ id = "yellow gem", chance = 2878 },  -- 2154
	{ id = "devil helmet", chance = 1352 },  -- 2462
	{ id = "magma legs", chance = 1266 },  -- 7894
	{ id = "demon shield", chance = 1040 },  -- 2520
	{ id = "blue gem", chance = 832 },  -- 2158
	{ id = "nightmare blade", chance = 832 },  -- 7418
	{ id = "rift crossbow", chance = 693 },  -- 25523
	{ id = "rift shield", chance = 607 },  -- 25382
	{ id = "steel boots", chance = 589 },  -- 2645
	{ id = "rift lance", chance = 572 },  -- 25383
	{ id = "rift bow", chance = 399 },  -- 25522
	{ id = "abyss hammer", chance = 260 },  -- 7414
	{ id = "vile axe", chance = 191 },  -- 7388
	{ id = "magic plate armor", chance = 52 },  -- 2472
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, skill = 70, attack = 80 },
	{ name = "melee", interval = 2000, chance = 2, skill = 153, attack = 100 },
	-- positive min damage?
	{ name = "combat", interval = 2000, chance = 14, type = COMBAT_LIFEDRAIN, minDamage = 100, maxDamage = -565, range = 7, shootEffect = CONST_ANI_DEATH, effect = CONST_ME_MORTAREA, target = true },
	{ name = "combat", interval = 2000, chance = 12, type = COMBAT_LIFEDRAIN, minDamage = -150, maxDamage = -220, length = 8, spread = 0, effect = CONST_ME_MAGIC_GREEN, target = false },
	{ name = "combat", interval = 2000, chance = 13, type = COMBAT_DEATHDAMAGE, minDamage = -225, maxDamage = -375, radius = 4, effect = CONST_ME_MORTAREA, target = false },
	{ name = "combat", interval = 2000, chance = 9, type = COMBAT_MANADRAIN, minDamage = 0, maxDamage = -300, length = 8, spread = 3, effect = CONST_ME_MAGIC_RED, target = false },
}

monster.defenses = {
	defense = 30,
	armor = 65,
	mitigation = 1.74,
	{ name = "combat", interval = 2000, chance = 16, type = COMBAT_HEALING, minDamage = 130, maxDamage = 205, effect = CONST_ME_MAGIC_RED, target = false },
	{ name = "effect", interval = 2000, chance = 9, effect = CONST_ME_MAGIC_GREEN, target = false },
	{ name = "effect", interval = 2000, chance = 10, target = false },
	{ name = "speed", interval = 2000, chance = 12, effect = CONST_ME_MAGIC_RED, speed = 340},
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -5 },
	{ type = COMBAT_EARTHDAMAGE, percent = 40 },
	{ type = COMBAT_FIREDAMAGE, percent = 20 },
	{ type = COMBAT_LIFEDRAIN, percent = 100 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 100 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 60 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)