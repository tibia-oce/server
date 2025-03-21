-- Version: 10.80
-- Monster: https://tibia.fandom.com/wiki/Feroxa
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Feroxa
---


local mType = Game.createMonsterType("Feroxa")
local monster = {}

monster.description = "Feroxa"
monster.experience = 0
monster.outfit = {
	lookType = 158,
	lookHead = 57,
	lookBody = 76,
	lookLegs = 77,
	lookFeet = 57,
	lookAddons = 0,
	lookMount = 0,
}

monster.health = 100000
monster.maxHealth = 100000
monster.race = "blood"
monster.corpse = 0
monster.speed = 175
monster.manaCost = 0

monster.changeTarget = {
	interval = 2000,
	chance = 2,
}

monster.bosstiary = {
	bossRaceId = 1149,
	bossRace = RARITY_NEMESIS,
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
	staticAttackChance = 90,
	targetDistance = 4,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false}

-- todo(monster events): not yet migrated from xml to lua (or doesn't exist)
-- monster.events = {
--	"FeroxaTransform",
-- }

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
}

monster.loot = {
	{ id = "blue gem", chance = 100000 },  -- 2158
	{ id = "great health potion", chance = 100000, maxCount = 5 },  -- 7591
	{ id = "great mana potion", chance = 100000, maxCount = 6 },  -- 7590
	{ id = "moonlight crystals", chance = 100000, maxCount = 6 },  -- 24739
	{ id = "red gem", chance = 100000 },  -- 2156
	{ id = "small diamond", chance = 100000, maxCount = 3 },  -- 2145
	{ id = "small ruby", chance = 100000, maxCount = 3 },  -- 2147
	{ id = "ultimate health potion", chance = 100000 },  -- 8473
	{ id = 24760, chance = 62500 },  -- trophy of Feroxa
	{ id = "violet crystal shard", chance = 62500 },  -- 18414
	{ id = "dreaded cleaver", chance = 25000 },  -- 7419
	{ id = "platinum coin", chance = 25000, maxCount = 10 },  -- 2152
	{ id = "red crystal fragment", chance = 25000 },  -- 18420
	{ id = "skullcracker armor", chance = 25000 },  -- 8889
	{ id = "wolf backpack", chance = 25000 },  -- 24740
	{ id = "boots of haste", chance = 12500 },  -- 2195
	{ id = "werewolf helmet", chance = 12500 },  -- 24718
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -1400, maxDamage = -1800 },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_DEATHDAMAGE, minDamage = -700, maxDamage = -1250, radius = 6, effect = CONST_ME_MORTAREA, target = false },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_MANADRAIN, minDamage = -700, maxDamage = -1250, radius = 5, effect = CONST_ME_ICETORNADO, target = true },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_EARTHDAMAGE, minDamage = -700, maxDamage = -1250, range = 6, shootEffect = CONST_ANI_ARROW, effect = CONST_ME_EXPLOSIONAREA, target = true },
}

monster.defenses = {
	defense = 55,
	armor = 50,
	{ name = "speed", interval = 2000, chance = 12, effect = CONST_ME_THUNDER, speed = 350},
	{ name = "feroxa summon", interval = 2000, chance = 20, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 30 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 30 },
	{ type = COMBAT_EARTHDAMAGE, percent = 30 },
	{ type = COMBAT_FIREDAMAGE, percent = 30 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 30 },
	{ type = COMBAT_HOLYDAMAGE, percent = 30 },
	{ type = COMBAT_DEATHDAMAGE, percent = 30 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
