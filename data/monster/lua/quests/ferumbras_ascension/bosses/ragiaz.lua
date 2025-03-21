-- Version: 10.90
-- Monster: https://tibia.fandom.com/wiki/Ragiaz
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Ragiaz
---


local mType = Game.createMonsterType("Ragiaz")
local monster = {}

monster.description = "Ragiaz"
monster.experience = 500000
monster.outfit = {
	lookType = 862,
	lookHead = 76,
	lookBody = 57,
	lookLegs = 19,
	lookFeet = 0,
	lookAddons = 3,
	lookMount = 0,
}

-- todo(monster events): not yet migrated from xml to lua (or doesn't exist)
-- monster.events = {
--	"AscendantBossesDeath",
-- }

monster.bosstiary = {
	bossRaceId = 1180,
	bossRace = RARITY_ARCHFOE,
}

monster.health = 280000
monster.maxHealth = 280000
monster.race = "undead"
monster.corpse = 22495
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
}

monster.loot = {
	{ id = "demonic essence", chance = 0 },  -- 6500
	{ id = "gold coin", chance = 0, maxCount = 200 },  -- 2148
	{ id = "platinum coin", chance = 0, minCount = 20, maxCount = 30 },  -- 2152
	{ id = "red crystal fragment", chance = 0, maxCount = 4 },  -- 18420
	{ id = "silver token", chance = 0 },  -- 25172
	{ id = "concentrated demonic blood", chance = 0 },  -- todo: flask of demonic blood does not exist in items.xml
	{ id = "green crystal fragment", chance = 0, maxCount = 4 },  -- 18421
	{ id = "green gem", chance = 0 },  -- 2155
	{ id = "small amethyst", chance = 0, maxCount = 5 },  -- 2150
	{ id = "ultimate health potion", chance = 0, maxCount = 10 },  -- 8473
	{ id = "amber staff", chance = 0 },  -- 7426
	{ id = "cyan crystal fragment", chance = 0, maxCount = 4 },  -- 18419
	{ id = 6300, chance = 0 },  -- death ring
	{ id = 7632, chance = 0 },  -- giant shimmering pearl
	{ id = "great mana potion", chance = 0, maxCount = 5 },  -- 7590
	{ id = "great spirit potion", chance = 0, maxCount = 5 },  -- 8472
	{ id = "rift bow", chance = 0 },  -- 25522
	{ id = "rift lance", chance = 0 },  -- 25383
	{ id = "ring of healing", chance = 0 },  -- 2214
	{ id = "skull staff", chance = 0 },  -- 2436
	{ id = "small ruby", chance = 0, maxCount = 5 },  -- 2147
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -1400, maxDamage = -2300 },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_DEATHDAMAGE, minDamage = -500, maxDamage = -900, radius = 4, effect = CONST_ME_SMALLCLOUDS, target = false },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_DEATHDAMAGE, minDamage = -500, maxDamage = -900, range = 4, radius = 4, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_POFF, target = true },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_LIFEDRAIN, minDamage = -1000, maxDamage = -1200, length = 10, spread = 3, effect = CONST_ME_MAGIC_GREEN, target = false },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = -1500, maxDamage = -1900, length = 10, spread = 3, effect = CONST_ME_GROUNDSHAKER, target = false },
	{ name = "speed", interval = 2000, chance = 20, speed = -600, radius = 7, effect = CONST_ME_POFF, target = false, duration = 20000 },
}

monster.defenses = {
	defense = 125,
	armor = 125,
	--	mitigation = ???,
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_HEALING, minDamage = 1000, maxDamage = 2000, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "speed", interval = 2000, chance = 20, effect = CONST_ME_MAGIC_GREEN, speed = 340},
	{ name = "ragiaz transform", interval = 2000, chance = 8, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 90 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 50 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)