-- Drillworm (Tibia Wiki: https://tibia.fandom.com/wiki/Drillworm)
-- Version: 9.80

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

monster.events = {
	"LowerSpikeDeath",
}


monster.health = 1500
monster.maxHealth = 1500
monster.race = "venom"
monster.corpse = 17425
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
	{ id = "gold coin", chance = 50000, maxCount = 100 },
	{ id = "gold coin", chance = 50000, maxCount = 50 },
	{ id = 3456, chance = 5280 }, -- pick
	{ id = "worm", chance = 4580, maxCount = 5 },
	{ id = "iron ore", chance = 1750 },
	{ id = "spiked squelcher", chance = 540 },
	{ id = "terra amulet", chance = 2360 },
	{ id = "lump of earth", chance = 15000 },
	{ id = "clay lump", chance = 700 },
	{ id = 12600, chance = 12130 }, -- coal
	{ id = "green crystal splinter", chance = 9780 },
	{ id = "brown crystal splinter", chance = 9260 },
	{ id = "blue crystal splinter", chance = 9610 },
	{ id = "pulverized ore", chance = 5400 },
	{ id = "vein of ore", chance = 7280 },
	{ id = "drill bolt", chance = 4870, maxCount = 2 },
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
