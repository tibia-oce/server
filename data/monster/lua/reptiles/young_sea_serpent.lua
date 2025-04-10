-- Version: 8.20
-- Monster: https://tibia.fandom.com/wiki/Young_Sea_Serpent
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Young_Sea_Serpent
---


local mType = Game.createMonsterType("Young Sea Serpent")
local monster = {}

monster.description = "a young sea serpent"
monster.experience = 1000
monster.outfit = {
	lookType = 317,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 1050
monster.maxHealth = 1050
monster.race = "blood"
monster.corpse = 9879
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
	staticAttackChance = 85,
	targetDistance = 1,
	runHealth = 400,
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
	{ text = "HISSSS", yell = true },
	{ text = "CHHHRRRR", yell = true },
}

monster.loot = {
	{ id = "gold coin", chance = 98268, minCount = 1, maxCount = 174 },  -- 2148
	{ id = "morning star", chance = 39925 },  -- 2394
	{ id = "battle axe", chance = 8045 },  -- 2378
	{ id = 9808, chance = 7879, minCount = 1, maxCount = 2 },  -- rusty armor
	{ id = "strong health potion", chance = 5099 },  -- 7588
	{ id = "sea serpent scale", chance = 5094 },  -- 10583
	{ id = "battle hammer", chance = 4992 },  -- 2417
	{ id = "strong mana potion", chance = 3980 },  -- 7589
	{ id = "small sapphire", chance = 1991, minCount = 1, maxCount = 2 },  -- 2146
	{ id = "stealth ring", chance = 1008 },  -- 2165
	{ id = "life crystal", chance = 264 },  -- 2177
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -200 },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_EARTHDAMAGE, minDamage = -10, maxDamage = -250, length = 7, spread = 2, effect = CONST_ME_SMALLPLANTS, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_ICEDAMAGE, minDamage = -80, maxDamage = -250, length = 7, spread = 2, effect = CONST_ME_ICEATTACK, target = false },
	{ name = "young sea serpent drown", interval = 2000, chance = 15, range = 5, target = false },
}

monster.defenses = {
	defense = 30,
	armor = 20,
	mitigation = 0.78,
	{ name = "combat", interval = 2000, chance = 30, type = COMBAT_HEALING, minDamage = 25, maxDamage = 175, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "speed", interval = 2000, chance = 15, effect = CONST_ME_MAGIC_RED, speed = 480},
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = -20 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -10 },
	{ type = COMBAT_EARTHDAMAGE, percent = -5 },
	{ type = COMBAT_FIREDAMAGE, percent = 30 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 100 },
	{ type = COMBAT_ICEDAMAGE, percent = 100 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = -15 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)