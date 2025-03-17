-- Version: 10.70
-- Monster: https://tibia.fandom.com/wiki/Renegade_Quara_Constrictor
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Renegade_Quara_Constrictor
---


local mType = Game.createMonsterType("Renegade Quara Constrictor")
local monster = {}

monster.description = "a renegade quara constrictor"
monster.experience = 1250
monster.outfit = {
	lookType = 46,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 1500
monster.maxHealth = 1500
monster.race = "blood"
monster.corpse = 6065
monster.speed = 190
monster.manaCost = 0

monster.changeTarget = {
	interval = 2000,
	chance = 0,
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
	illusionable = true,
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 20,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = true,
	canWalkOnPoison = false}

monster.light = {
	level = 2,
	color = 35,
}

monster.voices = {
	interval = 5000,
	chance = 10,
}

monster.loot = {
	{ id = "platinum coin", chance = 80886, minCount = 1, maxCount = 3 },  -- 2152
	{ id = "quara tentacle", chance = 14622 },  -- 12443
	{ id = "mind stone", chance = 7001 },  -- 2178
	{ id = "great mana potion", chance = 6722 },  -- 7590
	{ id = "ring of healing", chance = 5297 },  -- 2214
	{ id = "shrimp", chance = 4926 },  -- 2670
	{ id = "small amethyst", chance = 4802, minCount = 1, maxCount = 2 },  -- 2150
	{ id = "assassin star", chance = 4461, minCount = 1, maxCount = 7 },  -- 7368
	{ id = "small ruby", chance = 4182, minCount = 1, maxCount = 2 },  -- 2147
	{ id = "vortex bolt", chance = 3284, minCount = 1, maxCount = 10 },  -- 15649
	{ id = "northwind rod", chance = 1053 },  -- 8911
	{ id = "violet crystal shard", chance = 960 },  -- 18414
	{ id = "fish fin", chance = 372 },  -- 5895
	{ id = "piggy bank", chance = 248 },  -- 2114
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, skill = 60, attack = 40, effect = CONST_ME_DRAWBLOOD },
	{ name = "quara constrictor freeze", interval = 2000, chance = 10, target = false },
	{ name = "quara constrictor electrify", interval = 2000, chance = 10, range = 1, target = false },
}

monster.defenses = {
	defense = 20,
	armor = 35,
	mitigation = 1.04,
	{ name = "combat", interval = 3000, chance = 35, type = COMBAT_HEALING, minDamage = 150, maxDamage = 300, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -25 },
	{ type = COMBAT_EARTHDAMAGE, percent = -10 },
	{ type = COMBAT_FIREDAMAGE, percent = 100 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 100 },
	{ type = COMBAT_ICEDAMAGE, percent = 100 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = false },
	{ type = "bleed", condition = false },
}

mType:register(monster)