-- Version: 8.54
-- Monster: https://tibia.fandom.com/wiki/Draken_Warmaster
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Draken_Warmaster
---


local mType = Game.createMonsterType("Draken Warmaster")
local monster = {}

monster.description = "a draken warmaster"
monster.experience = 2400
monster.outfit = {
	lookType = 334,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 4150
monster.maxHealth = 4150
monster.race = "blood"
monster.corpse = 10190
monster.speed = 162
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
	pushable = false,
	rewardBoss = false,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
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
	{ text = "Attack aggrezzively! Dezztroy zze intruderzz!", yell = false },
	{ text = "Hizzzzzz!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 97351, minCount = 1, maxCount = 200 },  -- 2148
	{ id = "platinum coin", chance = 50255, minCount = 1, maxCount = 5 },  -- 2152
	{ id = "meat", chance = 30168 },  -- 2666
	{ id = "bone shoulderplate", chance = 12056 },  -- 11321
	{ id = "Zaoan halberd", chance = 8010 },
	{ id = "warmaster's wristguards", chance = 6987 },  -- 11322
	{ id = "great health potion", chance = 5043, minCount = 1, maxCount = 3 },  -- 7591
	{ id = "ultimate health potion", chance = 3980 },  -- 8473
	{ id = "Zaoan shoes", chance = 2027 },
	{ id = "tower shield", chance = 1986 },  -- 2528
	{ id = "small ruby", chance = 1570, minCount = 1, maxCount = 5 },  -- 2147
	{ id = "Zaoan legs", chance = 943 },
	{ id = "drakinata", chance = 827 },  -- 11305
	{ id = "Zaoan armor", chance = 791 },
	{ id = "ring of the sky", chance = 208 },  -- 2123
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -300 },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_FIREDAMAGE, minDamage = -240, maxDamage = -520, length = 4, spread = 3, effect = CONST_ME_EXPLOSIONHIT, target = false },
}

monster.defenses = {
	defense = 40,
	armor = 55,
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_HEALING, minDamage = 510, maxDamage = 600, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 5 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = 100 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -5 },
	{ type = COMBAT_HOLYDAMAGE, percent = 5 },
	{ type = COMBAT_DEATHDAMAGE, percent = 50 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
