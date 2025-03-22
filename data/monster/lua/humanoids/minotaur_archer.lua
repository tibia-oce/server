-- Version: 5.1
-- Monster: https://tibia.fandom.com/wiki/Minotaur_Archer
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Minotaur_Archer
---


local mType = Game.createMonsterType("Minotaur Archer")
local monster = {}

monster.description = "a minotaur archer"
monster.experience = 65
monster.outfit = {
	lookType = 24,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 100
monster.maxHealth = 100
monster.race = "blood"
monster.corpse = 5982
monster.speed = 80
monster.manaCost = 390

monster.changeTarget = {
	interval = 4000,
	chance = 10,
}

monster.strategiesTarget = {
	nearest = 100,
}

monster.flags = {
	summonable = true,
	attackable = true,
	hostile = true,
	convinceable = true,
	pushable = true,
	rewardBoss = false,
	illusionable = true,
	canPushItems = false,
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 4,
	runHealth = 10,
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
	{ text = "Ruan Wihmpy!", yell = false },
	{ text = "Kaplar!", yell = false },
}

monster.loot = {
	{ id = 2543, chance = 90081, minCount = 1, maxCount = 20 },  -- bolt
	{ id = "gold coin", chance = 74968, minCount = 1, maxCount = 30 },  -- 2148
	{ id = "broken crossbow", chance = 15310 },  -- 12407
	{ id = 7363, chance = 12172, minCount = 1, maxCount = 4 },  -- piercing bolt
	{ id = "piece of archer armor", chance = 8042 },  -- 12439
	{ id = "meat", chance = 4933 },  -- 2666
	{ id = "minotaur leather", chance = 1963 },  -- 5878
	{ id = "minotaur horn", chance = 1956, minCount = 1, maxCount = 2 },  -- 12428
	{ id = "crossbow", chance = 886 },  -- 2455
	{ id = "scale armor", chance = 550 },  -- 2483
	{ id = "brass armor", chance = 524 },  -- 2465
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -25 },
	{ name = "combat", interval = 2000, chance = 40, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -80, range = 7, shootEffect = CONST_ANI_BOLT, target = false },
}

monster.defenses = {
	defense = 10,
	armor = 6,
	mitigation = 0.20,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 20 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -10 },
	{ type = COMBAT_HOLYDAMAGE, percent = 10 },
	{ type = COMBAT_DEATHDAMAGE, percent = -5 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = false },
	{ type = "bleed", condition = false },
}

mType:register(monster)
