-- Version: 10.70
-- Monster: https://tibia.fandom.com/wiki/Roaring_Lion
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Roaring_Lion
---


local mType = Game.createMonsterType("Roaring Lion")
local monster = {}

monster.description = "a roaring lion"
monster.experience = 800
monster.outfit = {
	lookType = 570,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 1000
monster.maxHealth = 1000
monster.race = "blood"
monster.corpse = 19103
monster.speed = 105
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10,
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
	illusionable = true,
	canPushItems = true,
	canPushCreatures = false,
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
	{ text = "Groarrrr! Rwarrrr!", yell = false },
	{ text = "Growl!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 100000, minCount = 1, maxCount = 115 },  -- 2148
	{ id = "meat", chance = 25279 },  -- 2666
	{ id = "ham", chance = 24843 },  -- 2671
	{ id = "lion's mane", chance = 20182 },  -- 10608
	{ id = "platinum coin", chance = 9999 },  -- 2152
	{ id = "small sapphire", chance = 7158 },  -- 2146
	{ id = "small topaz", chance = 6924 },  -- 9970
	{ id = "small ruby", chance = 6858 },  -- 2147
	{ id = "small amethyst", chance = 6694 },  -- 2150
	{ id = "ankh", chance = 2917 },  -- 2193
	{ id = "might ring", chance = 709 },  -- 2164
	{ id = "crown helmet", chance = 580 },  -- 2491
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, skill = 60, attack = 40 },
}

monster.defenses = {
	defense = 28,
	armor = 28,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 20 },
	{ type = COMBAT_FIREDAMAGE, percent = 20 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -10 },
	{ type = COMBAT_HOLYDAMAGE, percent = 50 },
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)