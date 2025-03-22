-- Version: 10.50
-- Monster: https://tibia.fandom.com/wiki/Bullwark
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Bullwark
---


local mType = Game.createMonsterType("Bullwark")
local monster = {}

monster.description = "Bullwark"
monster.experience = 22000
monster.outfit = {
	lookType = 607,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 72000
monster.maxHealth = 72000
monster.race = "blood"
monster.corpse = 20996
monster.speed = 150
monster.manaCost = 0

monster.changeTarget = {
	interval = 2000,
	chance = 3,
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
    { id = "giant pacifier", chance = 1000 },  -- 23570
    { id = "gold coin", chance = 100000, maxCount = 200 },  -- 2148
    { id = "great health potion", chance = 1037, maxCount = 5 },  -- 7591
    { id = "minotaur leather", chance = 1000 },  -- 5878
    { id = "moohtant horn", chance = 1845, maxCount = 2 },  -- 23571
    { id = "platinum coin", chance = 5075, maxCount = 5 },  -- 2152
    { id = "ham", chance = 2770 },  -- 2671
    { id = "meat", chance = 2124 },  -- 2666
    { id = "mooh'tah plate", chance = 68 },  -- 23537
    { id = "small amethyst", chance = 714, maxCount = 5 },  -- 2150
    { id = "small topaz", chance = 633, maxCount = 5 },  -- 9970
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, skill = 180, attack = 200 },
	{ name = "combat", interval = 2000, chance = 19, type = COMBAT_LIFEDRAIN, minDamage = -200, maxDamage = -400, radius = 6, effect = CONST_ME_MAGIC_RED, target = false },
	-- bleed
	{ name = "condition", type = CONDITION_BLEEDING, interval = 2000, chance = 9, minDamage = -400, maxDamage = -600, radius = 8, effect = CONST_ME_ICEATTACK, target = false },
	{ name = "combat", interval = 2000, chance = 8, type = COMBAT_PHYSICALDAMAGE, minDamage = -250, maxDamage = -400, range = 7, radius = 6, shootEffect = CONST_ANI_LARGEROCK, effect = CONST_ME_STONES, target = true },
	{ name = "combat", interval = 2000, chance = 13, type = COMBAT_PHYSICALDAMAGE, minDamage = -200, maxDamage = -400, range = 7, radius = 4, shootEffect = CONST_ANI_WHIRLWINDCLUB, effect = CONST_ME_EXPLOSIONHIT, target = true },
	{ name = "bullwark paralyze", interval = 2000, chance = 6, target = false },
}

monster.defenses = {
	defense = 66,
	armor = 48,
	--	mitigation = ???,
	{ name = "combat", interval = 2000, chance = 1, type = COMBAT_HEALING, minDamage = 4000, maxDamage = 6000, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "speed", interval = 2000, chance = 11, effect = CONST_ME_HITAREA, speed = 300},
	{ name = "bullwark summon", interval = 2000, chance = 9, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 15 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = 5 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 15 },
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
