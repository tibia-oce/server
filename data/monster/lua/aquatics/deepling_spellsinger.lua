-- Version: 9.40
-- Monster: https://tibia.fandom.com/wiki/Deepling_Spellsinger
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Deepling_Spellsinger
---


local mType = Game.createMonsterType("Deepling Spellsinger")
local monster = {}

monster.description = "a deepling spellsinger"
monster.experience = 1000
monster.outfit = {
	lookType = 443,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 850
monster.maxHealth = 850
monster.race = "blood"
monster.corpse = 13771
monster.speed = 95
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
	canPushItems = false,
	canPushCreatures = true,
	staticAttackChance = 60,
	targetDistance = 1,
	runHealth = 60,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = true,
	canWalkOnPoison = false}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Jey Obu giotja!!", yell = false },
	{ text = "Mmmmmoooaaaaaahaaa!!", yell = false },
}

monster.loot = {
	{ id = "platinum coin", chance = 80120 },
	{ id = "gold coin", chance = 75110, maxCount = 60 },
	{ id = "spellsinger's seal", chance = 15185 },
	{ id = "deepling filet", chance = 14995 },
	{ id = "key to the drowned library", chance = 10740 },
	{ id = "fish", chance = 3448 }, -- fish
	{ id = "small sapphire", chance = 2934 },
	{ id = "eye of a deepling", chance = 2540 },
	{ id = "life ring", chance = 2459 }, -- life ring
	{ id = "deepling staff", chance = 2020 },
	{ id = "necklace of the deep", chance = 790 },
	{ id = "fish fin", chance = 520 },
	{ id = "ornate crossbow", chance = 220 },
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -152, effect = CONST_ME_DRAWBLOOD },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_ICEDAMAGE, minDamage = -180, maxDamage = -350, length = 10, spread = 3, effect = CONST_ME_ICETORNADO, target = false },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_DROWNDAMAGE, minDamage = -90, maxDamage = -130, radius = 4, effect = CONST_ME_BUBBLES, target = true },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_LIFEDRAIN, minDamage = -60, maxDamage = -140, range = 7, effect = CONST_ME_SMALLPLANTS, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_MANADRAIN, minDamage = -60, maxDamage = -140, range = 7, effect = CONST_ME_SMALLPLANTS, target = false },
	{ name = "deepling spellsinger skill reducer", interval = 2000, chance = 5, range = 5, target = false },
}

monster.defenses = {
	defense = 25,
	armor = 42,
	mitigation = 1.29,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -10 },
	{ type = COMBAT_EARTHDAMAGE, percent = -10 },
	{ type = COMBAT_FIREDAMAGE, percent = 100 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 100 },
	{ type = COMBAT_ICEDAMAGE, percent = 100 },
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