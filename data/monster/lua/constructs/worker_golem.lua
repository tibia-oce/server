-- Version: 8.40
-- Monster: https://tibia.fandom.com/wiki/Worker_Golem
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Worker_Golem
---


local mType = Game.createMonsterType("Worker Golem")
local monster = {}

monster.description = "a worker golem"
monster.experience = 1250
monster.outfit = {
	lookType = 304,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 1470
monster.maxHealth = 1470
monster.race = "venom"
monster.corpse = 8887
monster.speed = 80
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
	staticAttackChance = 70,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = true}

monster.light = {
	level = 3,
	color = 35,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "INTRUDER ALARM!", yell = true },
	{ text = "klonk klonk klonk", yell = false },
	{ text = "Rrrtttarrrttarrrtta", yell = false },
	{ text = "Awaiting orders.", yell = false },
	{ text = "Secret objective complete.", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 93746, minCount = 1, maxCount = 139 },  -- 2148
	{ id = "nail", chance = 4845, minCount = 1, maxCount = 5 },  -- 8309
	{ id = "gear crystal", chance = 2190 },  -- 10572
	{ id = "great health potion", chance = 1955 },  -- 7591
	{ id = "great mana potion", chance = 1567 },  -- 7590
	{ id = 9808, chance = 1562 },  -- todo: rusted armor does not exist in items.xml
	{ id = 9690, chance = 1045 },  -- gear wheel
	{ id = "life crystal", chance = 1025 },  -- 2177
	{ id = "war hammer", chance = 997 },  -- 2391
	{ id = "small diamond", chance = 963, minCount = 1, maxCount = 2 },  -- 2145
	{ id = 9811, chance = 901 },  -- todo: rusted legs does not exist in items.xml
	{ id = "spiked squelcher", chance = 891 },  -- 7452
	{ id = "iron ore", chance = 867 },  -- 5880
	{ id = "great spirit potion", chance = 829 },  -- 8472
	{ id = "berserk potion", chance = 781 },  -- 7439
	{ id = "might ring", chance = 508 },  -- 2164
	{ id = 9978, chance = 153 },  -- crystal pedestal (cyan)
	{ id = "bonebreaker", chance = 110 },  -- 7428
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -240 },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -125, range = 7, shootEffect = CONST_ANI_SMALLSTONE, target = false },
}

monster.defenses = {
	defense = 35,
	armor = 35,
	mitigation = 1.32,
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_HEALING, minDamage = 200, maxDamage = 250, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 10 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -5 },
	{ type = COMBAT_EARTHDAMAGE, percent = 50 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 10 },
	{ type = COMBAT_HOLYDAMAGE, percent = 50 },
	{ type = COMBAT_DEATHDAMAGE, percent = 10 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
