-- Version: 8.50
-- Monster: https://tibia.fandom.com/wiki/The_Noxious_Spawn
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:The_Noxious_Spawn
---


local mType = Game.createMonsterType("The Noxious Spawn")
local monster = {}

monster.description = "The Noxious Spawn"
monster.experience = 6000
monster.outfit = {
	lookType = 220,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.health = 9500
monster.maxHealth = 9500
monster.race = "venom"
monster.corpse = 4388
monster.speed = 180
monster.manaCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 8,
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
	runHealth = 275,
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
	{ text = "I bring you deathhhh, mortalssss", yell = false },
}

monster.loot = {
	{ id = "snake skin", chance = 100000 },  -- 10611
	{ id = "winged tail", chance = 100000 },  -- 11230
	{ id = "platinum coin", chance = 80000, minCount = 1, maxCount = 5 },  -- 2152
	{ id = "small emerald", chance = 72000, minCount = 1, maxCount = 5 },  -- 2149
	{ id = "great mana potion", chance = 65333, minCount = 1, maxCount = 4 },  -- 7590
	{ id = 10310, chance = 44000 },  -- claw of 'the noxious spawn'
	{ id = "noble axe", chance = 42667 },  -- 7456
	{ id = "tower shield", chance = 42667 },  -- 2528
	{ id = "mercenary sword", chance = 37333 },  -- 7386
	{ id = "golden mug", chance = 32000 },  -- 2033
	{ id = "assassin star", chance = 30667, minCount = 4, maxCount = 98 },  -- 7368
	{ id = "crown armor", chance = 29333 },  -- 2487
	{ id = "green mushroom", chance = 16000 },  -- 2796
	{ id = "spellbook of mind control", chance = 16000 },  -- 8902
	{ id = "life ring", chance = 12000 },  -- 2168
	{ id = "royal helmet", chance = 5333 },  -- 2498
	{ id = "swamplair armor", chance = 2667 },  -- 8880
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -250 },
	{ name = "speed", interval = 4000, chance = 20, speed = -370, range = 7, shootEffect = CONST_ANI_POISON, target = true, duration = 12000 },
	{ name = "combat", interval = 2000, chance = 7, type = COMBAT_EARTHDAMAGE, minDamage = 0, maxDamage = -550, length = 8, spread = 3, effect = CONST_ME_POISONAREA, target = false },
	{ name = "combat", interval = 2000, chance = 9, type = COMBAT_LIFEDRAIN, minDamage = 0, maxDamage = -550, length = 8, spread = 3, effect = CONST_ME_SOUND_RED, target = false },
	{ name = "combat", interval = 2000, chance = 12, type = COMBAT_EARTHDAMAGE, minDamage = 0, maxDamage = -300, range = 1, shootEffect = CONST_ANI_POISON, effect = CONST_ME_POISONAREA, target = false },
	{ name = "outfit", interval = 2000, chance = 11, range = 7, effect = CONST_ME_MAGIC_BLUE, target = false, duration = 4000, outfitItem = 3976 },
}

monster.defenses = {
	defense = 25,
	armor = 18,
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_HEALING, minDamage = 900, maxDamage = 1000, effect = CONST_ME_MAGIC_BLUE, target = false },
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