-- Version: 9.20
-- Monster: https://tibia.fandom.com/wiki/Gorgo
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Gorgo
---


local mType = Game.createMonsterType("Gorgo")
local monster = {}

monster.description = "Gorgo"
monster.experience = 7000
monster.outfit = {
	lookType = 330,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.health = 4500
monster.maxHealth = 4500
monster.race = "blood"
monster.corpse = 9607
monster.speed = 140
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 20,
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
	rewardBoss = true,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 80,
	targetDistance = 1,
	runHealth = 600,
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
}

monster.loot = {
	{ id = "medusa shield", chance = 100000 },  -- 2536
	{ id = "platinum coin", chance = 100000, minCount = 4, maxCount = 20 },  -- 2152
	{ id = "strand of medusa hair", chance = 100000 },  -- 11226
	{ id = "great mana potion", chance = 82051, minCount = 1, maxCount = 2 },  -- 7590
	{ id = "ultimate health potion", chance = 64103, minCount = 1, maxCount = 2 },  -- 8473
	{ id = "sacred tree amulet", chance = 56410 },  -- 10219
	{ id = "small emerald", chance = 53846, minCount = 1, maxCount = 4 },  -- 2149
	{ id = "terra amulet", chance = 46154 },  -- 7887
	{ id = "titan axe", chance = 43590 },  -- 7413
	{ id = "terra mantle", chance = 35897 },  -- 7884
	{ id = "terra legs", chance = 30769 },  -- 7885
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -450, condition = { type = CONDITION_POISON, totalDamage = 42, interval = 4000 } },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_LIFEDRAIN, minDamage = -21, maxDamage = -350, range = 7, shootEffect = CONST_ANI_EARTH, effect = CONST_ME_CARNIPHILA, target = true },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_EARTHDAMAGE, minDamage = -250, maxDamage = -500, length = 8, spread = 3, effect = CONST_ME_CARNIPHILA, target = false },
	{ name = "speed", speed = -300, interval = 2000, chance = 25, radius = 7, effect = CONST_ME_POFF, target = true },
	{ name = "outfit", interval = 2000, chance = 1, range = 7, target = true, duration = 3000, outfitMonster = "clay guardian" },
}

monster.defenses = {
	defense = 30,
	armor = 30,
	mitigation = 1.94,
	{ name = "combat", interval = 2000, chance = 25, type = COMBAT_HEALING, minDamage = 150, maxDamage = 300, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -10 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = -5 },
	{ type = COMBAT_LIFEDRAIN, percent = 100 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 100 },
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