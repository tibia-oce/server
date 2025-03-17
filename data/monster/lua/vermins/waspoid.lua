-- Version: 9.40
-- Monster: https://tibia.fandom.com/wiki/Waspoid
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Waspoid
---


local mType = Game.createMonsterType("Waspoid")
local monster = {}

monster.description = "a Waspoid"
monster.experience = 830
monster.outfit = {
	lookType = 462,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 1100
monster.maxHealth = 1100
monster.race = "venom"
monster.corpse = 13983
monster.speed = 155
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
	pushable = false,
	rewardBoss = false,
	illusionable = true,
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 95,
	targetDistance = 1,
	runHealth = 0,
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
	{ text = "Peeex!", yell = false },
	{ text = "Bzzzzzzzrrrrzzzzzzrrrrr!", yell = false },
}

monster.loot = {
	{ id = "emerald bangle", chance = 2040 },
	{ id = "black pearl", chance = 4230 },
	{ id = "gold coin", chance = 40000, maxCount = 100 },
	{ id = "gold coin", chance = 50000, maxCount = 35 },
	{ id = "platinum coin", chance = 40430 },
	{ id = "yellow gem", chance = 1040 },
	{ id = "waspoid claw", chance = 9096 },
	{ id = "waspoid wing", chance = 13890 },
	{ id = "compound eye", chance = 6060 },
	{ id = "grasshopper legs", chance = 230 },
	{ id = "carapace shield", chance = 120 },
	{ id = "hive scythe", chance = 330 },
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -248, condition = { type = CONDITION_POISON, totalDamage = 400, interval = 4000 } },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_EARTHDAMAGE, minDamage = -110, maxDamage = -180, radius = 3, effect = CONST_ME_POISONAREA, target = true },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_EARTHDAMAGE, minDamage = -80, maxDamage = -100, range = 7, shootEffect = CONST_ANI_POISON, target = false },
}

monster.defenses = {
	defense = 25,
	armor = 36,
	mitigation = 1.54,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = -2 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 25 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = -10 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = -7 },
	{ type = COMBAT_DEATHDAMAGE, percent = 5 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
