-- Version: 7.8
-- Monster: https://tibia.fandom.com/wiki/Tiquandas_Revenge
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Tiquandas_Revenge
---


local mType = Game.createMonsterType("Tiquandas Revenge")
local monster = {}

monster.description = "Tiquandas Revenge"
monster.experience = 2635
monster.outfit = {
	lookType = 120,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.health = 1800
monster.maxHealth = 1800
monster.race = "venom"
monster.corpse = 6047
monster.speed = 220
monster.manaCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 8,
}

monster.strategiesTarget = {
	nearest = 70,
	damage = 30,
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
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 400,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
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
	{ id = "mandrake", chance = 100000 },  -- 5015
	{ id = "seeds", chance = 100000 },  -- 7732
	{ id = "gold coin", chance = 87500, minCount = 1, maxCount = 118 },  -- 2148
	{ id = "meat", chance = 68750 },  -- 2666
	{ id = "ham", chance = 37500 },  -- 2671
	{ id = "dark mushroom", chance = 20833, minCount = 1, maxCount = 5 },  -- 2792
	{ id = "carrot on a stick", chance = 12500 },  -- 13298
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, skill = 70, attack = 40, condition = { type = CONDITION_POISON, totalDamage = 95, interval = 4000 } },
	{ name = "combat", interval = 1000, chance = 25, type = COMBAT_EARTHDAMAGE, minDamage = -60, maxDamage = -200, range = 7, shootEffect = CONST_ANI_POISON, effect = CONST_ME_HITBYPOISON, target = false },
	{ name = "speed", interval = 1000, chance = 34, speed = -850, range = 7, shootEffect = CONST_ANI_POISON, effect = CONST_ME_HITBYPOISON, target = false, duration = 30000 },
	{ name = "combat", interval = 1000, chance = 12, type = COMBAT_EARTHDAMAGE, minDamage = -40, maxDamage = -130, radius = 3, effect = CONST_ME_POISONAREA, target = false },
}

monster.defenses = {
	defense = 31,
	armor = 30,
	mitigation = 1.58,
	{ name = "ultimate healing", interval = 1200, chance = 35, minDamage = 600, maxDamage = 800, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 1 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = -1 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 1 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 1 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)