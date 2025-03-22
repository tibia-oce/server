-- Version: 9.10
-- Monster: https://tibia.fandom.com/wiki/Feverish_Citizen
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Feverish_Citizen
---


local mType = Game.createMonsterType("Feverish Citizen")
local monster = {}

monster.description = "a feverish citizen"
monster.experience = 30
monster.outfit = {
	lookType = 425,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 125
monster.maxHealth = 125
monster.race = "blood"
monster.corpse = 20395
monster.speed = 73
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 0,
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
	canPushItems = false,
	canPushCreatures = false,
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
	{ text = "Arrrgh!", yell = false },
	{ text = "I am the king of the world!", yell = false },
	{ text = "Die Ferumbras!", yell = false },
	{ text = "Tigerblood is running through my veins!", yell = false },
	{ text = "You! It's you again!", yell = false },
	{ text = "Stand still you tasty morsel!", yell = false },
	{ text = "<giggle>", yell = false },
	{ text = "Burn heretic! Burn!", yell = false },
	{ text = "Harrr!", yell = false },
	{ text = "This is Venore!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 29865, minCount = 1, maxCount = 35 },  -- 2148
	{ id = "worm", chance = 25010, minCount = 1, maxCount = 3 },  -- 3976
	{ id = 2230, chance = 4901 },  -- bone
	{ id = "ludicrous piece of cloth", chance = 2190 },  -- 13544
	{ id = "voluminous piece of cloth", chance = 2098 },  -- 13542
	{ id = "obvious piece of cloth", chance = 1983 },  -- 13543
	{ id = "ominous piece of cloth", chance = 1949 },  -- 13540
	{ id = "luminous piece of cloth", chance = 1874 },  -- 13545
	{ id = "dubious piece of cloth", chance = 1657 },  -- 13541
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -18 },
	{ name = "drunk", interval = 2000, chance = 15, length = 3, spread = 2, effect = CONST_ME_POISONAREA, target = false, duration = 3000 },
}

monster.defenses = {
	defense = 15,
	armor = 14,
	mitigation = 0.25,
	{ name = "outfit", interval = 2000, chance = 1, radius = 3, effect = CONST_ME_GREEN_RINGS, target = false, duration = 5000, outfitMonster = "bog raider" },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = -15 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -10 },
	{ type = COMBAT_EARTHDAMAGE, percent = 10 },
	{ type = COMBAT_FIREDAMAGE, percent = -15 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 10 },
	{ type = COMBAT_HOLYDAMAGE, percent = 75 },
	{ type = COMBAT_DEATHDAMAGE, percent = 10 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = false },
	{ type = "bleed", condition = false },
}

mType:register(monster)
