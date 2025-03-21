-- Version: 8.20
-- Monster: https://tibia.fandom.com/wiki/Madareth
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Madareth
---


local mType = Game.createMonsterType("Madareth")
local monster = {}

monster.description = "Madareth"
monster.experience = 10000
monster.outfit = {
	lookType = 12,
	lookHead = 77,
	lookBody = 78,
	lookLegs = 80,
	lookFeet = 79,
	lookAddons = 0,
	lookMount = 0,
}

-- todo(monster events): not yet migrated from xml to lua (or doesn't exist)
-- monster.events = {
--	"InquisitionBossDeath",
-- }


monster.health = 75000
monster.maxHealth = 75000
monster.race = "fire"
monster.corpse = 7893
monster.speed = 165
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
	runHealth = 1200,
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
	{ text = "I am going to play with yourself!", yell = false },
	{ text = "Feel my wrath!", yell = false },
	{ text = "No one matches my battle prowess!", yell = false },
	{ text = "You will all die!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 100000, minCount = 3, maxCount = 100 },  -- 2148
	{ id = 9811, chance = 59322 },  -- rusty legs (todo: slightly rusted does not exist in items.xml)
	{ id = 9808, chance = 40678 },  -- rusty armor (todo: slightly rusted does not exist in items.xml)
	{ id = "bullseye potion", chance = 35593 },  -- 7443
	{ id = "great health potion", chance = 30508 },  -- 7591
	{ id = "berserk potion", chance = 27119 },  -- 7439
	{ id = "great spirit potion", chance = 27119 },  -- 8472
	{ id = "mastermind potion", chance = 27119 },  -- 7440
	{ id = "great mana potion", chance = 22034 },  -- 7590
	{ id = 6300, chance = 20339 },  -- death ring
	{ id = "platinum coin", chance = 20339, minCount = 1, maxCount = 26 },  -- 2152
	{ id = "springsprout rod", chance = 20339 },  -- 8912
	{ id = "ultimate health potion", chance = 20339 },  -- 8473
	{ id = "two handed sword", chance = 16949 },  -- 2377
	{ id = "assassin dagger", chance = 15254 },  -- 7404
	{ id = "axe ring", chance = 15254 },  -- 2208
	{ id = "hailstorm rod", chance = 15254 },  -- 2183
	{ id = 2072, chance = 15254 },  -- lute
	{ id = "underworld rod", chance = 15254 },  -- 8910
	{ id = "wand of inferno", chance = 15254 },  -- 2187
	{ id = "nightmare blade", chance = 13559 },  -- 7418
	{ id = "bloody edge", chance = 11864 },  -- 7416
	{ id = "club ring", chance = 11864 },  -- 2209
	{ id = "haunted blade", chance = 11864 },  -- 7407
	{ id = 2071, chance = 11864 },  -- lyre
	{ id = "ring of healing", chance = 11864 },  -- 2214
	{ id = 2169, chance = 11864 },  -- time ring
	{ id = "wand of voodoo", chance = 11864 },  -- 8922
	{ id = "war horn", chance = 11864 },  -- 2079
	{ id = "crystal sword", chance = 10169 },  -- 7449
	{ id = "demon horn", chance = 10169, minCount = 1, maxCount = 2 },  -- 5954
	{ id = "demonic essence", chance = 10169 },  -- 6500
	{ id = "life ring", chance = 10169 },  -- 2168
	{ id = "war drum", chance = 10169 },  -- 3953
	{ id = "didgeridoo", chance = 8475 },  -- 3952
	{ id = "mercenary sword", chance = 8475 },  -- 7386
	{ id = "relic sword", chance = 6780 },  -- 7383
	{ id = "wand of starstorm", chance = 6780 },  -- 8920
	{ id = "ice rapier", chance = 5085 },  -- 2396
	{ id = 2070, chance = 5085 },  -- wooden flute
	{ id = "dwarven ring", chance = 3390 },  -- 2213
	{ id = "sword ring", chance = 3390 },  -- 2207
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -2000 },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_ENERGYDAMAGE, minDamage = -180, maxDamage = -660, radius = 4, effect = CONST_ME_PURPLEENERGY, target = true },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_DEATHDAMAGE, minDamage = -600, maxDamage = -850, length = 5, spread = 2, effect = CONST_ME_BLACKSMOKE, target = false },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_MANADRAIN, minDamage = 0, maxDamage = -200, radius = 4, effect = CONST_ME_MAGIC_RED, target = true },
	{ name = "combat", interval = 2000, chance = 5, type = COMBAT_MANADRAIN, minDamage = 0, maxDamage = -250, radius = 5, effect = CONST_ME_MAGIC_RED, target = true },
}

monster.defenses = {
	defense = 46,
	armor = 48,
	--	mitigation = ???,
	{ name = "combat", interval = 3000, chance = 14, type = COMBAT_HEALING, minDamage = 400, maxDamage = 900, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 99 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = -1 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 1 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 95 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)