-- Version: 9.50
-- Monster: https://tibia.fandom.com/wiki/Bretzecutioner
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Bretzecutioner
---


local mType = Game.createMonsterType("Bretzecutioner")
local monster = {}

monster.description = "Bretzecutioner"
monster.experience = 3700
monster.outfit = {
	lookType = 236,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.health = 5600
monster.maxHealth = 5600
monster.race = "undead"
monster.corpse = 6319
monster.speed = 135
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
	rewardBoss = true,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 70,
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
}

monster.loot = {
	{ id = "assassin star", chance = 100000, minCount = 1, maxCount = 10 },  -- 7368
	{ id = 6300, chance = 100000 },  -- death ring
	{ id = "gold coin", chance = 100000, minCount = 2, maxCount = 99 },  -- 2148
	{ id = "meat", chance = 100000 },  -- 2666
	{ id = "metal spike", chance = 100000 },  -- 11215
	{ id = "platinum coin", chance = 100000, minCount = 2, maxCount = 8 },  -- 2152
	{ id = "dark armor", chance = 66667 },  -- 2489
	{ id = "demonic essence", chance = 61111 },  -- 6500
	{ id = "great health potion", chance = 47222, minCount = 1, maxCount = 3 },  -- 7591
	{ id = 7632, chance = 41667 },  -- giant shimmering pearl
	{ id = "small sapphire", chance = 38889, minCount = 1, maxCount = 5 },  -- 2146
	{ id = "spiked squelcher", chance = 38889 },  -- 7452
	{ id = "small diamond", chance = 33333, minCount = 1, maxCount = 5 },  -- 2145
	{ id = "great spirit potion", chance = 30556, minCount = 1, maxCount = 3 },  -- 8472
	{ id = "crystal necklace", chance = 27778 },  -- 2125
	{ id = "small amethyst", chance = 27778, minCount = 1, maxCount = 5 },  -- 2150
	{ id = "great mana potion", chance = 22222, minCount = 1, maxCount = 3 },  -- 7590
	{ id = "chaos mace", chance = 19444 },  -- 7427
	{ id = "dark shield", chance = 19444 },  -- 2521
	{ id = "giant sword", chance = 16667 },  -- 2393
	{ id = "dreaded cleaver", chance = 13889 },  -- 7419
	{ id = "steel boots", chance = 5556 },  -- 2645
	{ id = "skull helmet", chance = 2778 },  -- 5741
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -514 },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -200, range = 7, shootEffect = CONST_ANI_LARGEROCK, target = false },
}

monster.defenses = {
	defense = 30,
	armor = 30,
	mitigation = 2.04,
	{ name = "speed", interval = 2000, chance = 15, effect = CONST_ME_MAGIC_RED, speed = 270},
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