-- data\scripts\custom\itemupgrades\crystals.lua
dofile('data/scripts/custom/itemupgrades/augments.lua')
local CrystalsAction = Action()

-- Helper function for debugging (optional)
local function debugPrint(player, message)
    player:sendTextMessage(MESSAGE_STATUS_CONSOLE, message)
end

-- Common validation functions
--- Validates if the target item can be modified.
-- @param player Player: The player using the crystal
-- @param item Item: The crystal being used
-- @param target Item: The target item
-- @param toPosition Position: The position of the target
-- @return boolean: True if validation passes, false otherwise
local function validateTarget(player, item, target, toPosition)
    if not target or not target:isItem() or not target:getType():isUpgradable() then
        return false
    end

    if toPosition.y <= CONST_SLOT_AMMO then
        player:sendTextMessage(MESSAGE_STATUS_WARNING, "You can't use that on equipped item!")
        player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
        return false
    end

    return true
end

--- Validates if the target item is not mirrored.
-- @param player Player: The player using the crystal
-- @param target Item: The target item
-- @return boolean: True if validation passes, false otherwise
local function validateNotMirrored(player, target)
    if target:isMirrored() then
        player:sendTextMessage(MESSAGE_STATUS_WARNING, "Sorry, this item is mirrored and can't be modified!")
        player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
        return false
    end

    return true
end

--- Validates if the target item is not unique.
-- @param player Player: The player using the crystal
-- @param target Item: The target item
-- @return boolean: True if validation passes, false otherwise
local function validateNotUnique(player, target)
    if target:isUnique() then
        player:sendTextMessage(MESSAGE_STATUS_WARNING, "You can't modify Unique items' attributes!")
        player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
        return false
    end

    return true
end

-- Crystal-specific functions
--- Handles the Upgrade Crystal which increases item's upgrade level.
-- @param player Player: The player using the crystal
-- @param item Item: The crystal being used
-- @param target Item: The target item
-- @return boolean: True if handled successfully
local function handleUpgradeCrystal(player, item, target)
    local itemType = ItemType(target.itemid)
    if not itemType:isUpgradable() then
        player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
        return false
    end

    local upgrade = target:getUpgradeLevel()
    if upgrade >= US_CONFIG.MAX_UPGRADE_LEVEL then
        player:sendTextMessage(MESSAGE_STATUS_WARNING, "Maximum upgrade level reached!")
        return false
    end

    upgrade = upgrade + 1

    if upgrade >= US_CONFIG.UPGRADE_LEVEL_DESTROY then
        if math.random(100) > US_CONFIG.UPGRADE_DESTROY_CHANCE[upgrade] then
            if player:getItemCount(US_CONFIG.ITEM_UPGRADE_CATALYST) > 0 then
                player:sendTextMessage(MESSAGE_INFO_DESCR, "Upgrade failed! Item protected from being destroyed!")
                player:removeItem(US_CONFIG.ITEM_UPGRADE_CATALYST, 1)
                item:remove(1)
                player:getPosition():sendMagicEffect(CONST_ME_GROUNDSHAKER)
                return true
            end

            player:sendTextMessage(MESSAGE_STATUS_WARNING, "Upgrade failed! Item destroyed!")
            target:remove(1)
            item:remove(1)
            player:getPosition():sendMagicEffect(CONST_ME_GROUNDSHAKER)
            return true
        end
    else
        if math.random(100) > US_CONFIG.UPGRADE_SUCCESS_CHANCE[upgrade] then
            player:sendTextMessage(MESSAGE_STATUS_WARNING, "Upgrade failed! Upgrade level -1!")
            target:reduceUpgradeLevel()
            item:remove(1)
            player:getPosition():sendMagicEffect(CONST_ME_GROUNDSHAKER)
            return true
        end
    end

    target:setUpgradeLevel(upgrade)
    item:remove(1)

    -- Only apply initial item level logic if the item already has attributes
    local bonuses = target:getBonusAttributes()
    if target:getItemLevel() == 0 and bonuses and #bonuses > 0 then
        target:setItemLevel(1, true)
    end

    player:sendTextMessage(MESSAGE_INFO_DESCR, "Item upgrade level increased to " .. upgrade .. "!")
    player:getPosition():sendMagicEffect(CONST_ME_GIFT_WRAPS)
    player:getPosition():sendMagicEffect(CONST_ME_FIREWORK_YELLOW)

    return true
end

