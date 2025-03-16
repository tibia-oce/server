-- Kollos (Tibia Wiki: https://tibia.fandom.com/wiki/Kollos)
-- Version: 9.40

local mType = Game.createMonsterType("Kollos")
local monster = {}

monster.description = "a kollos"
monster.experience = 2400
monster.outfit = {
	lookType = 458,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 3800
monster.maxHealth = 3800
monster.race = "venom"
monster.corpse = 13937
monster.speed = 115
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
	staticAttackChance = 95,
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
	{ text = "Kropp!", yell = false },
	{ text = "Flzlzlzlzlzlzlz!", yell = false },
}

monster.loot = {
	{ id = "small ruby", chance = 8180, maxCount = 2 },
	{ id = "gold coin", chance = 49000, maxCount = 100 },
	{ id = "gold coin", chance = 50000, maxCount = 97 },
	{ id = "platinum coin", chance = 66000, maxCount = 3 },
	{ id = 3098, chance = 3270 }, -- ring of healing
	{ id = "steel boots", chance = 130 },
	{ id = "great mana potion", chance = 8950, maxCount = 4 },
	{ id = 281, chance = 2600 }, -- giant shimmering pearl (green)
	{ id = "ultimate health potion", chance = 4000, maxCount = 3 },
	{ id = "gold ingot", chance = 5160 },
	{ id = "kollos shell", chance = 15390 },
	{ id = "compound eye", chance = 15720 },
	{ id = "calopteryx cape", chance = 360 },
	{ id = "carapace shield", chance = 310 },
	{ id = "hive scythe", chance = 700 },
	{ id = "buggy backpack", chance = 460 },
	{ id = "tarsal arrow", chance = 10210, maxCount = 5 },
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -315 },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -500, range = 7, radius = 3, shootEffect = CONST_ANI_EXPLOSION, effect = CONST_ME_EXPLOSIONHIT, target = true },
}

monster.defenses = {
	defense = 35,
	armor = 52,
	mitigation = 1.71,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 10 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = 30 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -7 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = -5 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
