-- Version: 8.20
-- Monster: https://tibia.fandom.com/wiki/Massive_Energy_Elemental
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Massive_Energy_Elemental
---


local mType = Game.createMonsterType("Massive Energy Elemental")
local monster = {}

monster.description = "a massive energy elemental"
monster.experience = 950
monster.outfit = {
	lookType = 290,
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
monster.corpse = 8138
monster.speed = 215
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 15,
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
	staticAttackChance = 85,
	targetDistance = 1,
	runHealth = 1,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = false}

monster.light = {
	level = 4,
	color = 203,
}

monster.voices = {
	interval = 5000,
	chance = 10,
}

monster.loot = {
    { id = "gold coin", chance = 79669, maxCount = 5646 },  -- 2148
    { id = "flash arrow", chance = 697, maxCount = 33 },  -- 7838
    { id = "strong mana potion", chance = 151, maxCount = 10 },  -- 7589
    { id = "great mana potion", chance = 73, maxCount = 5 },  -- 7590
    { id = 9808, chance = 73 },  -- todo: rusted armor does not exist in items.xml
    { id = "small amethyst", chance = 73, maxCount = 4 },  -- 2150
    { id = "energy spike sword", chance = 152 },  -- 7869
    { id = "lightning pendant", chance = 4 },  -- 7889
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -175 },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_ENERGYDAMAGE, minDamage = -270, maxDamage = -615, range = 7, radius = 2, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_ENERGYHIT, target = true },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_ENERGYDAMAGE, minDamage = -175, maxDamage = -205, range = 7, shootEffect = CONST_ANI_ENERGYBALL, effect = CONST_ME_ENERGYHIT, target = true },
	{ name = "massive energy elemental electrify", interval = 2000, chance = 20, effect = CONST_ME_BLOCKHIT, target = false },
}

monster.defenses = {
	defense = 20,
	armor = 35,
	mitigation = 1.04,
	{ name = "combat", interval = 2000, chance = 5, type = COMBAT_HEALING, minDamage = 190, maxDamage = 250, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 50 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 100 },
	{ type = COMBAT_EARTHDAMAGE, percent = -5 },
	{ type = COMBAT_FIREDAMAGE, percent = 100 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 100 },
	{ type = COMBAT_HOLYDAMAGE, percent = 20 },
	{ type = COMBAT_DEATHDAMAGE, percent = 20 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
