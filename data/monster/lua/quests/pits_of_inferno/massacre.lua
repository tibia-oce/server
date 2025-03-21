-- Version: 7.9
-- Monster: https://tibia.fandom.com/wiki/Massacre
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Massacre
---


local mType = Game.createMonsterType("Massacre")
local monster = {}

monster.description = "Massacre"
monster.experience = 20000
monster.outfit = {
	lookType = 244,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 32000
monster.maxHealth = 32000
monster.race = "blood"
monster.corpse = 6335
monster.speed = 215
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
	rewardBoss = true,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
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
	{ text = "HATE! HATE! KILL! KILL!", yell = true },
	{ text = "GRRAAARRRHH!", yell = true },
	{ text = "GRRRR!", yell = true },
}

monster.loot = {
	{ id = "piece of Massacre's shell", chance = 100000 },  -- 6540
	{ id = "demonic essence", chance = 96552 },  -- 6500
	{ id = "soul orb", chance = 96552 },  -- 5944
	{ id = "gold coin", chance = 89655, minCount = 8, maxCount = 157 },  -- 2148
	{ id = "meat", chance = 82759 },  -- 2666
	{ id = "orichalcum pearl", chance = 75862, minCount = 1, maxCount = 6 },  -- 5022
	{ id = "old twig", chance = 65517 },  -- 2221
	{ id = "platinum coin", chance = 51724, minCount = 1, maxCount = 6 },  -- 2152
	{ id = "great mana potion", chance = 10345 },  -- 7590
	{ id = "great health potion", chance = 6897 },  -- 7591
	{ id = 2231, chance = 3448 },  -- big bone
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, skill = 160, attack = 200 },
	{ name = "combat", interval = 2000, chance = 12, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -1100, range = 7, shootEffect = CONST_ANI_LARGEROCK, effect = CONST_ME_EXPLOSIONAREA, target = false },
}

monster.defenses = {
	defense = 65,
	armor = 45,
	--	mitigation = ???,
	{ name = "speed", interval = 2000, chance = 8, effect = CONST_ME_MAGIC_RED, speed = 430},
	{ name = "combat", interval = 2000, chance = 25, type = COMBAT_HEALING, minDamage = 600, maxDamage = 1090, effect = CONST_ME_HITBYFIRE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -1 },
	{ type = COMBAT_EARTHDAMAGE, percent = 1 },
	{ type = COMBAT_FIREDAMAGE, percent = 100 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 10 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = -10 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = true },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)