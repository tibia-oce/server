-- Roll a random attribute for an item.
-- @param self Item
-- @param player Player|nil
-- @param itemType ItemType
-- @param weaponType number
-- @param unidentify boolean
-- @return boolean
function Item.rollAttribute(self, player, itemType, weaponType, unidentify)
    if not itemType:isUpgradable() or self:isUnique() then
        return false
    end

    local attrIds = {}
    local item_level = self:getItemLevel()

    if unidentify then
        local bonusCount = self:getRarity().maxBonus
        local usItemType = self:getItemType()
        for i = 1, bonusCount do
            local attrId = rollRandomAttribute(attrIds, item_level, usItemType)
            table.insert(attrIds, attrId)

            local attr = US_ENCHANTMENTS[attrId]
            local value = calculateAttributeValue(attr, item_level)
            self:setCustomAttribute("Slot" .. i, attrId .. "|" .. value)
            if isCombatEnchantment(attrId) then
                applyAugmentForEnchantment(self, attrId, value)
            end
        end
        return true
    else
        local bonuses = self:getBonusAttributes()
        if bonuses then
            local maxPossible = US_CONFIG.RARITY[#US_CONFIG.RARITY].maxBonus
            if #bonuses >= maxPossible then
                if player then
                    player:sendTextMessage(MESSAGE_STATUS_WARNING, "Max number of bonuses reached!")
                end
                return false
            end
            for _, b in pairs(bonuses) do
                table.insert(attrIds, b[1])
            end
        end

        local usItemType = self:getItemType()
        local attrId = rollRandomAttribute(attrIds, item_level, usItemType)
        local attr = US_ENCHANTMENTS[attrId]
        local value = calculateAttributeValue(attr, item_level)
        self:setCustomAttribute("Slot" .. (self:getLastSlot() + 1), attrId .. "|" .. value)

        if isCombatEnchantment(attrId) then
            applyAugmentForEnchantment(self, attrId, value)
        end

        self:updateRarityByBonusCount()
        return true
    end
end

--- Randomly decide an upgrade level (not typically used in your script).
-- @return number
function rollUpgradeLevel()
    local level = 1
    for i = US_CONFIG.MAX_UPGRADE_LEVEL, 1, -1 do
        if i >= US_CONFIG.UPGRADE_LEVEL_DESTROY then
            if math.random(100) <= US_CONFIG.UPGRADE_DESTROY_CHANCE[i] then
                level = i
                break
            end
        else
            if math.random(100) <= US_CONFIG.UPGRADE_SUCCESS_CHANCE[i] then
                level = i
                break
            end
        end
    end
    return level
end

--- Roll a random attribute ID, possibly avoiding duplicates.
-- @param existingAttrIds table
-- @param item_level number
-- @param usItemType number
-- @return number
function rollRandomAttribute(existingAttrIds, item_level, usItemType)
    local attrId = math.random(1, #US_ENCHANTMENTS)
    local attr = US_ENCHANTMENTS[attrId]

    while ((not US_CONFIG.ALLOW_DUPLICATE_ENCHANTS and isInArray(existingAttrIds, attrId)) or
        (bit.band(usItemType, attr.itemType) == 0) or (attr.chance and math.random(100) >= attr.chance)) do
        attrId = math.random(1, #US_ENCHANTMENTS)
        attr = US_ENCHANTMENTS[attrId]
    end
    return attrId
end

--- Compute an attribute's magnitude (percentage or otherwise).
-- @param attr table
-- @param item_level number
-- @return number
function calculateAttributeValue(attr, item_level)
    if attr.percentage then
        return math.random(1, US_CONFIG.MAX_PERCENTAGE_ROLL)
    elseif attr.VALUES_PER_LEVEL then
        local maxValue = math.ceil(item_level * attr.VALUES_PER_LEVEL)
        if maxValue < 1 then
            return 1
        end
        return math.random(1, maxValue)
    else
        return 1
    end
end

--- Add an attribute to a specific slot.
-- @param self Item
-- @param slot number
-- @param attr number
-- @param value number
function Item.addAttribute(self, slot, attr, value)
    self:setCustomAttribute("Slot" .. slot, attr .. "|" .. value)
end

--- Get a single attribute from a slot.
-- @param self Item
-- @param slot number
-- @return table|nil  {attrId, attrValue}
function Item.getBonusAttribute(self, slot)
    local bonuses = self:getCustomAttribute("Slot" .. slot)
    if bonuses then
        local t = {}
        for b in bonuses:gmatch("([^|]+)") do
            t[#t + 1] = tonumber(b)
        end
        return t
    end
    return nil
end

--- Return all bonus attributes from an item.
-- @param self Item
-- @return table|nil
function Item.getBonusAttributes(self)
    local data = {}
    for i = 1, self:getMaxAttributes() do
        local bonuses = self:getCustomAttribute("Slot" .. i)
        if bonuses then
            local t = {}
            for b in bonuses:gmatch("([^|]+)") do
                t[#t + 1] = tonumber(b)
            end
            data[#data + 1] = t
        end
    end
    return (#data > 0) and data or nil
end

--- Get the last slot index that has a bonus.
-- @param self Item
-- @return number
function Item.getLastSlot(self)
    local last = 0
    for i = 1, self:getMaxAttributes() do
        if self:getCustomAttribute("Slot" .. i) then
            last = i
        end
    end
    return last
end

--- Force item rarity based on how many bonuses it has.
-- @param self Item
function Item.updateRarityByBonusCount(self)
    local bonuses = self:getBonusAttributes()
    if bonuses then
        local count = #bonuses
        for i = 1, #US_CONFIG.RARITY do
            if US_CONFIG.RARITY[i].maxBonus == count then
                self:setRarity(i)
                break
            end
        end
    else
        self:setRarity(COMMON)
    end
    self:setAttribute(ITEM_ATTRIBUTE_ACTIONID, self:getActionId())
    syncItemAugments(self)
end

--- Set item level, adjusting stats based on the difference from old level.
-- @param self Item
-- @param level number
-- @param first boolean
-- @return boolean
function Item.setItemLevel(self, level, first)
    local oldLevel = self:getItemLevel()
    local it = ItemType(self.itemid)
    local finalValue = 0

    local function calcValue(diff, perLevel, fromLevel)
        if diff >= perLevel then
            return math.floor((diff / perLevel) * fromLevel)
        end
        return 0
    end

    local diff = (oldLevel < level) and (level - oldLevel) or (oldLevel - level)
    if it:getAttack() > 0 then
        finalValue = calcValue(diff, US_CONFIG.ATTACK_PER_ITEM_LEVEL, US_CONFIG.ATTACK_FROM_ITEM_LEVEL)
        updateItemAttribute(self, ITEM_ATTRIBUTE_ATTACK, it:getAttack(), finalValue, (oldLevel < level))
    end
    if it:getDefense() > 0 then
        finalValue = calcValue(diff, US_CONFIG.DEFENSE_PER_ITEM_LEVEL, US_CONFIG.DEFENSE_FROM_ITEM_LEVEL)
        updateItemAttribute(self, ITEM_ATTRIBUTE_DEFENSE, it:getDefense(), finalValue, (oldLevel < level))
    end
    if it:getArmor() > 0 then
        finalValue = calcValue(diff, US_CONFIG.ARMOR_PER_ITEM_LEVEL, US_CONFIG.ARMOR_FROM_ITEM_LEVEL)
        updateItemAttribute(self, ITEM_ATTRIBUTE_ARMOR, it:getArmor(), finalValue, (oldLevel < level))
    end
    if it:getHitChance() > 0 then
        finalValue = calcValue(diff, US_CONFIG.HITCHANCE_PER_ITEM_LEVEL, US_CONFIG.HITCHANCE_FROM_ITEM_LEVEL)
        updateItemAttribute(self, ITEM_ATTRIBUTE_HITCHANCE, it:getHitChance(), finalValue, (oldLevel < level))
    end

    if first then
        if it:getAttack() > 0 then
            level = level + math.floor(it:getAttack() / US_CONFIG.ITEM_LEVEL_PER_ATTACK)
        end
        if it:getDefense() > 0 then
            level = level + math.floor(it:getDefense() / US_CONFIG.ITEM_LEVEL_PER_DEFENSE)
        end
        if it:getArmor() > 0 then
            level = level + math.floor(it:getArmor() / US_CONFIG.ITEM_LEVEL_PER_ARMOR)
        end
        if it:getHitChance() > 0 then
            level = level + math.floor(it:getHitChance() / US_CONFIG.ITEM_LEVEL_PER_HITCHANCE)
        end
    end
    return self:setCustomAttribute("item_level", level)
end

--- Update a single attribute (attack, defense, etc.) when item level changes.
-- @param item Item
-- @param attrType number
-- @param baseValue number
-- @param changeValue number
-- @param isIncrease boolean
function updateItemAttribute(item, attrType, baseValue, changeValue, isIncrease)
    local currentValue = item:getAttribute(attrType) or 0
    local newValue
    if isIncrease then
        if changeValue == 0 and currentValue < baseValue then
            newValue = baseValue + (US_CONFIG.DEFENSE_PER_UPGRADE or 0) -- fallback if needed
        else
            newValue = (currentValue > 0) and (currentValue + changeValue) or (baseValue + changeValue)
        end
    else
        newValue = (currentValue > 0) and (currentValue - changeValue) or (baseValue - changeValue)
    end
    item:setAttribute(attrType, newValue)
end

--- Get the item level.
-- @param self Item
-- @return number
function Item.getItemLevel(self)
    return self:getCustomAttribute("item_level") or 0
end

--- Set the upgrade level, adjusting stats accordingly.
-- @param self Item
-- @param level number
function Item.setUpgradeLevel(self, level)
    local it = ItemType(self.itemid)
    local oldLevel = self:getUpgradeLevel()
    local config = getUpgradeConfig(self)

    if it:getAttack() > 0 then
        updateUpgradeAttribute(self, ITEM_ATTRIBUTE_ATTACK, config.attack_per_upgrade, oldLevel, level)
    end
    if it:getDefense() > 0 then
        updateUpgradeAttribute(self, ITEM_ATTRIBUTE_DEFENSE, config.defense_per_upgrade, oldLevel, level)
    end
    if it:getExtraDefense() > 0 then
        local extraDef = config.extra_defense_per_upgrade or US_CONFIG.EXTRADEFENSE_PER_UPGRADE
        if oldLevel < level then
            self:setAttribute(ITEM_ATTRIBUTE_EXTRADEFENSE, it:getExtraDefense() + (level - oldLevel) * extraDef)
        else
            self:setAttribute(ITEM_ATTRIBUTE_EXTRADEFENSE,
                self:getAttribute(ITEM_ATTRIBUTE_EXTRADEFENSE) - (oldLevel - level) * extraDef)
        end
    end
    if it:getArmor() > 0 then
        updateUpgradeAttribute(self, ITEM_ATTRIBUTE_ARMOR, config.armor_per_upgrade, oldLevel, level)
    end
    if it:getHitChance() > 0 then
        updateUpgradeAttribute(self, ITEM_ATTRIBUTE_HITCHANCE, config.hitchance_per_upgrade, oldLevel, level)
    end

    MAGICLEVEL.updateBonus(self, oldLevel, level)
    self:setCustomAttribute("upgrade", level)

    if oldLevel < level then
        self:setItemLevel(self:getItemLevel() + (US_CONFIG.ITEM_LEVEL_PER_UPGRADE * (level - oldLevel)))
    end
end

--- Update an attribute by comparing old vs. new upgrade level.
-- @param item Item
-- @param attrType number
-- @param perUpgrade number
-- @param oldLevel number
-- @param newLevel number
function updateUpgradeAttribute(item, attrType, perUpgrade, oldLevel, newLevel)
    local current = item:getAttribute(attrType)
    if oldLevel < newLevel then
        item:setAttribute(attrType, current + (newLevel - oldLevel) * perUpgrade)
    else
        item:setAttribute(attrType, current - (oldLevel - newLevel) * perUpgrade)
    end
end

--- Get the current upgrade level.
-- @param self Item
-- @return number
function Item.getUpgradeLevel(self)
    return self:getCustomAttribute("upgrade") or 0
end

--- Reduce upgrade by one level.
-- @param self Item
function Item.reduceUpgradeLevel(self)
    self:setUpgradeLevel(self:getUpgradeLevel() - 1)
    self:setItemLevel(self:getItemLevel() - US_CONFIG.ITEM_LEVEL_PER_UPGRADE)
end

--- Check if an item is unique.
-- @param self Item
-- @return boolean
function Item.isUnique(self)
    return self:getCustomAttribute("unique") and true or false
end

--- Set an item as unique by ID, adding relevant attributes from US_UNIQUES.
-- @param self Item
-- @param uniqueId number
function Item.setUnique(self, uniqueId)
    self:setCustomAttribute("unique", uniqueId)
    local entry = US_UNIQUES[uniqueId]
    if entry then
        for _, attrId in ipairs(entry.attributes) do
            local attr = US_ENCHANTMENTS[attrId]
            local val = (attr.VALUES_PER_LEVEL and
                            math.random(1, math.ceil(self:getItemLevel() * attr.VALUES_PER_LEVEL))) or 1
            self:setCustomAttribute("Slot" .. (self:getLastSlot() + 1), attrId .. "|" .. val)
        end
    end
end

--- Get the unique ID if present.
-- @param self Item
-- @return number|nil
function Item.getUnique(self)
    return self:getCustomAttribute("unique")
end

--- Get the unique name from US_UNIQUES table.
-- @param self Item
-- @return string
function Item.getUniqueName(self)
    return US_UNIQUES[self:getUnique()].name
end

--- Make the item indefinite for level requirements.
-- @param self Item
-- @param value boolean
function Item.setLimitless(self, value)
    self:setCustomAttribute("limitless", value)
end

--- Check if item is indefinite for level requirements.
-- @param self Item
-- @return boolean
function Item.isLimitless(self)
    return self:getCustomAttribute("limitless")
end

--- Flag an item as mirrored.
-- @param self Item
-- @param value boolean
function Item.setMirrored(self, value)
    self:setCustomAttribute("mirrored", value)
end

--- Check if item is mirrored.
-- @param self Item
-- @return boolean
function Item.isMirrored(self)
    return self:getCustomAttribute("mirrored")
end

--- Return the item type classification for your system.
-- @param self Item
-- @return number
function Item.getItemType(self)
    local it = self:getType()
    local slot = it:getSlotPosition() - SLOTP_LEFT - SLOTP_RIGHT
    local wtype = it:getWeaponType()
    if wtype > 0 then
        if wtype == WEAPON_SHIELD then
            return US_ITEM_TYPES.SHIELD
        elseif wtype == WEAPON_DISTANCE then
            return US_ITEM_TYPES.WEAPON_DISTANCE
        elseif wtype == WEAPON_WAND then
            return US_ITEM_TYPES.WEAPON_WAND
        elseif isInArray({WEAPON_SWORD, WEAPON_CLUB, WEAPON_AXE}, wtype) then
            return US_ITEM_TYPES.WEAPON_MELEE
        end
    else
        if slot == SLOTP_HEAD then
            return US_ITEM_TYPES.HELMET
        elseif slot == SLOTP_ARMOR then
            return US_ITEM_TYPES.ARMOR
        elseif slot == SLOTP_LEGS then
            return US_ITEM_TYPES.LEGS
        elseif slot == SLOTP_FEET then
            return US_ITEM_TYPES.BOOTS
        elseif slot == SLOTP_NECKLACE then
            return US_ITEM_TYPES.NECKLACE
        elseif slot == SLOTP_RING then
            return US_ITEM_TYPES.RING
        end
    end
    return US_ITEM_TYPES.ALL
end

--- Set the item's rarity.
-- @param self Item
-- @param rarity number
function Item.setRarity(self, rarity)
    self:setCustomAttribute("rarity", rarity)
end

--- Randomly roll a rarity from the config chances.
-- @param self Item
function Item.rollRarity(self)
    local r = COMMON
    for i = #US_CONFIG.RARITY, 1, -1 do
        if math.random(US_CONFIG.RARITY[i].chance) == 1 then
            r = i
            break
        end
    end
    self:setRarity(r)
end

--- Get the current rarity from the config.
-- @param self Item
-- @return table
function Item.getRarity(self)
    local r = self:getCustomAttribute("rarity")
    return r and US_CONFIG.RARITY[r] or US_CONFIG.RARITY[COMMON]
end

--- Return the rarity ID.
-- @param self Item
-- @return number
function Item.getRarityId(self)
    return self:getCustomAttribute("rarity") or COMMON
end

--- Return the maximum number of bonus attributes an item can hold.
-- @param self Item
-- @return number
function Item.getMaxAttributes(self)
    if self:isUnique() then
        return #US_UNIQUES[self:getUnique()].attributes
    end
    return self:getRarity().maxBonus
end

--- Check if an item type can be upgraded.
-- @param self ItemType
-- @return boolean
function ItemType.isUpgradable(self)
    if self:isStackable() or self:getTransformEquipId() > 0 or self:getDecayId() > 0 or self:getDestroyId() > 0 or
        self:getCharges() > 0 then
        return false
    end
    local slot = self:getSlotPosition() - SLOTP_LEFT - SLOTP_RIGHT
    local wtype = self:getWeaponType()
    if wtype > 0 then
        if wtype == WEAPON_AMMO then
            return false
        end
        if wtype == WEAPON_SHIELD or wtype == WEAPON_DISTANCE or wtype == WEAPON_WAND or
            isInArray({WEAPON_SWORD, WEAPON_CLUB, WEAPON_AXE}, wtype) then
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

--- Check if an item type can have item level.
-- @param self ItemType
-- @return boolean
function ItemType.canHaveItemLevel(self)
    if self:getTransformEquipId() > 0 or self:getDecayId() > 0 or self:getDestroyId() > 0 or self:getCharges() > 0 then
        return false
    end
    local slot = self:getSlotPosition() - SLOTP_LEFT - SLOTP_RIGHT
    local wtype = self:getWeaponType()
    if wtype > 0 then
        if wtype == WEAPON_AMMO then
            return false
        end
        if wtype == WEAPON_SHIELD or wtype == WEAPON_DISTANCE or wtype == WEAPON_WAND or
            isInArray({WEAPON_SWORD, WEAPON_CLUB, WEAPON_AXE}, wtype) then
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

--- Compute item level for a monster (if dropping an item).
-- @param self MonsterType
-- @return number
function MonsterType.calculateItemLevel(self)
    local monsterValue = self:getMaxHealth() + self:getExperience()
    local level = math.ceil((monsterValue ^ 0.4) / 1.25)
    return math.max(1, math.min(200, level))
end

--- Get the per-upgrade config for an item, if it exists in config.lua.
-- @param item Item
-- @return table
function getUpgradeConfig(item)
    local it = ItemType(item:getId())
    local wtype = it:getWeaponType()
    if wtype > 0 and US_CONFIG.WEAPON_UPGRADES and US_CONFIG.WEAPON_UPGRADES[wtype] then
        return {
            attack_per_upgrade = US_CONFIG.WEAPON_UPGRADES[wtype].attack or US_CONFIG.ATTACK_PER_UPGRADE,
            defense_per_upgrade = US_CONFIG.WEAPON_UPGRADES[wtype].defense or US_CONFIG.DEFENSE_PER_UPGRADE,
            extra_defense_per_upgrade = US_CONFIG.WEAPON_UPGRADES[wtype].extra_defense or
                US_CONFIG.EXTRADEFENSE_PER_UPGRADE,
            armor_per_upgrade = US_CONFIG.WEAPON_UPGRADES[wtype].armor or US_CONFIG.ARMOR_PER_UPGRADE,
            hitchance_per_upgrade = US_CONFIG.WEAPON_UPGRADES[wtype].hitchance or US_CONFIG.HITCHANCE_PER_UPGRADE
        }
    end
    return {
        attack_per_upgrade = US_CONFIG.ATTACK_PER_UPGRADE,
        defense_per_upgrade = US_CONFIG.DEFENSE_PER_UPGRADE,
        extra_defense_per_upgrade = US_CONFIG.EXTRADEFENSE_PER_UPGRADE,
        armor_per_upgrade = US_CONFIG.ARMOR_PER_UPGRADE,
        hitchance_per_upgrade = US_CONFIG.HITCHANCE_PER_UPGRADE
    }
end
