-- Version: 10.90
-- Monster: https://tibia.fandom.com/wiki/Razzagorn
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Razzagorn
---


local mType = Game.createMonsterType("Razzagorn")
local monster = {}

monster.description = "Razzagorn"
monster.experience = 500000
monster.outfit = {
	lookType = 842,
	lookHead = 78,
	lookBody = 94,
	lookLegs = 13,
	lookFeet = 126,
	lookAddons = 0,
	lookMount = 0,
}

monster.events = {
	"AscendantBossesDeath",
}

monster.bosstiary = {
	bossRaceId = 1177,
	bossRace = RARITY_ARCHFOE,
}

monster.health = 290000
monster.maxHealth = 290000
monster.race = "fire"
monster.corpse = 22495
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

monster.summon = {
	maxSummons = 2,
	summons = {
		{ name = "Eruption of Destruction", chance = 15, interval = 2000, count = 2 },
	},
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "YOUR FUTILE ATTACKS ONLY FEED MY RAGE!", yell = false },
	{ text = "YOU-ARE-WEAK!!", yell = false },
	{ text = "DEEESTRUCTIOOON!!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 0, maxCount = 200 },  -- 2148
	{ id = "onyx chip", chance = 0, maxCount = 5 },  -- 24849
	{ id = "opal", chance = 0, maxCount = 5 },  -- 24850
	{ id = "platinum coin", chance = 0, minCount = 20, maxCount = 30 },  -- 2152
	{ id = "silver token", chance = 0 },  -- 25172
	{ id = "demonic essence", chance = 0 },  -- 6500
	{ id = "great mana potion", chance = 0, maxCount = 5 },  -- 7590
	{ id = "ultimate health potion", chance = 0, maxCount = 5 },  -- 8473
	{ id = "concentrated demonic blood", chance = 0 },  -- todo: flask of demonic blood does not exist in items.xml
	{ id = "great spirit potion", chance = 0, maxCount = 5 },  -- 8472
	{ id = "small emerald", chance = 0, maxCount = 5 },  -- 2149
	{ id = "blue gem", chance = 0 },  -- 2158
	{ id = "green gem", chance = 0 },  -- 2155
	{ id = "orichalcum pearl", chance = 0, maxCount = 5 },  -- 5022
	{ id = "red gem", chance = 0 },  -- 2156
	{ id = "rift crossbow", chance = 0 },  -- 25523
	{ id = "rift lance", chance = 0 },  -- 25383
	{ id = "small diamond", chance = 0, maxCount = 5 },  -- 2145
	{ id = "small ruby", chance = 0, maxCount = 5 },  -- 2147
	{ id = "violet gem", chance = 0 },  -- 2153
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -1000, maxDamage = -2000 },
	{ name = "combat", interval = 3000, chance = 20, type = COMBAT_FIREDAMAGE, minDamage = -500, maxDamage = -1000, length = 10, spread = 3, effect = CONST_ME_HITBYFIRE, target = false },
	{ name = "speed", interval = 2000, chance = 25, speed = -600, radius = 7, effect = CONST_ME_GREEN_RINGS, target = false, duration = 15000 },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_DEATHDAMAGE, minDamage = -500, maxDamage = -700, radius = 7, effect = CONST_ME_LOSEENERGY, target = false },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_FIREDAMAGE, minDamage = -300, maxDamage = -700, radius = 5, effect = CONST_ME_EXPLOSIONHIT, target = false },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_DEATHDAMAGE, minDamage = -1500, maxDamage = -1800, length = 12, spread = 3, effect = CONST_ME_MORTAREA, target = false },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_FIREDAMAGE, minDamage = -500, maxDamage = -800, length = 10, spread = 3, effect = CONST_ME_HITBYFIRE, target = false },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_ENERGYDAMAGE, minDamage = -500, maxDamage = -800, length = 10, spread = 3, effect = CONST_ME_ENERGYHIT, target = false },
}

monster.defenses = {
	defense = 145,
	armor = 188,
	--	mitigation = ???,
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_HEALING, minDamage = 1000, maxDamage = 3000, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "speed", interval = 2000, chance = 8, effect = CONST_ME_MAGIC_RED, speed = 340},
	{ name = "razzagorn summon", interval = 2000, chance = 3, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 40 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 10 },
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)