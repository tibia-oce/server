-- Version: 7.5
-- Monster: https://tibia.fandom.com/wiki/Demodras
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Demodras
---


local mType = Game.createMonsterType("Demodras")
local monster = {}

monster.description = "Demodras"
monster.experience = 6000
monster.outfit = {
	lookType = 204,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.health = 4500
monster.maxHealth = 4500
monster.race = "blood"
monster.corpse = 5984
monster.speed = 197
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
	runHealth = 300,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true}

monster.light = {
	level = 0,
	color = 0,
}

monster.summon = {
	maxSummons = 2,
	summons = {
		{ name = "Dragon", chance = 17, interval = 1000, count = 2 },
	},
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "I WILL SET THE WORLD ON FIRE!", yell = true },
	{ text = "I WILL PROTECT MY BROOD!", yell = true },
}

monster.loot = {
	{ id = 5919, chance = 100000 },  -- dragon claw
	{ id = "platinum coin", chance = 99145, minCount = 1, maxCount = 10 },  -- 2152
	{ id = "dragon ham", chance = 75214 },  -- 2672
	{ id = "green mushroom", chance = 25641, minCount = 1, maxCount = 7 },  -- 2796
	{ id = 2547, chance = 19658, minCount = 1, maxCount = 10 },  -- power bolt
	{ id = "red dragon leather", chance = 13675 },  -- 5948
	{ id = "small sapphire", chance = 11966 },  -- 2146
	{ id = 1976, chance = 10256 },  -- book (gemmed)
	{ id = "energy ring", chance = 10256 },  -- 2167
	{ id = "great health potion", chance = 9402 },  -- 7591
	{ id = "great mana potion", chance = 9402 },  -- 7590
	{ id = "golden mug", chance = 5983 },  -- 2033
	{ id = "onyx arrow", chance = 4274, minCount = 2, maxCount = 5 },  -- 7365
	{ id = "dragon scale mail", chance = 1709 },  -- 2492
	{ id = "fire sword", chance = 1709 },  -- 2392
	{ id = "life crystal", chance = 855 },  -- 2177
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -160, maxDamage = -600 },
	{ name = "combat", interval = 3000, chance = 20, type = COMBAT_FIREDAMAGE, minDamage = -250, maxDamage = -350, range = 7, radius = 4, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = true },
	{ name = "firefield", interval = 1000, chance = 10, range = 7, radius = 6, shootEffect = CONST_ANI_FIRE, target = true },
	{ name = "combat", interval = 4000, chance = 20, type = COMBAT_FIREDAMAGE, minDamage = -250, maxDamage = -550, length = 8, spread = 3, effect = CONST_ME_FIREAREA, target = false },
}

monster.defenses = {
	defense = 25,
	armor = 45,
	mitigation = 1.99,
	{ name = "combat", interval = 1000, chance = 25, type = COMBAT_HEALING, minDamage = 400, maxDamage = 700, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 100 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)