-- Version: 10.70
-- Monster: https://tibia.fandom.com/wiki/Empowered_Glooth_Horror
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Empowered_Glooth_Horror
---


local mType = Game.createMonsterType("Empowered Glooth Horror")
local monster = {}

monster.description = "an empowered glooth horror"
monster.experience = 2150
monster.outfit = {
	lookType = 677,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

-- todo(monster events): not yet migrated from xml to lua (or doesn't exist)
-- monster.events = {
--	"RathletonBossDeath",
	-- "GloothHorror",
-- }

monster.health = 25000
monster.maxHealth = 25000
monster.race = "venom"
monster.corpse = 21907
monster.speed = 100
monster.manaCost = 0

monster.changeTarget = {
	interval = 60000,
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
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 200,
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
}

monster.loot = {
    { id = "glooth bag", chance = 72727, minCount = 1, maxCount = 2 },  -- 23574
    { id = "glooth glider hinge", chance = 15152 },  -- 24274
    { id = "platinum coin", chance = 12121, minCount = 1, maxCount = 4 },  -- 2152
    { id = 9808, chance = 6061 },  -- rusty armor (todo: slightly rusted does not exist in items.xml)
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, skill = 150, attack = 100 },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_DEATHDAMAGE, minDamage = -400, maxDamage = -600, range = 1, shootEffect = CONST_ANI_POISON, target = true },
	{ name = "drunk", interval = 2000, chance = 8, radius = 8, effect = CONST_ME_HITBYPOISON, target = false, duration = 15000 },
	-- poison
	{ name = "condition", type = CONDITION_POISON, interval = 2000, chance = 12, minDamage = -600, maxDamage = -900, radius = 8, effect = CONST_ME_HITBYPOISON, target = false },
}

monster.defenses = {
	defense = 25,
	armor = 15,
	--	mitigation = ???,
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_HEALING, minDamage = 500, maxDamage = 700, effect = CONST_ME_MAGIC_GREEN, target = false },
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
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)