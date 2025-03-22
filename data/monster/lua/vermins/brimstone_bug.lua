-- Version: 8.60
-- Monster: https://tibia.fandom.com/wiki/Brimstone_Bug
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Brimstone_Bug
---


local mType = Game.createMonsterType("Brimstone Bug")
local monster = {}

monster.description = "a brimstone bug"
monster.experience = 900
monster.outfit = {
	lookType = 352,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 1300
monster.maxHealth = 1300
monster.race = "venom"
monster.corpse = 12527
monster.speed = 120
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
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = true}

monster.light = {
	level = 2,
	color = 66,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Chrrr!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 100000, minCount = 1, maxCount = 200 },  -- 2148
	{ id = "poisonous slime", chance = 49871 },  -- 10557
	{ id = "lump of earth", chance = 19788 },  -- 11222
	{ id = "sulphurous stone", chance = 14865 },  -- 11232
	{ id = "brimstone shell", chance = 10193 },  -- 12659
	{ id = "strong mana potion", chance = 9206 },  -- 7589
	{ id = "strong health potion", chance = 8995 },  -- 7588
	{ id = "brimstone fangs", chance = 5999 },  -- 12658
	{ id = "small emerald", chance = 2792, minCount = 1, maxCount = 4 },  -- 2149
	{ id = "magic sulphur", chance = 1577 },  -- 5904
	{ id = "stealth ring", chance = 917 },  -- 2165
	{ id = "platinum amulet", chance = 82 },  -- 2171
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -213, condition = { type = CONDITION_POISON, totalDamage = 400, interval = 4000 } },
	{ name = "speed", interval = 2000, chance = 20, speed = -600, range = 7, shootEffect = CONST_ANI_DEATH, effect = CONST_ME_MORTAREA, target = false, duration = 10000 },
	{ name = "combat", interval = 2000, chance = 5, type = COMBAT_EARTHDAMAGE, minDamage = -140, maxDamage = -310, radius = 6, effect = CONST_ME_SMALLPLANTS, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_MANADRAIN, minDamage = -130, maxDamage = -200, length = 6, spread = 3, effect = CONST_ME_HITBYPOISON, target = false },
	{ name = "brimstone bug wave", interval = 2000, chance = 15, minDamage = -80, maxDamage = -120, target = false },
}

monster.defenses = {
	defense = 25,
	armor = 38,
	mitigation = 1.18,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = -10 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -10 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = -10 },
	{ type = COMBAT_LIFEDRAIN, percent = 100 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -10 },
	{ type = COMBAT_HOLYDAMAGE, percent = -10 },
	{ type = COMBAT_DEATHDAMAGE, percent = 100 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)