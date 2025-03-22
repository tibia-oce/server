-- Version: 9.80
-- Monster: https://tibia.fandom.com/wiki/Drillworm
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Drillworm
---


local mType = Game.createMonsterType("Drillworm")
local monster = {}

monster.description = "a drillworm"
monster.experience = 1200
monster.outfit = {
	lookType = 527,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

-- todo(monster events): not yet migrated from xml to lua (or doesn't exist)
-- monster.events = {
--	"LowerSpikeDeath",
-- }


monster.health = 1500
monster.maxHealth = 1500
monster.race = "venom"
monster.corpse = 19705
monster.speed = 110
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 20,
}

monster.strategiesTarget = {
	nearest = 100,
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
	canWalkOnEnergy = true,
	canWalkOnFire = false,
	canWalkOnPoison = true}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Krrrk!", yell = false },
	{ text = "Knarrrk!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 100000, minCount = 1, maxCount = 150 },  -- 2148
	{ id = "lump of earth", chance = 15034 },  -- 11222
	{ id = 13757, chance = 12226 },  -- coal
	{ id = "brown crystal splinter", chance = 10090 },  -- 18417
	{ id = "green crystal splinter", chance = 10055 },  -- 18416
	{ id = "blue crystal splinter", chance = 9951 },  -- 18418
	{ id = "vein of ore", chance = 7313 },  -- 18429
	{ id = "pulverized ore", chance = 5173 },  -- 18427
	{ id = 2553, chance = 5049 },  -- pick
	{ id = "drill bolt", chance = 5024, minCount = 1, maxCount = 2 },  -- 18436
	{ id = "worm", chance = 5005, minCount = 1, maxCount = 5 },  -- 3976
	{ id = "terra amulet", chance = 2580 },  -- 7887
	{ id = "dwarven ring", chance = 2419 },  -- 2213
	{ id = "iron ore", chance = 1532 },  -- 5880
	{ id = "clay lump", chance = 743 },  -- 11339
	{ id = "spiked squelcher", chance = 521 },  -- 7452
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -300, condition = { type = CONDITION_POISON, totalDamage = 100, interval = 4000 } },
	{ name = "speed", interval = 2000, chance = 15, speed = -600, length = 8, spread = 3, effect = CONST_ME_MAGIC_RED, target = false, duration = 15000 },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_EARTHDAMAGE, minDamage = -150, maxDamage = -300, length = 8, spread = 3, effect = CONST_ME_HITBYPOISON, target = false },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_EARTHDAMAGE, minDamage = -100, maxDamage = -150, radius = 3, effect = CONST_ME_POISONAREA, target = true },
}

monster.defenses = {
	defense = 35,
	armor = 41,
	mitigation = 1.26,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 15 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = -5 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 16 },
	{ type = COMBAT_HOLYDAMAGE, percent = 15 },
	{ type = COMBAT_DEATHDAMAGE, percent = 15 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)