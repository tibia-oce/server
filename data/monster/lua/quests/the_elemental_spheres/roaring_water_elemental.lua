-- Version: 8.20
-- Monster: https://tibia.fandom.com/wiki/Roaring_Water_Elemental
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Roaring_Water_Elemental
---


local mType = Game.createMonsterType("Roaring Water Elemental")
local monster = {}

monster.description = "a roaring water elemental"
monster.experience = 1300
monster.outfit = {
	lookType = 11,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.health = 1750
monster.maxHealth = 1750
monster.race = "undead"
monster.corpse = 8965
monster.speed = 195
monster.manaCost = 0

monster.changeTarget = {
	interval = 20000,
	chance = 15,
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
	canPushCreatures = false,
	staticAttackChance = 85,
	targetDistance = 1,
	runHealth = 1,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = true,
	canWalkOnPoison = true}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "BLUB BLUB", yell = true },
	{ text = "SWASHHH", yell = true },
}

monster.loot = {
	{ id = "gold coin", chance = 86180, minCount = 1, maxCount = 180 },  -- 2148
	{ id = "iced soil", chance = 9021 },  -- 8302
	{ id = "small sapphire", chance = 3839, minCount = 1, maxCount = 2 },  -- 2146
	{ id = 7632, chance = 2303 },  -- giant shimmering pearl
	{ id = "northwind rod", chance = 384 },  -- 8911
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -225 },
	{ name = "combat", interval = 1000, chance = 15, type = COMBAT_ICEDAMAGE, minDamage = -240, maxDamage = -320, radius = 2, shootEffect = CONST_ANI_ICE, effect = CONST_ME_LOSEENERGY, target = true },
}

monster.defenses = {
	defense = 30,
	armor = 30,
	--	mitigation = ???,
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_HEALING, minDamage = 90, maxDamage = 150, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 45 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = 100 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 100 },
	{ type = COMBAT_ICEDAMAGE, percent = 100 },
	{ type = COMBAT_HOLYDAMAGE, percent = 40 },
	{ type = COMBAT_DEATHDAMAGE, percent = 1 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
