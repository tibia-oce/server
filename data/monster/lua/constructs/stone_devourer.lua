-- Version: 9.60
-- Monster: https://tibia.fandom.com/wiki/Stone_Devourer
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Stone_Devourer
---


local mType = Game.createMonsterType("Stone Devourer")
local monster = {}

monster.description = "a stone devourer"
monster.experience = 2900
monster.outfit = {
	lookType = 486,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 4200
monster.maxHealth = 4200
monster.race = "undead"
monster.corpse = 15865
monster.speed = 150
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
	canPushCreatures = false,
	staticAttackChance = 80,
	targetDistance = 1,
	runHealth = 1,
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
	{ text = "Rumble!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 100000, minCount = 1, maxCount = 100 },  -- 2148
	{ id = "platinum coin", chance = 91411, minCount = 1, maxCount = 7 },  -- 2152
	{ id = "stone nose", chance = 18731 },  -- 18431
	{ id = "crystalline spikes", chance = 17212 },  -- 18432
	{ id = "mana potion", chance = 15527, minCount = 1, maxCount = 2 },  -- 7620
	{ id = "great mana potion", chance = 15362, minCount = 1, maxCount = 2 },  -- 7590
	{ id = "ultimate health potion", chance = 15329 },  -- 8473
	{ id = "strong mana potion", chance = 14371, minCount = 1, maxCount = 2 },  -- 7589
	{ id = "strong health potion", chance = 14338, minCount = 1, maxCount = 2 },  -- 7588
	{ id = "ancient stone", chance = 12058 },  -- 10549
	{ id = 13757, chance = 11166 },  -- coal
	{ id = "crystalline arrow", chance = 10043, minCount = 1, maxCount = 10 },  -- 18304
	{ id = "cyan crystal fragment", chance = 7169 },  -- 18419
	{ id = "green crystal splinter", chance = 6706 },  -- 18416
	{ id = "glorious axe", chance = 2742 },  -- 7454
	{ id = "dwarven ring", chance = 2544 },  -- 2213
	{ id = "stone skin amulet", chance = 2213 },  -- 2197
	{ id = "sapphire hammer", chance = 1718 },  -- 7437
	{ id = "spiked squelcher", chance = 1288 },  -- 7452
	{ id = "war axe", chance = 826 },  -- 2454
	{ id = "crystal mace", chance = 694 },  -- 2445
	{ id = "giant sword", chance = 496 },  -- 2393
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -990 },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_EARTHDAMAGE, minDamage = -230, maxDamage = -460, range = 7, shootEffect = CONST_ANI_SMALLEARTH, effect = CONST_ME_STONES, target = true },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -650, range = 7, shootEffect = CONST_ANI_LARGEROCK, target = true },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_LIFEDRAIN, minDamage = -150, maxDamage = -260, length = 5, spread = 0, effect = CONST_ME_STONES, target = false },
}

monster.defenses = {
	defense = 35,
	armor = 75,
	mitigation = 2.31,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 10 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 30 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = -5 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 30 },
	{ type = COMBAT_HOLYDAMAGE, percent = 30 },
	{ type = COMBAT_DEATHDAMAGE, percent = 30 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)