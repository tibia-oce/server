-- Version: 10.50
-- Monster: https://tibia.fandom.com/wiki/The_Ravager
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:The_Ravager
---


local mType = Game.createMonsterType("The Ravager")
local monster = {}

monster.description = "The Ravager"
monster.experience = 14980
monster.outfit = {
	lookType = 91,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.events = {
	"TheRavagerDeath",
}

monster.bosstiary = {
	bossRaceId = 1035,
	bossRace = RARITY_BANE,
}

monster.health = 53500
monster.maxHealth = 53500
monster.race = "undead"
monster.corpse = 6031
monster.speed = 170
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
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true}

monster.events = {
	"TheRavagerDeath",
}

monster.light = {
	level = 0,
	color = 0,
}

monster.summon = {
	maxSummons = 16,
	summons = {
		{ name = "Elder Mummy", chance = 9, interval = 2000, count = 4 },
		{ name = "Canopic Jar", chance = 9, interval = 2000, count = 4 },
		{ name = "Greater Canopic Jar", chance = 9, interval = 2000, count = 8 },
	},
}

monster.voices = {
	interval = 5000,
	chance = 10,
}

monster.loot = {
	{ id = "black pearl", chance = 100000, minCount = 1, maxCount = 5 },  -- 2144
	{ id = "platinum coin", chance = 100000, minCount = 1, maxCount = 15 },  -- 2152
	{ id = "scarab coin", chance = 100000, minCount = 1, maxCount = 4 },  -- 2159
	{ id = 2142, chance = 28272 },  -- ancient amulet
	{ id = "great mana potion", chance = 24869, minCount = 1, maxCount = 4 },  -- 7590
	{ id = "great health potion", chance = 24607, minCount = 1, maxCount = 4 },  -- 7591
	{ id = "daramian waraxe", chance = 9162 },  -- 2440
	{ id = "scarab shield", chance = 2880 },  -- 2540
	{ id = "silver brooch", chance = 2094 },  -- 2134
	{ id = 9811, chance = 785 },  -- rusty legs (todo: slightly rusted does not exist in items.xml)
	{ id = 9808, chance = 524 },  -- rusty armor (todo: slightly rusted does not exist in items.xml)
	{ id = 9808, chance = 262 },  -- rusty armor
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, skill = 82, attack = 70, condition = { type = CONDITION_POISON, totalDamage = 320, interval = 4000 } },
	{ name = "combat", interval = 2000, chance = 12, type = COMBAT_DEATHDAMAGE, minDamage = -200, maxDamage = -750, range = 7, shootEffect = CONST_ANI_DEATH, effect = CONST_ME_MORTAREA, target = false },
	{ name = "combat", interval = 2000, chance = 9, type = COMBAT_DEATHDAMAGE, minDamage = -700, maxDamage = -880, length = 8, spread = 3, effect = CONST_ME_SMALLCLOUDS, target = false },
	{ name = "combat", interval = 2000, chance = 18, type = COMBAT_LIFEDRAIN, minDamage = -400, maxDamage = -500, length = 7, spread = 3, effect = CONST_ME_SMOKE, target = false },
}

monster.defenses = {
	defense = 30,
	armor = 25,
	--	mitigation = ???,
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_HEALING, minDamage = 200, maxDamage = 400, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 10 },
	{ type = COMBAT_EARTHDAMAGE, percent = 1 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 50 },
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