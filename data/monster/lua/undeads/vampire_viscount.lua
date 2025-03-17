-- Version: 10.10
-- Monster: https://tibia.fandom.com/wiki/Vampire_Viscount
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Vampire_Viscount
---


local mType = Game.createMonsterType("Vampire Viscount")
local monster = {}

monster.description = "a vampire viscount"
monster.experience = 800
monster.outfit = {
	lookType = 555,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 1200
monster.maxHealth = 1200
monster.race = "blood"
monster.corpse = 18961
monster.speed = 110
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10,
}

monster.strategiesTarget = {
	nearest = 80,
	health = 10,
	damage = 10,
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
	{ text = "Prepare to BLEED!", yell = false },
	{ text = "Don't struggle. We don't want to waste a drop of blood now, do we?", yell = false },
	{ text = "Ah, refreshments have arrived!", yell = false },
	{ text = "Bloody good thing you came!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 84988, minCount = 1, maxCount = 50 },  -- 2148
	{ id = "vampire teeth", chance = 7883 },  -- 10602
	{ id = "strong mana potion", chance = 7267 },  -- 7589
	{ id = "strong health potion", chance = 5994 },  -- 7588
	{ id = "tooth file", chance = 5223 },  -- 21241
	{ id = "vampire's cape chain", chance = 3893 },  -- 21244
	{ id = "small ruby", chance = 3293, minCount = 1, maxCount = 2 },  -- 2147
	{ id = "blood preservation", chance = 3163 },  -- 12405
	{ id = "black pearl", chance = 2774 },  -- 2144
	{ id = "ice rapier", chance = 746 },  -- 2396
	{ id = "red gem", chance = 397 },  -- 2156
	{ id = "red piece of cloth", chance = 284 },  -- 5911
	{ id = "vampire shield", chance = 195 },  -- 2534
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -150 },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_DEATHDAMAGE, minDamage = -50, maxDamage = -100, range = 6, radius = 3, shootEffect = CONST_ANI_DEATH, effect = CONST_ME_MORTAREA, target = true },
	-- bleed
	{ name = "condition", type = CONDITION_BLEEDING, interval = 2000, chance = 10, minDamage = -320, maxDamage = -560, radius = 6, effect = CONST_ME_BATS, target = false },
}

monster.defenses = {
	defense = 35,
	armor = 42,
	mitigation = 1.18,
	{ name = "outfit", interval = 2000, chance = 10, target = false, duration = 4000, outfitMonster = "Vicious Manbat" },
	{ name = "speed", interval = 2000, chance = 15, effect = CONST_ME_MAGIC_RED, speed = 220},
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 10 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = -5 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 10 },
	{ type = COMBAT_HOLYDAMAGE, percent = -25 },
	{ type = COMBAT_DEATHDAMAGE, percent = 100 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)