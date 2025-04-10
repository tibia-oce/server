-- Version: 7.4
-- Monster: https://tibia.fandom.com/wiki/Efreet
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Efreet
---


local mType = Game.createMonsterType("Efreet")
local monster = {}

monster.description = "an efreet"
monster.experience = 410
monster.outfit = {
	lookType = 103,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 550
monster.maxHealth = 550
monster.race = "blood"
monster.corpse = 6032
monster.speed = 117
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
	canPushCreatures = false,
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

monster.summon = {
	maxSummons = 2,
	summons = {
		{ name = "green djinn", chance = 10, interval = 2000, count = 2 },
	},
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "I grant you a deathwish!", yell = false },
	{ text = "I wish you a merry trip to hell!", yell = false },
	{ text = "Good wishes are for fairytales", yell = false },
	{ text = "Muhahahaha!", yell = false },
	{ text = "Tell me your last wish!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 97474, minCount = 1, maxCount = 129 },  -- 2148
	{ id = "royal spear", chance = 14880, minCount = 1, maxCount = 3 },  -- 7378
	{ id = "strong mana potion", chance = 10324 },  -- 7589
	{ id = "pear", chance = 9798, minCount = 1, maxCount = 5 },  -- 2673
	{ id = "jewelled belt", chance = 7710 },  -- 12426
	{ id = "small emerald", chance = 7155 },  -- 2149
	{ id = "heavy machete", chance = 4819 },  -- 2442
	{ id = "green piece of cloth", chance = 2614 },  -- 5910
	{ id = 1860, chance = 2190 },  -- green tapestry
	{ id = "noble turban", chance = 1022 },  -- 12442
	{ id = "magma monocle", chance = 423 },  -- 7900
	{ id = "wand of inferno", chance = 380 },  -- 2187
	{ id = "small oil lamp", chance = 204 },  -- 2063
	{ id = "mystic turban", chance = 190 },  -- 2663
	{ id = "green gem", chance = 102 },  -- 2155
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -110 },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_FIREDAMAGE, minDamage = -40, maxDamage = -110, range = 7, shootEffect = CONST_ANI_FIRE, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_ENERGYDAMAGE, minDamage = -30, maxDamage = -90, radius = 3, effect = CONST_ME_ENERGYHIT, target = false },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_ENERGYDAMAGE, minDamage = -65, maxDamage = -120, range = 7, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_ENERGYHIT, target = false },
	{ name = "speed", interval = 2000, chance = 15, speed = -650, range = 7, effect = CONST_ME_MAGIC_RED, target = false, duration = 15000 },
	{ name = "drunk", interval = 2000, chance = 10, range = 7, shootEffect = CONST_ANI_ENERGY, target = false, duration = 6000 },
	{ name = "outfit", interval = 2000, chance = 1, range = 7, effect = CONST_ME_MAGIC_BLUE, target = false, duration = 4000, outfitMonster = "rat" },
	{ name = "djinn electrify", interval = 2000, chance = 15, range = 5, target = false },
}

monster.defenses = {
	defense = 20,
	armor = 24,
	mitigation = 0.91,
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_HEALING, minDamage = 50, maxDamage = 80, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 60 },
	{ type = COMBAT_EARTHDAMAGE, percent = 10 },
	{ type = COMBAT_FIREDAMAGE, percent = 90 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -5 },
	{ type = COMBAT_HOLYDAMAGE, percent = -8 },
	{ type = COMBAT_DEATHDAMAGE, percent = 20 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)