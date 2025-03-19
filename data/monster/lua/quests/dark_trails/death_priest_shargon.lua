-- Version: 10.50
-- Monster: https://tibia.fandom.com/wiki/Death_Priest_Shargon
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Death_Priest_Shargon
---


local mType = Game.createMonsterType("Death Priest Shargon")
local monster = {}

monster.description = "Death Priest Shargon"
monster.experience = 20000
monster.outfit = {
	lookType = 278,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 3,
	lookMount = 0,
}

monster.events = {
	"DeathPriestShargonDeath",
}

monster.bosstiary = {
	bossRaceId = 1047,
	bossRace = RARITY_BANE,
}

monster.health = 65000
monster.maxHealth = 65000
monster.race = "blood"
monster.corpse = 21123
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

monster.summon = {
	maxSummons = 2,
	summons = {
		{ name = "Lesser Death Minion", chance = 30, interval = 2000, count = 2 },
		{ name = "Superior Death Minion", chance = 30, interval = 2000, count = 2 },
		{ name = "Greater Death Minion", chance = 30, interval = 2000, count = 2 },
	},
}

monster.voices = {
	interval = 5000,
	chance = 10,
}

monster.loot = {
	{ id = "gold coin", chance = 100000, minCount = 1, maxCount = 100 },  -- 2148
	{ id = "necrotic rod", chance = 100000 },  -- 2185
	{ id = "platinum coin", chance = 100000, minCount = 1, maxCount = 15 },  -- 2152
	{ id = "great health potion", chance = 49924, minCount = 1, maxCount = 5 },  -- 7591
	{ id = "great mana potion", chance = 45344, minCount = 1, maxCount = 5 },  -- 7590
	{ id = "black skull", chance = 25191 },  -- 9969
	{ id = "gold ingot", chance = 22290 },  -- 9971
	{ id = "blood goblet", chance = 4885 },  -- 9447
	{ id = 9811, chance = 1374 },  -- rusty legs (todo: slightly rusted does not exist in items.xml)
	{ id = 9808, chance = 1069 },  -- rusty armor (todo: slightly rusted does not exist in items.xml)
	{ id = 2322, chance = 1069 },  -- voodoo doll

}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, skill = 200, attack = 150 },
	{ name = "combat", interval = 2000, chance = 12, type = COMBAT_DEATHDAMAGE, minDamage = 0, maxDamage = -660, range = 7, radius = 6, shootEffect = CONST_ANI_DEATH, effect = CONST_ME_MORTAREA, target = false },
	{ name = "combat", interval = 2000, chance = 18, type = COMBAT_HOLYDAMAGE, minDamage = -350, maxDamage = -1000, length = 6, spread = 2, effect = CONST_ME_PURPLEENERGY, target = false },
}

monster.defenses = {
	defense = 120,
	armor = 120,
	--	mitigation = ???,
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_HEALING, minDamage = 0, maxDamage = 699, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 3 },
	{ type = COMBAT_EARTHDAMAGE, percent = 60 },
	{ type = COMBAT_FIREDAMAGE, percent = 5 },
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