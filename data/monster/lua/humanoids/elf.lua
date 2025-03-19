-- Version: 6.2
-- Monster: https://tibia.fandom.com/wiki/Elf
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Elf
---


local mType = Game.createMonsterType("Elf")
local monster = {}

monster.description = "an elf"
monster.experience = 42
monster.outfit = {
	lookType = 62,
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
monster.corpse = 6003
monster.speed = 95
monster.manaCost = 320

monster.changeTarget = {
	interval = 4000,
	chance = 0,
}

monster.strategiesTarget = {
	nearest = 100,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = true,
	pushable = true,
	rewardBoss = false,
	illusionable = true,
	canPushItems = false,
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 1,
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
	{ text = "Death to the Defilers!", yell = false },
	{ text = "You are not welcome here.", yell = false },
	{ text = "Flee as long as you can.", yell = false },
	{ text = "Bahaha aka!", yell = false },
	{ text = "Ulathil beia Thratha!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 44649, minCount = 1, maxCount = 30 },  -- 2148
	{ id = "plum", chance = 20078, minCount = 1, maxCount = 2 },  -- 8839
	{ id = "studded helmet", chance = 15048 },  -- 2482
	{ id = "leather boots", chance = 11061 },  -- 2643
	{ id = "longsword", chance = 10989 },  -- 2397
	{ id = "studded armor", chance = 8969 },  -- 2484
	{ id = "plate shield", chance = 8880 },  -- 2510
	{ id = "arrow", chance = 6995, minCount = 1, maxCount = 3 },  -- 2544
	{ id = "elvish talisman", chance = 1951 },  -- 10552
	{ id = 5921, chance = 1006 },  -- heaven blossom
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -15 },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -25, range = 7, shootEffect = CONST_ANI_ARROW, target = false },
}

monster.defenses = {
	defense = 10,
	armor = 6,
	mitigation = 0.30,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 20 },
	{ type = COMBAT_DEATHDAMAGE, percent = -10 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)