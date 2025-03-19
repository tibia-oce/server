-- Version: 9.10
-- Monster: https://tibia.fandom.com/wiki/Diamond_Servant
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Diamond_Servant
---


local mType = Game.createMonsterType("Diamond Servant")
local monster = {}

monster.description = "a diamond servant"
monster.experience = 700
monster.outfit = {
	lookType = 397,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 1000
monster.maxHealth = 1000
monster.race = "venom"
monster.corpse = 12496
monster.speed = 86
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
	illusionable = true,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 100,
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
	{ text = "Error. LOAD 'PROGRAM',8,1", yell = false },
	{ text = "Remain. Obedient.", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 93988, minCount = 1, maxCount = 180 },  -- 2148
	{ id = "soul orb", chance = 45160 },  -- 5944
	{ id = "life crystal", chance = 9413 },  -- 2177
	{ id = "strong mana potion", chance = 6027 },  -- 7589
	{ id = "strong health potion", chance = 5821 },  -- 7588
	{ id = 9690, chance = 5116 },  -- gear wheel
	{ id = 9978, chance = 5078 },  -- crystal pedestal (cyan)
	{ id = "gear crystal", chance = 5013 },  -- 10572
	{ id = "might ring", chance = 915 },  -- 2164
	{ id = "lightning pendant", chance = 751 },  -- 7889
	{ id = "yellow gem", chance = 534 },  -- 2154
	{ id = "slime mould", chance = 530 },  -- 13758
	{ id = "wand of cosmic energy", chance = 530 },  -- 2189
	{ id = "mastermind potion", chance = 412 },  -- 7440
	{ id = "shockwave amulet", chance = 107 },  -- 10221
	{ id = "crystalline armor", chance = 19 },  -- 8878
	{ id = "bonebreaker", chance = 11 },  -- 7428
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -100 },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_ENERGYDAMAGE, minDamage = -80, maxDamage = -120, radius = 3, effect = CONST_ME_YELLOWENERGY, target = false },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_ENERGYDAMAGE, minDamage = -125, maxDamage = -170, length = 5, spread = 2, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_ENERGYHIT, target = false },
	{ name = "drunk", interval = 2000, chance = 10, range = 7, shootEffect = CONST_ANI_DEATH, effect = CONST_ME_STUN, target = true, duration = 3000 },
}

monster.defenses = {
	defense = 25,
	armor = 25,
	mitigation = 0.83,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 100 },
	{ type = COMBAT_EARTHDAMAGE, percent = 75 },
	{ type = COMBAT_FIREDAMAGE, percent = 10 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = -15 },
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
