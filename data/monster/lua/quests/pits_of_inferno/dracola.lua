-- Version: 7.9
-- Monster: https://tibia.fandom.com/wiki/Dracola
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Dracola
---


local mType = Game.createMonsterType("Dracola")
local monster = {}

monster.description = "Dracola"
monster.experience = 11000
monster.outfit = {
	lookType = 231,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 16200
monster.maxHealth = 16200
monster.race = "undead"
monster.corpse = 6306
monster.speed = 185
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
	canPushCreatures = true,
	staticAttackChance = 95,
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
	{ text = "DEATH CAN'T STOP MY HUNGER!", yell = true },
	{ text = "YOU ARE ALL DOOMED!", yell = true },
	{ text = "Your new name is breakfast.", yell = false },
	{ text = "I'm bad to the bone.", yell = false },
}

monster.loot = {
	{ id = "Dracola's eye", chance = 100000 },  -- 6546
	{ id = "gold coin", chance = 100000, minCount = 8, maxCount = 154 },  -- 2148
	{ id = "soul orb", chance = 100000 },  -- 5944
	{ id = "demonic essence", chance = 95455 },  -- 6500
	{ id = "life crystal", chance = 77273 },  -- 2177
	{ id = "platinum coin", chance = 40909, minCount = 1, maxCount = 4 },  -- 2152
	{ id = "dark armor", chance = 36364 },  -- 2489
	{ id = "great health potion", chance = 18182 },  -- 7591
	{ id = "reaper's axe", chance = 18182 },  -- 7420
	{ id = "small sapphire", chance = 13636, minCount = 2, maxCount = 4 },  -- 2146
	{ id = 6300, chance = 9091 },  -- death ring
	{ id = "great mana potion", chance = 9091 },  -- 7590
	{ id = "hardened bone", chance = 9091 },  -- 5925
	{ id = "ring of healing", chance = 4545 },  -- 2214
	{ id = "skull helmet", chance = 4545 },  -- 5741
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -700 },
	{ name = "combat", interval = 3000, chance = 20, type = COMBAT_LIFEDRAIN, minDamage = -800, maxDamage = -1000, length = 8, spread = 3, effect = CONST_ME_MAGIC_GREEN, target = false },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_EARTHDAMAGE, minDamage = -120, maxDamage = -750, range = 7, radius = 4, shootEffect = CONST_ANI_POISON, effect = CONST_ME_POISONAREA, target = true },
	-- drown
	{ name = "condition", type = CONDITION_DROWN, interval = 1000, chance = 20, length = 8, spread = 3, effect = CONST_ME_POFF, target = false },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = -300, maxDamage = -870, range = 7, radius = 4, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_HITAREA, target = true },
	{ name = "combat", interval = 3000, chance = 10, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -750, range = 7, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA, target = false },
	{ name = "combat", interval = 1000, chance = 23, type = COMBAT_EARTHDAMAGE, minDamage = -50, maxDamage = -175, range = 7, radius = 4, shootEffect = CONST_ANI_POISON, effect = CONST_ME_POISONAREA, target = true },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_MANADRAIN, minDamage = -100, maxDamage = -200, range = 7, target = false },
}

monster.defenses = {
	defense = 39,
	armor = 40,
	--	mitigation = ???,
	{ name = "combat", interval = 4000, chance = 10, type = COMBAT_HEALING, minDamage = 500, maxDamage = 1000, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = 100 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 100 },
	{ type = COMBAT_ICEDAMAGE, percent = 100 },
	{ type = COMBAT_HOLYDAMAGE, percent = -10 },
	{ type = COMBAT_DEATHDAMAGE, percent = 100 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)