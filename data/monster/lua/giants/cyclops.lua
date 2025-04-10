-- Version: 2.0
-- Monster: https://tibia.fandom.com/wiki/Cyclops
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Cyclops
---


local mType = Game.createMonsterType("Cyclops")
local monster = {}

monster.description = "a cyclops"
monster.experience = 150
monster.outfit = {
	lookType = 22,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 260
monster.maxHealth = 260
monster.race = "blood"
monster.corpse = 5962
monster.speed = 95
monster.manaCost = 490

monster.changeTarget = {
	interval = 4000,
	chance = 10,
}

monster.strategiesTarget = {
	nearest = 70,
	damage = 30,
}

monster.flags = {
	summonable = true,
	attackable = true,
	hostile = true,
	convinceable = true,
	pushable = false,
	rewardBoss = false,
	illusionable = true,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Human, uh whil dyh!", yell = false },
	{ text = "Youh ah trak!", yell = false },
	{ text = "Let da mashing begin!", yell = false },
	{ text = "Toks utat.", yell = false },
	{ text = "Il lorstok human!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 82083, minCount = 1, maxCount = 47 },  -- 2148
	{ id = "meat", chance = 30071 },  -- 2666
	{ id = "short sword", chance = 7996 },  -- 2406
	{ id = "cyclops toe", chance = 5035 },  -- 10574
	{ id = "plate shield", chance = 2625 },  -- 2510
	{ id = "battle shield", chance = 1434 },  -- 2513
	{ id = 2381, chance = 991 },  -- halberd
	{ id = "dark helmet", chance = 205 },  -- 2490
	{ id = "health potion", chance = 203 },  -- 7618
	{ id = "wolf tooth chain", chance = 200 },  -- 2129
	{ id = "club ring", chance = 91 },  -- 2209
	{ id = 7398, chance = 86 },  -- cyclops trophy
	-- { id = "heavy old tome", chance = 21 },  -- todo: heavy old tome does not exist in items.xml
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -105 },
}

monster.defenses = {
	defense = 20,
	armor = 17,
	mitigation = 0.62,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 25 },
	{ type = COMBAT_EARTHDAMAGE, percent = -10 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 20 },
	{ type = COMBAT_DEATHDAMAGE, percent = -10 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = false },
	{ type = "bleed", condition = false },
}

mType:register(monster)