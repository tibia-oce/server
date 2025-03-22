-- Version: 10.70
-- Monster: https://tibia.fandom.com/wiki/Glooth_Battery
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Glooth_Battery
---


local mType = Game.createMonsterType("Glooth Battery")
local monster = {}

monster.description = "a glooth battery"
monster.experience = 3000
monster.outfit = {
	lookTypeEx = 20710,
}

monster.health = 8000
monster.maxHealth = 8000
monster.race = "blood"
monster.corpse = 0
monster.speed = 0
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
	canPushItems = false,
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 4,
	runHealth = 0,
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
}

monster.loot = {
	{ id = "platinum coin", chance = 76800, minCount = 1, maxCount = 5 },  -- 2152
	{ id = "great health potion", chance = 13600 },  -- 7591
	{ id = "great mana potion", chance = 10400 },  -- 7590
	{ id = "flask of rust remover", chance = 8000 },  -- 9930
	{ id = "gearwheel chain", chance = 6400 },  -- 23541
	{ id = 9690, chance = 4800 },  -- gear wheel
	{ id = "metal spats", chance = 3200 },  -- 23540
	{ id = "iron ore", chance = 2400 },  -- 5880
	{ id = "heat core", chance = 1600 },  -- 23538
	{ id = "steel boots", chance = 1600 },  -- 2645
	{ id = "alloy legs", chance = 800 },  -- 23539
	{ id = 9976, chance = 800 },  -- crystal pedestal (red)
	{ id = "mastermind potion", chance = 800 },  -- 7440
	{ id = "war crystal", chance = 800 },  -- 10571
}

monster.attacks = {
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_EARTHDAMAGE, minDamage = -206, maxDamage = -252, radius = 6, effect = CONST_ME_GREEN_RINGS, target = false },
}

monster.defenses = {
	defense = 30,
	armor = 30,
	{ name = "combat", interval = 4000, chance = 15, type = COMBAT_HEALING, minDamage = 133, maxDamage = 454, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 25 },
	{ type = COMBAT_EARTHDAMAGE, percent = 1 },
	{ type = COMBAT_FIREDAMAGE, percent = 25 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 25 },
	{ type = COMBAT_HOLYDAMAGE, percent = 25 },
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = false },
	{ type = "bleed", condition = false },
}

mType:register(monster)