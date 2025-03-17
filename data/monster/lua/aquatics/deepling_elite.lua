-- Version: 9.50
-- Monster: https://tibia.fandom.com/wiki/Deepling_Elite
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Deepling_Elite
---


local mType = Game.createMonsterType("Deepling Elite")
local monster = {}

monster.description = "a deepling elite"
monster.experience = 3000
monster.outfit = {
	lookType = 441,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 3200
monster.maxHealth = 3200
monster.race = "blood"
monster.corpse = 13713
monster.speed = 165
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
	runHealth = 30,
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
}

monster.loot = {
	{ id = "gold coin", chance = 100000, minCount = 1, maxCount = 189 },  -- 2148
	{ id = "great health potion", chance = 25946 },  -- 7591
	{ id = "eye of a deepling", chance = 25450 },  -- 13870
	{ id = "deepling filet", chance = 25315 },  -- 15488
	{ id = "vortex bolt", chance = 25045, minCount = 1, maxCount = 5 },  -- 15649
	{ id = "deepling warts", chance = 24595 },  -- 15425
	{ id = "great mana potion", chance = 24505 },  -- 7590
	{ id = "deeptags", chance = 20631 },  -- 15426
	{ id = "deepling ridge", chance = 18784 },  -- 15452
	{ id = "small emerald", chance = 7072, minCount = 1, maxCount = 2 },  -- 2149
	{ id = "life ring", chance = 5541 },  -- 2168
	{ id = "heavy trident", chance = 3468 },  -- 13838
	{ id = "fish fin", chance = 2342 },  -- 5895
	{ id = "warrior's shield", chance = 1171 },  -- 15453
	{ id = "warrior's axe", chance = 901 },  -- 15451
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -300, effect = CONST_ME_DRAWBLOOD },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -290, range = 7, shootEffect = CONST_ANI_LARGEROCK, target = true },
}

monster.defenses = {
	defense = 45,
	armor = 45,
	mitigation = 1.37,
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_HEALING, minDamage = 150, maxDamage = 200, effect = CONST_ME_MAGIC_BLUE, target = false },
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