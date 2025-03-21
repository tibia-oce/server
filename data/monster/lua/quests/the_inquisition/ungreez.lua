-- Version: 8.20
-- Monster: https://tibia.fandom.com/wiki/Ungreez
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Ungreez
---


local mType = Game.createMonsterType("Ungreez")
local monster = {}

monster.description = "Ungreez"
monster.experience = 500
monster.outfit = {
	lookType = 35,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

-- todo(monster events): not yet migrated from xml to lua (or doesn't exist)
-- monster.events = {
--	"UngreezDeath",
-- }

monster.health = 8200
monster.maxHealth = 8200
monster.race = "blood"
monster.corpse = 5995
monster.speed = 120
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
	{ text = "I teach you that even heroes can die!", yell = false },
	{ text = "You will die begging like the others did!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 37037, minCount = 8, maxCount = 96 },  -- 2148
	{ id = "fire mushroom", chance = 18519, minCount = 1, maxCount = 4 },  -- 2795
	{ id = "great health potion", chance = 7407 },  -- 7591
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, skill = 70, attack = 120 },
	{ name = "combat", interval = 2000, chance = 13, type = COMBAT_MANADRAIN, minDamage = 0, maxDamage = -110, range = 7, shootEffect = CONST_ANI_SUDDENDEATH, target = false },
	{ name = "combat", interval = 1000, chance = 14, type = COMBAT_FIREDAMAGE, minDamage = -150, maxDamage = -250, range = 7, radius = 7, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = true },
	{ name = "combat", interval = 2000, chance = 18, type = COMBAT_ENERGYDAMAGE, minDamage = -200, maxDamage = -400, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_PURPLEENERGY, target = false },
	{ name = "combat", interval = 1000, chance = 12, type = COMBAT_ENERGYDAMAGE, minDamage = -300, maxDamage = -380, length = 8, spread = 0, effect = CONST_ME_PURPLEENERGY, target = false },
}

monster.defenses = {
	defense = 55,
	armor = 55,
	--	mitigation = ???,
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_HEALING, minDamage = 90, maxDamage = 150, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 30 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 55 },
	{ type = COMBAT_EARTHDAMAGE, percent = 60 },
	{ type = COMBAT_FIREDAMAGE, percent = 100 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -5 },
	{ type = COMBAT_HOLYDAMAGE, percent = -5 },
	{ type = COMBAT_DEATHDAMAGE, percent = 20 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)