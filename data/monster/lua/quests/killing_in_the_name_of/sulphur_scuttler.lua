-- Version: 9.20
-- Monster: https://tibia.fandom.com/wiki/Sulphur_Scuttler
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Sulphur_Scuttler
---


local mType = Game.createMonsterType("Sulphur Scuttler")
local monster = {}

monster.description = "Sulphur Scuttler"
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
monster.corpse = 11571
monster.speed = 100
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
	rewardBoss = true,
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
}

monster.loot = {
	{ id = "brimstone fangs", chance = 100000 },  -- 12658
	{ id = "brimstone shell", chance = 100000 },  -- 12659
	{ id = "platinum coin", chance = 98684, minCount = 1, maxCount = 10 },  -- 2152
	{ id = "sulphurous stone", chance = 97368 },  -- 11232
	{ id = "magic sulphur", chance = 82895 },  -- 5904
	{ id = "strong health potion", chance = 78947 },  -- 7588
	{ id = "strong mana potion", chance = 73684 },  -- 7589
	{ id = "lump of earth", chance = 71053 },  -- 11222
	{ id = "small emerald", chance = 67105, minCount = 1, maxCount = 4 },  -- 2149
	{ id = "poisonous slime", chance = 48684 },  -- 10557
	{ id = "stealth ring", chance = 43421 },  -- 2165
	{ id = "platinum amulet", chance = 18421 },  -- 2171
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -200 },
	{ name = "speed", interval = 2000, chance = 20, speed = -600, range = 7, shootEffect = CONST_ANI_DEATH, effect = CONST_ME_MORTAREA, target = false, duration = 10000 },
	{ name = "combat", interval = 2000, chance = 5, type = COMBAT_EARTHDAMAGE, minDamage = 0, maxDamage = -394, radius = 6, effect = CONST_ME_SMALLPLANTS, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_MANADRAIN, minDamage = 0, maxDamage = -200, length = 6, spread = 3, effect = CONST_ME_HITBYPOISON, target = false },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_EARTHDAMAGE, minDamage = 0, maxDamage = -120, length = 8, spread = 3, effect = CONST_ME_YELLOW_RINGS, target = false },
}

monster.defenses = {
	defense = 25,
	armor = 25,
	--	mitigation = 1.38,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = -10 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 100 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)