--- Handles the Augmenting Crystal (formerly Enchantment Crystal)
--- Adds a modifier to an existing common item
-- @param player Player: The player using the crystal
-- @param item Item: The crystal being used
-- @param target Item: The target item
-- @return boolean: True if handled successfully
local function handleAugmentingCrystal(player, item, target)
    if not validateNotUnique(player, target) then
        return false
    end

    local currentRarityId = target:getRarityId()
    if currentRarityId ~= COMMON then
        player:sendTextMessage(MESSAGE_STATUS_WARNING, "Augmentation can only be used on common items!")
        player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
        return false
    end

    local bonuses = target:getBonusAttributes() or {}
    if #bonuses >= 2 then
        player:sendTextMessage(MESSAGE_STATUS_WARNING, "Item already has the maximum number of modifiers for common rarity.")
        player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
        return false
    end

    local newRarityId = (currentRarityId == COMMON and #bonuses == 1) and RARE or currentRarityId
    local currentItemLevel = target:getItemLevel()
    local existingAttrIds = {}

    for _, bonus in ipairs(bonuses) do
        table.insert(existingAttrIds, bonus[1])
    end

    local newAttrId = rollRandomAttribute(existingAttrIds, currentItemLevel, target:getItemType())
    local newAttr = US_ENCHANTMENTS[newAttrId]
    local newValue = calculateAttributeValue(newAttr, currentItemLevel)

    target:setCustomAttribute("Slot" .. (target:getLastSlot() + 1), newAttrId .. "|" .. newValue)
    target:setAttribute(ITEM_ATTRIBUTE_ACTIONID, target:getActionId())

    -- Upgrade to RARE if this is the second modifier
    if newRarityId ~= currentRarityId then
        target:setRarity(newRarityId)
        player:sendTextMessage(MESSAGE_INFO_DESCR,
            "Item has been augmented and upgraded from " .. US_CONFIG.RARITY[currentRarityId].name .. " to " ..
            US_CONFIG.RARITY[newRarityId].name .. " with a new modifier: " .. newAttr.name .. "!")
    else
        player:sendTextMessage(MESSAGE_INFO_DESCR,
            "Item has been augmented with a new modifier: " .. newAttr.name)
    end
    
    -- Create and add augment if this was a combat enchantment
    if isCombatEnchantment(newAttrId) then
        applyAugmentForEnchantment(target, newAttrId, newValue)
    end

    item:remove(1)
    return true
end



--- Handles the Alteration Crystal
--- Rerolls any existing modifiers of a rare or common item
-- @param player Player: The player using the crystal
-- @param item Item: The crystal being used
-- @param target Item: The target item
-- @return boolean: True if handled successfully
local function handleAlterationCrystal(player, item, target)
    if not validateNotUnique(player, target) then
        return false
    end

    local rarity = target:getRarityId()
    if rarity > RARE then
        player:sendTextMessage(MESSAGE_STATUS_WARNING, "Alteration can only be used on common or rare items!")
        player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
        return false
    end

    local bonuses = target:getBonusAttributes()
    if not bonuses then
        player:sendTextMessage(MESSAGE_STATUS_WARNING, "Item has no modifiers to alter!")
        player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
        return false
    end

    -- Remove all augments before changing enchantments
    removeAllAugments(target)

    -- Clear all existing modifiers
    for i = 1, #bonuses do
        target:removeCustomAttribute("Slot" .. i)
    end

    -- Set rarity randomly to either common or rare
    local newRarity = math.random(1, 2) -- Either COMMON (1) or RARE (2)
    target:setRarity(newRarity)

    -- Generate new modifiers based on the new rarity
    local itemType = ItemType(target.itemid)
    local weaponType = itemType:getWeaponType()
    target:rollAttribute(nil, itemType, weaponType, true)
    
    -- Synchronize augments with the new enchantments
    syncItemAugments(target)

    item:remove(1)
    player:sendTextMessage(MESSAGE_INFO_DESCR, "Item has been altered to " .. target:getRarity().name .. "!")
    return true
end

--- Handles the Scouring Crystal (formerly Clean Crystal)
--- Removes all modifiers from an item
-- @param player Player: The player using the crystal
-- @param item Item: The crystal being used
-- @param target Item: The target item
-- @return boolean: True if handled successfully
local function handleScouringCrystal(player, item, target)
    if not validateNotUnique(player, target) then
        return false
    end

    local bonuses = target:getBonusAttributes()
    if not bonuses then
        player:sendTextMessage(MESSAGE_STATUS_WARNING, "Item has no attributes!")
        player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
        return false
    end

    -- Remove all augments
    removeAllAugments(target)

    -- Remove all enchantments
    for i = 1, #bonuses do
        target:removeCustomAttribute("Slot" .. i)
    end

    -- Set rarity to common after removing all bonuses
    target:setRarity(COMMON)

    item:remove(1)
    player:sendTextMessage(MESSAGE_INFO_DESCR, "All modifiers have been scoured from the item.")
    return true
end

--- Handles the Exaltation Crystal
--- Adds a new modifier to an item with existing modifiers
-- @param player Player: The player using the crystal
-- @param item Item: The crystal being used
-- @param target Item: The target item
-- @return boolean: True if handled successfully
local function handleExaltationCrystal(player, item, target)
    if not validateNotUnique(player, target) then
        return false
    end

    local bonuses = target:getBonusAttributes()
    if not bonuses or #bonuses == 0 then
        player:sendTextMessage(MESSAGE_STATUS_WARNING, "Item needs at least one existing modifier!")
        player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
        return false
    end

    if #bonuses >= 4 then
        player:sendTextMessage(MESSAGE_STATUS_WARNING, "Item already has the maximum number of modifiers!")
        player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
        return false
    end

    local currentRarityId = target:getRarityId()
    local newRarityId = currentRarityId + 1

    -- Make sure the next rarity exists in config
    if not US_CONFIG.RARITY[newRarityId] then
        player:sendTextMessage(MESSAGE_STATUS_WARNING, "Item is already at maximum rarity.")
        player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
        return false
    end

    local currentItemLevel = target:getItemLevel()
    local existingAttrIds = {}

    for _, bonus in ipairs(bonuses) do
        table.insert(existingAttrIds, bonus[1])
    end

    local newAttrId = rollRandomAttribute(existingAttrIds, currentItemLevel, target:getItemType())
    local newAttr = US_ENCHANTMENTS[newAttrId]
    local newValue = calculateAttributeValue(newAttr, currentItemLevel)

    target:setCustomAttribute("Slot" .. (target:getLastSlot() + 1), newAttrId .. "|" .. newValue)
    target:setRarity(newRarityId)
    target:setAttribute(ITEM_ATTRIBUTE_ACTIONID, target:getActionId())
    
    -- Create and add augment if this was a combat enchantment
    if isCombatEnchantment(newAttrId) then
        applyAugmentForEnchantment(target, newAttrId, newValue)
    end

    item:remove(1)

    player:sendTextMessage(MESSAGE_INFO_DESCR,
        "Item has been exalted and upgraded from " .. US_CONFIG.RARITY[currentRarityId].name .. " to " ..
            US_CONFIG.RARITY[newRarityId].name .. " with a new modifier: " .. newAttr.name .. "!")

    return true
end

--- Handles the Chaos Crystal (formerly Faith Crystal)
--- Rerolls the rarity and all modifiers of the item
-- @param player Player: The player using the crystal
-- @param item Item: The crystal being used
-- @param target Item: The target item
-- @return boolean: True if handled successfully
local function handleChaosCrystal(player, item, target)
    if not validateNotUnique(player, target) then
        return false
    end

    local bonuses = target:getBonusAttributes()
    if not bonuses then
        player:sendTextMessage(MESSAGE_STATUS_WARNING, "Item has no modifiers to chaos reroll!")
        player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
        return false
    end

    -- Remove all augments
    removeAllAugments(target)

    -- Clear all existing modifiers
    for i = 1, #bonuses do
        target:removeCustomAttribute("Slot" .. i)
    end

    -- Roll a new rarity
    target:rollRarity()

    -- Generate new modifiers based on the new rarity
    local itemType = ItemType(target.itemid)
    local weaponType = itemType:getWeaponType()
    target:rollAttribute(nil, itemType, weaponType, true)
    
    -- Synchronize augments with the new enchantments
    syncItemAugments(target)

    item:remove(1)
    player:sendTextMessage(MESSAGE_INFO_DESCR,
        "Chaotic forces have rerolled the item to " .. target:getRarity().name .. "!")
    return true
end

--- Handles the Mind Crystal which copies or applies bonus attributes.
-- @param player Player: The player using the crystal
-- @param item Item: The crystal being used
-- @param target Item: The target item
-- @return boolean: True if handled successfully
local function handleMindCrystal(player, item, target)
    if not item:hasMemory() then
        -- Crystal has no memory - try to copy attributes from target
        if not target:getBonusAttributes() then
            player:sendTextMessage(MESSAGE_STATUS_WARNING, "Sorry, this item doesn't have any attributes!")
            player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
            return false
        end

        if target:isUnique() then
            player:sendTextMessage(MESSAGE_STATUS_WARNING, "Sorry, this item is Unique and can't be copied!")
            player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
            return false
        end

        local crystal = Game.createItem(item.itemid, 1)
        local maxAttr = target:getMaxAttributes()

        for i = 1, maxAttr do
            local attr = target:getBonusAttribute(i)
            if attr then
                crystal:addAttribute(i, attr[1], attr[2])
                target:removeCustomAttribute("Slot" .. i)
            end
        end

        crystal:setMemory(true)

        if player:addItemEx(crystal) then
            player:sendTextMessage(MESSAGE_INFO_DESCR, "Item attributes saved into crystal's memory!")
            item:remove(1)

            -- Update target's rarity after removing all attributes
            target:setRarity(COMMON)
            return true
        end
    else
        -- Crystal has memory - try to apply attributes to target
        if target:getBonusAttributes() then
            player:sendTextMessage(MESSAGE_STATUS_WARNING, "Sorry, this item already has attributes!")
            player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
            return false
        end

        local maxAttr = target:getMaxAttributes()
        for i = 1, maxAttr do
            local attr = item:getBonusAttribute(i)
            if attr then
                target:addAttribute(i, attr[1], attr[2])
            end
        end

        -- Update target's rarity based on applied attributes
        target:updateRarityByBonusCount()

        item:remove(1)
        player:sendTextMessage(MESSAGE_INFO_DESCR, "Successfully applied attributes to item!")
        return true
    end

    return false
end

--- Handles the Annulment Crystal (formerly Limitless Crystal)
--- Removes one random modifier from an item
-- @param player Player: The player using the crystal
-- @param item Item: The crystal being used
-- @param target Item: The target item
-- @return boolean: True if handled successfully
local function handleAnnulmentCrystal(player, item, target)
    if not validateNotUnique(player, target) then
        return false
    end

    local bonuses = target:getBonusAttributes()
    if not bonuses or #bonuses == 0 then
        player:sendTextMessage(MESSAGE_STATUS_WARNING, "Item has no attributes!")
        player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
        return false
    end

    -- Select a random slot to remove
    local slotToRemove = math.random(1, #bonuses)

    -- Save attribute info for message
    local attributeInfo = target:getBonusAttribute(slotToRemove)
    if not attributeInfo then
        player:sendTextMessage(MESSAGE_STATUS_WARNING, "Error accessing attribute!")
        return false
    end
    local attrName = US_ENCHANTMENTS[attributeInfo[1]].name

    -- Save all attributes except the one to remove
    local tempAttributes = {}
    for i = 1, #bonuses do
        if i ~= slotToRemove then
            local attr = target:getBonusAttribute(i)
            if attr then
                tempAttributes[#tempAttributes + 1] = {
                    id = attr[1],
                    value = attr[2]
                }
            end
        end
    end

    -- Clear all attributes
    for i = 1, #bonuses do
        target:removeCustomAttribute("Slot" .. i)
    end

    -- Re-add remaining attributes in order
    for i = 1, #tempAttributes do
        target:setCustomAttribute("Slot" .. i, tempAttributes[i].id .. "|" .. tempAttributes[i].value)
    end

    -- Update rarity based on new count
    target:updateRarityByBonusCount()

    item:remove(1)
    player:sendTextMessage(MESSAGE_INFO_DESCR, "Annulled " .. attrName .. " modifier from the item.")
    return true
end

--- Handles the Mirrored Crystal which creates a copy of the target item.
-- @param player Player: The player using the crystal
-- @param item Item: The crystal being used
-- @param target Item: The target item
-- @return boolean: True if handled successfully
local function handleMirroredCrystal(player, item, target)
    local copy = Game.createItem(target.itemid, 1)
    copy:setRarity(target:getRarityId())
    copy:setCustomAttribute("upgrade", target:getUpgradeLevel())
    copy:setCustomAttribute("item_level", target:getItemLevel())

    if target:getBonusAttributes() then
        for i = 1, target:getMaxAttributes() do
            local attr = target:getBonusAttribute(i)
            if attr then
                copy:addAttribute(i, attr[1], attr[2])
            end
        end
    end

    if target:isUnique() then
        copy:setCustomAttribute("unique", target:getUnique())
    end

    if target:isLimitless() then
        copy:setLimitless(true)
    end

    -- Copy all item attributes
    local attributes = {ITEM_ATTRIBUTE_ATTACK, ITEM_ATTRIBUTE_DEFENSE, ITEM_ATTRIBUTE_EXTRADEFENSE,
                        ITEM_ATTRIBUTE_ARMOR, ITEM_ATTRIBUTE_HITCHANCE}

    for _, attr in ipairs(attributes) do
        local value = target:getAttribute(attr)
        if value > 0 then
            copy:setAttribute(attr, value)
        end
    end

    copy:setMirrored(true)

    if player:addItemEx(copy) then
        player:sendTextMessage(MESSAGE_INFO_DESCR, "Item mirrored and placed in your backpack!")
        item:remove(1)
        return true
    end

    return false
end

--- Handles the Divining Crystal (formerly Void Crystal)
--- Rerolls all modifier values at random
-- @param player Player: The player using the crystal
-- @param item Item: The crystal being used
-- @param target Item: The target item
-- @return boolean: True if handled successfully
local function handleDiviningCrystal(player, item, target)
    if not validateNotUnique(player, target) then
        return false
    end

    local bonuses = target:getBonusAttributes()
    if not bonuses or #bonuses == 0 then
        player:sendTextMessage(MESSAGE_STATUS_WARNING, "Item has no modifiers to divine!")
        player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
        return false
    end

    -- Reroll each attribute value
    for i = 1, #bonuses do
        local attr = US_ENCHANTMENTS[bonuses[i][1]]

        -- Calculate new value
        local newValue = 1
        if attr.percentage then
            newValue = math.random(1, US_CONFIG.MAX_PERCENTAGE_ROLL)
        else
            local item_level = target:getItemLevel()
            if attr.VALUES_PER_LEVEL then
                local maxValue = math.ceil(item_level * attr.VALUES_PER_LEVEL)
                if maxValue >= 1 then
                    newValue = math.random(1, maxValue)
                end
            end
        end

        -- Update the attribute value
        target:setCustomAttribute("Slot" .. i, bonuses[i][1] .. "|" .. newValue)
    end

    item:remove(1)
    player:sendTextMessage(MESSAGE_INFO_DESCR, "All modifier values have been divined anew!")
    return true
end

-- Main function to handle crystal use
function CrystalsAction.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if not validateTarget(player, item, target, toPosition) then
        return false
    end

    if not validateNotMirrored(player, target) then
        return true
    end

    -- Crystal type handlers mapping
    local crystalHandlers = {
        [US_CONFIG[1][ITEM_UPGRADE_CRYSTAL]] = handleUpgradeCrystal,
        [US_CONFIG[1][ITEM_AUGMENTING_CRYSTAL]] = handleAugmentingCrystal,
        [US_CONFIG[1][ITEM_ALTER_CRYSTAL]] = handleAlterationCrystal,
        [US_CONFIG[1][ITEM_SCOURING_CRYSTAL]] = handleScouringCrystal,
        [US_CONFIG[1][ITEM_EXALT_CRYSTAL]] = handleExaltationCrystal,
        [US_CONFIG[1][ITEM_CHAOS_CRYSTAL]] = handleChaosCrystal,
        [US_CONFIG.ITEM_MIND_CRYSTAL] = handleMindCrystal,
        [US_CONFIG.ITEM_ANNULMENT_CRYSTAL] = handleAnnulmentCrystal,
        [US_CONFIG.ITEM_MIRRORED_CRYSTAL] = handleMirroredCrystal,
        [US_CONFIG.ITEM_DIVINE_CRYSTAL] = handleDiviningCrystal
    }

    local handler = crystalHandlers[item.itemid]
    if handler then
        return handler(player, item, target)
    end

    return false
end

-- Register crystal action for all crystal types
CrystalsAction:id(US_CONFIG[1][ITEM_UPGRADE_CRYSTAL], US_CONFIG[1][ITEM_AUGMENTING_CRYSTAL],
    US_CONFIG[1][ITEM_ALTER_CRYSTAL], US_CONFIG[1][ITEM_SCOURING_CRYSTAL], US_CONFIG[1][ITEM_EXALT_CRYSTAL],
    US_CONFIG[1][ITEM_CHAOS_CRYSTAL], US_CONFIG.ITEM_MIND_CRYSTAL, US_CONFIG.ITEM_ANNULMENT_CRYSTAL,
    US_CONFIG.ITEM_MIRRORED_CRYSTAL, US_CONFIG.ITEM_DIVINE_CRYSTAL)
CrystalsAction:register()
