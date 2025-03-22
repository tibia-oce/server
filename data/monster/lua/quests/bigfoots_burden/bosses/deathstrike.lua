-- Version: 9.60
-- Monster: https://tibia.fandom.com/wiki/Deathstrike
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Deathstrike
---


local mType = Game.createMonsterType("Deathstrike")
local monster = {}

monster.description = "Deathstrike"
monster.experience = 40000
monster.outfit = {
	lookType = 500,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

-- todo(monster events): not yet migrated from xml to lua (or doesn't exist)
-- monster.events = {
--	"BossesWarzoneDeath",
-- }


monster.health = 200000
monster.maxHealth = 200000
monster.race = "blood"
monster.corpse = 18384
monster.speed = 235
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
	staticAttackChance = 50,
	targetDistance = 1,
	runHealth = 2000,
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
	{ text = "Deeestructiooon!", yell = false },
	{ text = "Maaahhhrrr!", yell = false },
	{ text = "I am carnage incarnate!", yell = false },
	{ text = "I've seen the light! And it was all engulfing fire!", yell = false },
	{ text = "Taaake... this!", yell = false },
}

monster.loot = {
	{ id = "Deathstrike's snippet", chance = 100000 },  -- 18430
	{ id = "crystal crossbow", chance = 14419 },  -- 18453
	{ id = "crystalline axe", chance = 13488 },  -- 18451
	{ id = "mycological bow", chance = 11628 },  -- 18454
	{ id = "crystalline sword", chance = 9767 },  -- 18450
	{ id = "shiny blade", chance = 9302 },  -- 18465
	{ id = "mycological mace", chance = 6512 },  -- 18452
	{ id = "decorative ribbon", chance = 1860 },  -- 18449
}

monster.attacks = {
	{ name = "melee", interval = 1300, chance = 100, skill = 80, attack = 120 },
	{ name = "speed", interval = 2000, chance = 20, speed = -400, range = 7, shootEffect = CONST_ANI_WHIRLWINDAXE, target = false, duration = 2500 },
	{ name = "combat", interval = 2000, chance = 100, type = COMBAT_FIREDAMAGE, minDamage = -820, maxDamage = -950, range = 7, effect = CONST_ME_FIREAREA, target = false },
	{ name = "combat", interval = 1000, chance = 12, type = COMBAT_ENERGYDAMAGE, minDamage = -350, maxDamage = -800, range = 3, effect = CONST_ME_PURPLEENERGY, target = true },
}

monster.defenses = {
	defense = 35,
	armor = 25,
	--	mitigation = ???,
	{ name = "combat", interval = 1000, chance = 25, type = COMBAT_HEALING, minDamage = 1000, maxDamage = 5500, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 25 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 40 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = 50 },
	{ type = COMBAT_LIFEDRAIN, percent = 10 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 40 },
	{ type = COMBAT_HOLYDAMAGE, percent = 20 },
	{ type = COMBAT_DEATHDAMAGE, percent = 40 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)