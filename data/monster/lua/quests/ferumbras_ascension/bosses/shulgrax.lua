-- Version: 10.90
-- Monster: https://tibia.fandom.com/wiki/Shulgrax
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Shulgrax
---


local mType = Game.createMonsterType("Shulgrax")
local monster = {}

monster.description = "Shulgrax"
monster.experience = 500000
monster.outfit = {
	lookType = 842,
	lookHead = 0,
	lookBody = 62,
	lookLegs = 2,
	lookFeet = 87,
	lookAddons = 1,
	lookMount = 0,
}

-- todo(monster events): not yet migrated from xml to lua (or doesn't exist)
-- monster.events = {
--	"AscendantBossesDeath",
-- }

monster.health = 40000
monster.maxHealth = 40000
monster.race = "undead"
monster.corpse = 22495
monster.speed = 160
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
	{ text = "DAMMMMNNNNAAATIONN!", yell = false },
	{ text = "I WILL FEAST ON YOUR SOUL!", yell = true },
	{ text = "YOU ARE ALL DAMNED!", yell = true },
}

monster.loot = {
    { id = "demonic essence", chance = 100000 },  -- 6500
    { id = "concentrated demonic blood", chance = 100000 },  -- todo: flask of demonic blood does not exist in items.xml
    { id = "gold coin", chance = 100000, maxCount = 200 },  -- 2148
    { id = "onyx chip", chance = 100000, maxCount = 5 },  -- 24849
    { id = "platinum coin", chance = 100000, minCount = 25, maxCount = 30 },  -- 2152
    { id = "silver token", chance = 100000 },  -- 25172
    { id = "blue gem", chance = 66667 },  -- 2158
    { id = "great mana potion", chance = 66667, maxCount = 5 },  -- 7590
    { id = "great spirit potion", chance = 66667, maxCount = 5 },  -- 8472
    { id = "opal", chance = 66667, maxCount = 5 },  -- 24850
    { id = "rift crossbow", chance = 66667 },  -- 25523
    { id = "small ruby", chance = 66667, maxCount = 5 },  -- 2147
    { id = "ultimate health potion", chance = 66667, maxCount = 5 },  -- 8473
    { id = 6300, chance = 33333 },  -- death ring
    { id = "green gem", chance = 33333 },  -- 2155
    { id = "lightning pendant", chance = 33333 },  -- 7889
    { id = "small emerald", chance = 33333, maxCount = 5 },  -- 2149
}
monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -1500, maxDamage = -2500 },
	{ name = "combat", interval = 3000, chance = 20, type = COMBAT_FIREDAMAGE, minDamage = -500, maxDamage = -1000, length = 10, spread = 3, effect = CONST_ME_HITBYFIRE, target = false },
	{ name = "speed", interval = 2000, chance = 25, speed = -600, radius = 7, effect = CONST_ME_MAGIC_RED, target = false, duration = 15000 },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_FIREDAMAGE, minDamage = -300, maxDamage = -700, radius = 5, effect = CONST_ME_HITBYFIRE, target = false },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_DEATHDAMAGE, minDamage = -500, maxDamage = -800, length = 10, spread = 3, effect = CONST_ME_EXPLOSIONHIT, target = false },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_FIREDAMAGE, minDamage = -500, maxDamage = -800, length = 8, spread = 3, effect = CONST_ME_FIREATTACK, target = false },
}

monster.defenses = {
	defense = 65,
	armor = 55,
	{ name = "combat", interval = 3000, chance = 35, type = COMBAT_HEALING, minDamage = 400, maxDamage = 6000, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "shulgrax summon", interval = 5000, chance = 5, target = false },
	{ name = "speed", interval = 4000, chance = 80, effect = CONST_ME_MAGIC_RED, speed = 320},
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -10 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = -10 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 10 },
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