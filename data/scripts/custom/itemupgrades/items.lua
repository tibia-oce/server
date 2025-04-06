-- data\scripts\custom\itemupgrades\items.lua
--- Roll a random attribute for an item
-- @param self Item: The item to roll attributes for
-- @param player Player: The player (optional for unidentified items)
-- @param itemType ItemType: The type of the item
-- @param weaponType number: The weapon type
-- @param unidentify boolean: True if this is for an unidentified item
-- @return boolean: True if successful
function Item.rollAttribute(self, player, itemType, weaponType, unidentify)
    if not itemType:isUpgradable() or self:isUnique() then
        return false
    end

    local attrIds = {}
    local item_level = self:getItemLevel()

    if unidentify then
        -- Get exact number of bonus slots based on rarity
        local bonusCount = self:getRarity().maxBonus
        local usItemType = self:getItemType()

        -- Roll attributes for each bonus slot
        for i = 1, bonusCount do
            local attrId = rollRandomAttribute(attrIds, item_level, usItemType)
            table.insert(attrIds, attrId)

            local attr = US_ENCHANTMENTS[attrId]
            local value = calculateAttributeValue(attr, item_level)
            self:setCustomAttribute("Slot" .. i, attrId .. "|" .. value)

            -- If this is a combat-related enchantment, add an augment
            if isCombatEnchantment(attrId) then
                applyAugmentForEnchantment(self, attrId, value)
            end
        end
        return true
    else
        -- Add a single attribute through crafting
        local bonuses = self:getBonusAttributes()
        if bonuses then
            local maxPossibleBonuses = US_CONFIG.RARITY[#US_CONFIG.RARITY].maxBonus
            if #bonuses >= maxPossibleBonuses then
                if player then
                    player:sendTextMessage(MESSAGE_STATUS_WARNING, "Max number of bonuses reached!")
                end
                return false
            end

            -- Collect existing attribute IDs
            for v, k in pairs(bonuses) do
                table.insert(attrIds, k[1])
            end
        end

        -- Roll a new attribute
        local usItemType = self:getItemType()
        local attrId = rollRandomAttribute(attrIds, item_level, usItemType)
        local attr = US_ENCHANTMENTS[attrId]
        local value = calculateAttributeValue(attr, item_level)

        -- Add the new attribute
        self:setCustomAttribute("Slot" .. self:getLastSlot() + 1, attrId .. "|" .. value)

        -- If this is a combat-related enchantment, add an augment
        if isCombatEnchantment(attrId) then
            applyAugmentForEnchantment(self, attrId, value)
        end

        -- Update rarity based on new bonus count
        self:updateRarityByBonusCount()

        return true
    end
end

--- Roll a random upgrade level based on config chances
-- @return number: The rolled upgrade level
function rollUpgradeLevel()
    local upgrade_level = 1
    for i = US_CONFIG.MAX_UPGRADE_LEVEL, 1, -1 do
        if i >= US_CONFIG.UPGRADE_LEVEL_DESTROY then
            if math.random(100) <= US_CONFIG.UPGRADE_DESTROY_CHANCE[i] then
                upgrade_level = i
                break
            end
        else
            if math.random(100) <= US_CONFIG.UPGRADE_SUCCESS_CHANCE[i] then
                upgrade_level = i
                break
            end
        end
    end
    return upgrade_level
end

--- Roll a random attribute that may or may not allow duplicates
-- @param existingAttrIds table: Array of existing attribute IDs
-- @param item_level number: The item level
-- @param usItemType number: The item type
-- @return number: The rolled attribute ID
function rollRandomAttribute(existingAttrIds, item_level, usItemType)
    local attrId = math.random(1, #US_ENCHANTMENTS)
    local attr = US_ENCHANTMENTS[attrId]

    while ( -- Check duplicates only if ALLOW_DUPLICATE_ENCHANTS is false
    (not US_CONFIG.ALLOW_DUPLICATE_ENCHANTS and isInArray(existingAttrIds, attrId)) -- or (attr.minLevel and item_level < attr.minLevel)
    or (bit.band(usItemType, attr.itemType) == 0) or (attr.chance and math.random(100) >= attr.chance)) do
        attrId = math.random(1, #US_ENCHANTMENTS)
        attr = US_ENCHANTMENTS[attrId]
    end

    return attrId
end

--- Calculate an attribute value based on item level
-- @param attr table: The attribute information
-- @param item_level number: The item level
-- @return number: The calculated value
function calculateAttributeValue(attr, item_level)
    if attr.percentage then
        -- Fixed range of 1-10% for percentage-based enchantments
        return math.random(1, US_CONFIG.MAX_PERCENTAGE_ROLL)
    elseif attr.VALUES_PER_LEVEL then
        -- For non-percentage attributes
        local maxValue = math.ceil(item_level * attr.VALUES_PER_LEVEL)
        if maxValue < 1 then
            return 1
        else
            return math.random(1, maxValue)
        end
    else
        return 1
    end
end

--- Add an attribute to an item
-- @param self Item: The item to add the attribute to
-- @param slot number: The slot index
-- @param attr number: The attribute ID
-- @param value number: The attribute value
function Item.addAttribute(self, slot, attr, value)
    self:setCustomAttribute("Slot" .. slot, attr .. "|" .. value)
end

--- Set the value of an existing attribute
-- @param self Item: The item to modify
-- @param slot number: The slot index
-- @param value string: The new attribute value string
function Item.setAttributeValue(self, slot, value)
    self:setCustomAttribute("Slot" .. slot, value)
    self:setAttribute(ITEM_ATTRIBUTE_ACTIONID, self:getActionId())
    return true
end

--- Get a specific bonus attribute from an item
-- @param self Item: The item to get the attribute from
-- @param slot number: The slot index
-- @return table: The attribute data (ID and value)
function Item.getBonusAttribute(self, slot)
    local bonuses = self:getCustomAttribute("Slot" .. slot)
    if bonuses then
        local data = {}
        for bonus in bonuses:gmatch("([^|]+)") do
            data[#data + 1] = tonumber(bonus)
        end
        return data
    end
    return nil
end

--- Get all bonus attributes from an item
-- @param self Item: The item to get attributes from
-- @return table: Array of attribute data
function Item.getBonusAttributes(self)
    local data = {}
    for i = 1, self:getMaxAttributes() do
        local bonuses = self:getCustomAttribute("Slot" .. i)
        if bonuses then
            local t = {}
            for bonus in bonuses:gmatch("([^|]+)") do
                t[#t + 1] = tonumber(bonus)
            end
            data[#data + 1] = t
        end
    end
    return #data > 0 and data or nil
end

--- Get the last used attribute slot
-- @param self Item: The item to check
-- @return number: The last slot index with an attribute
function Item.getLastSlot(self)
    local last = 0
    for i = 1, self:getMaxAttributes() do
        if self:getCustomAttribute("Slot" .. i) then
            last = i
        end
    end
    return last
end

--- Update the rarity of an item based on its bonus count
-- @param self Item: The item to update
function Item.updateRarityByBonusCount(self)
    local bonuses = self:getBonusAttributes()
    if bonuses then
        local count = #bonuses

        -- Set to appropriate rarity based on exact bonus count
        for i = 1, #US_CONFIG.RARITY do
            if US_CONFIG.RARITY[i].maxBonus == count then
                self:setRarity(i)
                break
            end
        end
    else
        -- No bonuses, set to common
        self:setRarity(COMMON)
    end
    self:setAttribute(ITEM_ATTRIBUTE_ACTIONID, self:getActionId())

    -- Make sure augments match enchantments
    syncItemAugments(self)
end

--- Set the item level of an item
-- @param self Item: The item to set the level for
-- @param level number: The new item level
-- @param first boolean: True if this is the first time setting the level
-- @return boolean: True if successful
function Item.setItemLevel(self, level, first)
    local oldLevel = self:getItemLevel()
    local itemType = ItemType(self.itemid)
    local finalValue = 0
    local value = 0

    -- Calculate level difference
    if oldLevel < level then
        value = (level - oldLevel)
    else
        value = (oldLevel - level)
    end

    -- Update attack
    if itemType:getAttack() > 0 then
        finalValue = calculateAttributeChangeValue(value, US_CONFIG.ATTACK_PER_ITEM_LEVEL,
            US_CONFIG.ATTACK_FROM_ITEM_LEVEL)
        updateItemAttribute(self, ITEM_ATTRIBUTE_ATTACK, itemType:getAttack(), finalValue, oldLevel < level)
    end

    -- Update defense
    if itemType:getDefense() > 0 then
        finalValue = calculateAttributeChangeValue(value, US_CONFIG.DEFENSE_PER_ITEM_LEVEL,
            US_CONFIG.DEFENSE_FROM_ITEM_LEVEL)
        updateItemAttribute(self, ITEM_ATTRIBUTE_DEFENSE, itemType:getDefense(), finalValue, oldLevel < level)
    end

    -- Update armor
    if itemType:getArmor() > 0 then
        finalValue = calculateAttributeChangeValue(value, US_CONFIG.ARMOR_PER_ITEM_LEVEL,
            US_CONFIG.ARMOR_FROM_ITEM_LEVEL)
        updateItemAttribute(self, ITEM_ATTRIBUTE_ARMOR, itemType:getArmor(), finalValue, oldLevel < level)
    end

    -- Update hit chance
    if itemType:getHitChance() > 0 then
        finalValue = calculateAttributeChangeValue(value, US_CONFIG.HITCHANCE_PER_ITEM_LEVEL,
            US_CONFIG.HITCHANCE_FROM_ITEM_LEVEL)
        updateItemAttribute(self, ITEM_ATTRIBUTE_HITCHANCE, itemType:getHitChance(), finalValue, oldLevel < level)
    end

    -- Adjust level based on item stats for first-time calculation
    if first then
        if itemType:getAttack() > 0 then
            level = level + math.floor(itemType:getAttack() / US_CONFIG.ITEM_LEVEL_PER_ATTACK)
        end
        if itemType:getDefense() > 0 then
            level = level + math.floor(itemType:getDefense() / US_CONFIG.ITEM_LEVEL_PER_DEFENSE)
        end
        if itemType:getArmor() > 0 then
            level = level + math.floor(itemType:getArmor() / US_CONFIG.ITEM_LEVEL_PER_ARMOR)
        end
        if itemType:getHitChance() > 0 then
            level = level + math.floor(itemType:getHitChance() / US_CONFIG.ITEM_LEVEL_PER_HITCHANCE)
        end
    end

    return self:setCustomAttribute("item_level", level)
end

--- Calculate the value change for an attribute based on level difference
-- @param valueDiff number: The level difference
-- @param perLevel number: The attribute points per level
-- @param fromLevel number: The attribute points from level
-- @return number: The calculated value change
function calculateAttributeChangeValue(valueDiff, perLevel, fromLevel)
    if valueDiff >= perLevel then
        return math.floor((valueDiff / perLevel) * fromLevel)
    else
        return 0
    end
end

--- Update an item attribute based on level change
-- @param item Item: The item to update
-- @param attrType number: The attribute type
-- @param baseValue number: The base value of the attribute
-- @param changeValue number: The value to change by
-- @param isIncrease boolean: True if increasing, false if decreasing
function updateItemAttribute(item, attrType, baseValue, changeValue, isIncrease)
    local attrNameMap = {
        [ITEM_ATTRIBUTE_ATTACK] = "Attack",
        [ITEM_ATTRIBUTE_DEFENSE] = "Defense",
        [ITEM_ATTRIBUTE_ARMOR] = "Armor"
        -- [ITEM_ATTRIBUTE_EXTRADEFENSE] = "Extra Defense",
        -- [ITEM_ATTRIBUTE_HITCHANCE] = "Hit Chance"
    }
    local attrName = attrNameMap[attrType] or ("Attribute " .. tostring(attrType))
    local configKey = attrName:upper():gsub(" ", "_") .. "_PER_UPGRADE"
    local perUpgrade = US_CONFIG[configKey] or 0
    baseValue = baseValue or 0
    local currentValue = item:getAttribute(attrType) or 0
    local newValue

    if isIncrease then
        if changeValue == 0 and currentValue < baseValue then
            -- Force to (baseValue + perUpgrade) if there's no real "changeValue" but we haven't reached baseValue yet
            newValue = baseValue + perUpgrade
        else
            -- Either use currentValue or baseValue, whichever was non-zero
            newValue = (currentValue > 0) and (currentValue + changeValue) or (baseValue + changeValue)
        end
    else
        newValue = (currentValue > 0) and (currentValue - changeValue) or (baseValue - changeValue)
    end

    item:setAttribute(attrType, newValue)
end

--- Get the item level of an item
-- @param self Item: The item to get the level from
-- @return number: The item level
function Item.getItemLevel(self)
    return self:getCustomAttribute("item_level") and self:getCustomAttribute("item_level") or 0
end

--- Set the upgrade level of an item
-- @param self Item: The item to upgrade
-- @param level number: The new upgrade level
function Item.setUpgradeLevel(self, level)
    local itemType = ItemType(self.itemid)
    local oldLevel = self:getUpgradeLevel()

    -- Update attributes based on upgrade level
    if itemType:getAttack() > 0 then
        updateUpgradeAttribute(self, ITEM_ATTRIBUTE_ATTACK, US_CONFIG.ATTACK_PER_UPGRADE, oldLevel, level)
    end

    if itemType:getDefense() > 0 then
        updateUpgradeAttribute(self, ITEM_ATTRIBUTE_DEFENSE, US_CONFIG.DEFENSE_PER_UPGRADE, oldLevel, level)
    end

    if itemType:getExtraDefense() > 0 then
        if oldLevel < level then
            self:setAttribute(ITEM_ATTRIBUTE_EXTRADEFENSE,
                itemType:getExtraDefense() + (level - oldLevel) * US_CONFIG.EXTRADEFENSE_PER_UPGRADE)
        else
            self:setAttribute(ITEM_ATTRIBUTE_EXTRADEFENSE, self:getAttribute(ITEM_ATTRIBUTE_EXTRADEFENSE) -
                (oldLevel - level) * US_CONFIG.EXTRADEFENSE_PER_UPGRADE)
        end
    end

    if itemType:getArmor() > 0 then
        updateUpgradeAttribute(self, ITEM_ATTRIBUTE_ARMOR, US_CONFIG.ARMOR_PER_UPGRADE, oldLevel, level)
    end

    if itemType:getHitChance() > 0 then
        updateUpgradeAttribute(self, ITEM_ATTRIBUTE_HITCHANCE, US_CONFIG.HITCHANCE_PER_UPGRADE, oldLevel, level)
    end

    self:setCustomAttribute("upgrade", level)

    -- Increase item level based on upgrade level change
    if oldLevel < level then
        self:setItemLevel(self:getItemLevel() + (US_CONFIG.ITEM_LEVEL_PER_UPGRADE * (level - oldLevel)))
    end
end

--- Update an attribute based on upgrade level change
-- @param item Item: The item to update
-- @param attrType number: The attribute type
-- @param perUpgrade number: The attribute points per upgrade level
-- @param oldLevel number: The old upgrade level
-- @param newLevel number: The new upgrade level
function updateUpgradeAttribute(item, attrType, perUpgrade, oldLevel, newLevel)
    local currentValue = item:getAttribute(attrType)

    if oldLevel < newLevel then
        item:setAttribute(attrType, currentValue + (newLevel - oldLevel) * perUpgrade)
    else
        item:setAttribute(attrType, currentValue - (oldLevel - newLevel) * perUpgrade)
    end
end

--- Get the upgrade level of an item
-- @param self Item: The item to get the upgrade level from
-- @return number: The upgrade level
function Item.getUpgradeLevel(self)
    return self:getCustomAttribute("upgrade") and self:getCustomAttribute("upgrade") or 0
end

--- Reduce the upgrade level of an item by 1
-- @param self Item: The item to reduce
function Item.reduceUpgradeLevel(self)
    self:setUpgradeLevel(self:getUpgradeLevel() - 1)
    self:setItemLevel(self:getItemLevel() - US_CONFIG.ITEM_LEVEL_PER_UPGRADE)
end

--- Check if an item is unidentified (always returns false now)
-- @param self Item: The item to check
-- @return boolean: Always false as items are no longer unidentified
function Item.isUnidentified(self)
    return false
end

--- Set an item as a unique item
-- @param self Item: The item to make unique
-- @param uniqueId number: The unique item ID
function Item.setUnique(self, uniqueId)
    self:setCustomAttribute("unique", uniqueId)
    local unique = US_UNIQUES[uniqueId]
    if unique then
        for i = 1, #unique.attributes do
            local attrId = unique.attributes[i]
            local attr = US_ENCHANTMENTS[attrId]
            local value = attr.VALUES_PER_LEVEL and
                              math.random(1, math.ceil(self:getItemLevel() * attr.VALUES_PER_LEVEL)) or 1
            self:setCustomAttribute("Slot" .. self:getLastSlot() + 1, attrId .. "|" .. value)
        end
    end
end

--- Get the unique ID of an item
-- @param self Item: The item to check
-- @return number: The unique ID or nil if not unique
function Item.getUnique(self)
    return self:getCustomAttribute("unique") and self:getCustomAttribute("unique") or nil
end

--- Check if an item is unique
-- @param self Item: The item to check
-- @return boolean: True if the item is unique
function Item.isUnique(self)
    return self:getCustomAttribute("unique") and true or false
end

--- Get the unique name of an item
-- @param self Item: The unique item
-- @return string: The unique name
function Item.getUniqueName(self)
    return US_UNIQUES[self:getUnique()].name
end

--- Set memory attribute for a crystal
-- @param self Item: The crystal
-- @param value boolean: The memory state
function Item.setMemory(self, value)
    self:setCustomAttribute("memory", value)
end

--- Check if a crystal has memory
-- @param self Item: The crystal to check
-- @return boolean: True if the crystal has memory
function Item.hasMemory(self)
    return self:getCustomAttribute("memory")
end

--- Set an item as limitless (no level requirement)
-- @param self Item: The item to make limitless
-- @param value boolean: The limitless state
function Item.setLimitless(self, value)
    self:setCustomAttribute("limitless", value)
end

--- Check if an item is limitless
-- @param self Item: The item to check
-- @return boolean: True if the item is limitless
function Item.isLimitless(self)
    return self:getCustomAttribute("limitless")
end

--- Set an item as mirrored
-- @param self Item: The item to make mirrored
-- @param value boolean: The mirrored state
function Item.setMirrored(self, value)
    self:setCustomAttribute("mirrored", value)
end

--- Check if an item is mirrored
-- @param self Item: The item to check
-- @return boolean: True if the item is mirrored
function Item.isMirrored(self)
    return self:getCustomAttribute("mirrored")
end

--- Get the item type classification for upgrade system
-- @param self Item: The item to check
-- @return number: The item type classification
function Item.getItemType(self)
    local itemType = self:getType()
    local slot = itemType:getSlotPosition() - SLOTP_LEFT - SLOTP_RIGHT

    local weaponType = itemType:getWeaponType()
    if weaponType > 0 then
        if weaponType == WEAPON_SHIELD then
            return US_ITEM_TYPES.SHIELD
        end
        if weaponType == WEAPON_DISTANCE then
            return US_ITEM_TYPES.WEAPON_DISTANCE
        end
        if weaponType == WEAPON_WAND then
            return US_ITEM_TYPES.WEAPON_WAND
        end
        if isInArray({WEAPON_SWORD, WEAPON_CLUB, WEAPON_AXE}, weaponType) then
            return US_ITEM_TYPES.WEAPON_MELEE
        end
    else
        if slot == SLOTP_HEAD then
            return US_ITEM_TYPES.HELMET
        end
        if slot == SLOTP_ARMOR then
            return US_ITEM_TYPES.ARMOR
        end
        if slot == SLOTP_LEGS then
            return US_ITEM_TYPES.LEGS
        end
        if slot == SLOTP_FEET then
            return US_ITEM_TYPES.BOOTS
        end
        if slot == SLOTP_NECKLACE then
            return US_ITEM_TYPES.NECKLACE
        end
        if slot == SLOTP_RING then
            return US_ITEM_TYPES.RING
        end
    end
    return US_ITEM_TYPES.ALL
end

--- Set the rarity of an item
-- @param self Item: The item to modify
-- @param rarity number: The rarity level
function Item.setRarity(self, rarity)
    self:setCustomAttribute("rarity", rarity)
end

--- Roll a random rarity for an item based on chances
-- @param self Item: The item to roll rarity for
function Item.rollRarity(self)
    local rarity = COMMON
    for i = #US_CONFIG.RARITY, 1, -1 do
        if math.random(US_CONFIG.RARITY[i].chance) == 1 then
            rarity = i
            break
        end
    end
    self:setRarity(rarity)
end

--- Get the rarity configuration for an item
-- @param self Item: The item to check
-- @return table: The rarity configuration
function Item.getRarity(self)
    return self:getCustomAttribute("rarity") and US_CONFIG.RARITY[self:getCustomAttribute("rarity")] or
               US_CONFIG.RARITY[COMMON]
end

--- Get the rarity ID of an item
-- @param self Item: The item to check
-- @return number: The rarity ID
function Item.getRarityId(self)
    return self:getCustomAttribute("rarity") and self:getCustomAttribute("rarity") or COMMON
end

--- Get the maximum number of attributes an item can have
-- @param self Item: The item to check
-- @return number: The maximum number of attributes
function Item.getMaxAttributes(self)
    if self:isUnique() then
        return #US_UNIQUES[self:getUnique()].attributes
    end
    local rarity = self:getRarity()
    return rarity.maxBonus
end

--- Check if an item type is upgradable
-- @param self ItemType: The item type to check
-- @return boolean: True if the item type can be upgraded
function ItemType.isUpgradable(self)
    if self:isStackable() or self:getTransformEquipId() > 0 or self:getDecayId() > 0 or self:getDestroyId() > 0 or
        self:getCharges() > 0 then
        return false
    end

    local slot = self:getSlotPosition() - SLOTP_LEFT - SLOTP_RIGHT
    local weaponType = self:getWeaponType()

    if weaponType > 0 then
        if weaponType == WEAPON_AMMO then
            return false
        end

        if weaponType == WEAPON_SHIELD or weaponType == WEAPON_DISTANCE or weaponType == WEAPON_WAND or
            isInArray({WEAPON_SWORD, WEAPON_CLUB, WEAPON_AXE}, weaponType) then
            return true
        end
    else
        if slot == SLOTP_HEAD or slot == SLOTP_ARMOR or slot == SLOTP_LEGS or slot == SLOTP_FEET or slot ==
            SLOTP_NECKLACE or slot == SLOTP_RING then
            return true
        end
    end

    return false
end

--- Assign rarity to an item based on its modifiers
-- @param self Item: The item to modify
function Item.assignRarityByModifiers(self)
    local bonuses = self:getBonusAttributes()
    if bonuses then
        local count = #bonuses
        local rarity = COMMON -- Default rarity

        -- Assign rarity based on modifier count
        for i = #US_CONFIG.RARITY, 1, -1 do
            if count >= US_CONFIG.RARITY[i].maxBonus then
                rarity = i
                break
            end
        end

        self:setRarity(rarity)
    else
        -- No modifiers, set to common
        self:setRarity(COMMON)
    end
end

--- Check if an item type can have item level
-- @param self ItemType: The item type to check
-- @return boolean: True if the item type can have item level
function ItemType.canHaveItemLevel(self)
    if self:getTransformEquipId() > 0 or self:getDecayId() > 0 or self:getDestroyId() > 0 or self:getCharges() > 0 then
        return false
    end

    local slot = self:getSlotPosition() - SLOTP_LEFT - SLOTP_RIGHT
    local weaponType = self:getWeaponType()

    if weaponType > 0 then
        if weaponType == WEAPON_AMMO then
            return false
        end

        if weaponType == WEAPON_SHIELD or weaponType == WEAPON_DISTANCE or weaponType == WEAPON_WAND or
            isInArray({WEAPON_SWORD, WEAPON_CLUB, WEAPON_AXE}, weaponType) then
            return true
        end
    else
        if slot == SLOTP_HEAD or slot == SLOTP_ARMOR or slot == SLOTP_LEGS or slot == SLOTP_FEET or slot ==
            SLOTP_NECKLACE or slot == SLOTP_RING then
            return true
        end
    end

    return false
end

--- Calculate the appropriate item level for a monster
-- @param self MonsterType: The monster type
-- @return number: The calculated item level
function MonsterType.calculateItemLevel(self)
    local level = 1
    local monsterValue = self:getMaxHealth() + self:getExperience()
    level = math.ceil((monsterValue ^ 0.4) / 1.25)
    return math.max(1, math.min(200, level))
end
