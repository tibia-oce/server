-- Version: 10.70
-- Monster: https://tibia.fandom.com/wiki/Professor_Maxxen
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Professor_Maxxen
---


local mType = Game.createMonsterType("Professor Maxxen")
local monster = {}

monster.description = "Professor Maxxen"
monster.experience = 15500
monster.outfit = {
	lookType = 679,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

-- todo(monster events): not yet migrated from xml to lua (or doesn't exist)
-- monster.events = {
--	"RathletonBossDeath",
-- }

monster.health = 90000
monster.maxHealth = 90000
monster.race = "venom"
monster.corpse = 21910
monster.speed = 170
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

monster.summon = {
	maxSummons = 8,
	summons = {
		{ name = "walker", chance = 10, interval = 2000, count = 2 },
		{ name = "glooth trasher", chance = 10, interval = 2000, count = 2 },
		{ name = "glooth smasher", chance = 10, interval = 2000, count = 2 },
		{ name = "glooth slasher", chance = 10, interval = 2000, count = 2 },
	},
}

monster.voices = {
	interval = 5000,
	chance = 10,
}

monster.loot = {
    { id = "glooth bag", chance = 100000, minCount = 1, maxCount = 3 },  -- 23574
    { id = "glooth glider casing", chance = 33333 },  -- 24270
    { id = "platinum coin", chance = 33333, minCount = 1, maxCount = 4 },  -- 2152
    { id = 9808, chance = 33333 },  -- todo: rusted armor does not exist in items.xml
    { id = "gold ingot", chance = 22222 },  -- 9971
    { id = 9808, chance = 22222 },  -- rusty armor (todo: slightly rusted does not exist in items.xml)
    { id = "feedbag", chance = 11111 },  -- 23663
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, skill = 180, attack = 200 },
	{ name = "combat", interval = 2000, chance = 11, type = COMBAT_ENERGYDAMAGE, minDamage = -250, maxDamage = -500, radius = 8, effect = CONST_ME_ENERGYHIT, target = false },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_MANADRAIN, minDamage = -450, maxDamage = -1500, length = 8, spread = 0, effect = CONST_ME_TELEPORT, target = false },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_FIREDAMAGE, minDamage = -450, maxDamage = -500, length = 8, spread = 0, effect = CONST_ME_FIREATTACK, target = false },
	{ name = "war golem skill reducer", interval = 2000, chance = 22, target = false },
	{ name = "war golem electrify", interval = 2000, chance = 16, range = 2, target = false },
	{ name = "glooth fairy skill reducer", interval = 2000, chance = 20, target = false },
	{ name = "glooth fairy paralyze", interval = 2000, chance = 9, target = false },
}

monster.defenses = {
	defense = 45,
	armor = 40,
	{ name = "speed", interval = 2000, chance = 13, effect = CONST_ME_MAGIC_RED, speed = 340},
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_HEALING, minDamage = 200, maxDamage = 250, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "generator", interval = 30000, chance = 50, target = false },
	{ name = "maxxenteleport", interval = 2000, chance = 5, target = false },
	{ name = "glooth fairy healing", interval = 1000, chance = 100, target = false },
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
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = false },
	{ type = "bleed", condition = false },
}

mType:register(monster)