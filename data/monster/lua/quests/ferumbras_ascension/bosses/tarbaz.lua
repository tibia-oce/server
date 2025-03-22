-- Version: 10.90
-- Monster: https://tibia.fandom.com/wiki/Tarbaz
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Tarbaz
---


local mType = Game.createMonsterType("Tarbaz")
local monster = {}

monster.description = "Tarbaz"
monster.experience = 500000
monster.outfit = {
	lookType = 842,
	lookHead = 0,
	lookBody = 21,
	lookLegs = 19,
	lookFeet = 3,
	lookAddons = 2,
	lookMount = 0,
}

-- todo(monster events): not yet migrated from xml to lua (or doesn't exist)
-- monster.events = {
--	"AscendantBossesDeath",
-- }

monster.health = 290000
monster.maxHealth = 290000
monster.race = "undead"
monster.corpse = 22495
monster.speed = 160
monster.manaCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 8,
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
	{ text = "You are a failure.", yell = false },
}

monster.loot = {
    { id = "concentrated demonic blood", chance = 100000 },  -- todo: flask of demonic blood does not exist in items.xml
    { id = "gold coin", chance = 100000, maxCount = 200 },  -- 2148
    { id = "green crystal shard", chance = 100000, maxCount = 3 },  -- 18415
    { id = "platinum coin", chance = 100000, minCount = 20, maxCount = 30 },  -- 2152
    { id = "silver token", chance = 100000 },  -- 25172
    { id = "small topaz", chance = 100000, maxCount = 5 },  -- 9970
    { id = "ultimate health potion", chance = 100000, maxCount = 5 },  -- 8473
    { id = "chaos mace", chance = 66667 },  -- 7427
    { id = "demonic essence", chance = 66667 },  -- 6500
    { id = "energy ring", chance = 66667 },  -- 2167
    { id = "great mana potion", chance = 66667, maxCount = 5 },  -- 7590
    { id = "rift shield", chance = 66667 },  -- 25382
    { id = "yellow gem", chance = 66667 },  -- 2154
    { id = "blue crystal shard", chance = 33333, maxCount = 3 },  -- 18413
    { id = "great spirit potion", chance = 33333, maxCount = 5 },  -- 8472
    { id = "green gem", chance = 33333 },  -- 2155
    { id = "underworld rod", chance = 33333 },  -- 8910
    { id = "violet crystal shard", chance = 33333, maxCount = 3 },  -- 18414
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -1000, maxDamage = -2000 },
	{ name = "combat", interval = 3000, chance = 20, type = COMBAT_FIREDAMAGE, minDamage = -500, maxDamage = -1000, length = 10, spread = 3, effect = CONST_ME_HITBYFIRE, target = false },
	{ name = "speed", interval = 2000, chance = 25, speed = -600, radius = 7, effect = CONST_ME_MAGIC_RED, target = false, duration = 15000 },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_FIREDAMAGE, minDamage = -300, maxDamage = -700, radius = 5, effect = CONST_ME_HITBYFIRE, target = false },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_DEATHDAMAGE, minDamage = -500, maxDamage = -800, length = 10, spread = 3, effect = CONST_ME_EXPLOSIONHIT, target = false },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_FIREDAMAGE, minDamage = -500, maxDamage = -800, length = 8, spread = 3, effect = CONST_ME_FIREATTACK, target = false },
}

monster.defenses = {
	defense = 120,
	armor = 100,
	--	mitigation = ???,
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_HEALING, minDamage = 900, maxDamage = 3500, effect = CONST_ME_MAGIC_GREEN, target = false },
	{ name = "speed", interval = 3000, chance = 30, effect = CONST_ME_MAGIC_RED, speed = 320},
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)