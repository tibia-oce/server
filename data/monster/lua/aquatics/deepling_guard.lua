-- Version: 9.40
-- Monster: https://tibia.fandom.com/wiki/Deepling_Guard
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Deepling_Guard
---


local mType = Game.createMonsterType("Deepling Guard")
local monster = {}

monster.description = "a deepling guard"
monster.experience = 2100
monster.outfit = {
	lookType = 442,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 1900
monster.maxHealth = 1900
monster.race = "blood"
monster.corpse = 13750
monster.speed = 135
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
	canPushCreatures = false,
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
	{ id = "gold coin", chance = 100000, minCount = 2, maxCount = 180 },  -- 2148
	{ id = "platinum coin", chance = 70160, minCount = 1, maxCount = 2 },  -- 2152
	{ id = "great health potion", chance = 15088, minCount = 1, maxCount = 3 },  -- 7591
	{ id = "great mana potion", chance = 15055, minCount = 1, maxCount = 3 },  -- 7590
	{ id = "deepling breaktime snack", chance = 14983 },  -- 15424
	{ id = "deepling guard belt buckle", chance = 11986 },  -- 15423
	{ id = "eye of a deepling", chance = 9839 },  -- 13870
	{ id = "deepling claw", chance = 8968 },  -- 15455
	{ id = "small sapphire", chance = 2864, minCount = 1, maxCount = 3 },  -- 2146
	{ id = "heavy trident", chance = 1500 },  -- 13838
	{ id = "guardian axe", chance = 878 },  -- 15454
	{ id = "deepling squelcher", chance = 719 },  -- 15647
	{ id = "ornate crossbow", chance = 411 },  -- 15644
	{ id = "deepling backpack", chance = 312 },  -- 15645
	{ id = "foxtail", chance = 19 },  -- 15545
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -400, effect = CONST_ME_DRAWBLOOD },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -200, range = 7, shootEffect = CONST_ANI_WHIRLWINDSWORD, target = true },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_DROWNDAMAGE, minDamage = -100, maxDamage = -150, range = 7, shootEffect = CONST_ANI_SPEAR, effect = CONST_ME_LOSEENERGY, target = true },
}

monster.defenses = {
	defense = 35,
	armor = 53,
	mitigation = 1.57,
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_HEALING, minDamage = 100, maxDamage = 200, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -10 },
	{ type = COMBAT_EARTHDAMAGE, percent = -10 },
	{ type = COMBAT_FIREDAMAGE, percent = 100 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 100 },
	{ type = COMBAT_ICEDAMAGE, percent = 100 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 10 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
