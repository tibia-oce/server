-- Version: 5.1
-- Monster: https://tibia.fandom.com/wiki/Necromancer
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Necromancer
---


local mType = Game.createMonsterType("Necromancer")
local monster = {}

monster.description = "a necromancer"
monster.experience = 580
monster.outfit = {
	lookType = 9,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 580
monster.maxHealth = 580
monster.race = "blood"
monster.corpse = 20455
monster.speed = 94
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
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 4,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = true}

monster.light = {
	level = 0,
	color = 0,
}

monster.summon = {
	maxSummons = 3,
	summons = {
		{ name = "Ghoul", chance = 15, interval = 2000, count = 1 },
		{ name = "Ghost", chance = 5, interval = 2000, count = 1 },
		{ name = "Mummy", chance = 5, interval = 2000, count = 1 },
	},
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Taste the sweetness of death!", yell = false },
	{ text = "Your corpse will be mine.", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 30040, minCount = 1, maxCount = 90 },  -- 2148
	{ id = "poison arrow", chance = 14913, minCount = 1, maxCount = 5 },  -- 2545
	{ id = "book of necromantic rituals", chance = 10006 },  -- 11237
	{ id = "green mushroom", chance = 1498 },  -- 2796
	{ id = "necromantic robe", chance = 1036 },  -- 12431
	{ id = "mystic turban", chance = 496 },  -- 2663
	{ id = "clerical mace", chance = 373 },  -- 2423
	{ id = "strong mana potion", chance = 335 },  -- 7589
	{ id = "boots of haste", chance = 200 },  -- 2195
	{ id = "skull staff", chance = 102 },  -- 2436
	{ id = "spellbook of warding", chance = 102 },  -- 8901
	{ id = "noble axe", chance = 7 },  -- 7456
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -80, condition = { type = CONDITION_POISON, totalDamage = 160, interval = 4000 } },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_DEATHDAMAGE, minDamage = -60, maxDamage = -120, range = 1, shootEffect = CONST_ANI_DEATH, effect = CONST_ME_SMALLCLOUDS, target = true },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_EARTHDAMAGE, minDamage = -65, maxDamage = -120, range = 7, shootEffect = CONST_ANI_POISON, effect = CONST_ME_POISONAREA, target = false },
}

monster.defenses = {
	defense = 25,
	armor = 50,
	mitigation = 1.04,
	{ name = "combat", interval = 2000, chance = 25, type = COMBAT_HEALING, minDamage = 50, maxDamage = 80, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = -5 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 20 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = -5 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 100 },
	{ type = COMBAT_ICEDAMAGE, percent = 10 },
	{ type = COMBAT_HOLYDAMAGE, percent = -5 },
	{ type = COMBAT_DEATHDAMAGE, percent = 50 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
