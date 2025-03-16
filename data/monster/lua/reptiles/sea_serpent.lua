-- Sea Serpent (Tibia Wiki: https://tibia.fandom.com/wiki/Sea_Serpent)
-- Version: 8.20

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
monster.corpse = 949
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
	{ id = "small sapphire", chance = 5600, maxCount = 3 },
	{ id = "gold coin", chance = 38000, maxCount = 100 },
	{ id = "gold coin", chance = 30000, maxCount = 100 },
	{ id = "gold coin", chance = 30000, maxCount = 36 },
	{ id = "platinum coin", chance = 25000, maxCount = 3 },
	{ id = 3049, chance = 400 }, -- stealth ring
	{ id = 3098, chance = 1100 }, -- ring of healing
	{ id = "serpent sword", chance = 4200 },
	{ id = "plate legs", chance = 7150 },
	{ id = "dragon ham", chance = 60000, maxCount = 2 },
	{ id = "strong health potion", chance = 5500 },
	{ id = "strong mana potion", chance = 3850 },
	{ id = "great mana potion", chance = 920 },
	{ id = "glacier amulet", chance = 880 },
	{ id = "glacier kilt", chance = 430 },
	{ id = "spirit cloak", chance = 2900 },
	{ id = "focus cape", chance = 370 },
	{ id = "crystalline armor", chance = 90 },
	{ id = "northwind rod", chance = 930 },
	{ id = "sea serpent scale", chance = 10200 },
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
