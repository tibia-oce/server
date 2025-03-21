-- Version: 7.9
-- Monster: https://tibia.fandom.com/wiki/Mr._Punish
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Mr._Punish
---


local mType = Game.createMonsterType("Mr. Punish")
local monster = {}

monster.description = "Mr. Punish"
monster.experience = 9000
monster.outfit = {
	lookType = 234,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.bosstiary = {
	bossRaceId = 303,
	bossRace = RARITY_NEMESIS,
}

monster.health = 22000
monster.maxHealth = 22000
monster.race = "undead"
monster.corpse = 6330
monster.speed = 235
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
	canPushCreatures = false,
	staticAttackChance = 50,
	targetDistance = 1,
	runHealth = 2000,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "I kept my axe sharp, especially for you!", yell = false },
	{ text = "Time for a little torturing practice!", yell = false },
	{ text = "Scream for me!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 100000, minCount = 8, maxCount = 129 },  -- 2148
	{ id = "Mr. Punish's handcuffs", chance = 100000 },  -- 6537
	{ id = "demonic essence", chance = 92857 },  -- 6500
	{ id = "soul orb", chance = 92857 },  -- 5944
	{ id = "double axe", chance = 28571 },  -- 2387
	{ id = "jewelled backpack", chance = 21429 },  -- 5801
	{ id = "assassin star", chance = 14286, minCount = 2, maxCount = 3 },  -- 7368
	{ id = "cat's paw", chance = 14286 },  -- 5480
	{ id = "gold ingot", chance = 14286 },  -- 9971
	{ id = "great health potion", chance = 14286 },  -- 7591
	{ id = "platinum coin", chance = 14286, minCount = 1, maxCount = 2 },  -- 2152
	{ id = 6492, chance = 7143 },  -- bat decoration
	{ id = "great mana potion", chance = 7143 },  -- 7590
	{ id = "ravager's axe", chance = 7143 },  -- 2443
	{ id = "small diamond", chance = 7143 },  -- 2145
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -660, maxDamage = -1280 },
}

monster.defenses = {
	defense = 72,
	armor = 64,
	--	mitigation = ???,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 100 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = 100 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 100 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = -10 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
