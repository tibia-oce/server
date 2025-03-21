-- Version: 9.40
-- Monster: https://tibia.fandom.com/wiki/Nomad_(Blue)
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Nomad_(Basic)
---


local mType = Game.createMonsterType("Nomad Blue")
local monster = {}

monster.name = "Nomad"
monster.description = "a nomad"
monster.experience = 60
monster.outfit = {
	lookType = 146,
	lookHead = 104,
	lookBody = 48,
	lookLegs = 49,
	lookFeet = 3,
	lookAddons = 3,
	lookMount = 0,
}

-- todo(monster events): not yet migrated from xml to lua (or doesn't exist)
-- monster.events = {
--	"NomadDeath",
-- }


monster.health = 160
monster.maxHealth = 160
monster.race = "blood"
monster.corpse = 18322
monster.speed = 95
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10,
}

monster.strategiesTarget = {
	nearest = 100,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = true,
	rewardBoss = false,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 15,
	healthHidden = false,
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
	{ text = "I will leave your remains to the vultures!", yell = false },
	{ text = "We are the true sons of the desert!", yell = false },
	{ text = "We are swift as the wind of the desert!", yell = false },
	{ text = "Your riches will be mine!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 56162, minCount = 1, maxCount = 40 },  -- 2148
	{ id = "rope belt", chance = 6438 },  -- 12448
	{ id = "potato", chance = 4723, minCount = 1, maxCount = 3 },  -- 8838
	{ id = "axe", chance = 2823 },  -- 2386
	{ id = "brass armor", chance = 2499 },  -- 2465
	{ id = "dirty turban", chance = 2036 },  -- 12412
	{ id = "mace", chance = 2016 },  -- 2398
	{ id = "steel shield", chance = 967 },  -- 2509
	{ id = "iron helmet", chance = 588 },  -- 2459
	{ id = "nomad parchment", chance = 206 },  -- 8267
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -80 },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_PHYSICALDAMAGE, effect = CONST_ME_SOUND_WHITE, target = false },
}

monster.defenses = {
	defense = 15,
	armor = 15,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = -10 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 20 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -10 },
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