-- Version: 9.10
-- Monster: https://tibia.fandom.com/wiki/Yielothax
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Yielothax
---


local mType = Game.createMonsterType("Yielothax")
local monster = {}

monster.description = "a yielothax"
monster.experience = 1250
monster.outfit = {
	lookType = 408,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

-- todo(monster events): not yet migrated from xml to lua (or doesn't exist)
-- monster.events = {
--	"YielothaxDeath",
-- }


monster.health = 1500
monster.maxHealth = 1500
monster.race = "venom"
monster.corpse = 12595
monster.speed = 150
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
	staticAttackChance = 75,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = true,
	canWalkOnPoison = true}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "IIEEH!! Iiih iih ih iiih!!!", yell = true },
	{ text = "Bsssssssm Bssssssm Bsssssssssssm!", yell = true },
}

monster.loot = {
	{ id = "gold coin", chance = 99796, minCount = 1, maxCount = 227 },  -- 2148
	{ id = "strong health potion", chance = 19930 },  -- 7588
	{ id = "strong mana potion", chance = 19909 },  -- 7589
	{ id = "brown mushroom", chance = 9960, minCount = 1, maxCount = 3 },  -- 2789
	{ id = "small diamond", chance = 4907, minCount = 1, maxCount = 5 },  -- 2145
	{ id = "might ring", chance = 4020 },  -- 2164
	{ id = "talon", chance = 969 },  -- 2151
	{ id = "lightning pendant", chance = 751 },  -- 7889
	{ id = "shockwave amulet", chance = 563 },  -- 10221
	{ id = "wand of cosmic energy", chance = 535 },  -- 2189
	{ id = "epee", chance = 500 },  -- 2438
	{ id = "mastermind potion", chance = 500 },  -- 7440
	{ id = "lightning legs", chance = 485 },  -- 7895
	{ id = "broken ring of ending", chance = 301 },  -- 13877
	{ id = "yielocks", chance = 293 },  -- 13942
	{ id = "yielowax", chance = 264 },  -- 13881
}

monster.attacks = {
	{ name = "melee", interval = 1000, chance = 100, minDamage = 0, maxDamage = -203 },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_LIFEDRAIN, minDamage = -100, maxDamage = -130, length = 4, spread = 0, effect = CONST_ME_ENERGYAREA, target = false },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_EARTHDAMAGE, minDamage = -150, maxDamage = -250, radius = 3, effect = CONST_ME_HITBYPOISON, target = false },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_EARTHDAMAGE, minDamage = -70, maxDamage = -120, radius = 3, effect = CONST_ME_HITBYPOISON, target = true },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_MANADRAIN, minDamage = -50, maxDamage = -150, length = 4, spread = 0, effect = CONST_ME_MAGIC_RED, target = false },
}

monster.defenses = {
	defense = 30,
	armor = 30,
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_HEALING, minDamage = 100, maxDamage = 150, effect = CONST_ME_HITBYPOISON, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = -10 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -5 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = 25 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -5 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 50 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
