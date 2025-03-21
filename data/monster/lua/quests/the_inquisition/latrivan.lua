-- Version: 8.20
-- Monster: https://tibia.fandom.com/wiki/Latrivan
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Latrivan
---


local mType = Game.createMonsterType("Latrivan")
local monster = {}

monster.description = "Latrivan"
monster.experience = 10000
monster.outfit = {
	lookType = 12,
	lookHead = 118,
	lookBody = 33,
	lookLegs = 118,
	lookFeet = 91,
	lookAddons = 0,
	lookMount = 0,
}

-- todo(monster events): not yet migrated from xml to lua (or doesn't exist)
-- monster.events = {
--	"InquisitionBossDeath",
-- }

monster.health = 25000
monster.maxHealth = 25000
monster.race = "fire"
monster.corpse = 7893
monster.speed = 195
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
	rewardBoss = false,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 85,
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
	{ text = "I might reward you for killing my brother ~ with a swift death!", yell = true },
	{ text = "Colateral damage is so fun!", yell = false },
	{ text = "Golgordan you fool!", yell = false },
	{ text = "We are the brothers of fear!", yell = false },
}

monster.loot = {
    { id = "gold coin", chance = 100000, maxCount = 451 },  -- 2148
    { id = "small amethyst", chance = 16220, maxCount = 15 },  -- 2150
    { id = "small sapphire", chance = 13960, maxCount = 6 },  -- 2146
    { id = "black pearl", chance = 16220, maxCount = 3 },  -- 2144
    { id = "ring of healing", chance = 26130, maxCount = 2 },  -- 2214
    { id = "double axe", chance = 19820, maxCount = 2 },  -- 2387
    { id = "devil helmet", chance = 5860, maxCount = 2 },  -- 2462
    { id = "great health potion", chance = 36940 },  -- 7591
    { id = "silver dagger", chance = 15320 },  -- 2402
    { id = "giant sword", chance = 7210 },  -- 2393
    { id = "demonic essence", chance = 9910 },  -- 6500
    { id = "demon shield", chance = 11260 },  -- 2520
    { id = 6300, chance = 13060 },  -- death ring
    { id = "stone skin amulet", chance = 13060 },  -- 2197
    { id = "snakebite rod", chance = 4050 },  -- 2182
    { id = 2162, chance = 18920 },  -- magic light wand
    { id = "stealth ring", chance = 20270 },  -- 2165
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -1 },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_FIREDAMAGE, minDamage = 0, maxDamage = -850, length = 8, spread = 3, effect = CONST_ME_FIREAREA, target = false },
	{ name = "combat", interval = 1000, chance = 10, type = COMBAT_FIREDAMAGE, minDamage = -50, maxDamage = -250, length = 7, spread = 3, effect = CONST_ME_EXPLOSIONHIT, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_DEATHDAMAGE, minDamage = 0, maxDamage = -600, range = 4, radius = 1, shootEffect = CONST_ANI_DEATH, effect = CONST_ME_MORTAREA, target = false },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_FIREDAMAGE, minDamage = -60, maxDamage = -200, range = 7, radius = 4, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = false },
}

monster.defenses = {
	defense = 45,
	armor = 35,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 1 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 100 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -1 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 100 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)