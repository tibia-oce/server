-- data\scripts\custom\itemupgrades\crystals.lua
local CrystalsAction = Action()

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
    player:sendTextMessage(MESSAGE_INFO_DESCR, "Item upgrade level increased to " .. upgrade .. "!")
    player:getPosition():sendMagicEffect(CONST_ME_GIFT_WRAPS)
    player:getPosition():sendMagicEffect(CONST_ME_FIREWORK_YELLOW)

    if target:getItemLevel() == 0 then
        target:setItemLevel(1, true)
    end

    return true
end

--- Handles the Enchant Crystal which adds a random bonus attribute to the item.
-- @param player Player: The player using the crystal
-- @param item Item: The crystal being used
-- @param target Item: The target item
-- @return boolean: True if handled successfully
local function handleEnchantCrystal(player, item, target)
    if not validateNotUnique(player, target) then
        return false
    end

    local itemType = ItemType(target.itemid)
    local weaponType = itemType:getWeaponType()

    if not target:rollAttribute(player, itemType, weaponType, true) then
        player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
        return false
    end

    item:remove(1)
    return true
end

--- Handles the Alter Crystal which removes the last bonus attribute from the item.
-- @param player Player: The player using the crystal
-- @param item Item: The crystal being used
-- @param target Item: The target item
-- @return boolean: True if handled successfully
local function handleAlterCrystal(player, item, target)
    if not validateNotUnique(player, target) then
        return false
    end

    local bonuses = target:getBonusAttributes()
    if not bonuses then
        player:sendTextMessage(MESSAGE_STATUS_WARNING, "Item has no attributes!")
        player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
        return false
    end

    local last = target:getLastSlot()
    target:removeCustomAttribute("Slot" .. last)

    -- Update rarity based on new bonus count
    target:updateRarityByBonusCount()

    item:remove(1)
    player:sendTextMessage(MESSAGE_INFO_DESCR, "Successfully removed last attribute.")
    return true
end

--- Handles the Clean Crystal which removes all bonus attributes from the item.
-- @param player Player: The player using the crystal
-- @param item Item: The crystal being used
-- @param target Item: The target item
-- @return boolean: True if handled successfully
local function handleCleanCrystal(player, item, target)
    if not validateNotUnique(player, target) then
        return false
    end

    local bonuses = target:getBonusAttributes()
    if not bonuses then
        player:sendTextMessage(MESSAGE_STATUS_WARNING, "Item has no attributes!")
        player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
        return false
    end

    for i = 1, #bonuses do
        target:removeCustomAttribute("Slot" .. i)
    end

    -- Set rarity to common after removing all bonuses
    target:setRarity(COMMON)

    item:remove(1)
    player:sendTextMessage(MESSAGE_INFO_DESCR, "Successfully removed all attributes.")
    return true
end

--- Handles the Fortune Crystal which rerolls the value of the last bonus attribute.
-- @param player Player: The player using the crystal
-- @param item Item: The crystal being used
-- @param target Item: The target item
-- @return boolean: True if handled successfully
local function handleFortuneCrystal(player, item, target)
    local bonuses = target:getBonusAttributes()
    if not bonuses then
        player:sendTextMessage(MESSAGE_STATUS_WARNING, "Item has no attributes!")
        player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
        return false
    end

    local last = target:getLastSlot()
    local values = target:getBonusAttribute(last)
    local attr = US_ENCHANTMENTS[values[1]]
    local item_level = target:getItemLevel()

    values[2] = attr.VALUES_PER_LEVEL and math.random(1, math.ceil(item_level * attr.VALUES_PER_LEVEL)) or 1
    target:setAttributeValue(last, values[1] .. "|" .. values[2])

    item:remove(1)
    player:sendTextMessage(MESSAGE_INFO_DESCR, "Successfully rerolled last attribute value.")
    return true
end

--- Handles the Faith Crystal which rerolls the values of all bonus attributes.
-- @param player Player: The player using the crystal
-- @param item Item: The crystal being used
-- @param target Item: The target item
-- @return boolean: True if handled successfully
local function handleFaithCrystal(player, item, target)
    local bonuses = target:getBonusAttributes()
    if not bonuses then
        player:sendTextMessage(MESSAGE_STATUS_WARNING, "Item has no attributes!")
        player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
        return false
    end

    for i = 1, #bonuses do
        local values = bonuses[i]
        local attr = US_ENCHANTMENTS[values[1]]
        local item_level = target:getItemLevel()

        values[2] = attr.VALUES_PER_LEVEL and math.random(1, math.ceil(item_level * attr.VALUES_PER_LEVEL)) or 1
        target:setAttributeValue(i, values[1] .. "|" .. values[2])
    end

    item:remove(1)
    player:sendTextMessage(MESSAGE_INFO_DESCR, "Successfully rerolled all attribute values.")
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

