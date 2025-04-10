-- Version: 10.94
-- Monster: https://tibia.fandom.com/wiki/Instable_Breach_Brood
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Instable_Breach_Brood
---


local mType = Game.createMonsterType("Instable Breach Brood")
local monster = {}

monster.description = "an instable breach brood"
monster.experience = 1100
monster.outfit = {
	lookType = 878,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 2200
monster.maxHealth = 2200
monster.race = "venom"
monster.corpse = 23392
monster.speed = 135
monster.manaCost = 0

monster.changeTarget = {
	interval = 2000,
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
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = true,
	canWalkOnPoison = true}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Hisss!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 99578, minCount = 1, maxCount = 100 },  -- 2148
	{ id = "platinum coin", chance = 69694, minCount = 1, maxCount = 2 },  -- 2152
	{ id = "plasma pearls", chance = 10095 },  -- 26162
	{ id = "crystal bone", chance = 9912 },  -- 26177
	{ id = "energy drink", chance = 5351 },  -- 26201
	{ id = "great mana potion", chance = 5078 },  -- 7590
	{ id = "great spirit potion", chance = 5017 },  -- 8472
	{ id = "energy bar", chance = 4894 },  -- 26191
	{ id = "great health potion", chance = 4690 },  -- 7591
	{ id = "blue crystal splinter", chance = 3955 },  -- 18418
	{ id = "green crystal shard", chance = 3696 },  -- 18415
	{ id = "cyan crystal fragment", chance = 3016 },  -- 18419
	{ id = "blue crystal shard", chance = 2103 },  -- 18413
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -240 },
	{ name = "combat", interval = 2000, chance = 25, type = COMBAT_ENERGYDAMAGE, minDamage = -160, maxDamage = -250, range = 6, shootEffect = CONST_ANI_FLASHARROW, effect = CONST_ME_STUN, target = true },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_LIFEDRAIN, minDamage = -80, maxDamage = -200, radius = 5, effect = CONST_ME_MAGIC_RED, target = false },
	{ name = "breach brood reducer", interval = 2000, chance = 20, target = false },
}

monster.defenses = {
	defense = 35,
	armor = 43,
	mitigation = 1.32,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 75 },
	{ type = COMBAT_EARTHDAMAGE, percent = -15 },
	{ type = COMBAT_FIREDAMAGE, percent = 40 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 30 },
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