-- Version: 10.90
-- Monster: https://tibia.fandom.com/wiki/Ferumbras_Mortal_Shell
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Ferumbras_Mortal_Shell
---


local mType = Game.createMonsterType("Ferumbras Mortal Shell")
local monster = {}

monster.description = "Ferumbras Mortal Shell"
monster.experience = 2000000
monster.outfit = {
	lookType = 229,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

-- todo(monster events): not yet migrated from xml to lua (or doesn't exist)
-- monster.events = {
--	"AscendantBossesDeath",
-- }

monster.health = 300000
monster.maxHealth = 300000
monster.race = "venom"
monster.corpse = 6078
monster.speed = 195
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
	runHealth = 2500,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true}

monster.light = {
	level = 0,
	color = 0,
}

monster.summon = {
	maxSummons = 3,
	summons = {
		{ name = "Demon", chance = 100, interval = 1000, count = 3 },
	},
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "INSECTS!", yell = true },
	{ text = "If you strike me down, I shall become more powerful than you could possibly imagine!", yell = false },
	{ text = "I' STILL POWERFUL ENOUGH TO CRUSH YOU!", yell = true },
	{ text = "I WILL MAKE ALL OF YOU SUFFER!", yell = true },
	{ text = "THE POWER WAS MINE!", yell = true },
}

