-- Version: 7.3
-- Monster: https://tibia.fandom.com/wiki/Thalas
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Thalas
---


local mType = Game.createMonsterType("Thalas")
local monster = {}

monster.description = "Thalas"
monster.experience = 2950
monster.outfit = {
	lookType = 90,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.health = 4100
monster.maxHealth = 4100
monster.race = "undead"
monster.corpse = 6025
monster.speed = 210
monster.manaCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 8,
}


monster.strategiesTarget = {
	nearest = 80,
	health = 10,
	damage = 10,
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
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false}

monster.light = {
	level = 0,
	color = 0,
}

monster.summon = {
	maxSummons = 8,
	summons = {
		{ name = "Slime", chance = 100, interval = 2000, count = 8 },
	},
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "You will become a feast for my maggots!", yell = false },
}

monster.loot = {
	{ id = "cobrafang dagger", chance = 100000 },  -- 2351
	{ id = "gold coin", chance = 91128, minCount = 1, maxCount = 238 },  -- 2148
	{ id = "poison dagger", chance = 21039 },  -- 2411
	{ id = "small emerald", chance = 8999, minCount = 1, maxCount = 3 },  -- 2149
	{ id = "great health potion", chance = 8112 },  -- 7591
	{ id = 2169, chance = 5323 },  -- time ring
	{ id = "serpent sword", chance = 2662 },  -- 2409
	{ id = "djinn blade", chance = 1014 },  -- 2451
	{ id = "green gem", chance = 887 },  -- 2155
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -900 },
	{ name = "combat", interval = 2000, chance = 25, type = COMBAT_EARTHDAMAGE, minDamage = -150, maxDamage = -650, range = 7, shootEffect = CONST_ANI_POISON, effect = CONST_ME_POISONAREA, target = false },
	{ name = "melee", interval = 3000, chance = 20, minDamage = -150, maxDamage = -650 },
	{ name = "speed", interval = 1000, chance = 6, speed = -800, range = 7, effect = CONST_ME_MAGIC_RED, target = false, duration = 20000 },
	-- poison
	{ name = "condition", type = CONDITION_POISON, interval = 1000, chance = 15, minDamage = -34, maxDamage = -35, radius = 5, effect = CONST_ME_POISONAREA, target = false },
	{ name = "combat", interval = 3000, chance = 17, type = COMBAT_EARTHDAMAGE, minDamage = -55, maxDamage = -550, length = 8, spread = 3, effect = CONST_ME_POISONAREA, target = false },
}

monster.defenses = {
	defense = 30,
	armor = 20,
	{ name = "combat", interval = 1000, chance = 20, type = COMBAT_HEALING, minDamage = 150, maxDamage = 450, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = -23 },
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
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)