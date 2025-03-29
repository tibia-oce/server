local ec = EventCallback

-- helper: get skill id
local function getSkillId(skillName)
	if skillName == "club" then return SKILL_CLUB
	elseif skillName == "sword" then return SKILL_SWORD
	elseif skillName == "axe" then return SKILL_AXE
	elseif skillName:sub(1, 4) == "dist" then return SKILL_DISTANCE
	elseif skillName:sub(1, 6) == "shield" then return SKILL_SHIELD
	elseif skillName:sub(1, 4) == "fist" then return SKILL_FIST
	elseif skillName:sub(1, 1) == "m" then return SKILL_MAGLEVEL
	end
	return nil
end

-- helper: does item have stats worth rolling rarity for?
local function hasRelevantStats(item)
	if not item or type(item) ~= "userdata" then return false end

	local itType = ItemType(item:getId())
	if not itType then return false end

	local hasWeapon = (itType:getAttack() > 0 or itType:getDefense() > 0)
	local hasArmor  = (itType:getArmor() > 0)
	local hasHit    = (itType:getHitChance() > 0)
	local hasSkill  = false

	local abilities = itType:getAbilities()
	if abilities and abilities.skills then
		for _, skillName in ipairs({ "fist", "club", "sword", "axe", "distance", "shield", "magic" }) do
			local skillId = getSkillId(skillName)
			if skillId then
				local val = abilities.skills[skillId]
				if val and val > 0 then
					hasSkill = true
					print(string.format("[Stats] Item %d has skill bonus: %s = %d", item:getId(), skillName, val))
					break
				end
			end
		end
	end

	local hasSpecialSkill = false
	if abilities and abilities.specialSkills then
		for _, spec in ipairs({
			"criticalHitChance", "criticalHitAmount",
			"manaLeechChance", "manaLeechAmount",
			"lifeLeechChance", "lifeLeechAmount"
		}) do
			local val = abilities.specialSkills[spec]
			if val and val > 0 then
				hasSpecialSkill = true
				print(string.format("[Stats] Item %d has special stat: %s = %s", item:getId(), spec, val))
				break
			end
		end
	end

	-- Show if stats were found
	if hasWeapon or hasArmor or hasHit or hasSkill or hasSpecialSkill then
		print(string.format("[Stats] Item %d has relevant stats.", item:getId()))
	end

	return hasWeapon or hasArmor or hasHit or hasSkill or hasSpecialSkill
end

-- rarity table
local rarities = {
	{ id = 1,  chance = 15.0, name = "Common" },
	{ id = 2,  chance = 14.0, name = "Uncommon" },
	{ id = 3,  chance = 12.0, name = "Rare" },
	{ id = 4,  chance = 10.0, name = "Epic" },
	{ id = 5,  chance = 8.5,  name = "Legendary" },
	{ id = 6,  chance = 7.0,  name = "Exotic" },
	{ id = 7,  chance = 6.0,  name = "Mythic" },
	{ id = 8,  chance = 4.5,  name = "Chaos" },
	{ id = 9,  chance = 3.8,  name = "Eternal" },
	{ id = 10, chance = 3.0,  name = "Divine" },
	{ id = 11, chance = 2.3,  name = "Phantasmal" },
	{ id = 12, chance = 1.7,  name = "Celestial" },
	{ id = 13, chance = 1.2,  name = "Cosmic" },
	{ id = 14, chance = 0.8,  name = "Abyssal" },
	{ id = 15, chance = 0.5,  name = "Transcendent" }
}

local function rollRarity()
	-- Fix: Use math.random() directly
	if math.random(100) > 70 then return 0 end
	
	for _, r in ipairs(rarities) do
		-- Fix: Ensure we're comparing numbers
		local randomRoll = math.random(100)
		if randomRoll and r.chance and randomRoll <= r.chance then
			print(string.format("[Rarity] Rolled rarity: %s (%d)", r.name, r.id))
			return r.id
		end
	end
	return 0
end

