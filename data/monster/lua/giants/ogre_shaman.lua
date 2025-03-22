-- Version: 10.90
-- Monster: https://tibia.fandom.com/wiki/Ogre_Shaman
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Ogre_Shaman
---


local mType = Game.createMonsterType("Ogre Shaman")
local monster = {}

monster.description = "an ogre shaman"
monster.experience = 625
monster.outfit = {
	lookType = 859,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 800
monster.maxHealth = 800
monster.race = "blood"
monster.corpse = 24795
monster.speed = 105
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10,
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
	targetDistance = 4,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = true}

monster.light = {
	level = 0,
	color = 0,
}

monster.summon = {
	maxSummons = 2,
	summons = {
		{ name = "Dworc Fleshhunter", chance = 30, interval = 1000, count = 1 },
		{ name = "Terror Bird", chance = 30, interval = 1000, count = 1 },
	},
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Stay here, soul food!", yell = false },
	{ text = "You more delicate than clomp!", yell = false },
	{ text = "The spirits hunger!", yell = false },
	{ text = "A sacrifice for Great Hunger!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 100000, minCount = 1, maxCount = 90 },  -- 2148
	{ id = "strong mana potion", chance = 15196 },  -- 7589
	{ id = "ogre ear stud", chance = 13903 },  -- 24844
	{ id = "skull fetish", chance = 11033 },  -- 24847
	{ id = "shamanic talisman", chance = 10233 },  -- 24840
	{ id = "ogre nose ring", chance = 9951 },  -- 24845
	{ id = 2229, chance = 9527 },  -- skull
	{ id = "prickly pear", chance = 8986, minCount = 1, maxCount = 2 },  -- 24841
	{ id = "broken shamanic staff", chance = 7175 },  -- 12408
	{ id = "bone fetish", chance = 5269 },  -- 20111
	{ id = "small ruby", chance = 3176 },  -- 2147
	{ id = "black pearl", chance = 2564 },  -- 2144
	{ id = "necrotic rod", chance = 2423 },  -- 2185
	{ id = "waterskin", chance = 2070 },  -- 2031
	{ id = "wand of decay", chance = 2000 },  -- 2188
	{ id = "opal", chance = 1623, minCount = 1, maxCount = 2 },  -- 24850
	{ id = "onyx chip", chance = 1435, minCount = 1, maxCount = 2 },  -- 24849
	{ id = "shamanic mask", chance = 847 },  -- 24848
	{ id = "didgeridoo", chance = 494 },  -- 3952
	{ id = "ogre scepta", chance = 494 },  -- 24839
	{ id = 2322, chance = 165 },  -- voodoo doll

}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -269, condition = { type = CONDITION_FIRE, totalDamage = 6, interval = 9000 } },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_FIREDAMAGE, minDamage = -70, maxDamage = -180, range = 7, shootEffect = CONST_ANI_POISON, target = false },
	{ name = "outfit", interval = 2000, chance = 8, range = 7, effect = CONST_ME_MAGIC_BLUE, target = false, duration = 4000, outfitMonster = "chicken" },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_EARTHDAMAGE, minDamage = -15, maxDamage = -120, length = 8, spread = 0, effect = CONST_ME_CARNIPHILA, target = false },
}

monster.defenses = {
	defense = 20,
	armor = 30,
	mitigation = 1.04,
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_HEALING, minDamage = 80, maxDamage = 95, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 20 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = 20 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 20 },
	{ type = COMBAT_HOLYDAMAGE, percent = -10 },
	{ type = COMBAT_DEATHDAMAGE, percent = 100 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)