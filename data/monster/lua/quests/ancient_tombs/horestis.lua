-- Version: 9.10
-- Monster: https://tibia.fandom.com/wiki/Horestis
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Horestis
---


local mType = Game.createMonsterType("Horestis")
local monster = {}

monster.description = "Horestis"
monster.experience = 3500
monster.outfit = {
	lookType = 91,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.health = 6000
monster.maxHealth = 6000
monster.race = "undead"
monster.corpse = 6031
monster.speed = 170
monster.manaCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 8,
}

monster.bosstiary = {
	bossRaceId = 713,
	bossRace = RARITY_NEMESIS,
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
	maxSummons = 2,
	summons = {
		{ name = "Sandstone Scorpion", chance = 12, interval = 1000, count = 2 },
	},
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "I might be dead but I'm not gone!", yell = false },
}

monster.loot = {
	{ id = "scorpion sceptre", chance = 100000 },  -- 13498
	{ id = "gold coin", chance = 95833, minCount = 9, maxCount = 243 },  -- 2148
	{ id = "platinum coin", chance = 35417, minCount = 1, maxCount = 5 },  -- 2152
	{ id = "scarab coin", chance = 20833, minCount = 1, maxCount = 5 },  -- 2159
	{ id = 13472, chance = 14583 },  -- pharaoh banner
	{ id = 13739, chance = 10417 },  -- hieroglyph banner
	{ id = "silver brooch", chance = 10417 },  -- 2134
	{ id = "great mana potion", chance = 8333, minCount = 1, maxCount = 3 },  -- 7590
	{ id = "great health potion", chance = 6250, minCount = 4, maxCount = 5 },  -- 7591
	{ id = "pharaoh sword", chance = 4167 },  -- 2446
	{ id = "mini mummy", chance = 2083 },  -- 11207
	{ id = 9811, chance = 2083 },  -- rusty legs (todo: slightly rusted does not exist in items.xml)
	{ id = "twin axe", chance = 2083 },  -- 2447
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -450 },
	{ name = "combat", interval = 1000, chance = 12, type = COMBAT_DEATHDAMAGE, minDamage = -200, maxDamage = -750, range = 7, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA, target = false },
	{ name = "combat", interval = 3000, chance = 17, type = COMBAT_LIFEDRAIN, minDamage = -400, maxDamage = -500, length = 8, spread = 3, effect = CONST_ME_MAGIC_RED, target = false },
	{ name = "drunk", interval = 3000, chance = 11, radius = 6, effect = CONST_ME_POISONAREA, target = false, duration = 25000 },
	{ name = "speed", interval = 1000, chance = 25, speed = -350, length = 7, spread = 3, effect = CONST_ME_POISONAREA, target = false, duration = 30000 },
	-- poison
	{ name = "condition", type = CONDITION_POISON, interval = 2000, chance = 30, minDamage = -35, maxDamage = -35, radius = 5, effect = CONST_ME_HITBYPOISON, target = false },
}

monster.defenses = {
	defense = 30,
	armor = 25,
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_HEALING, minDamage = 200, maxDamage = 400, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = -5 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 5 },
	{ type = COMBAT_EARTHDAMAGE, percent = 50 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 100 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 20 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 100 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)