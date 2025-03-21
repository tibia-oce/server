-- Version: 8.10
-- Monster: https://tibia.fandom.com/wiki/The_Abomination
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:The_Abomination
---


local mType = Game.createMonsterType("The Abomination")
local monster = {}

monster.description = "The Abomination"
monster.experience = 1500000
monster.outfit = {
	lookType = 1393,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.bosstiary = {
	bossRaceId = 373,
	bossRace = RARITY_NEMESIS,
}

monster.health = 750000
monster.maxHealth = 750000
monster.race = "venom"
monster.corpse = 36612
monster.speed = 170
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
	{ text = "ANIHILATION!", yell = true },
	{ text = "DEATH IS INEVITABLE!", yell = true },
	{ text = "DESTRUCTION!", yell = true },
	{ text = "I AM THE ESSENCE OF DEATH!", yell = true },
	{ text = "YOU CAN NOT ESCAPE ME!", yell = true },
	{ text = "DRUIDS! ... LIKE ... DRUID FLAVOUR!", yell = true },
	{ text = "WILL EAT DRUIDS!", yell = true },
	{ text = "KNIGHTS! ... DELICIOUS KNIGHTS!", yell = true },
	{ text = "WILL EAT KNIGHTS!", yell = true },
	{ text = "PALADINS!... TASTY!", yell = true },
	{ text = "WILL EAT PALADINS!", yell = true },
	{ text = "SORCERERS! ... MUST EAT SORCERERS!", yell = true },
	{ text = "WILL EAT SORCERERS!", yell = true },
	{ text = "HUNGER ... SO ... GREAT! YOU ALL .. WILL .... DIE!!!", yell = true },
	{ text = "PAIN!", yell = true },
	{ text = "DIIIIEEEEE!", yell = true },
}

monster.loot = {
	{ id = "gold coin", chance = 0 },  -- 2148
	{ id = "crystal coin", chance = 0, maxCount = 20 },  -- 2160
	{ id = "ultimate mana potion", chance = 0, maxCount = 6 },  -- 26029
	{ id = "supreme health potion", chance = 0, maxCount = 6 },  -- 26031
	{ id = "berserk potion", chance = 0, maxCount = 10 },  -- 7439
	{ id = "mastermind potion", chance = 0, maxCount = 10 },  -- 7440
	{ id = "ultimate spirit potion", chance = 0, maxCount = 6 },  -- 26030
	{ id = "bullseye potion", chance = 0, maxCount = 10 },  -- 7443
	{ id = "brooch of embracement", chance = 0 },  -- 27341
	{ id = "giant emerald", chance = 0 },  -- 27186
	{ id = "giant ruby", chance = 0 },  -- 27187
	{ id = "gruesome fan", chance = 0 },  -- 27342
	{ id = "amber with a bug", chance = 0 },  -- 27292
	{ id = "amber with a dragonfly", chance = 0 },  -- 27293
	{ id = "diabolic skull", chance = 0 },  -- 27343
	{ id = "giant sapphire", chance = 0 },  -- 27185
	{ id = "raw watermelon tourmaline", chance = 0 },  -- 27308
	{ id = "violet gem", chance = 0 },  -- 2153
	{ id = "white gem", chance = 0 },  -- 27299
	-- { id = "fiery horseshoe", chance = 0 },  -- todo: fiery horseshoe does not exist in items.xml
	-- { id = "abomination's tail", chance = 0 },  -- todo: abomination's tail does not exist in items.xml
	-- { id = "abomination's eye", chance = 0 },  -- todo: abomination's eye does not exist in items.xml
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, skill = 90, attack = 120 },
	{ name = "speed", interval = 1000, chance = 12, speed = -800, radius = 6, effect = CONST_ME_POISONAREA, target = false, duration = 10000 },
	{ name = "combat", interval = 1000, chance = 9, type = COMBAT_EARTHDAMAGE, minDamage = -200, maxDamage = -650, radius = 4, effect = CONST_ME_POISONAREA, target = false },
	{ name = "combat", interval = 1000, chance = 11, type = COMBAT_LIFEDRAIN, minDamage = -400, maxDamage = -900, radius = 4, shootEffect = CONST_ANI_POISON, effect = CONST_ME_SOUND_GREEN, target = true },
	{ name = "combat", interval = 2000, chance = 19, type = COMBAT_PHYSICALDAMAGE, minDamage = -350, maxDamage = -850, length = 7, spread = 0, shootEffect = CONST_ANI_POISON, effect = CONST_ME_HITBYPOISON, target = false },
}

monster.defenses = {
	defense = 25,
	armor = 25,
	--	mitigation = ???,
	{ name = "combat", interval = 1000, chance = 75, type = COMBAT_HEALING, minDamage = 505, maxDamage = 605, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 50 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 50 },
	{ type = COMBAT_EARTHDAMAGE, percent = 50 },
	{ type = COMBAT_FIREDAMAGE, percent = 50 },
	{ type = COMBAT_LIFEDRAIN, percent = 100 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 50 },
	{ type = COMBAT_HOLYDAMAGE, percent = 50 },
	{ type = COMBAT_DEATHDAMAGE, percent = 50 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)