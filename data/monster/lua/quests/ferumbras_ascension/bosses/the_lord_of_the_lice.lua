-- Version: 10.90
-- Monster: https://tibia.fandom.com/wiki/The_Lord_of_the_Lice
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:The_Lord_of_the_Lice
---


local mType = Game.createMonsterType("The Lord of the Lice")
local monster = {}

monster.description = "The Lord of the Lice"
monster.experience = 0
monster.outfit = {
	lookType = 305,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

-- todo(monster events): not yet migrated from xml to lua (or doesn't exist)
-- monster.events = {
--	"AscendantBossesDeath",
-- }


monster.health = 80000
monster.maxHealth = 80000
monster.race = "blood"
monster.corpse = 8957
monster.speed = 115
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
	{ text = "Feel the fever!", yell = false },
	{ text = "Feeling queasy? Heeheehee!", yell = false },
	{ text = "Swarm forth, minions!", yell = false },
	{ text = "Pox upon you!", yell = false },
	{ text = "Take your breath away!", yell = false },
}

monster.loot = {
    { id = "great mana potion", chance = 100000, maxCount = 10 },  -- 7590
    { id = "great spirit potion", chance = 100000, maxCount = 10 },  -- 8472
    { id = "platinum coin", chance = 100000, maxCount = 10 },  -- 2152
    { id = "ultimate health potion", chance = 100000, maxCount = 10 },  -- 8473
    { id = "life ring", chance = 75000 },  -- 2168
    { id = "small topaz", chance = 50000, maxCount = 10 },  -- 9970
    { id = "epee", chance = 25000 },  -- 2438
    { id = "small emerald", chance = 25000, maxCount = 10 },  -- 2149
    { id = "small ruby", chance = 25000, maxCount = 10 },  -- 2147
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, skill = 100, attack = 100, condition = { type = CONDITION_POISON, totalDamage = 100, interval = 4000 } },
	{ name = "combat", interval = 2000, chance = 30, type = COMBAT_EARTHDAMAGE, minDamage = -120, maxDamage = -310, range = 7, shootEffect = CONST_ANI_POISON, effect = CONST_ME_POISONAREA, target = false },
	-- poison
	{ name = "condition", type = CONDITION_POISON, interval = 2000, chance = 22, minDamage = -1000, maxDamage = -1800, length = 8, spread = 3, effect = CONST_ME_POISONAREA, target = false },
	-- poison
	{ name = "condition", type = CONDITION_POISON, interval = 2000, chance = 15, minDamage = -80, maxDamage = -80, radius = 3, effect = CONST_ME_POISONAREA, target = false },
	{ name = "combat", interval = 2000, chance = 25, type = COMBAT_LIFEDRAIN, minDamage = -300, maxDamage = -420, range = 7, radius = 7, effect = CONST_ME_MAGIC_RED, target = false },
	{ name = "mutated rat paralyze", interval = 2000, chance = 20, range = 7, target = false },
}

monster.defenses = {
	defense = 30,
	armor = 30,
	--	mitigation = ???,
	{ name = "combat", interval = 2000, chance = 9, type = COMBAT_HEALING, minDamage = 250, maxDamage = 550, effect = CONST_ME_HITBYPOISON, target = false },
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
	{ type = COMBAT_DEATHDAMAGE, percent = 100 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)