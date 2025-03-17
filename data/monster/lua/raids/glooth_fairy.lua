-- Version: 10.50
-- Monster: https://tibia.fandom.com/wiki/Glooth_Fairy
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Glooth_Fairy
---


local mType = Game.createMonsterType("Glooth Fairy")
local monster = {}

monster.description = "Glooth Fairy"
monster.experience = 19000
monster.outfit = {
	lookType = 600,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.bosstiary = {
	bossRaceId = 1058,
	bossRace = RARITY_BANE,
}

monster.health = 59000
monster.maxHealth = 59000
monster.race = "blood"
monster.corpse = 20972
monster.speed = 130
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 80,
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
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
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
	{ id = "glooth injection tube", chance = 100000, maxCount = 3 },  -- 23474
	{ id = "gold coin", chance = 100000, maxCount = 100 },  -- 2148
	{ id = "platinum coin", chance = 100000, maxCount = 5 },  -- 2152
	{ id = "great spirit potion", chance = 39167, maxCount = 5 },  -- 8472
	{ id = "great health potion", chance = 32500, maxCount = 5 },  -- 7591
	{ id = "great mana potion", chance = 28333, maxCount = 5 },  -- 7590
	{ id = "glooth sandwich", chance = 27500, maxCount = 5 },  -- 23514
	{ id = "glooth amulet", chance = 23333 },  -- 23554
	{ id = "bowl of glooth soup", chance = 22500, maxCount = 5 },  -- 23515
	{ id = "glooth blade", chance = 21667 },  -- 23550
	{ id = "glooth steak", chance = 21667, maxCount = 5 },  -- 23517
	{ id = "iron ore", chance = 20833 },  -- 5880
	{ id = "glooth club", chance = 20000 },  -- 23549
	{ id = "small emerald", chance = 20000, maxCount = 5 },  -- 2149
	{ id = "glooth spear", chance = 19167, maxCount = 5 },  -- 23529
	{ id = 9690, chance = 17500 },  -- gear wheel
	{ id = "glooth axe", chance = 15833 },  -- 23551
	{ id = "small diamond", chance = 15833, maxCount = 5 },  -- 2145
	{ id = "small ruby", chance = 16667, maxCount = 5 },  -- 2147
	{ id = "small topaz", chance = 14167, maxCount = 5 },  -- 9970
	{ id = "small sapphire", chance = 12500, maxCount = 5 },  -- 2146
	{ id = "small amethyst", chance = 10833, maxCount = 5 },  -- 2150
	{ id = "glooth cape", chance = 7500 },  -- 23535
	{ id = "rubber cap", chance = 7500 },  -- 23536
	{ id = "heat core", chance = 5000 },  -- 23538
	{ id = "blue gem", chance = 4167 },  -- 2158
	{ id = "red gem", chance = 3333 },  -- 2156
	{ id = "yellow gem", chance = 2500 },  -- 2154
	{ id = "feedbag", chance = 1667 },  -- 23663
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -1900 },
	{ name = "combat", interval = 1000, chance = 7, type = COMBAT_ENERGYDAMAGE, minDamage = -300, maxDamage = -4000, radius = 6, effect = CONST_ME_ENERGYHIT, target = false }, -- blue energy ultimate explosion
	{ name = "war golem skill reducer", interval = 2000, chance = 10, target = false }, -- reduces shield "yellow stars beam"
	{ name = "glooth fairy skill reducer", interval = 2000, chance = 5, target = false }, -- reduces magic level "great energy beam"
	{ name = "speed", interval = 2000, chance = 20, speed = -400, radius = 6, effect = CONST_ME_POISONAREA, target = true, duration = 60000 }, -- paralyze, poison ultimate explosion
}

monster.defenses = {
	defense = 150,
	armor = 165,
	mitigation = 2.37,
	{ name = "combat", interval = 1000, chance = 10, type = COMBAT_HEALING, minDamage = 200, maxDamage = 250, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "combat", interval = 1000, chance = 1, type = COMBAT_HEALING, minDamage = 7500, maxDamage = 8000, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 5 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = -5 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 15 },
	{ type = COMBAT_DEATHDAMAGE, percent = 30 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)