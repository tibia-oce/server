-- Version: 10.55
-- Monster: https://tibia.fandom.com/wiki/Muglex_Clan_Footman
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Muglex_Clan_Footman
---


local mType = Game.createMonsterType("Muglex Clan Footman")
local monster = {}

monster.description = "a muglex clan footman"
monster.experience = 25
monster.outfit = {
	lookType = 61,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.events = {
	"MorrisGoblinDeath",
}

monster.health = 50
monster.maxHealth = 50
monster.race = "blood"
monster.corpse = 6002
monster.speed = 60
monster.manaCost = 0

monster.changeTarget = {
	interval = 2000,
	chance = 0,
}

monster.strategiesTarget = {
	nearest = 100,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = true,
	rewardBoss = false,
	illusionable = true,
	canPushItems = false,
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 15,
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
}

monster.loot = {
	{ id = "gold coin", chance = 100000, minCount = 1, maxCount = 6 },  -- 2148
	{ id = "dagger", chance = 18433 },  -- 2379
	{ id = "fish", chance = 16590, minCount = 1, maxCount = 2 },  -- 2667
	{ id = "short sword", chance = 13364 },  -- 2406
	{ id = "small stone", chance = 12903 },  -- 1294
	{ id = "small axe", chance = 11982 },  -- 2559
	{ id = "bone club", chance = 10138 },  -- 2449
	{ id = "leather armor", chance = 4608 },  -- 2467
	{ id = "leather helmet", chance = 4147 },  -- 2461
	{ id = 2230, chance = 1843 },  -- bone
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, skill = 10, attack = 10 },
	{ name = "combat", interval = 2000, chance = 8, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -22, range = 7, shootEffect = CONST_ANI_SMALLSTONE, target = false },
}

monster.defenses = {
	defense = 4,
	armor = 2,
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