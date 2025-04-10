-- Version: 10.50
-- Monster: https://tibia.fandom.com/wiki/Minotaur_Amazon
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Minotaur_Amazon
---


local mType = Game.createMonsterType("Minotaur Amazon")
local monster = {}

monster.description = "a minotaur amazon"
monster.experience = 2200
monster.outfit = {
	lookType = 608,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 2600
monster.maxHealth = 2600
monster.race = "blood"
monster.corpse = 23371
monster.speed = 125
monster.manaCost = 0

monster.changeTarget = {
	interval = 2000,
	chance = 11,
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
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 4,
	runHealth = 240,
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
	{ text = "I'll protect the herd!", yell = false },
	{ text = "Never surrender!", yell = false },
	{ text = "You won't hurt us!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 100000, minCount = 2, maxCount = 200 },  -- 2148
	{ id = "platinum coin", chance = 65090, minCount = 1, maxCount = 3 },  -- 2152
	{ id = "ham", chance = 59526 },  -- 2671
	{ id = "cowbell", chance = 19741 },  -- 23575
	{ id = "minotaur leather", chance = 16415 },  -- 5878
	{ id = "great mana potion", chance = 7004 },  -- 7590
	{ id = "great health potion", chance = 6931 },  -- 7591
	{ id = "meat", chance = 6895 },  -- 2666
	{ id = "minotaur horn", chance = 5165, minCount = 1, maxCount = 2 },  -- 12428
	{ id = "small topaz", chance = 5129, minCount = 1, maxCount = 2 },  -- 9970
	{ id = "small ruby", chance = 4923, minCount = 1, maxCount = 2 },  -- 2147
	{ id = "small amethyst", chance = 4899, minCount = 1, maxCount = 2 },  -- 2150
	{ id = "small emerald", chance = 4572, minCount = 1, maxCount = 2 },  -- 2149
	{ id = "mino shield", chance = 3871 },  -- 23546
	{ id = "assassin star", chance = 3036, minCount = 1, maxCount = 5 },  -- 7368
	{ id = "ring of healing", chance = 2492 },  -- 2214
	{ id = "mino lance", chance = 1657 },  -- 23545
	{ id = "stone skin amulet", chance = 835 },  -- 2197
	{ id = "bullseye potion", chance = 810 },  -- 7443
	{ id = "warrior helmet", chance = 617 },  -- 2475
	{ id = "yellow gem", chance = 617 },  -- 2154
	{ id = "gold ingot", chance = 593 },  -- 9971
	{ id = "red piece of cloth", chance = 569 },  -- 5911
	{ id = "red gem", chance = 399 },  -- 2156
	{ id = 7401, chance = 266 },  -- minotaur trophy
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, skill = 50, attack = 50 },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_MANADRAIN, minDamage = -50, maxDamage = -305, length = 8, spread = 0, effect = CONST_ME_MAGIC_RED, target = false },
	{ name = "combat", interval = 2000, chance = 16, type = COMBAT_LIFEDRAIN, minDamage = -50, maxDamage = -150, radius = 4, effect = CONST_ME_MAGIC_RED, target = false },
	{ name = "combat", interval = 2000, chance = 22, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -150, range = 7, shootEffect = CONST_ANI_HUNTINGSPEAR, effect = CONST_ME_EXPLOSIONAREA, target = false },
	-- bleed
	{ name = "condition", type = CONDITION_BLEEDING, interval = 2000, chance = 40, minDamage = -300, maxDamage = -400, radius = 4, effect = CONST_ME_DRAWBLOOD, shootEffect = CONST_ANI_THROWINGKNIFE, target = true },
	{ name = "minotaur amazon paralyze", interval = 2000, chance = 15, target = false },
}

monster.defenses = {
	defense = 35,
	armor = 37,
	mitigation = 1.18,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -10 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = -5 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 5 },
	{ type = COMBAT_HOLYDAMAGE, percent = 10 },
	{ type = COMBAT_DEATHDAMAGE, percent = 10 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)