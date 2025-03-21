-- Version: 6.2
-- Monster: https://tibia.fandom.com/wiki/Elf_Scout
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Elf_Scout
---


local mType = Game.createMonsterType("Elf Scout")
local monster = {}

monster.description = "an elf scout"
monster.experience = 75
monster.outfit = {
	lookType = 64,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 160
monster.maxHealth = 160
monster.race = "blood"
monster.corpse = 6012
monster.speed = 110
monster.manaCost = 360

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
	convinceable = true,
	pushable = false,
	rewardBoss = false,
	illusionable = true,
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 4,
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
	{ text = "Tha'shi Ab'Dendriel!", yell = false },
	{ text = "Evicor guide my arrow!", yell = false },
	{ text = "Your existence will end here!", yell = false },
	{ text = "Feel the sting of my arrows!", yell = false },
	{ text = "Thy blood will quench the soil's thirst!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 75214, minCount = 1, maxCount = 25 },  -- 2148
	{ id = 2544, chance = 30287, minCount = 1, maxCount = 12 },  -- arrow
	{ id = "grapes", chance = 17854 },  -- 2681
	{ id = "poison arrow", chance = 15091, minCount = 1, maxCount = 4 },  -- 2545
	{ id = "elven scouting glass", chance = 10109 },  -- 12420
	{ id = "elvish talisman", chance = 5130 },  -- 10552
	{ id = "bow", chance = 4023 },  -- 2456
	{ id = "waterskin", chance = 1292 },  -- 2031
	{ id = "sandals", chance = 1157 },  -- 2642
	{ id = 5921, chance = 1103 },  -- heaven blossom
	{ id = "elvish bow", chance = 128 },  -- 7438
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -30 },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -80, range = 7, shootEffect = CONST_ANI_ARROW, target = false },
}

monster.defenses = {
	defense = 10,
	armor = 7,
	mitigation = 0.46,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
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
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)