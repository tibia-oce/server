

local mType = Game.createMonsterType("Draken Spellweaver")
local monster = {}

monster.description = "a draken spellweaver"
monster.experience = 3100
monster.outfit = {
	lookType = 340,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 5000
monster.maxHealth = 5000
monster.race = "blood"
monster.corpse = 10399
monster.speed = 168
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
	staticAttackChance = 70,
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
	{ text = "Zzzzzooom!", yell = false },
	{ text = "Fissziss!", yell = false },
	{ text = "Kazzzzzzuuum!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 100000, maxCount = 195 },
	{ id = "meat", chance = 26940 },
	{ id = "platinum coin", chance = 23800, maxCount = 5 },
	{ id = "weaver's wandtip", chance = 18450 },
	{ id = "small ruby", chance = 6640, maxCount = 5 },
	{ id = "great mana potion", chance = 5350 },
	{ id = "draken sulphur", chance = 4610 },
	{ id = "luminous orb", chance = 2580 },
	{ id = "green gem", chance = 1290 },
	{ id = "zaoan shoes", chance = 1290 },
	{ id = "wand of inferno", chance = 1110 },
	{ id = "focus cape", chance = 740 },
	{ id = "spellweaver's robe", chance = 740 },
	{ id = "zaoan legs", chance = 550 },
	{ id = "zaoan robe", chance = 370 },
	{ id = "ring of the sky", chance = 180 },
	{ id = "bamboo leaves", chance = 180 },
	{ id = "harness", chance = 30 },
	{ id = "draken trophy", chance = 10 },
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -252 },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_FIREDAMAGE, minDamage = -240, maxDamage = -480, length = 4, spread = 3, effect = CONST_ME_EXPLOSIONHIT, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_FIREDAMAGE, minDamage = -100, maxDamage = -250, range = 7, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = true },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_ENERGYDAMAGE, minDamage = -150, maxDamage = -300, range = 7, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_ENERGYHIT, target = true },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_EARTHDAMAGE, minDamage = -200, maxDamage = -380, radius = 4, effect = CONST_ME_POFF, target = true },
	{ name = "soulfire rune", interval = 2000, chance = 10, target = false },
	-- poison
	{ name = "condition", type = CONDITION_POISON, interval = 2000, chance = 10, minDamage = -280, maxDamage = -360, shootEffect = CONST_ANI_POISON, target = true },
}

monster.defenses = {
	defense = 25,
	armor = 25,
	mitigation = 1.35,
	{ name = "invisible", interval = 2000, chance = 10, effect = CONST_ME_MAGIC_RED },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_HEALING, minDamage = 270, maxDamage = 530, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = -10 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -10 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = 100 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -10 },
	{ type = COMBAT_HOLYDAMAGE, percent = -5 },
	{ type = COMBAT_DEATHDAMAGE, percent = 80 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
