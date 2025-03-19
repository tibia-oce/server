-- Version: 8.20
-- Monster: https://tibia.fandom.com/wiki/Annihilon
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Annihilon
---


local mType = Game.createMonsterType("Annihilon")
local monster = {}

monster.description = "Annihilon"
monster.experience = 15000
monster.outfit = {
	lookType = 12,
	lookHead = 3,
	lookBody = 9,
	lookLegs = 77,
	lookFeet = 77,
	lookAddons = 0,
	lookMount = 0,
}

monster.events = {
	"InquisitionBossDeath",
}

monster.bosstiary = {
	bossRaceId = 418,
	bossRace = RARITY_BANE,
}

monster.health = 46500
monster.maxHealth = 46500
monster.race = "fire"
monster.corpse = 6068
monster.speed = 66
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
	{ text = "Flee as long as you can!", yell = false },
	{ text = "Annihilon's might will crush you all!", yell = false },
	{ text = "I am coming for you!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 100000, minCount = 1, maxCount = 100 },  -- 2148
	{ id = 9808, chance = 62598 },  -- rusty armor (todo: slightly rusted does not exist in items.xml)
	{ id = 7632, chance = 37795, minCount = 1, maxCount = 2 },  -- giant shimmering pearl
	{ id = "heavy mace", chance = 27953 },  -- 2452
	{ id = "assassin star", chance = 23228, minCount = 1, maxCount = 50 },  -- 7368
	{ id = "guardian halberd", chance = 22835 },  -- 2427
	{ id = "blue gem", chance = 22441 },  -- 2158
	{ id = "yellow gem", chance = 22441 },  -- 2154
	{ id = "emerald bangle", chance = 21654 },  -- 2127
	{ id = "gold ingot", chance = 20866 },  -- 9971
	{ id = "infernal bolt", chance = 20866, minCount = 1, maxCount = 50 },  -- 6529
	{ id = "power bolt", chance = 20472, minCount = 3, maxCount = 99 },  -- 2547
	{ id = "red gem", chance = 20472 },  -- 2156
	{ id = "berserk potion", chance = 20079 },  -- 7439
	{ id = 2381, chance = 19685 },  -- halberd
	{ id = "soul orb", chance = 19685, minCount = 1, maxCount = 5 },  -- 5944
	{ id = "platinum coin", chance = 19291, minCount = 1, maxCount = 30 },  -- 2152
	{ id = "flaming arrow", chance = 18898, minCount = 4, maxCount = 96 },  -- 7840
	{ id = "green gem", chance = 17323 },  -- 2155
	{ id = "violet gem", chance = 17323 },  -- 2153
	{ id = "viper star", chance = 16535, minCount = 2, maxCount = 70 },  -- 7366
	{ id = "mastermind potion", chance = 14961 },  -- 7440
	{ id = "great health potion", chance = 14567 },  -- 7591
	{ id = "onyx flail", chance = 13780 },  -- 7421
	{ id = "great mana potion", chance = 13386 },  -- 7590
	{ id = "ultimate health potion", chance = 13386 },  -- 8473
	{ id = "crown shield", chance = 12598 },  -- 2519
	{ id = "great spirit potion", chance = 12205 },  -- 8472
	{ id = "demon horn", chance = 11811, minCount = 1, maxCount = 2 },  -- 5954
	{ id = "paladin armor", chance = 10236 },  -- 8891
	{ id = "tower shield", chance = 10236 },  -- 2528
	{ id = "guardian shield", chance = 8661 },  -- 2515
	{ id = "diamond sceptre", chance = 7087 },  -- 7387
	{ id = "demon shield", chance = 3937 },  -- 2520
	{ id = "mastermind shield", chance = 3543 },  -- 2514
	{ id = "demonbone", chance = 1575 },  -- 7431
	{ id = "lavos armor", chance = 1181 },  -- 8877
	{ id = "obsidian truncheon", chance = 1181 },  -- 8928
	{ id = "the stomper", chance = 787 },  -- 8929
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -1707 },
	{ name = "combat", interval = 1000, chance = 11, type = COMBAT_DEATHDAMAGE, minDamage = 0, maxDamage = -600, length = 8, spread = 3, effect = CONST_ME_MORTAREA, target = false },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_DEATHDAMAGE, minDamage = -200, maxDamage = -700, radius = 4, effect = CONST_ME_ICEAREA, target = false },
	{ name = "combat", interval = 3000, chance = 18, type = COMBAT_PHYSICALDAMAGE, minDamage = -50, maxDamage = -255, radius = 5, effect = CONST_ME_GROUNDSHAKER, target = true },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_FIREDAMAGE, minDamage = -50, maxDamage = -600, radius = 6, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = true },
}

monster.defenses = {
	defense = 55,
	armor = 60,
	--	mitigation = ???,
	{ name = "combat", interval = 1000, chance = 14, type = COMBAT_HEALING, minDamage = 400, maxDamage = 900, effect = CONST_ME_MAGIC_GREEN, target = false },
	{ name = "speed", interval = 1000, chance = 4, effect = CONST_ME_MAGIC_BLUE, speed = 132},
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 95 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 20 },
	{ type = COMBAT_HOLYDAMAGE, percent = -5 },
	{ type = COMBAT_DEATHDAMAGE, percent = 95 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)