monster.loot = {
	{ id = "silver token", chance = 0, maxCount = 3 },  -- 25172
	{ id = "gold coin", chance = 0, minCount = 100, maxCount = 200 },  -- 2148
	{ id = 7632, chance = 0 },  -- giant shimmering pearl
	{ id = "platinum coin", chance = 0, minCount = 10, maxCount = 25 },  -- 2152
	{ id = "soul orb", chance = 0 },  -- 5944
	{ id = "emerald bangle", chance = 0 },  -- 2127
	{ id = "rift crossbow", chance = 0 },  -- 25523
	{ id = "white pearl", chance = 0, maxCount = 5 },  -- 2143
	{ id = "black pearl", chance = 0, maxCount = 5 },  -- 2144
	{ id = "rift shield", chance = 0 },  -- 25382
	{ id = "gold ingot", chance = 0 },  -- 9971
	{ id = "red gem", chance = 0 },  -- 2156
	{ id = "rift lance", chance = 0 },  -- 25383
	{ id = "small emerald", chance = 0, maxCount = 10 },  -- 2149
	{ id = "rift bow", chance = 0 },  -- 25522
	{ id = "small topaz", chance = 0, maxCount = 10 },  -- 9970
	{ id = "small amethyst", chance = 0, maxCount = 10 },  -- 2150
	{ id = "small diamond", chance = 0, maxCount = 10 },  -- 2145
	{ id = "blue gem", chance = 0 },  -- 2158
	{ id = "small sapphire", chance = 0, maxCount = 10 },  -- 2146
	{ id = "green gem", chance = 0 },  -- 2155
	{ id = "lightning legs", chance = 0 },  -- 7895
	{ id = "terra legs", chance = 0 },  -- 7885
	{ id = "magma legs", chance = 0 },  -- 7894
	{ id = "glacier kilt", chance = 0 },  -- 7896
	{ id = "golden legs", chance = 0 },  -- 2470
	{ id = 25429, chance = 0 },  -- boots of homecoming
	{ id = 25420, chance = 0 },  -- Ferumbras' staff (blunt)
	{ id = "demonrage sword", chance = 0 },  -- 7382
	{ id = 25425, chance = 0 },  -- "Ferumbras' mana keg"
	{ id = "spellbook of mind control", chance = 0 },  -- 8902
	{ id = 25428, chance = 0 },  -- scroll of ascension
	{ id = "haunted blade", chance = 0 },  -- 7407
	{ id = "golden armor", chance = 0 },  -- 2466
	{ id = "mastermind shield", chance = 0 },  -- 2514
	{ id = "shadow sceptre", chance = 0 },  -- 7451
	{ id = "demon shield", chance = 0 },  -- 2520
	{ id = 25423, chance = 0 },  -- Ferumbras' amulet
	{ id = "spellbook of lost souls", chance = 0 },  -- 8903
	{ id = "chaos mace", chance = 0 },  -- 7427
	{ id = "abyss hammer", chance = 0 },  -- 7414
	{ id = "runed sword", chance = 0 },  -- 7417
	{ id = "folded rift carpet", chance = 0 },  -- 25393
	{ id = "berserker", chance = 0 },  -- 7403
	{ id = "jade hammer", chance = 0 },  -- 7422
	{ id = "vile axe", chance = 0 },  -- 7388
	{ id = "bloody edge", chance = 0 },  -- 7416
	{ id = "divine plate", chance = 0 },  -- 8885
	{ id = "nightmare blade", chance = 0 },  -- 7418
	{ id = "spellbook of dark mysteries", chance = 0 },  -- 8918
	{ id = 25381, chance = 0 },  -- rift lamp
	{ id = 25387, chance = 0 },  -- rift tapestry
	{ id = "spellscroll of prophecies", chance = 0 },  -- 8904
	{ id = "greenwood coat", chance = 0 },  -- 8869
	{ id = "magic plate armor", chance = 0 },  -- 2472
	{ id = "obsidian truncheon", chance = 0 },  -- 8928
	{ id = "ornamented axe", chance = 0 },  -- 7411
	{ id = "impaler", chance = 0 },  -- 7435
	{ id = "skullcrusher", chance = 0 },  -- 7423
	{ id = "velvet mantle", chance = 0 },  -- 8868
	{ id = "emerald sword", chance = 0 },  -- 8930
	{ id = "havoc blade", chance = 0 },  -- 7405
	{ id = "hellforged axe", chance = 0 },  -- 8924
	{ id = "great axe", chance = 0 },  -- 2415
	{ id = "demonwing axe", chance = 0 },  -- 8926
	{ id = "phoenix shield", chance = 0 },  -- 2539
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, skill = 90, attack = 200 },
	-- poison
	{ name = "condition", type = CONDITION_POISON, interval = 2000, chance = 20, minDamage = -250, maxDamage = -520, radius = 6, effect = CONST_ME_POISONAREA, target = false },
	{ name = "ferumbras electrify", interval = 2000, chance = 18, target = false },
	{ name = "combat", interval = 2000, chance = 16, type = COMBAT_MANADRAIN, minDamage = -225, maxDamage = -410, radius = 6, effect = CONST_ME_MAGIC_RED, target = false },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_MANADRAIN, minDamage = -425, maxDamage = -810, radius = 9, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "combat", interval = 2000, chance = 21, type = COMBAT_ENERGYDAMAGE, minDamage = -400, maxDamage = -650, radius = 9, effect = CONST_ME_ENERGYHIT, target = false },
	{ name = "combat", interval = 2000, chance = 21, type = COMBAT_LIFEDRAIN, minDamage = -200, maxDamage = -450, radius = 6, effect = CONST_ME_POFF, target = false },
	{ name = "ferumbras soulfire", interval = 2000, chance = 20, range = 7, target = false },
	{ name = "combat", interval = 2000, chance = 17, type = COMBAT_LIFEDRAIN, minDamage = -590, maxDamage = -1050, length = 8, spread = 0, effect = CONST_ME_HITBYPOISON, target = false },
}

monster.defenses = {
	defense = 120,
	armor = 100,
	--	mitigation = ???,
	{ name = "combat", interval = 2000, chance = 23, type = COMBAT_HEALING, minDamage = 600, maxDamage = 2490, effect = CONST_ME_MAGIC_GREEN, target = false },
	{ name = "combat", interval = 2000, chance = 3, type = COMBAT_HEALING, minDamage = 20000, maxDamage = 35000, effect = CONST_ME_MAGIC_GREEN, target = false },
	{ name = "speed", interval = 2000, chance = 14, effect = CONST_ME_MAGIC_BLUE, speed = 390},
	{ name = "invisible", interval = 2000, chance = 10, effect = CONST_ME_MAGIC_BLUE },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 65 },
	{ type = COMBAT_EARTHDAMAGE, percent = 65 },
	{ type = COMBAT_FIREDAMAGE, percent = 65 },
	{ type = COMBAT_LIFEDRAIN, percent = 65 },
	{ type = COMBAT_MANADRAIN, percent = 65 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 65 },
	{ type = COMBAT_HOLYDAMAGE, percent = 65 },
	{ type = COMBAT_DEATHDAMAGE, percent = 65 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = true },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)