--- Handles the Limitless Crystal which removes level requirements from an item.
-- @param player Player: The player using the crystal
-- @param item Item: The crystal being used
-- @param target Item: The target item
-- @return boolean: True if handled successfully
local function handleLimitlessCrystal(player, item, target)
    if target:isLimitless() then
        player:sendTextMessage(MESSAGE_STATUS_WARNING, "This item is already limitless!")
        player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
        return false
    end

    target:setLimitless(true)
    item:remove(1)
    player:sendTextMessage(MESSAGE_INFO_DESCR, "Required Item Level removed from the item!")
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

--- Handles the Void Crystal which transforms an item into a unique item.
-- @param player Player: The player using the crystal
-- @param item Item: The crystal being used
-- @param target Item: The target item
-- @return boolean: True if handled successfully
local function handleVoidCrystal(player, item, target)
    local usItemType = target:getItemType()
    local canUnique = false

    for i = 1, #US_UNIQUES do
        if US_UNIQUES[i].minLevel <= target:getItemLevel() and bit.band(usItemType, US_UNIQUES[i].itemType) ~= 0 then
            canUnique = true
            break
        end
    end

    if not canUnique then
        player:sendTextMessage(MESSAGE_STATUS_WARNING, "Sorry, there are no Uniques available for this item!")
        player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
        return false
    end

    local unique = math.random(#US_UNIQUES)
    while US_UNIQUES[unique].minLevel > target:getItemLevel() or bit.band(usItemType, US_UNIQUES[unique].itemType) == 0 do
        unique = math.random(#US_UNIQUES)
    end

    local slots = target:getMaxAttributes()
    for i = 1, slots do
        target:removeCustomAttribute("Slot" .. i)
    end

    target:setUnique(unique)
    player:sendTextMessage(MESSAGE_INFO_DESCR, "Unique item " .. target:getUniqueName() .. " discovered!")
    item:remove(1)
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
        [US_CONFIG[1][ITEM_ENCHANT_CRYSTAL]] = handleEnchantCrystal,
        [US_CONFIG[1][ITEM_ALTER_CRYSTAL]] = handleAlterCrystal,
        [US_CONFIG[1][ITEM_CLEAN_CRYSTAL]] = handleCleanCrystal,
        [US_CONFIG[1][ITEM_FORTUNE_CRYSTAL]] = handleFortuneCrystal,
        [US_CONFIG[1][ITEM_FAITH_CRYSTAL]] = handleFaithCrystal,
        [US_CONFIG.ITEM_MIND_CRYSTAL] = handleMindCrystal,
        [US_CONFIG.ITEM_LIMITLESS_CRYSTAL] = handleLimitlessCrystal,
        [US_CONFIG.ITEM_MIRRORED_CRYSTAL] = handleMirroredCrystal,
        [US_CONFIG.ITEM_VOID_CRYSTAL] = handleVoidCrystal
        -- Removed identification scroll
    }

    local handler = crystalHandlers[item.itemid]
    if handler then
        return handler(player, item, target)
    end

    return false
end

-- Register crystal action for all crystal types
CrystalsAction:id(US_CONFIG[1][ITEM_UPGRADE_CRYSTAL], US_CONFIG[1][ITEM_ENCHANT_CRYSTAL],
    US_CONFIG[1][ITEM_ALTER_CRYSTAL], US_CONFIG[1][ITEM_CLEAN_CRYSTAL], US_CONFIG[1][ITEM_FORTUNE_CRYSTAL],
    US_CONFIG[1][ITEM_FAITH_CRYSTAL], US_CONFIG.ITEM_MIND_CRYSTAL, US_CONFIG.ITEM_LIMITLESS_CRYSTAL,
    US_CONFIG.ITEM_MIRRORED_CRYSTAL, US_CONFIG.ITEM_VOID_CRYSTAL)
CrystalsAction:register()
