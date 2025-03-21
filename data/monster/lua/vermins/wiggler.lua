-- Version: 9.60
-- Monster: https://tibia.fandom.com/wiki/Wiggler
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Wiggler
---


local mType = Game.createMonsterType("Wiggler")
local monster = {}

monster.description = "a wiggler"
monster.experience = 900
monster.outfit = {
	lookType = 510,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

-- todo(monster events): not yet migrated from xml to lua (or doesn't exist)
-- monster.events = {
--	"WigglerDeath",
-- }


monster.health = 1200
monster.maxHealth = 1200
monster.race = "venom"
monster.corpse = 16193
monster.speed = 180
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10,
}

monster.strategiesTarget = {
	nearest = 70,
	damage = 30,
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
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 359,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = true}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Zzzrp", yell = false },
	{ text = "Crick! Crick!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 100000, minCount = 1, maxCount = 100 },  -- 2148
	{ id = "crystalline arrow", chance = 15433, minCount = 1, maxCount = 5 },  -- 18304
	{ id = "drill bolt", chance = 15184, minCount = 1, maxCount = 5 },  -- 18436
	{ id = "platinum coin", chance = 14820 },  -- 2152
	{ id = "white mushroom", chance = 7189, minCount = 1, maxCount = 5 },  -- 2787
	{ id = "strong mana potion", chance = 5279 },  -- 7589
	{ id = "strong health potion", chance = 4902 },  -- 7588
	{ id = "green crystal splinter", chance = 3764 },  -- 18416
	{ id = "yellow piece of cloth", chance = 2160 },  -- 5914
	{ id = "blue piece of cloth", chance = 2051 },  -- 5912
	{ id = "green crystal fragment", chance = 2000 },  -- 18421
	{ id = "serpent sword", chance = 1406 },  -- 2409
	{ id = "black shield", chance = 1297 },  -- 2529
	{ id = "terra rod", chance = 786 },  -- 2181
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -200, condition = { type = CONDITION_POISON, totalDamage = 500, interval = 4000 } },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_EARTHDAMAGE, minDamage = -180, maxDamage = -270, length = 4, spread = 3, effect = CONST_ME_HITBYPOISON, target = false },
	-- poison
	{ name = "condition", type = CONDITION_POISON, interval = 2000, chance = 10, minDamage = -160, maxDamage = -200, range = 7, shootEffect = CONST_ANI_POISONARROW, effect = CONST_ME_SMALLPLANTS, target = false },
	{ name = "speed", interval = 2000, chance = 15, speed = -700, length = 3, spread = 2, effect = CONST_ME_HITAREA, target = false, duration = 30000 },
}

monster.defenses = {
	defense = 15,
	armor = 15,
	{ name = "speed", interval = 2000, chance = 15, effect = CONST_ME_MAGIC_RED, speed = 360},
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 5 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = -5 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 10 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
