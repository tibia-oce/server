-- Version: 8.20
-- Monster: https://tibia.fandom.com/wiki/Hellgorak
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Hellgorak
---


local mType = Game.createMonsterType("Hellgorak")
local monster = {}

monster.description = "Hellgorak"
monster.experience = 10000
monster.outfit = {
	lookType = 12,
	lookHead = 19,
	lookBody = 77,
	lookLegs = 3,
	lookFeet = 80,
	lookAddons = 0,
	lookMount = 0,
}

-- todo(monster events): not yet migrated from xml to lua (or doesn't exist)
-- monster.events = {
--	"InquisitionBossDeath",
-- }


monster.health = 25850
monster.maxHealth = 25850
monster.race = "blood"
monster.corpse = 6068
monster.speed = 165
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
	staticAttackChance = 85,
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
	{ text = "I'll sacrifice yours souls to seven!", yell = false },
	{ text = "I'm bad news for you mortals!", yell = false },
	{ text = "No man can defeat me!", yell = false },
	{ text = "Your puny skills are no match for me.", yell = false },
	{ text = "I smell your fear.", yell = false },
	{ text = "Delicious!", yell = false },
}

monster.loot = {
	{ id = "demonic essence", chance = 100000 },  -- 6500
	{ id = "gold coin", chance = 100000, minCount = 1, maxCount = 198 },  -- 2148
	{ id = 9811, chance = 51277 },  -- rusty legs (todo: slightly rusted does not exist in items.xml)
	{ id = "ultimate health potion", chance = 42447, minCount = 1, maxCount = 2 },  -- 8473
	{ id = 9808, chance = 32447 },  -- rusty armor (todo: slightly rusted does not exist in items.xml)
	{ id = "spellbook of warding", chance = 30532 },  -- 8901
	{ id = "beastslayer axe", chance = 30053 },  -- 3962
	{ id = "great spirit potion", chance = 21011 },  -- 8472
	{ id = "platinum coin", chance = 20426, minCount = 1, maxCount = 30 },  -- 2152
	{ id = "great health potion", chance = 18457 },  -- 7591
	{ id = "crown armor", chance = 18298 },  -- 2487
	{ id = "great mana potion", chance = 17979 },  -- 7590
	{ id = "crystal necklace", chance = 14415 },  -- 2125
	{ id = "black pearl", chance = 14202, minCount = 1, maxCount = 25 },  -- 2144
	{ id = "small ruby", chance = 13191, minCount = 1, maxCount = 25 },  -- 2147
	{ id = "white pearl", chance = 13191, minCount = 1, maxCount = 25 },  -- 2143
	{ id = "small diamond", chance = 12766, minCount = 1, maxCount = 25 },  -- 2145
	{ id = "noble axe", chance = 12234 },  -- 7456
	{ id = "small amethyst", chance = 11968, minCount = 1, maxCount = 25 },  -- 2150
	{ id = "small emerald", chance = 11755, minCount = 1, maxCount = 25 },  -- 2149
	{ id = "small sapphire", chance = 11543, minCount = 1, maxCount = 25 },  -- 2146
	{ id = "small topaz", chance = 11330, minCount = 1, maxCount = 25 },  -- 9970
	{ id = "magma legs", chance = 11117 },  -- 7894
	{ id = "spirit cloak", chance = 10372 },  -- 8870
	{ id = "ruby necklace", chance = 10160 },  -- 2133
	{ id = "crown legs", chance = 10000 },  -- 2488
	{ id = "spellbook of mind control", chance = 9947 },  -- 8902
	{ id = "stone skin amulet", chance = 9787 },  -- 2197
	{ id = "golden amulet", chance = 9628 },  -- 2130
	{ id = "focus cape", chance = 9574 },  -- 8871
	{ id = "steel boots", chance = 9574 },  -- 2645
	{ id = "demon horn", chance = 9521, minCount = 1, maxCount = 2 },  -- 5954
	{ id = "spellbook of lost souls", chance = 8830 },  -- 8903
	{ id = "knight legs", chance = 8777 },  -- 2477
	{ id = "blue robe", chance = 8085 },  -- 2656
	{ id = "butcher's axe", chance = 2287 },  -- 7412
	{ id = "golden armor", chance = 2021 },  -- 2466
	{ id = "vile axe", chance = 1223 },  -- 7388
	{ id = "spellscroll of prophecies", chance = 1011 },  -- 8904
	{ id = "executioner", chance = 798 },  -- 7453
	{ id = "golden legs", chance = 638 },  -- 2470
	{ id = 2136, chance = 585 },  -- demonbone amulet
	{ id = "voltage armor", chance = 372 },  -- 8879
	{ id = "demonwing axe", chance = 319 },  -- 8926
	{ id = "great axe", chance = 266 },  -- 2415
	{ id = "spellbook of dark mysteries", chance = 160 },  -- 8918
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -910 },
	{ name = "combat", interval = 1000, chance = 11, type = COMBAT_ENERGYDAMAGE, minDamage = -250, maxDamage = -819, length = 8, spread = 3, effect = CONST_ME_PURPLEENERGY, target = false },
	{ name = "combat", interval = 2000, chance = 14, type = COMBAT_MANADRAIN, minDamage = -90, maxDamage = -500, radius = 5, effect = CONST_ME_STUN, target = false },
	{ name = "combat", interval = 1000, chance = 11, type = COMBAT_FIREDAMAGE, minDamage = -50, maxDamage = -520, radius = 5, effect = CONST_ME_FIREAREA, target = true },
	{ name = "combat", interval = 2000, chance = 5, type = COMBAT_LIFEDRAIN, minDamage = 0, maxDamage = -150, radius = 7, effect = CONST_ME_POFF, target = false },
}

monster.defenses = {
	defense = 65,
	armor = 70,
	--	mitigation = ???,
	{ name = "combat", interval = 1000, chance = 11, type = COMBAT_HEALING, minDamage = 400, maxDamage = 900, effect = CONST_ME_MAGIC_GREEN, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 98 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 98 },
	{ type = COMBAT_EARTHDAMAGE, percent = 98 },
	{ type = COMBAT_FIREDAMAGE, percent = 98 },
	{ type = COMBAT_LIFEDRAIN, percent = 100 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = -205 },
	{ type = COMBAT_ICEDAMAGE, percent = 98 },
	{ type = COMBAT_HOLYDAMAGE, percent = 95 },
	{ type = COMBAT_DEATHDAMAGE, percent = 98 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)