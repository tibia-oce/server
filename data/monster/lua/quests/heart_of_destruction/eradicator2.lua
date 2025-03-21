-- Version: 10.94
-- Monster: https://tibia.fandom.com/wiki/Eradicator
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Eradicator
---


local mType = Game.createMonsterType("Eradicator2")
local monster = {}

monster.name = "Eradicator"
monster.description = "Eradicator"
monster.experience = 50000
monster.outfit = {
	lookType = 875,
	lookHead = 94,
	lookBody = 3,
	lookLegs = 78,
	lookFeet = 94,
	lookAddons = 1,
	lookMount = 0,
}

monster.health = 290000
monster.maxHealth = 290000
monster.race = "venom"
monster.corpse = 23564
monster.speed = 225
monster.manaCost = 0

monster.changeTarget = {
	interval = 2000,
	chance = 25,
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
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false}

-- todo(monster events): not yet migrated from xml to lua (or doesn't exist)
-- monster.events = {
--	"HeartBossDeath",
	-- "EradicatorTransform",
-- }

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
}

monster.loot = {
    { id = "energy bar", chance = 100000 },  -- 26191
    { id = "gold coin", chance = 100000, maxCount = 200 },  -- 2148
    { id = "gold token", chance = 100000, maxCount = 4 },  -- 25377
    { id = "mysterious remains", chance = 100000 },  -- 26165
    { id = "plasmatic lightning", chance = 100000 },  -- 26176
    { id = "platinum coin", chance = 100000, minCount = 15, maxCount = 35 },  -- 2152
    { id = "spark sphere", chance = 100000 },  -- 26174
    { id = "violet crystal shard", chance = 65217, maxCount = 3 },  -- 18414
    { id = "great mana potion", chance = 64130, minCount = 5, maxCount = 10 },  -- 7590
    { id = "blue crystal shard", chance = 62500, maxCount = 3 },  -- 18413
    { id = "green crystal shard", chance = 61413, maxCount = 3 },  -- 18415
    { id = "ultimate health potion", chance = 57609, minCount = 5, maxCount = 10 },  -- 8473
    { id = "great spirit potion", chance = 51630, minCount = 5, maxCount = 10 },  -- 8472
    { id = "red gem", chance = 25543 },  -- 2156
    { id = "yellow gem", chance = 22826 },  -- 2154
    { id = "small emerald", chance = 21739, maxCount = 10 },  -- 2149
    { id = "small ruby", chance = 20109, maxCount = 10 },  -- 2147
    { id = "small topaz", chance = 20109, maxCount = 10 },  -- 9970
    { id = "small diamond", chance = 19022, maxCount = 10 },  -- 2145
    { id = "small amethyst", chance = 18478, maxCount = 10 },  -- 2150
    { id = "blue gem", chance = 17391 },  -- 2158
    { id = "green gem", chance = 17391 },  -- 2155
    { id = 26133, chance = 15217 },  -- void boots
    { id = "ring of green plasma", chance = 14674 },  -- 26187
    { id = 26185, chance = 14130 },  -- ring of blue plasma
    { id = 26189, chance = 14130 },  -- ring of red plasma
    { id = 26200, chance = 13043 },  -- collar of red plasma
    { id = "collar of green plasma", chance = 11957 },  -- 26199
    { id = "spellbook of warding", chance = 10870 },  -- 8901
    { id = 7632, chance = 9783 },  -- giant shimmering pearl
    { id = "crystal mace", chance = 9239 },  -- 2445
    { id = "amber staff", chance = 8152 },  -- 7426
    { id = 26198, chance = 7609 },  -- collar of blue plasma
    { id = "spellbook of lost souls", chance = 6522 },  -- 8903
    { id = "violet gem", chance = 6522 },  -- 2153
    { id = 26130, chance = 3804 },  -- tiara of power
    { id = "steel boots", chance = 2174 },  -- 2645
    { id = "crystalline armor", chance = 1087 },  -- 8878
    { id = "vile axe", chance = 1087 },  -- 7388
    { id = "onyx flail", chance = 543 },  -- 7421
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -300, maxDamage = -1800 },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = -600, maxDamage = -1000, length = 8, spread = 0, effect = CONST_ME_BLOCKHIT, target = false },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = -450, maxDamage = -900, radius = 8, effect = CONST_ME_BLOCKHIT, target = false },
	{ name = "combat", interval = 2000, chance = 25, type = COMBAT_HOLYDAMAGE, minDamage = -300, maxDamage = -600, radius = 4, shootEffect = CONST_ANI_SMALLHOLY, effect = CONST_ME_HOLYDAMAGE, target = true },
	{ name = "big lifedrain wave", interval = 2000, chance = 20, minDamage = -700, maxDamage = -1000, target = false },
	{ name = "anomaly break", interval = 2000, chance = 40, target = false },
}

monster.defenses = {
	defense = 60,
	armor = 60,
	{ name = "combat", interval = 2000, chance = 100, type = COMBAT_HEALING, minDamage = 500, maxDamage = 1200, effect = CONST_ME_MAGIC_GREEN, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 15 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 15 },
	{ type = COMBAT_EARTHDAMAGE, percent = 15 },
	{ type = COMBAT_FIREDAMAGE, percent = 15 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 15 },
	{ type = COMBAT_HOLYDAMAGE, percent = 15 },
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)