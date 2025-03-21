-- Version: 7.5
-- Monster: https://tibia.fandom.com/wiki/Serpent_Spawn
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Serpent_Spawn
---


local mType = Game.createMonsterType("Serpent Spawn")
local monster = {}

monster.description = "a serpent spawn"
monster.experience = 3050
monster.outfit = {
	lookType = 220,
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
monster.corpse = 6061
monster.speed = 117
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10,
}

monster.strategiesTarget = {
	nearest = 70,
	health = 30,
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
	staticAttackChance = 80,
	targetDistance = 1,
	runHealth = 275,
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
	{ text = "HISSSS", yell = true },
	{ text = "I bring you deathhhh, mortalssss", yell = false },
	{ text = "Sssssouls for the one", yell = false },
	{ text = "Tsssse one will risssse again", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 97235, minCount = 1, maxCount = 245 },  -- 2148
	{ id = "green mushroom", chance = 18309 },  -- 2796
	{ id = "snake skin", chance = 14992 },  -- 10611
	{ id = "small sapphire", chance = 12099 },  -- 2146
	{ id = 2547, chance = 6086 },  -- power bolt
	{ id = "life ring", chance = 6032 },  -- 2168
	{ id = "energy ring", chance = 5953 },  -- 2167
	{ id = "golden mug", chance = 2976 },  -- 2033
	{ id = "mercenary sword", chance = 2039 },  -- 7386
	{ id = "great mana potion", chance = 2021 },  -- 7590
	{ id = "snakebite rod", chance = 980 },  -- 2182
	{ id = "winged tail", chance = 939 },  -- 11230
	{ id = "tower shield", chance = 852 },  -- 2528
	{ id = "noble axe", chance = 812 },  -- 7456
	{ id = "life crystal", chance = 788 },  -- 2177
	{ id = "strange helmet", chance = 638 },  -- 2479
	{ id = "warrior helmet", chance = 557 },  -- 2475
	{ id = 4842, chance = 556 },  -- old parchment
	{ id = "crown armor", chance = 518 },  -- 2487
	{ id = "charmer's tiara", chance = 178 },  -- 3971
	{ id = "royal helmet", chance = 120 },  -- 2498
	{ id = "spellbook of mind control", chance = 97 },  -- 8902
	{ id = "swamplair armor", chance = 82 },  -- 8880
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -252 },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_EARTHDAMAGE, minDamage = -80, maxDamage = -300, range = 7, shootEffect = CONST_ANI_POISON, target = false },
	{ name = "outfit", interval = 2000, chance = 1, range = 7, effect = CONST_ME_MAGIC_BLUE, target = false, duration = 3000, outfitMonster = "clay guardian" },
	{ name = "speed", interval = 2000, chance = 25, speed = -850, range = 7, radius = 4, shootEffect = CONST_ANI_POISON, effect = CONST_ME_GREEN_RINGS, target = true, duration = 12000 },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_LIFEDRAIN, minDamage = -200, maxDamage = -500, length = 8, spread = 3, effect = CONST_ME_SOUND_RED, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_EARTHDAMAGE, minDamage = -200, maxDamage = -500, length = 8, spread = 3, effect = CONST_ME_POISONAREA, target = false },
}

monster.defenses = {
	defense = 35,
	armor = 35,
	mitigation = 1.04,
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_HEALING, minDamage = 250, maxDamage = 500, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "speed", interval = 2000, chance = 15, effect = CONST_ME_MAGIC_RED, speed = 234},
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -10 },
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
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)