-- Version: 9.60
-- Monster: https://tibia.fandom.com/wiki/Bibby_Bloodbath
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Bibby_Bloodbath
---


local mType = Game.createMonsterType("Bibby Bloodbath")
local monster = {}

monster.description = "Bibby Bloodbath"
monster.experience = 1500
monster.outfit = {
	lookType = 2,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.bosstiary = {
	bossRaceId = 900,
	bossRace = RARITY_ARCHFOE,
}

monster.health = 1200
monster.maxHealth = 1200
monster.race = "blood"
monster.corpse = 6008
monster.speed = 120
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10,
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
	canWalkOnEnergy = false,
	canWalkOnFire = true,
	canWalkOnPoison = false}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Don't run, you'll just lose precious fat.", yell = false },
	{ text = "Hex hex!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 100000, minCount = 1, maxCount = 100 },  -- 2148
	{ id = "platinum coin", chance = 100000, minCount = 1, maxCount = 10 },  -- 2152
	{ id = "orcish axe", chance = 32911 },  -- 2428
	{ id = "two handed sword", chance = 24684 },  -- 2377
	{ id = "throwing star", chance = 19620, minCount = 1, maxCount = 18 },  -- 2399
	{ id = "mana potion", chance = 15190, minCount = 1, maxCount = 3 },  -- 7620
	{ id = "dark armor", chance = 14557 },  -- 2489
	{ id = "health potion", chance = 12025, minCount = 1, maxCount = 3 },  -- 7618
	{ id = "fish", chance = 10127 },  -- 2667
	{ id = "meat", chance = 10127 },  -- 2666
	{ id = "plate legs", chance = 8228 },  -- 2647
	{ id = "stealth ring", chance = 6962 },  -- 2165
	{ id = "magma amulet", chance = 5696 },  -- 7890
	{ id = "giant sword", chance = 3165 },  -- 2393
	{ id = "crusader helmet", chance = 1899 },  -- 2497
	{ id = "butcher's axe", chance = 1266 },  -- 7412
	{ id = 7395, chance = 1266 },  -- orc trophy
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -200 },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -200, length = 5, spread = 3, effect = CONST_ME_BLOCKHIT, target = false },
	{ name = "speed", interval = 2000, chance = 15, speed = -300, radius = 3, effect = CONST_ME_BLOCKHIT, target = false, duration = 30000 },
}

monster.defenses = {
	defense = 35,
	armor = 58,
	--	mitigation = ???,
	{ name = "invisible", interval = 2000, chance = 15, effect = CONST_ME_MAGIC_BLUE },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = -20 },
	{ type = COMBAT_FIREDAMAGE, percent = 100 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 100 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)