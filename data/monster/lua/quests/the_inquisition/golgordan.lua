-- Version: 8.20
-- Monster: https://tibia.fandom.com/wiki/Golgordan
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Golgordan
---


local mType = Game.createMonsterType("Golgordan")
local monster = {}

monster.description = "Golgordan"
monster.experience = 10000
monster.outfit = {
	lookType = 12,
	lookHead = 52,
	lookBody = 99,
	lookLegs = 52,
	lookFeet = 91,
	lookAddons = 0,
	lookMount = 0,
}

-- todo(monster events): not yet migrated from xml to lua (or doesn't exist)
-- monster.events = {
--	"InquisitionBossDeath",
-- }


monster.health = 40000
monster.maxHealth = 40000
monster.race = "fire"
monster.corpse = 7893
monster.speed = 195
monster.manaCost = 0

monster.changeTarget = {
	interval = 7000,
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
	staticAttackChance = 85,
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
	{ text = "Latrivan, you fool!", yell = false },
	{ text = "We are the right hand and the left hand of the seven!", yell = false },
}

monster.loot = {
    { id = "gold coin", chance = 100000, maxCount = 583 },  -- 2148
    { id = "white pearl", chance = 8180, maxCount = 20 },  -- 2143
    { id = "small diamond", chance = 7730, maxCount = 3 },  -- 2145
    { id = "ring of healing", chance = 27730, maxCount = 2 },  -- 2214
    { id = "gold ring", chance = 18180, maxCount = 2 },  -- 2179
    { id = "silver amulet", chance = 14550, maxCount = 2 },  -- 2170
    { id = 2162, chance = 25450, maxCount = 2 },  -- magic light wand
    { id = "great health potion", chance = 36820 },  -- 7591
    { id = "demon shield", chance = 7730 },  -- 2520
    { id = "fire axe", chance = 9550 },  -- 2432
    { id = "protection amulet", chance = 5910 },  -- 2200
    { id = "small sapphire", chance = 16360 },  -- 2146
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -500 },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_FIREDAMAGE, minDamage = -60, maxDamage = -200, range = 7, radius = 4, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = false },
	-- poison
	{ name = "condition", type = CONDITION_POISON, interval = 1000, chance = 11, minDamage = -30, maxDamage = -30, length = 5, spread = 3, effect = CONST_ME_POISONAREA, target = false },
	{ name = "combat", interval = 3000, chance = 15, type = COMBAT_DEATHDAMAGE, minDamage = -50, maxDamage = -600, length = 8, spread = 3, effect = CONST_ME_MORTAREA, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_DEATHDAMAGE, minDamage = 0, maxDamage = -600, range = 4, radius = 1, shootEffect = CONST_ANI_DEATH, effect = CONST_ME_MORTAREA, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_FIREDAMAGE, minDamage = 0, maxDamage = -600, length = 8, spread = 3, effect = CONST_ME_FIREAREA, target = false },
	{ name = "combat", interval = 1000, chance = 8, type = COMBAT_PHYSICALDAMAGE, minDamage = -50, maxDamage = -60, radius = 6, effect = CONST_ME_GROUNDSHAKER, target = false },
}

monster.defenses = {
	defense = 54,
	armor = 48,
	--	mitigation = ???,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 1 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = -1 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -1 },
	{ type = COMBAT_HOLYDAMAGE, percent = 1 },
	{ type = COMBAT_DEATHDAMAGE, percent = 100 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)