local function getRarityName(id)
	for _, r in ipairs(rarities) do
		if r.id == id then return r.name end
	end
	return "Common"
end

local function getCustomLootDescription(corpse)
	local parts = {}
	for slot = 0, corpse:getSize() - 1 do
		local item = corpse:getItem(slot)
		if type(item) == "userdata" and item:isItem() then
			local count = item:getCount()
			local baseName = ItemType(item:getId()):getName()
			local rarityId = item:getCustomAttribute("rarity")
			if rarityId and rarityId > 0 then
				baseName = string.format("[%s] %s", getRarityName(rarityId), baseName)
			end
			if count > 1 then
				baseName = string.format("%dx %s", count, baseName)
			end
			table.insert(parts, baseName)
		end
	end
	return table.concat(parts, ", ")
end

ec.onDropLoot = function(self, corpse)
    if configManager.getNumber(configKeys.RATE_LOOT) == 0 then return end

    local player = Player(corpse:getCorpseOwner())
    local mType = self:getType()

    if player and player:getStamina() <= 840 then
        local text = ("Loot of %s: nothing (due to low stamina)"):format(mType:getNameDescription())
        local party = player:getParty()
        if party then party:broadcastPartyLoot(text)
        else player:sendTextMessage(MESSAGE_LOOT, text) end
        return
    end

    local monsterLoot = mType:getLoot()
    if not monsterLoot then return end
    
    -- Debug information
    print(string.format("[Debug] Monster %s has %d loot entries", mType:getName(), #monsterLoot))
    
    for i = 1, #monsterLoot do
        local lootData = monsterLoot[i]
        -- Use the getLootRandom function if available, otherwise fallback
        local roll = getLootRandom and getLootRandom() or math.random(100000) / 1000
        
        print(string.format("[Debug] Loot roll for item %d: %f vs chance %f", 
            lootData.itemId, roll, lootData.chance))
        
        if roll <= lootData.chance then
            -- Use addItem directly for better compatibility
            local count = 1
            local itemType = ItemType(lootData.itemId)
            
            -- Handle stackable items
            if itemType:isStackable() then
                if lootData.maxCount and lootData.maxCount > 1 then
                    count = math.random(1, lootData.maxCount)
                end
            end
            
            print(string.format("[Debug] Creating item %d with count %d", lootData.itemId, count))
            
            -- Direct method to add the item
            local item = corpse:addItem(lootData.itemId, count)
            
            if not item then
                print(string.format("[DropLoot] Failed to add item to corpse: %d, count: %d", 
                    lootData.itemId, count))
            else
                print(string.format("[DropLoot] Created item: %s (%d)", 
                    ItemType(item:getId()):getName(), item:getId()))
                
                -- Apply rarity logic after item is already in the container
                if hasRelevantStats(item) then
                    local itType = ItemType(item:getId())
                    if itType and itType:getAmmoType() == 0 then
                        local rarity = rollRarity()
                        if rarity > 0 then
                            -- Using setCustomAttribute for compatibility
                            item:setCustomAttribute("rarity", rarity)
                            print(string.format("[DropLoot] Applied rarity %s (%d) to item %d", 
                                getRarityName(rarity), rarity, item:getId()))
                        end
                    end
                end
            end
        end
    end

    -- Rest of your code for adding special items and showing loot
    if math.random(100) <= 3 then
        local sp1 = corpse:addItem(28343, math.random(1, 5))
        local sp2 = corpse:addItem(28344, math.random(1, 3))
        if not sp1 or not sp2 then
            print("[DropLoot] Failed to add special item(s) to corpse.")
        end
    end

    local desc = getCustomLootDescription(corpse)
    if desc == "" then desc = "nothing" end

    local text = ("Loot of %s: %s"):format(mType:getNameDescription(), desc)
    local party = player and player:getParty()
    if party then
        party:broadcastPartyLoot(text)
    elseif player then
        player:sendTextMessage(MESSAGE_LOOT, text)
    end
end

ec:register()