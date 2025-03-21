
-- Version: 9.10
-- Monster: https://tibia.fandom.com/wiki/Raging_Mage
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Raging_Mage
---
local mType = Game.createMonsterType("Raging mage")
local monster = {}

monster.description = "a raging mage"
monster.experience = 3250
monster.outfit = {
	lookType = 416,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

-- todo(monster events): not yet migrated from xml to lua (or doesn't exist)
-- monster.events = {
--	"RagingMageDeath",
-- }

monster.health = 3500
monster.maxHealth = 3500
monster.race = "blood"
monster.corpse = 12678
monster.speed = 100
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
	rewardBoss = true,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 80,
	targetDistance = 1,
	runHealth = 300,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false}

monster.light = {
	level = 0,
	color = 0,
}

monster.summon = {
	maxSummons = 1,
	summons = {
		{ name = "Golden Servant", chance = 50, interval = 2000, count = 1 },
	},
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Behold the all permeating powers I draw from this gate!!", yell = false },
	{ text = "ENERGY!!", yell = false },
	{ text = "I WILL RETURN!! My death will just be a door to await my homecoming, my physical hull will be... my... argh...", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 97633, minCount = 2, maxCount = 250 },  -- 2148
	{ id = "platinum coin", chance = 78107, minCount = 1, maxCount = 12 },  -- 2152
	{ id = "red piece of cloth", chance = 30769 },  -- 5911
	{ id = "great health potion", chance = 27219, minCount = 1, maxCount = 5 },  -- 7591
	{ id = "great mana potion", chance = 23077, minCount = 1, maxCount = 5 },  -- 7590
	{ id = "mind stone", chance = 10651 },  -- 2178
	{ id = "bullseye potion", chance = 6509, minCount = 1, maxCount = 2 },  -- 7443
	{ id = "focus cape", chance = 4734 },  -- 8871
	{ id = "stealth ring", chance = 4734 },  -- 2165
	{ id = "luminous orb", chance = 4142 },  -- 12410
	{ id = "dark mushroom", chance = 3550, minCount = 1, maxCount = 4 },  -- 2792
	{ id = 2124, chance = 2367 },  -- crystal ring
	{ id = "small sapphire", chance = 2367, maxCount = 5 },  -- 2146
	{ id = "assassin star", chance = 2367, minCount = 1, maxCount = 10 },  -- 7368
	{ id = "ring of the sky", chance = 1775 },  -- 2123
	{ id = "elemental spikes", chance = 1183 },  -- 13940
	{ id = "piggy bank", chance = 1183 },  -- 2114
	{ id = "royal tapestry", chance = 1183 },  -- 9958
	{ id = "boots of haste", chance = 592 },  -- 2195
	{ id = "crystal of power", chance = 592 },  -- 9980
	{ id = "skull helmet", chance = 592 },  -- 5741
	{ id = "spellbook of mind control", chance = 592 },  -- 8902
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -50 },
	{ name = "thunderstorm rune", interval = 2000, chance = 35, minDamage = -100, maxDamage = -200, range = 7, target = true },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_MANADRAIN, minDamage = -100, maxDamage = -200, range = 7, target = false },
	{ name = "energyfield", interval = 2000, chance = 15, range = 7, radius = 2, shootEffect = CONST_ANI_ENERGY, target = true },
}

monster.defenses = {
	defense = 25,
	armor = 25,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = -25 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 100 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 100 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 15 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)