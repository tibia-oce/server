-- Version: 8.40
-- Monster: https://tibia.fandom.com/wiki/Werewolf
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Werewolf
---


local mType = Game.createMonsterType("Werewolf")
local monster = {}

monster.description = "a werewolf"
monster.experience = 1900
monster.outfit = {
	lookType = 308,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 1955
monster.maxHealth = 1955
monster.race = "blood"
monster.corpse = 18099
monster.speed = 140
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
	staticAttackChance = 80,
	targetDistance = 1,
	runHealth = 300,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = false,
	canWalkOnPoison = true}

monster.light = {
	level = 0,
	color = 0,
}

monster.summon = {
	maxSummons = 2,
	summons = {
		{ name = "war wolf", chance = 40, interval = 2000, count = 2 },
	},
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "GRRR", yell = true },
	{ text = "GRROARR", yell = true },
}

monster.loot = {
	{ id = "gold coin", chance = 98759, minCount = 1, maxCount = 301 },  -- 2148
	{ id = "werewolf fangs", chance = 14759 },  -- 24708
	{ id = "werewolf fur", chance = 9828 },  -- 11234
	{ id = "plate shield", chance = 9714, minCount = 1, maxCount = 2 },  -- 2510
	{ id = "rusty armor", chance = 7954 },  -- todo: rusted armor does not exist in items.xml
	{ id = "brown mushroom", chance = 6873 },  -- 2789
	{ id = "strong health potion", chance = 5246, minCount = 1, maxCount = 2 },  -- 7588
	{ id = "wolf paw", chance = 5210 },  -- 5897
	{ id = "troll green", chance = 5050 },  -- 2805
	{ id = 2381, chance = 3084 },  -- halberd
	{ id = "ultimate health potion", chance = 2064 },  -- 8473
	{ id = "berserk potion", chance = 952 },  -- 7439
	{ id = "stone skin amulet", chance = 891 },  -- 2197
	{ id = "platinum amulet", chance = 803 },  -- 2171
	{ id = "moonlight crystals", chance = 695 },  -- 24739
	{ id = 2169, chance = 582 },  -- time ring
	{ id = "epee", chance = 453 },  -- 2438
	{ id = "relic sword", chance = 381 },  -- 7383
	{ id = "bonebreaker", chance = 268 },  -- 7428
	{ id = "dreaded cleaver", chance = 108 },  -- 7419
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -350 },
	{ name = "outfit", interval = 2000, chance = 1, radius = 1, effect = CONST_ME_SOUND_BLUE, target = true, duration = 2000, outfitMonster = "werewolf" },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_LIFEDRAIN, minDamage = -80, maxDamage = -200, length = 4, spread = 2, effect = CONST_ME_SOUND_RED, target = false },
	{ name = "combat", interval = 2000, chance = 40, type = COMBAT_PHYSICALDAMAGE, radius = 3, effect = CONST_ME_SOUND_WHITE, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_PHYSICALDAMAGE, radius = 1, effect = CONST_ME_SOUND_GREEN, target = false },
	{ name = "werewolf skill reducer", interval = 2000, chance = 15, range = 1, target = false },
}

monster.defenses = {
	defense = 40,
	armor = 36,
	mitigation = 0.83,
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_HEALING, minDamage = 120, maxDamage = 225, effect = CONST_ME_MAGIC_GREEN, target = false },
	{ name = "speed", interval = 2000, chance = 15, range = 7, effect = CONST_ME_SOUND_PURPLE, speed = 280},
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 15 },
	{ type = COMBAT_EARTHDAMAGE, percent = 75 },
	{ type = COMBAT_FIREDAMAGE, percent = -5 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -5 },
	{ type = COMBAT_HOLYDAMAGE, percent = -5 },
	{ type = COMBAT_DEATHDAMAGE, percent = 55 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)