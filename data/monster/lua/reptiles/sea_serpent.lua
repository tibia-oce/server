-- Version: 8.20
-- Monster: https://tibia.fandom.com/wiki/Sea_Serpent
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Sea_Serpent
---


local mType = Game.createMonsterType("Sea Serpent")
local monster = {}

monster.description = "a sea serpent"
monster.experience = 2300
monster.outfit = {
	lookType = 275,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 1950
monster.maxHealth = 1950
monster.race = "blood"
monster.corpse = 8307
monster.speed = 240
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
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 70,
	targetDistance = 1,
	runHealth = 0,
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
	{ text = "CHHHRRRR", yell = true },
	{ text = "HISSSS", yell = true },
}

monster.loot = {
	{ id = "gold coin", chance = 98321, minCount = 1, maxCount = 236 },  -- 2148
	{ id = "dragon ham", chance = 60514 },  -- 2672
	{ id = "platinum coin", chance = 26847, minCount = 1, maxCount = 3 },  -- 2152
	{ id = "sea serpent scale", chance = 10123 },  -- 10583
	{ id = "plate legs", chance = 7146 },  -- 2647
	{ id = "small sapphire", chance = 5935, minCount = 1, maxCount = 3 },  -- 2146
	{ id = "strong health potion", chance = 5008 },  -- 7588
	{ id = "serpent sword", chance = 4031 },  -- 2409
	{ id = "strong mana potion", chance = 3998 },  -- 7589
	{ id = "spirit cloak", chance = 2914 },  -- 8870
	{ id = "ring of healing", chance = 1143 },  -- 2214
	{ id = "northwind rod", chance = 1019 },  -- 8911
	{ id = "great mana potion", chance = 911 },  -- 7590
	{ id = "glacier amulet", chance = 890 },  -- 7888
	{ id = "glacier kilt", chance = 431 },  -- 7896
	{ id = "stealth ring", chance = 422 },  -- 2165
	{ id = "focus cape", chance = 405 },  -- 8871
	{ id = "leviathan's amulet", chance = 115 },  -- 10220
	{ id = "crystalline armor", chance = 91 },  -- 8878
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -250 },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_EARTHDAMAGE, minDamage = -60, maxDamage = -300, length = 7, spread = 2, effect = CONST_ME_SMALLPLANTS, target = false },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_ICEDAMAGE, minDamage = -101, maxDamage = -300, length = 7, spread = 2, effect = CONST_ME_ICEATTACK, target = false },
	{ name = "sea serpent drown", interval = 2000, chance = 15, range = 5, target = false },
}

monster.defenses = {
	defense = 45,
	armor = 25,
	mitigation = 1.04,
	{ name = "combat", interval = 2000, chance = 30, type = COMBAT_HEALING, minDamage = 70, maxDamage = 273, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "speed", interval = 2000, chance = 15, effect = CONST_ME_MAGIC_RED, speed = 480},
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = -10 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -5 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 30 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 100 },
	{ type = COMBAT_ICEDAMAGE, percent = 100 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 10 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)