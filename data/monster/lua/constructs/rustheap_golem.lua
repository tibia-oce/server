-- Version: 10.50
-- Monster: https://tibia.fandom.com/wiki/Rustheap_Golem
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Rustheap_Golem
---


local mType = Game.createMonsterType("Rustheap Golem")
local monster = {}

monster.description = "a rustheap golem"
monster.experience = 2100
monster.outfit = {
	lookType = 603,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 2800
monster.maxHealth = 2800
monster.race = "venom"
monster.corpse = 20984
monster.speed = 125
monster.manaCost = 0

monster.changeTarget = {
	interval = 2000,
	chance = 5,
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
	canWalkOnFire = false,
	canWalkOnPoison = true}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "*clatter*", yell = false },
	{ text = "*krrk*", yell = false },
	{ text = "*frzzp*", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 100000, minCount = 3, maxCount = 300 },  -- 2148
	{ id = "platinum coin", chance = 59993, minCount = 1, maxCount = 3 },  -- 2152
	{ id = "necromantic rust", chance = 17038 },  -- 23567
	{ id = "strong mana potion", chance = 7504, minCount = 1, maxCount = 2 },  -- 7589
	{ id = "strong health potion", chance = 7472, minCount = 1, maxCount = 2 },  -- 7588
	{ id = "flask of rust remover", chance = 5051 },  -- 9930
	{ id = "gearwheel chain", chance = 3537 },  -- 23541
	{ id = 9808, chance = 3461 },  -- rusty armor (todo: slightly rusted does not exist in items.xml)
	{ id = 9811, chance = 3459 },  -- rusty legs (todo: slightly rusted does not exist in items.xml)
	{ id = "bronze gear wheel", chance = 3023 },  -- 24124
	{ id = "nail", chance = 2950 },  -- 8309
	{ id = "war hammer", chance = 2515 },  -- 2391
	{ id = "black pearl", chance = 1990 },  -- 2144
	{ id = "white pearl", chance = 1970 },  -- 2143
	{ id = "iron ore", chance = 1455 },  -- 5880
	{ id = "metal bat", chance = 909 },  -- 23542
	{ id = "spiked squelcher", chance = 509 },  -- 7452
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, skill = 118, attack = 50 },
	{ name = "rustheap golem electrify", interval = 2000, chance = 11, range = 7, target = false },
	{ name = "frazzlemaw paralyze", interval = 2000, chance = 10, target = false },
	{ name = "rustheap golem wave", interval = 2000, chance = 9, minDamage = -100, maxDamage = -210, target = false },
}

monster.defenses = {
	defense = 45,
	armor = 40,
	{ name = "speed", interval = 2000, chance = 11, effect = CONST_ME_MAGIC_BLUE, speed = 250},
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = -5 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -5 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 70 },
	{ type = COMBAT_LIFEDRAIN, percent = 100 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
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