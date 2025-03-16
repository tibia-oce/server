-- Worker Golem (Tibia Wiki: https://tibia.fandom.com/wiki/Worker_Golem)
-- Version: 8.40

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
	{ id = "small diamond", chance = 1000, maxCount = 2 },
	{ id = "gold coin", chance = 43000, maxCount = 100 },
	{ id = "gold coin", chance = 50000, maxCount = 40 },
	{ id = "might ring", chance = 370 },
	{ id = "life crystal", chance = 890 },
	{ id = "war hammer", chance = 920 },
	{ id = "iron ore", chance = 1001 },
	{ id = "bonebreaker", chance = 130 },
	{ id = "berserk potion", chance = 820 },
	{ id = "spiked squelcher", chance = 1003 },
	{ id = "great mana potion", chance = 1470 },
	{ id = "great health potion", chance = 2100 },
	{ id = "nail", chance = 5000, maxCount = 5 },
	{ id = "great spirit potion", chance = 830 },
	{ id = "gear wheel", chance = 1007 },
	{ id = 8895, chance = 200 }, -- rusted armor
	{ id = 8898, chance = 50 }, -- rusted legs
	{ id = 9066, chance = 2270 }, -- crystal pedestal
	{ id = "gear crystal", chance = 2270 },
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
