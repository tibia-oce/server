-- Version: 10.90
-- Monster: https://tibia.fandom.com/wiki/Zamulosh
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Zamulosh
---


local mType = Game.createMonsterType("Zamulosh")
local monster = {}

monster.description = "Zamulosh"
monster.experience = 500000
monster.outfit = {
	lookType = 862,
	lookHead = 16,
	lookBody = 12,
	lookLegs = 73,
	lookFeet = 55,
	lookAddons = 0,
	lookMount = 0,
}

-- todo(monster events): not yet migrated from xml to lua (or doesn't exist)
-- monster.events = {
--	"AscendantBossesDeath",
-- }

monster.health = 300000
monster.maxHealth = 300000
monster.race = "undead"
monster.corpse = 22495
monster.speed = 160
monster.manaCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 8,
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
	canPushCreatures = false,
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

monster.summon = {
	maxSummons = 1,
	summons = {
		{ name = "Zamulosh2", chance = 100, interval = 1000, count = 1 },
	},
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "I AM ZAMULOSH!", yell = true },
}

monster.loot = {
    { id = "brown crystal splinter", chance = 100000, maxCount = 6 },  -- 18417
    { id = "gold coin", chance = 100000, maxCount = 101 },  -- 2148
    { id = "platinum coin", chance = 100000, minCount = 20, maxCount = 35 },  -- 2152
    { id = "silver token", chance = 100000 },  -- 25172
    { id = "stealth ring", chance = 100000 },  -- 2165
    { id = 2169, chance = 100000 },  -- time ring
    { id = "demonic essence", chance = 80000 },  -- 6500
    { id = "great spirit potion", chance = 80000, minCount = 5, maxCount = 10 },  -- 8472
    { id = "green crystal splinter", chance = 80000, maxCount = 6 },  -- 18416
    { id = "blue crystal splinter", chance = 60000, maxCount = 6 },  -- 18418
    { id = "concentrated demonic blood", chance = 40000 },  -- todo: flask of demonic blood does not exist in items.xml
    { id = "great mana potion", chance = 40000, maxCount = 5 },  -- 7590
    { id = "yellow gem", chance = 40000 },  -- 2154
    { id = "red gem", chance = 20000 },  -- 2156
    { id = "small amethyst", chance = 20000, maxCount = 5 },  -- 2150
    { id = "small sapphire", chance = 20000, maxCount = 5 },  -- 2146
    { id = "small topaz", chance = 20000, maxCount = 5 },  -- 9970
    { id = "ultimate health potion", chance = 20000, maxCount = 10 },  -- 8473
}

monster.attacks = {
	{ name = "melee", interval = 3000, chance = 100, minDamage = -1500, maxDamage = -2300 },
	{ name = "combat", interval = 1000, chance = 10, type = COMBAT_DEATHDAMAGE, minDamage = -700, maxDamage = -800, length = 12, spread = 3, effect = CONST_ME_MORTAREA, target = false },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_MANADRAIN, minDamage = -2600, maxDamage = -3300, length = 12, spread = 3, effect = CONST_ME_TELEPORT, target = false },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_FIREDAMAGE, minDamage = -900, maxDamage = -1500, length = 6, spread = 2, effect = CONST_ME_FIREAREA, target = false },
	{ name = "speed", interval = 2000, chance = 35, speed = -600, radius = 8, effect = CONST_ME_MAGIC_RED, target = false, duration = 15000 },
}

monster.defenses = {
	defense = 30,
	armor = 30,
	--	mitigation = ???,
	{ name = "combat", interval = 2000, chance = 25, type = COMBAT_HEALING, minDamage = 220, maxDamage = 535, effect = CONST_ME_YELLOW_RINGS, target = false },
	{ name = "zamulosh invisible", interval = 2000, chance = 25 },
	{ name = "zamulosh tp", interval = 2000, chance = 15, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = -1 },
	{ type = COMBAT_FIREDAMAGE, percent = 50 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = -1 },
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)