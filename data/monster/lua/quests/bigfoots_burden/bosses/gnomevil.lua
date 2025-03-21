-- Version: 9.60
-- Monster: https://tibia.fandom.com/wiki/Gnomevil
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Gnomevil
---


local mType = Game.createMonsterType("Gnomevil")
local monster = {}

monster.description = "Gnomevil"
monster.experience = 400000
monster.outfit = {
	lookType = 504,
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

monster.bosstiary = {
	bossRaceId = 893,
	bossRace = RARITY_ARCHFOE,
}

monster.health = 250000
monster.maxHealth = 250000
monster.race = "blood"
monster.corpse = 16149
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
	runHealth = 10000,
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
	{ text = "I'm feeling grrrreat!", yell = false },
	{ text = "I've seen the light! And it was all engulfing fire!", yell = false },
	{ text = "No more Mr. Nicegnome!", yell = false },
	{ text = "Taste the power of the dark side!", yell = false },
}

monster.loot = {
	{ id = "Gnomevil's hat", chance = 100000 },  -- 18495
	{ id = "crystalline sword", chance = 12778 },  -- 18450
	{ id = "crystal crossbow", chance = 10556 },  -- 18453
	{ id = "mycological bow", chance = 10556 },  -- 18454
	{ id = "shiny blade", chance = 9815 },  -- 18465
	{ id = "mycological mace", chance = 8704 },  -- 18452
	{ id = "crystalline axe", chance = 8519 },  -- 18451
	{ id = "decorative ribbon", chance = 1852 },  -- 18449
}

monster.attacks = {
	{ name = "melee", interval = 1300, chance = 100, skill = 80, attack = 140 },
	{ name = "speed", interval = 2000, chance = 20, speed = -400, range = 7, shootEffect = CONST_ANI_WHIRLWINDAXE, target = false, duration = 2500 },
	{ name = "combat", interval = 2000, chance = 100, type = COMBAT_FIREDAMAGE, minDamage = -820, maxDamage = -950, range = 7, effect = CONST_ME_ENERGYAREA, target = false },
	{ name = "combat", interval = 2000, chance = 9, type = COMBAT_MANADRAIN, minDamage = -230, maxDamage = -500, length = 8, spread = 3, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "combat", interval = 1000, chance = 12, type = COMBAT_ENERGYDAMAGE, minDamage = -350, maxDamage = -800, range = 3, effect = CONST_ME_PURPLEENERGY, target = true },
}

monster.defenses = {
	defense = 35,
	armor = 25,
	--	mitigation = ???,
	{ name = "combat", interval = 1000, chance = 25, type = COMBAT_HEALING, minDamage = 1000, maxDamage = 4000, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 10 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 100 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = 50 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 50 },
	{ type = COMBAT_HOLYDAMAGE, percent = 50 },
	{ type = COMBAT_DEATHDAMAGE, percent = 27 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)