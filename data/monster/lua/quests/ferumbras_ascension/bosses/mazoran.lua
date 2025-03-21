-- Version: 10.90
-- Monster: https://tibia.fandom.com/wiki/Mazoran
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Mazoran
---


local mType = Game.createMonsterType("Mazoran")
local monster = {}

monster.description = "Mazoran"
monster.experience = 500000
monster.outfit = {
	lookType = 842,
	lookHead = 77,
	lookBody = 79,
	lookLegs = 78,
	lookFeet = 94,
	lookAddons = 3,
	lookMount = 0,
}

-- todo(monster events): not yet migrated from xml to lua (or doesn't exist)
-- monster.events = {
--	"AscendantBossesDeath",
-- }


monster.health = 290000
monster.maxHealth = 290000
monster.race = "fire"
monster.corpse = 22495
monster.speed = 200
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
	runHealth = 1,
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
    { id = "gold coin", chance = 100000, maxCount = 200 },  -- 2148
    { id = "platinum coin", chance = 100000, minCount = 20, maxCount = 30 },  -- 2152
    { id = "silver token", chance = 100000 },  -- 25172
    { id = "cyan crystal fragment", chance = 85714, maxCount = 4 },  -- 18419
    { id = "demonic essence", chance = 85714 },  -- 6500
    { id = "great mana potion", chance = 85714, maxCount = 5 },  -- 7590
    { id = "great spirit potion", chance = 85714, maxCount = 5 },  -- 8472
    { id = "green crystal fragment", chance = 85714, maxCount = 4 },  -- 18421
    { id = "red crystal fragment", chance = 71429, maxCount = 4 },  -- 18420
    { id = "blue gem", chance = 42857 },  -- 2158
    { id = "concentrated demonic blood", chance = 42857 },  -- todo: flask of demonic blood does not exist in items.xml
    { id = "red gem", chance = 42857 },  -- 2156
    { id = "small ruby", chance = 42857, maxCount = 5 },  -- 2147
    { id = "energy ring", chance = 28571 },  -- 2167
    { id = "small sapphire", chance = 28571, maxCount = 5 },  -- 2146
    { id = "ultimate health potion", chance = 28571, maxCount = 5 },  -- 8473
    { id = "fire axe", chance = 14286 },  -- 2432
    { id = 7632, chance = 14286 },  -- giant shimmering pearl
    { id = "magma amulet", chance = 14286 },  -- 7890
    { id = "magma legs", chance = 14286 },  -- 7894
    { id = "rift bow", chance = 14286 },  -- 25522
    { id = "rift shield", chance = 14286 },  -- 25382
    { id = "small amethyst", chance = 14286, maxCount = 5 },  -- 2150
    { id = "small topaz", chance = 14286, maxCount = 5 },  -- 9970
    { id = "wand of everblazing", chance = 14286 },  -- 18409
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
	defense = 125,
	armor = 125,
	--	mitigation = ???,
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_HEALING, minDamage = 2090, maxDamage = 4500, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "speed", interval = 2000, chance = 35, effect = CONST_ME_MAGIC_GREEN, speed = 400},
	{ name = "mazoran fire", interval = 30000, chance = 45, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 100 },
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