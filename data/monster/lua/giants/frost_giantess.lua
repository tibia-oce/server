-- Version: 8.00
-- Monster: https://tibia.fandom.com/wiki/Frost_Giantess
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Frost_Giantess
---


local mType = Game.createMonsterType("Frost Giantess")
local monster = {}

monster.description = "a frost giantess"
monster.experience = 150
monster.outfit = {
	lookType = 265,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 275
monster.maxHealth = 275
monster.race = "blood"
monster.corpse = 7330
monster.speed = 97
monster.manaCost = 490

monster.changeTarget = {
	interval = 4000,
	chance = 10,
}

monster.strategiesTarget = {
	nearest = 70,
	damage = 30,
}

monster.flags = {
	summonable = true,
	attackable = true,
	hostile = true,
	convinceable = true,
	pushable = false,
	rewardBoss = false,
	illusionable = true,
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 60,
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
	{ text = "Ymirs Mjalle!", yell = false },
	{ text = "No run so much, must stay fat!", yell = false },
	{ text = "Hï¿½rre Sjan Flan!", yell = false },
	{ text = "Damned fast food.", yell = false },
	{ text = "Come kiss the cook!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 82053, minCount = 1, maxCount = 40 },  -- 2148
	{ id = "ham", chance = 20780 },  -- 2671
	{ id = "small stone", chance = 10393, minCount = 1, maxCount = 3 },  -- 1294
	{ id = "short sword", chance = 7941 },  -- 2406
	{ id = "frost giant pelt", chance = 4949 },  -- 10575
	{ id = 7441, chance = 2084 },  -- ice cube
	{ id = "battle shield", chance = 1525 },  -- 2513
	{ id = "mana potion", chance = 940 },  -- 7620
	{ id = "norse shield", chance = 286 },  -- 7460
	{ id = "dark helmet", chance = 172 },  -- 2490
	{ id = "shard", chance = 102 },  -- 7290
	{ id = "club ring", chance = 70 },  -- 2209
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -60 },
	{ name = "combat", interval = 2000, chance = 30, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -90, range = 7, shootEffect = CONST_ANI_LARGEROCK, target = false },
}

monster.defenses = {
	defense = 15,
	armor = 15,
	{ name = "speed", interval = 2000, chance = 15, effect = CONST_ME_MAGIC_RED, speed = 194},
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -10 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 20 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 100 },
	{ type = COMBAT_HOLYDAMAGE, percent = 10 },
	{ type = COMBAT_DEATHDAMAGE, percent = -3 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = false },
	{ type = "bleed", condition = false },
}

mType:register(monster)