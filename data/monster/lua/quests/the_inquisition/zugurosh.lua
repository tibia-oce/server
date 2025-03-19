-- Version: 8.20
-- Monster: https://tibia.fandom.com/wiki/Zugurosh
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Zugurosh
---


local mType = Game.createMonsterType("Zugurosh")
local monster = {}

monster.description = "Zugurosh"
monster.experience = 10000
monster.outfit = {
	lookType = 12,
	lookHead = 3,
	lookBody = 18,
	lookLegs = 19,
	lookFeet = 91,
	lookAddons = 0,
	lookMount = 0,
}

monster.events = {
	"InquisitionBossDeath",
}

monster.bosstiary = {
	bossRaceId = 434,
	bossRace = RARITY_BANE,
}

monster.health = 90500
monster.maxHealth = 90500
monster.race = "fire"
monster.corpse = 7893
monster.speed = 165
monster.manaCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 15,
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
	runHealth = 4500,
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
	{ text = "You will run out of resources soon enough!", yell = false },
	{ text = "One little mistake and you're all are mine!", yell = false },
	{ text = "I sense your strength fading!", yell = false },
	{ text = "I know you will show a weakness!", yell = false },
	{ text = "Your fear will make you prone to mistakes!", yell = false },
}

monster.loot = {
	{ id = "demonic essence", chance = 100000 },  -- 6500
	{ id = "gold coin", chance = 100000, minCount = 1, maxCount = 195 },  -- 2148
	{ id = 9811, chance = 52174 },  -- rusty legs (todo: slightly rusted does not exist in items.xml)
	{ id = 9808, chance = 47826 },  -- rusty armor (todo: slightly rusted does not exist in items.xml)
	{ id = "great mana potion", chance = 25725 },  -- 7590
	{ id = "great spirit potion", chance = 25580 },  -- 8472
	{ id = "great health potion", chance = 24783 },  -- 7591
	{ id = "ultimate health potion", chance = 23913 },  -- 8473
	{ id = "platinum coin", chance = 21232, minCount = 1, maxCount = 30 },  -- 2152
	{ id = "soul orb", chance = 20725, minCount = 1, maxCount = 10 },  -- 5944
	{ id = 6104, chance = 20507 },  -- jewel case
	{ id = "gold ingot", chance = 20217 },  -- 9971
	{ id = "silver brooch", chance = 19855 },  -- 2134
	{ id = "talon", chance = 18768, minCount = 1, maxCount = 30 },  -- 2151
	{ id = "red piece of cloth", chance = 17391, minCount = 1, maxCount = 10 },  -- 5911
	{ id = "blue piece of cloth", chance = 15652, minCount = 1, maxCount = 10 },  -- 5912
	{ id = "white piece of cloth", chance = 14928, minCount = 1, maxCount = 10 },  -- 5909
	{ id = "brown piece of cloth", chance = 14275, minCount = 1, maxCount = 10 },  -- 5913
	{ id = "green piece of cloth", chance = 13913, minCount = 1, maxCount = 10 },  -- 5910
	{ id = "yellow piece of cloth", chance = 13623, minCount = 1, maxCount = 10 },  -- 5914
	{ id = "demon horn", chance = 9348, minCount = 1, maxCount = 2 },  -- 5954
	{ id = "boots of haste", chance = 8913 },  -- 2195
	{ id = "steel boots", chance = 4928 },  -- 2645
	{ id = "amulet of loss", chance = 4855 },  -- 2173
	{ id = "golden boots", chance = 1304 },  -- 2646
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -800 },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_LIFEDRAIN, minDamage = 0, maxDamage = -500, range = 4, effect = CONST_ME_MAGIC_RED, target = true },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_DEATHDAMAGE, minDamage = 0, maxDamage = -500, length = 7, spread = 3, effect = CONST_ME_MORTAREA, target = false },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_DEATHDAMAGE, minDamage = 0, maxDamage = -100, radius = 4, effect = CONST_ME_SMALLCLOUDS, target = false },
	-- fire
	{ name = "condition", type = CONDITION_FIRE, interval = 3000, chance = 20, minDamage = -10, maxDamage = -10, radius = 4, effect = CONST_ME_EXPLOSIONHIT, target = true },
	{ name = "combat", interval = 1000, chance = 13, type = COMBAT_MANADRAIN, minDamage = -60, maxDamage = -200, radius = 5, effect = CONST_ME_WATERSPLASH, target = false },
}

monster.defenses = {
	defense = 55,
	armor = 45,
	--	mitigation = ???,
	{ name = "combat", interval = 2000, chance = 50, type = COMBAT_HEALING, minDamage = 40, maxDamage = 60, effect = CONST_ME_MAGIC_GREEN, target = false },
	{ name = "combat", interval = 2000, chance = 50, type = COMBAT_HEALING, minDamage = 400, maxDamage = 600, effect = CONST_ME_MAGIC_GREEN, target = false },
	{ name = "invisible", interval = 1000, chance = 5, effect = CONST_ME_MAGIC_BLUE },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 50 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 30 },
	{ type = COMBAT_EARTHDAMAGE, percent = 30 },
	{ type = COMBAT_FIREDAMAGE, percent = 30 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 30 },
	{ type = COMBAT_HOLYDAMAGE, percent = 30 },
	{ type = COMBAT_DEATHDAMAGE, percent = 100 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)