-- Version: 10.70
-- Monster: https://tibia.fandom.com/wiki/Control_Tower
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Control_Tower
---


local mType = Game.createMonsterType("Control Tower")
local monster = {}

monster.description = "a control tower"
monster.experience = 3000
monster.outfit = {
	lookTypeEx = 23261,
}

monster.health = 7500
monster.maxHealth = 7500
monster.race = "venom"
monster.corpse = 24309
monster.speed = 0
monster.manaCost = 0

monster.changeTarget = {
	interval = 2000,
	chance = 0,
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
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = true,
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
}

monster.loot = {
	{ id = "platinum coin", chance = 74265, minCount = 1, maxCount = 5 },  -- 2152
	{ id = "great health potion", chance = 8824 },  -- 7591
	{ id = "great mana potion", chance = 8824 },  -- 7590
	{ id = "gearwheel chain", chance = 5147 },  -- 23541
	{ id = "flask of rust remover", chance = 3676 },  -- 9930
	{ id = 9690, chance = 3676 },  -- gear wheel
	{ id = "heat core", chance = 2941 },  -- 23538
	{ id = "war crystal", chance = 2941 },  -- 10571
	{ id = "metal bat", chance = 2206 },  -- 23542
	{ id = "metal spats", chance = 2206 },  -- 23540
	{ id = "iron ore", chance = 1471 },  -- 5880
	{ id = "alloy legs", chance = 735 },  -- 23539
	{ id = "bonebreaker", chance = 735 },  -- 7428
	{ id = 9976, chance = 735 },  -- crystal pedestal (red)
	{ id = "mastermind potion", chance = 735 },  -- 7440
	{ id = "steel boots", chance = 735 },  -- 2645
}

monster.defenses = {
	defense = 10,
	armor = 10,
	--	mitigation = ???,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 55 },
	{ type = COMBAT_EARTHDAMAGE, percent = 55 },
	{ type = COMBAT_FIREDAMAGE, percent = 55 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 55 },
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)