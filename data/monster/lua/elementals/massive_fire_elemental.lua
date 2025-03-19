-- Version: 8.20
-- Monster: https://tibia.fandom.com/wiki/Massive_Fire_Elemental
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Massive_Fire_Elemental
---


local mType = Game.createMonsterType("Massive Fire Elemental")
local monster = {}

monster.description = "a massive fire elemental"
monster.experience = 1400
monster.outfit = {
	lookType = 242,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 1800
monster.maxHealth = 1800
monster.race = "fire"
monster.corpse = 6323
monster.speed = 119
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10,
}

monster.strategiesTarget = {
	nearest = 80,
	random = 20,
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
	canWalkOnPoison = false}

monster.light = {
	level = 5,
	color = 206,
}

monster.voices = {
	interval = 5000,
	chance = 10,
}

monster.loot = {
	{ id = "gold coin", chance = 99991, minCount = 1, maxCount = 217 },  -- 2148
	{ id = "platinum coin", chance = 15193 },  -- 2152
	{ id = "rusty armor", chance = 7792 },  -- todo: rusted armor does not exist in items.xml
	{ id = "small ruby", chance = 7049, minCount = 1, maxCount = 2 },  -- 2147
	{ id = "wand of inferno", chance = 2387 },  -- 2187
	{ id = "magma amulet", chance = 919 },  -- 7890
	{ id = "magma boots", chance = 604 },  -- 7891
	{ id = "fire sword", chance = 474 },  -- 2392
	{ id = "magma legs", chance = 186 },  -- 7894
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -300 },
	{ name = "firefield", interval = 2000, chance = 10, range = 7, radius = 3, shootEffect = CONST_ANI_FIRE, target = false },
	{ name = "firefield", interval = 2000, chance = 10, range = 7, radius = 3, shootEffect = CONST_ANI_FIRE, target = true },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_FIREDAMAGE, minDamage = -200, maxDamage = -700, length = 7, spread = 0, effect = CONST_ME_FIREAREA, target = false },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_FIREDAMAGE, minDamage = -60, maxDamage = -250, radius = 3, effect = CONST_ME_EXPLOSIONHIT, target = false },
	{ name = "massive fire elemental soulfire", interval = 2000, chance = 15, target = false },
}

monster.defenses = {
	defense = 30,
	armor = 57,
	mitigation = 1.32,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 50 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 30 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 100 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -15 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 20 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
