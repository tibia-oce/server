-- Version: 7.8
-- Monster: https://tibia.fandom.com/wiki/Massive_Water_Elemental
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Massive_Water_Elemental
---


local mType = Game.createMonsterType("Massive Water Elemental")
local monster = {}

monster.description = "a massive water elemental"
monster.experience = 1100
monster.outfit = {
	lookType = 11,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 1250
monster.maxHealth = 1250
monster.race = "undead"
monster.corpse = 9582
monster.speed = 215
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
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = true,
	canWalkOnPoison = true}

monster.light = {
	level = 4,
	color = 143,
}

monster.voices = {
	interval = 5000,
	chance = 10,
}

monster.loot = {
	{ id = "gold coin", chance = 99712, minCount = 1, maxCount = 100 },  -- 2148
	{ id = "fish", chance = 39487, minCount = 1, maxCount = 2 },  -- 2667
	{ id = "platinum coin", chance = 29184, minCount = 1, maxCount = 2 },  -- 2152
	{ id = "great health potion", chance = 10277 },  -- 7591
	{ id = "great mana potion", chance = 10016 },  -- 7590
	{ id = "small diamond", chance = 5753, minCount = 1, maxCount = 2 },  -- 2145
	{ id = "small emerald", chance = 4393, minCount = 1, maxCount = 2 },  -- 2149
	{ id = "green perch", chance = 1177 },  -- 7159
	{ id = "energy ring", chance = 1098 },  -- 2167
	{ id = "rainbow trout", chance = 968 },  -- 7158
	{ id = "life ring", chance = 785 },  -- 2168
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -220, condition = { type = CONDITION_POISON, totalDamage = 300, interval = 4000 } },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_DROWNDAMAGE, minDamage = -330, maxDamage = -450, range = 7, radius = 2, effect = CONST_ME_LOSEENERGY, target = true },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_ICEDAMAGE, minDamage = -170, maxDamage = -210, range = 7, shootEffect = CONST_ANI_SMALLICE, target = false },
	-- poison
	{ name = "condition", type = CONDITION_POISON, interval = 2000, chance = 20, minDamage = -355, maxDamage = -420, radius = 5, effect = CONST_ME_POISONAREA, target = false },
}

monster.defenses = {
	defense = 25,
	armor = 45,
	mitigation = 1.32,
	{ name = "combat", interval = 2000, chance = 5, type = COMBAT_HEALING, minDamage = 120, maxDamage = 250, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 40 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -25 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = 100 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 100 },
	{ type = COMBAT_ICEDAMAGE, percent = 100 },
	{ type = COMBAT_HOLYDAMAGE, percent = 50 },
	{ type = COMBAT_DEATHDAMAGE, percent = 50 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)