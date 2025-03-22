-- Version: 9.50
-- Monster: https://tibia.fandom.com/wiki/Deepling_Tyrant
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Deepling_Tyrant
---


local mType = Game.createMonsterType("Deepling Tyrant")
local monster = {}

monster.description = "a deepling tyrant"
monster.experience = 4200
monster.outfit = {
	lookType = 442,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 4500
monster.maxHealth = 4500
monster.race = "blood"
monster.corpse = 15188
monster.speed = 155
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
	rewardBoss = false,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 70,
	targetDistance = 1,
	runHealth = 20,
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
	{ text = "QJELL NETA NA!!", yell = true },
}

monster.loot = {
	{ id = "gold coin", chance = 100000, minCount = 2, maxCount = 200 },  -- 2148
	{ id = "platinum coin", chance = 70180, minCount = 1, maxCount = 4 },  -- 2152
	{ id = "deepling breaktime snack", chance = 35443 },  -- 15424
	{ id = "great mana potion", chance = 32801, minCount = 1, maxCount = 3 },  -- 7590
	{ id = "great health potion", chance = 31834, minCount = 1, maxCount = 3 },  -- 7591
	{ id = "deepling claw", chance = 30055 },  -- 15455
	{ id = "eye of a deepling", chance = 29793 },  -- 13870
	{ id = "deepling guard belt buckle", chance = 24039 },  -- 15423
	{ id = "small sapphire", chance = 9286, minCount = 1, maxCount = 5 },  -- 2146
	{ id = "heavy trident", chance = 3270 },  -- 13838
	{ id = "deepling squelcher", chance = 1491 },  -- 15647
	{ id = "guardian axe", chance = 1256 },  -- 15454
	{ id = "ornate crossbow", chance = 1099 },  -- 15644
	{ id = "deepling backpack", chance = 549 },  -- 15645
	{ id = "foxtail", chance = 26 },  -- 15545
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -501, effect = CONST_ME_DRAWBLOOD },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -375, range = 7, shootEffect = CONST_ANI_WHIRLWINDSWORD, target = true },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_DROWNDAMAGE, minDamage = -180, maxDamage = -215, range = 7, shootEffect = CONST_ANI_SPEAR, effect = CONST_ME_LOSEENERGY, target = true },
}

monster.defenses = {
	defense = 45,
	armor = 54,
	mitigation = 1.65,
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_HEALING, minDamage = 200, maxDamage = 400, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -10 },
	{ type = COMBAT_EARTHDAMAGE, percent = -10 },
	{ type = COMBAT_FIREDAMAGE, percent = 100 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
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
