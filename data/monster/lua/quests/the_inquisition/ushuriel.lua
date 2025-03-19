-- Version: 8.20
-- Monster: https://tibia.fandom.com/wiki/Ushuriel
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Ushuriel
---


local mType = Game.createMonsterType("Ushuriel")
local monster = {}

monster.description = "Ushuriel"
monster.experience = 10000
monster.outfit = {
	lookType = 12,
	lookHead = 0,
	lookBody = 57,
	lookLegs = 0,
	lookFeet = 80,
	lookAddons = 0,
	lookMount = 0,
}

monster.events = {
	"InquisitionBossDeath",
}

monster.health = 31500
monster.maxHealth = 31500
monster.race = "fire"
monster.corpse = 6068
monster.speed = 220
monster.manaCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 8,
}

monster.bosstiary = {
	bossRaceId = 415,
	bossRace = RARITY_BANE,
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
	staticAttackChance = 85,
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
	{ text = "You can't run or hide forever!", yell = false },
	{ text = "I'm the executioner of the Seven!", yell = false },
	{ text = "The final punishment awaits you!", yell = false },
	{ text = "The judgement is guilty! The sentence is death!", yell = false },
}

monster.loot = {
	{ id = "demonic essence", chance = 100000 },  -- 6500
	{ id = "brown mushroom", chance = 96923, minCount = 1, maxCount = 30 },  -- 2789
	{ id = "gold coin", chance = 96923, minCount = 3, maxCount = 192 },  -- 2148
	{ id = "iron ore", chance = 44231 },  -- 5880
	{ id = "hardened bone", chance = 28077, minCount = 1, maxCount = 20 },  -- 5925
	{ id = "ultimate health potion", chance = 26346 },  -- 8473
	{ id = "royal helmet", chance = 25577 },  -- 2498
	{ id = "great health potion", chance = 25192 },  -- 7591
	{ id = "great spirit potion", chance = 24423 },  -- 8472
	{ id = "great mana potion", chance = 20962 },  -- 7590
	{ id = "life crystal", chance = 20962 },  -- 2177
	{ id = "platinum coin", chance = 20962, minCount = 1, maxCount = 30 },  -- 2152
	{ id = "skull helmet", chance = 20962 },  -- 5741
	{ id = "gold ingot", chance = 20385 },  -- 9971
	{ id = "mind stone", chance = 20385 },  -- 2178
	{ id = "mysterious voodoo skull", chance = 20000 },  -- 5669
	{ id = "warrior helmet", chance = 19615 },  -- 2475
	{ id = "thaian sword", chance = 19231 },  -- 7391
	{ id = "fire sword", chance = 19038 },  -- 2392
	{ id = "orb", chance = 17885 },  -- 2176
	{ id = 9808, chance = 16538 },  -- rusty armor (todo: slightly rusted does not exist in items.xml)
	{ id = "huge chunk of crude iron", chance = 14423 },  -- 5892
	{ id = "giant sword", chance = 11731 },  -- 2393
	{ id = 2419, chance = 10962 },  -- scimitar
	{ id = "demon horn", chance = 10577, minCount = 1, maxCount = 2 },  -- 5954
	{ id = "dragon slayer", chance = 10192 },  -- 7402
	{ id = "spike sword", chance = 10192 },  -- 2383
	{ id = 7385, chance = 9231 },  -- crimson sword
	{ id = "crown helmet", chance = 8846 },  -- 2491
	{ id = "strange helmet", chance = 8846 },  -- 2479
	{ id = "runed sword", chance = 8269 },  -- 7417
	{ id = "enchanted chicken wing", chance = 5577 },  -- 5891
	{ id = "spirit container", chance = 5000 },  -- 5884
	{ id = "unholy book", chance = 4423 },  -- 6103
	{ id = "flask of warrior's sweat", chance = 3846 },  -- 5885
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -1088 },
	{ name = "combat", interval = 1000, chance = 10, type = COMBAT_PHYSICALDAMAGE, minDamage = -250, maxDamage = -500, length = 10, spread = 3, effect = CONST_ME_MORTAREA, target = false },
	{ name = "combat", interval = 1000, chance = 8, type = COMBAT_DEATHDAMAGE, minDamage = -30, maxDamage = -760, radius = 5, shootEffect = CONST_ANI_DEATH, effect = CONST_ME_MORTAREA, target = false },
	{ name = "combat", interval = 2000, chance = 9, type = COMBAT_EARTHDAMAGE, minDamage = -200, maxDamage = -585, length = 8, spread = 3, effect = CONST_ME_SMALLPLANTS, target = false },
	{ name = "combat", interval = 1000, chance = 8, type = COMBAT_ICEDAMAGE, minDamage = 0, maxDamage = -430, radius = 6, effect = CONST_ME_ICETORNADO, target = false },
	{ name = "drunk", interval = 3000, chance = 11, radius = 6, effect = CONST_ME_SOUND_PURPLE, target = false },
	-- energy damage
	{ name = "condition", type = CONDITION_ENERGY, interval = 2000, chance = 15, minDamage = -250, maxDamage = -250, radius = 4, effect = CONST_ME_ENERGYHIT, target = false },
}

monster.defenses = {
	defense = 45,
	armor = 50,
	{ name = "combat", interval = 1000, chance = 12, type = COMBAT_HEALING, minDamage = 400, maxDamage = 600, effect = CONST_ME_MAGIC_GREEN, target = false },
	{ name = "speed", interval = 1000, chance = 4, effect = CONST_ME_MAGIC_BLUE, speed = 440},
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 50 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 30 },
	{ type = COMBAT_EARTHDAMAGE, percent = 30 },
	{ type = COMBAT_FIREDAMAGE, percent = 30 },
	{ type = COMBAT_LIFEDRAIN, percent = 100 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 30 },
	{ type = COMBAT_HOLYDAMAGE, percent = 25 },
	{ type = COMBAT_DEATHDAMAGE, percent = 100 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)