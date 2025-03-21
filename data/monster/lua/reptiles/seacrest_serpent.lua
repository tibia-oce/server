-- Version: 10.70
-- Monster: https://tibia.fandom.com/wiki/Seacrest_Serpent
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Seacrest_Serpent
---


local mType = Game.createMonsterType("Seacrest Serpent")
local monster = {}

monster.description = "a seacrest serpent"
monster.experience = 2900
monster.outfit = {
	lookType = 675,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 3000
monster.maxHealth = 3000
monster.race = "venom"
monster.corpse = 21893
monster.speed = 250
monster.manaCost = 0

monster.changeTarget = {
	interval = 2000,
	chance = 9,
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
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true}

monster.light = {
	level = 3,
	color = 212,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "LEAVE THESE GROUNDS...", yell = true },
	{ text = "THE DARK TIDE WILL SWALLOW YOU...", yell = true },
}

monster.loot = {
	{ id = "platinum coin", chance = 100000, minCount = 1, maxCount = 5 },  -- 2152
	{ id = "seacrest scale", chance = 16664 },  -- 24169
	{ id = "dragon ham", chance = 14079 },  -- 2672
	{ id = "seacrest hair", chance = 11353 },  -- 24170
	{ id = "shiver arrow", chance = 8207, minCount = 1, maxCount = 19 },  -- 7839
	{ id = "strong mana potion", chance = 7927, minCount = 1, maxCount = 2 },  -- 7589
	{ id = "strong health potion", chance = 7647, minCount = 1, maxCount = 2 },  -- 7588
	{ id = "seacrest pearl", chance = 6743 },  -- 24116
	{ id = "small diamond", chance = 4205, minCount = 1, maxCount = 3 },  -- 2145
	{ id = "soul orb", chance = 3317 },  -- 5944
	{ id = "black pearl", chance = 2056, minCount = 1, maxCount = 3 },  -- 2144
	{ id = "glacier kilt", chance = 2056 },  -- 7896
	{ id = "glacier mask", chance = 2040 },  -- 7902
	{ id = "white pearl", chance = 1947, minCount = 1, maxCount = 2 },  -- 2143
	{ id = "glacier shoes", chance = 1931 },  -- 7892
	{ id = 7632, chance = 1635 },
	{ id = "glacier amulet", chance = 1028 },  -- 7888
	{ id = "crest of the deep seas", chance = 1012 },  -- 24261
	{ id = "wand of draconia", chance = 934 },  -- 8921
	{ id = "wand of defiance", chance = 234 },  -- 18390
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, skill = 120, attack = 82 },
	{ name = "combat", interval = 2000, chance = 7, type = COMBAT_DEATHDAMAGE, minDamage = -200, maxDamage = -260, range = 7, shootEffect = CONST_ANI_EARTH, effect = CONST_ME_SOUND_RED, target = true },
	{ name = "combat", interval = 2000, chance = 11, type = COMBAT_LIFEDRAIN, minDamage = -200, maxDamage = -285, radius = 3, effect = CONST_ME_MAGIC_RED, target = false },
	{ name = "seacrest serpent wave", interval = 2000, chance = 30, minDamage = 0, maxDamage = -284, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_PHYSICALDAMAGE, minDamage = -200, maxDamage = -300, length = 4, spread = 3, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.defenses = {
	defense = 31,
	armor = 51,
	mitigation = 1.21,
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_HEALING, minDamage = 145, maxDamage = 200, effect = CONST_ME_SOUND_BLUE, target = false },
	{ name = "melee", interval = 2000, chance = 10, minDamage = 0, maxDamage = 0 },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 10 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 10 },
	{ type = COMBAT_EARTHDAMAGE, percent = 10 },
	{ type = COMBAT_FIREDAMAGE, percent = 20 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 100 },
	{ type = COMBAT_ICEDAMAGE, percent = 100 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 10 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)