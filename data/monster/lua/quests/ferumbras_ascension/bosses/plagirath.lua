-- Version: 10.90
-- Monster: https://tibia.fandom.com/wiki/Plagirath
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Plagirath
---


local mType = Game.createMonsterType("Plagirath")
local monster = {}

monster.description = "Plagirath"
monster.experience = 500000
monster.outfit = {
	lookType = 862,
	lookHead = 84,
	lookBody = 62,
	lookLegs = 60,
	lookFeet = 79,
	lookAddons = 1,
	lookMount = 0,
}

-- todo(monster events): not yet migrated from xml to lua (or doesn't exist)
-- monster.events = {
--	"AscendantBossesDeath",
-- }

monster.bosstiary = {
	bossRaceId = 1199,
	bossRace = RARITY_ARCHFOE,
}

monster.health = 290000
monster.maxHealth = 290000
monster.race = "venom"
monster.corpse = 22495
monster.speed = 160
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
	{ text = "I CAN SENSE YOUR BODY ROTTING!", yell = true },
	{ text = "WITHER AND DIE!", yell = true },
	{ text = "COME AND RECEIVE MY GIFTS!!", yell = true },
	{ text = "DEATH AND DECAY!", yell = true },
}

monster.loot = {
	{ id = "demonic essence", chance = 100000 },  -- 6500
	{ id = "gold coin", chance = 100000, maxCount = 200 },  -- 2148
	{ id = "great spirit potion", chance = 100000, maxCount = 5 },  -- 8472
	{ id = "green gem", chance = 100000 },  -- 2155
	{ id = "platinum coin", chance = 100000, minCount = 20, maxCount = 25 },  -- 2152
	{ id = "small diamond", chance = 100000, maxCount = 5 },  -- 2145
	{ id = "cyan crystal fragment", chance = 50000, maxCount = 6 },  -- 18419
	{ id = "great mana potion", chance = 50000, maxCount = 5 },  -- 7590
	{ id = "red crystal fragment", chance = 50000, maxCount = 6 },  -- 18420
	{ id = "terra mantle", chance = 50000 },  -- 7884
	{ id = "ultimate health potion", chance = 50000, maxCount = 5 },  -- 8473
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -1300, maxDamage = -2250 },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_EARTHDAMAGE, minDamage = -500, maxDamage = -900, radius = 4, effect = CONST_ME_GREEN_RINGS, target = false },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_DEATHDAMAGE, minDamage = -500, maxDamage = -900, range = 4, radius = 4, effect = CONST_ME_POFF, target = true },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_EARTHDAMAGE, minDamage = -1000, maxDamage = -1200, length = 10, spread = 3, effect = CONST_ME_POFF, target = false },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_LIFEDRAIN, minDamage = -1500, maxDamage = -1900, length = 10, spread = 3, effect = CONST_ME_POFF, target = false },
	{ name = "speed", interval = 2000, chance = 20, speed = -600, radius = 7, effect = CONST_ME_MAGIC_GREEN, target = false, duration = 20000 },
	{ name = "plagirath bog", interval = 20000, chance = 25, target = false },
}

monster.defenses = {
	defense = 125,
	armor = 125,
	--	mitigation = ???,
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_HEALING, minDamage = 3000, maxDamage = 4000, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "speed", interval = 2000, chance = 30, effect = CONST_ME_MAGIC_RED, speed = 320},
	{ name = "plagirath summon", interval = 2000, chance = 15, target = false },
	{ name = "plagirath heal", interval = 2000, chance = 17, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -10 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = -25 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 10 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 100 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)