-- Business logic for applying attribute upgrades (native and custom)
-- Handles calculations and application of attribute changes
-- AttributeService module
local AttributeService = {}

--- Remove condition bonuses from a player's item.
-- @param player Player Player wearing the item
-- @param item Item Item providing bonuses
function AttributeService.removeItemConditions(player, item)
    local bonuses = item:getBonusAttributes()
    if not bonuses then
        return
    end

    local itemId = item:getId()

    -- Remove enchantment conditions
    for i = 1, #bonuses do
        local val = bonuses[i]
        local bId = val[1]
        local bVal = val[2]
        local attr = US_ENCHANTMENTS[bId]

        if attr and attr.combatType == US_TYPES.CONDITION then
            if US_CONDITIONS[bId] and US_CONDITIONS[bId][bVal] and US_CONDITIONS[bId][bVal][itemId] then
                local c = US_CONDITIONS[bId][bVal][itemId]

                if c:getType() ~= CONDITION_MANASHIELD then
                    player:removeCondition(c:getType(), CONDITIONID_COMBAT, c:getSubId())
                else
                    player:removeCondition(c:getType(), CONDITIONID_COMBAT)
                end
            end
        end
    end

    -- Remove magic level bonus condition if present
    local ml = item:getCustomAttribute("bonus_magiclevel")
    if ml and ml > 0 and US_CONDITIONS[BONUS_CONFIG.MAGIC_LEVEL.ATTR_ID] and
        US_CONDITIONS[BONUS_CONFIG.MAGIC_LEVEL.ATTR_ID][ml] and
        US_CONDITIONS[BONUS_CONFIG.MAGIC_LEVEL.ATTR_ID][ml][itemId] then
        player:removeCondition(CONDITION_ATTRIBUTES, CONDITIONID_COMBAT,
            US_CONDITIONS[BONUS_CONFIG.MAGIC_LEVEL.ATTR_ID][ml][itemId]:getSubId())
    end
end

--- Applies item conditions on equip after a short delay.
-- @param cid number Player ID
-- @param iuid number Item UniqueID
-- @param slot number Equipment slot
function AttributeService.applyItemEffects(cid, iuid, slot)
    local player = Player(cid)
    if not player or not player:getSlotItem(slot) then
        return
    end

    -- Verify item is still in the same slot
    local slotUid = player:getSlotItem(slot):getUniqueId()
    if (iuid + 1) ~= slotUid then
        return
    end

    local item = Item(slotUid)
    if not item then
        return
    end

    -- Apply condition bonuses from item attributes
    local newBonuses = item:getBonusAttributes()
    if newBonuses then
        local maxHP = player:getMaxHealth()
        local maxMP = player:getMaxMana()

        local Enchantment = dofile('data/scripts/custom/itemupgrades/domain/Enchantment.lua')

        -- Apply each condition bonus
        for i = 1, #newBonuses do
            local bId = newBonuses[i][1]
            local bVal = newBonuses[i][2]
            local attr = US_ENCHANTMENTS[bId]

            if attr and attr.combatType == US_TYPES.CONDITION then
                Enchantment.applyConditionBonus(player, item, bId, bVal, attr, slot, i, maxHP, maxMP)
            end
        end

        -- Synchronize the item's augments
        Enchantment.syncItemAugments(item)
    end
end

--- Apply magic-level bonuses for a player's equipped items.
-- @param player Player Player to apply bonuses to
function AttributeService.applyMagicLevelBonuses(player)
    for slot = CONST_SLOT_HEAD, CONST_SLOT_AMMO do
        local item = player:getSlotItem(slot)
        if item then
            local bonusMagicLevel = item:getCustomAttribute("bonus_magiclevel")
            if bonusMagicLevel and bonusMagicLevel > 0 then
                local c = Condition(CONDITION_ATTRIBUTES)
                c:setParameter(CONDITION_PARAM_STAT_MAGICPOINTS, bonusMagicLevel)
                c:setParameter(CONDITION_PARAM_TICKS, -1)
                c:setParameter(CONDITION_PARAM_SUBID, 70000 + player:getId() % 1000)
                c:setParameter(CONDITION_PARAM_BUFF_SPELL, true)
                player:addCondition(c)
            end
        end
    end
end

--- Process health and damage calculations based on gear bonuses.
-- @param creature Creature Creature being damaged
-- @param attacker Creature Attacker
-- @param primaryDamage number Primary damage
-- @param primaryType number Primary damage type
-- @param secondaryDamage number Secondary damage
-- @param secondaryType number Secondary damage type
-- @param origin number Origin type
-- @return number, number, number, number Modified damage values
function AttributeService.calculateDamage(creature, attacker, primaryDamage, primaryType, secondaryDamage,
    secondaryType, origin)
    -- Handle healing calculation separately
    if primaryType == COMBAT_HEALING or secondaryType == COMBAT_HEALING then
        return AttributeService.processHealingModifiers(creature, attacker, primaryDamage, primaryType, secondaryDamage,
            secondaryType)
    end

    -- Process attacker bonuses
    if attacker:isPlayer() then
        local mod = AttributeService.processAttackerModifiers(attacker, creature, primaryDamage, primaryType,
            secondaryDamage, secondaryType)
        primaryDamage = mod.primaryDamage
        secondaryDamage = mod.secondaryDamage
    end

    -- Process defender bonuses
    if creature:isPlayer() then
        local mod = AttributeService.processDefenderModifiers(creature, attacker, primaryDamage, primaryType,
            secondaryDamage, secondaryType)
        primaryDamage = mod.primaryDamage
        secondaryDamage = mod.secondaryDamage
    end

    return primaryDamage, primaryType, secondaryDamage, secondaryType
end

--- Calculate healing modifications based on equipment bonuses.
-- @param creature Creature Being healed
-- @param attacker Creature Healer
-- @param primaryDamage number Primary healing
-- @param primaryType number Primary type
-- @param secondaryDamage number Secondary healing
-- @param secondaryType number Secondary type
-- @return number, number, number, number Modified healing values
function AttributeService.processHealingModifiers(creature, attacker, primaryDamage, primaryType, secondaryDamage,
    secondaryType)
    -- Process healer's bonuses (healing output)
    if attacker:isPlayer() then
        local primeTotal, secTotal = 0, 0

        -- Check healer's equipped items
        for slot = CONST_SLOT_HEAD, CONST_SLOT_AMMO do
            local it = attacker:getSlotItem(slot)
            if it and it:getType():usesSlot(slot) then
                local values = it:getBonusAttributes()
                if values then
                    for _, v in pairs(values) do
                        local a = US_ENCHANTMENTS[v[1]]
                        if a and a.name == "Increased Healing" then
                            if primaryType == COMBAT_HEALING then
                                primeTotal = primeTotal + v[2]
                            end
                            if secondaryType == COMBAT_HEALING then
                                secTotal = secTotal + v[2]
                            end
                        end
                    end
                end
            end
        end

        -- Apply healing output bonuses
        if primaryType == COMBAT_HEALING and primeTotal > 0 then
            primaryDamage = math.floor(primaryDamage + (primaryDamage * primeTotal / 100))
        end
        if secondaryType == COMBAT_HEALING and secTotal > 0 then
            secondaryDamage = math.floor(secondaryDamage + (secondaryDamage * secTotal / 100))
        end
    end

    -- Process target's bonuses (healing input)
    if creature:isPlayer() then
        local primeTotal, secTotal = 0, 0

        -- Check target's equipped items
        for slot = CONST_SLOT_HEAD, CONST_SLOT_AMMO do
            local it = creature:getSlotItem(slot)
            if it and it:getType():usesSlot(slot) then
                local values = it:getBonusAttributes()
                if values then
                    for _, v in pairs(values) do
                        local a = US_ENCHANTMENTS[v[1]]
                        if a and a.name == "Increased Healing" then
                            if primaryDamage > 0 then
                                primeTotal = primeTotal + v[2]
                            end
                            if secondaryDamage > 0 then
                                secTotal = secTotal + v[2]
                            end
                        end
                    end
                end
            end
        end

        -- Apply healing input bonuses
        if primeTotal > 0 then
            primaryDamage = math.floor(primaryDamage + (primaryDamage * primeTotal / 100))
        end
        if secTotal > 0 then
            secondaryDamage = math.floor(secondaryDamage + (secondaryDamage * secTotal / 100))
        end
    end

    return primaryDamage, primaryType, secondaryDamage, secondaryType
end

--- Calculate damage modifications for attacker bonuses.
-- @param attacker Creature Attacking creature
-- @param target Creature Target creature
-- @param primaryDamage number Primary damage
-- @param primaryType number Primary type
-- @param secondaryDamage number Secondary damage
-- @param secondaryType number Secondary type
-- @return table {primaryDamage, secondaryDamage}
function AttributeService.processAttackerModifiers(attacker, target, primaryDamage, primaryType, secondaryDamage,
    secondaryType)
    local doubleDamageTotal = 0
    local primeTotal = 0
    local secTotal = 0
    local lifeSteal = 0
    local manaSteal = 0

    -- Loop through attacker's equipment
    for slot = CONST_SLOT_HEAD, CONST_SLOT_AMMO do
        local it = attacker:getSlotItem(slot)
        if it and it:getType():usesSlot(slot) then
            local values = it:getBonusAttributes()
            if values then
                for _, v in pairs(values) do
                    local a = US_ENCHANTMENTS[v[1]]
                    if a and a.combatType and a.combatType ~= US_TYPES.CONDITION then
                        -- Handle trigger type enchantments
                        if a.combatType == US_TYPES.TRIGGER and a.triggerType == US_TRIGGERS.ATTACK then
                            a.execute(attacker, target, v[2])
                            -- Handle double damage
                        elseif a.name == "Double Damage" then
                            doubleDamageTotal = doubleDamageTotal + v[2]
                            -- Handle offensive damage enhancements
                        elseif a.combatDamage then
                            if primaryType > 0 and a.combatType == US_TYPES.OFFENSIVE then
                                local match = (a.combatDamage % (primaryType + primaryType) >= primaryType)
                                if match then
                                    primeTotal = primeTotal + v[2]
                                end
                            end
                            if secondaryType > 0 and a.combatType == US_TYPES.OFFENSIVE then
                                local match = (a.combatDamage % (secondaryType + secondaryType) >= secondaryType)
                                if match then
                                    secTotal = secTotal + v[2]
                                end
                            end
                            -- Handle life/mana steal
                        elseif a.name == "Life Steal" then
                            lifeSteal = lifeSteal + v[2]
                        elseif a.name == "Mana Steal" then
                            manaSteal = manaSteal + v[2]
                        end
                    end
                end
            end
        end
    end

    -- Apply double damage chance
    if doubleDamageTotal > 0 and math.random(100) < doubleDamageTotal then
        primaryDamage = primaryDamage * 2
        secondaryDamage = secondaryDamage * 2
    end

    -- Apply damage type enhancements
    if primeTotal > 0 then
        local bonus = math.floor(primaryDamage * primeTotal / 100)
        primaryDamage = math.floor(primaryDamage + bonus)
    end
    if secTotal > 0 then
        local bonus = math.floor(secondaryDamage * secTotal / 100)
        secondaryDamage = math.floor(secondaryDamage + bonus)
    end

    -- Apply life/mana steal effects
    local total = math.abs(primaryDamage + secondaryDamage)
    if lifeSteal > 0 then
        local heal = math.floor((total * lifeSteal / 100))
        if heal > 0 then
            attacker:addHealth(heal)
        end
    end
    if manaSteal > 0 then
        local mp = math.floor((total * manaSteal / 100))
        if mp > 0 then
            attacker:addMana(mp)
        end
    end

    return {
        primaryDamage = primaryDamage,
        secondaryDamage = secondaryDamage
    }
end

--- Calculate damage modifications for defender bonuses.
-- @param defender Creature Defending creature
-- @param attacker Creature Attacking creature
-- @param primaryDamage number Primary damage
-- @param primaryType number Primary type
-- @param secondaryDamage number Secondary damage
-- @param secondaryType number Secondary type
-- @return table {primaryDamage, secondaryDamage}
function AttributeService.processDefenderModifiers(defender, attacker, primaryDamage, primaryType, secondaryDamage,
    secondaryType)
    local primeTotal = 0
    local secTotal = 0

    -- Loop through defender's equipment
    for slot = CONST_SLOT_HEAD, CONST_SLOT_AMMO do
        local it = defender:getSlotItem(slot)
        if it and it:getType():usesSlot(slot) then
            local values = it:getBonusAttributes()
            if values then
                for _, v in pairs(values) do
                    local a = US_ENCHANTMENTS[v[1]]
                    if a and a.combatType and a.combatType ~= US_TYPES.CONDITION then
                        -- Handle on-hit triggers
                        if a.combatType == US_TYPES.TRIGGER and a.triggerType == US_TRIGGERS.HIT then
                            a.execute(defender, attacker, v[2])
                            -- Handle defensive damage reductions
                        elseif a.combatDamage then
                            if primaryType ~= 0 and (a.combatDamage % (primaryType + primaryType) >= primaryType) and
                                a.combatType == US_TYPES.DEFENSIVE then
                                primeTotal = primeTotal + v[2]
                            end
                            if secondaryType ~= 0 and
                                (a.combatDamage % (secondaryType + secondaryType) >= secondaryType) and a.combatType ==
                                US_TYPES.DEFENSIVE then
                                secTotal = secTotal + v[2]
                            end
                        end
                    end
                end
            end
        end
    end

    -- Apply damage reductions
    if primeTotal > 0 then
        local reduced = math.floor(primaryDamage * primeTotal / 100)
        primaryDamage = math.floor(primaryDamage - reduced)
    end
    if secTotal > 0 then
        local reduced = math.floor(secondaryDamage * secTotal / 100)
        secondaryDamage = math.floor(secondaryDamage - reduced)
    end

    return {
        primaryDamage = primaryDamage,
        secondaryDamage = secondaryDamage
    }
end

--- Process kill triggers for a player when they kill a monster.
-- @param player Player Player who made the kill
-- @param center Position Center position
-- @param target Creature Killed creature
function AttributeService.processKillTriggers(player, center, target)
    -- Loop through player's equipment
    for slot = CONST_SLOT_HEAD, CONST_SLOT_AMMO do
        local item = player:getSlotItem(slot)
        if item then
            local values = item:getBonusAttributes()
            if values then
                for _, v in pairs(values) do
                    local attr = US_ENCHANTMENTS[v[1]]
                    -- Execute kill trigger enchantments
                    if attr and attr.triggerType == US_TRIGGERS.KILL then
                        attr.execute(player, v[2], center, target)
                    end
                end
            end
        end
    end
end

--- Check if a creature should be revived upon death based on gear.
-- @param creature Creature Creature about to die
-- @return boolean True if revived
function AttributeService.checkReviveOnDeath(creature)
    -- Check all equipped items for revive chance
    for slot = CONST_SLOT_HEAD, CONST_SLOT_AMMO do
        local item = creature:getSlotItem(slot)
        if item then
            local values = item:getBonusAttributes()
            if values then
                for _, v in pairs(values) do
                    local attr = US_ENCHANTMENTS[v[1]]
                    if attr and attr.name == "Revive on death" then
                        -- Roll for revive chance
                        if math.random(100) < v[2] then
                            creature:addHealth(creature:getMaxHealth())
                            creature:addMana(creature:getMaxMana())
                            creature:getPosition():sendMagicEffect(CONST_ME_HOLYAREA)
                            creature:sendTextMessage(MESSAGE_INFO_DESCR, "You have been revived!")
                            return true
                        end
                    end
                end
            end
        end
    end
    return false
end

--- Calculate modified experience gain based on equipment bonuses.
-- @param player Player Player gaining experience
-- @param exp number Base experience
-- @return number Modified experience
function AttributeService.calculateModifiedExperience(player, exp)
    -- Check for experience bonuses in all equipped items
    for slot = CONST_SLOT_HEAD, CONST_SLOT_AMMO do
        local item = player:getSlotItem(slot)
        if item then
            local values = item:getBonusAttributes()
            if values then
                for _, v in pairs(values) do
                    local attr = US_ENCHANTMENTS[v[1]]
                    if attr and attr.name == "Experience" then
                        exp = exp + math.ceil(exp * v[2] / 100)
                    end
                end
            end
        end
    end
    return exp
end

--- Enhances item/creature description with item-level, enchantments, or total item level.
-- @param player Player Observer
-- @param thing Thing Thing being looked at
-- @param description string Original description
-- @return string Enhanced description
function AttributeService.enhanceItemDescription(player, thing, description)
    if thing:isItem() then
        if thing.itemid == US_CONFIG.ITEM_MIND_CRYSTAL and thing:hasMemory() then
            return AttributeService.enhanceMindCrystalDescription(thing, description)
        elseif thing:getType():isUpgradable() then
            return AttributeService.enhanceUpgradableItemDescription(thing, description)
        elseif thing:getType():canHaveItemLevel() then
            return AttributeService.enhanceItemLevelDescription(thing, description, 1)
        end
    elseif thing:isPlayer() then
        return AttributeService.enhancePlayerDescription(player, thing, description)
    end
    return description
end

--- Enhance the name part of an item description.
-- @param item Item Item being described
-- @param description string Original description
-- @return string Enhanced name description
function AttributeService.enhanceItemName(item, description)
    local baseName = item:getName()
    local r = item:getRarity()
    local rname = (r and r.name ~= "") and r.name or ""
    local upg = item:getUpgradeLevel() or 0

    -- Format the item name properly
    description = description:gsub("You see (an? )", "You see ")
    description = description:gsub("You see the ", "You see ")

    local forcedName = AttributeService.buildItemNameWithArticle(rname, baseName)
    description = description:gsub("^(You see [^%(\n%.]+)", "You see " .. forcedName)

    -- Update name for unique items
    if item:isUnique() then
        description = description:gsub(baseName, item:getUniqueName())
    end

    -- Add upgrade level to display
    if upg > 0 then
        description = description:gsub("^(You see [^%(%.]+)", "%1 +" .. upg)
        description = description:gsub("(%+%d+)%(", "%1 (")
    end

    return description
end

--- Generate the attributes section for an item description.
-- @param item Item Item being described
-- @return string Attributes section text
function AttributeService.buildAttributesSection(item)
    local lvl = item:getItemLevel()
    local magicLevelBonus = item:getCustomAttribute("bonus_magiclevel")

    local attributesText = "[ Attributes ]\nItem Level: " .. lvl

    -- Add magic level to attributes section
    if magicLevelBonus and magicLevelBonus > 0 then
        attributesText = attributesText .. "\nMagic Level: +" .. magicLevelBonus
    end

    return attributesText
end

--- Generate the enchantments section for an item description.
-- @param item Item Item being described
-- @return string|nil Enchantments section text or nil if no enchantments
function AttributeService.buildEnchantmentsSection(item)
    local bonuses = item:getBonusAttributes()
    if not bonuses or #bonuses == 0 then
        return nil
    end

    local enchantmentsText = "[ Enchantments ]"
    for _, b in ipairs(bonuses) do
        local attrId, val = b[1], b[2]
        local attr = US_ENCHANTMENTS[attrId]
        if attr then
            local f = attr.format(val)
            if f then
                enchantmentsText = enchantmentsText .. "\n" .. f
            end
        end
    end

    return enchantmentsText
end

--- Appends any stored enchant data in a Mind Crystal to its description.
-- @param crystal Item Mind Crystal
-- @param description string Original description
-- @return string Enhanced description
function AttributeService.enhanceMindCrystalDescription(crystal, description)
    for i = 4, 1, -1 do
        local e = crystal:getBonusAttribute(i)
        if e then
            local attr = US_ENCHANTMENTS[e[1]]
            if attr then
                description = description:gsub(crystal:getName() .. "%.", "%1\n" .. attr.format(e[2]))
            end
        end
    end
    return description
end

--- Get indefinite article (a/an) for a word.
-- @param text string Text to get article for
-- @return string "a" or "an"
function AttributeService.getIndefiniteArticleFor(text)
    if text:sub(1, 1):lower():match("[aeiou]") then
        return "an"
    end
    return "a"
end

--- Build item name with proper article.
-- @param rarityName string Rarity name
-- @param baseName string Base item name
-- @return string Formatted name with article
function AttributeService.buildItemNameWithArticle(rarityName, baseName)
    if rarityName ~= "" then
        return string.format("%s %s %s", AttributeService.getIndefiniteArticleFor(rarityName), rarityName, baseName)
    end
    return string.format("%s %s", AttributeService.getIndefiniteArticleFor(baseName), baseName)
end

--- Override required level text in description.
-- @param description string Original description
-- @param item Item Item being described
-- @return string Modified description
function AttributeService.overrideRequiredLevelText(description, item)
    return description:gsub("(It can only be wielded properly by [^%.]- of level )(%d+)( or higher)",
        function(prefix, reqStr, suffix)
            local defaultLevel = tonumber(reqStr) or 0
            local lvl = item:getItemLevel()
            if lvl > defaultLevel then
                return prefix .. lvl .. suffix
            end
            return prefix .. reqStr .. suffix
        end)
end

--- Enhance description for upgradable items.
-- @param item Item Item being described
-- @param description string Original description
-- @return string Enhanced description
function AttributeService.enhanceUpgradableItemDescription(item, description)
    -- Enhance the item name (rarity, upgrade level, etc.)
    description = AttributeService.enhanceItemName(item, description)

    -- Remove any existing attributes/enchantments sections to avoid duplication
    description = description:gsub("\n%[ Attributes %].-\n%[ Enchantments %].-", "")
    description = description:gsub("\n%[ Attributes %].-", "")
    description = description:gsub("\n%[ Enchantments %].-", "")
    description = description:gsub("\nItem Level:%s?%d+", "")
    description = description:gsub("\nMagic Level: %+%d+", "")
    description = description:gsub("\n[A-Za-z ]+ %+%d+%%", "")

    -- Add the attributes section
    description = description .. "\n\n" .. AttributeService.buildAttributesSection(item)

    -- Add the enchantments section if needed
    local enchantmentsSection = AttributeService.buildEnchantmentsSection(item)
    if enchantmentsSection then
        description = description .. "\n\n" .. enchantmentsSection
    end

    -- Add mirrored status if applicable
    if item:isMirrored() and not description:find("Mirrored") then
        description = description .. "\nMirrored"
    end

    -- Fix formatting and level requirements
    description = AttributeService.overrideRequiredLevelText(description, item)
    description = description:gsub("([^%s])%(", "%1 (")

    return description
end

--- Extends an item description for gear that only has an item level (no upgradable bonus).
-- @param item Item Item being described
-- @param description string Original description
-- @param distance number Viewing distance
-- @return string Enhanced description
function AttributeService.enhanceItemLevelDescription(item, description, distance)
    local lvl = item:getItemLevel()
    if not description:match("^You see") then
        description = "You see " .. description
    end
    local it = ItemType(item:getId())
    local defDesc = it and it:getDescription() or ""

    -- Remove any existing item level indicator
    description = description:gsub("\nItem Level: %d+", "")

    -- Add item level based on distance and description layout
    if distance <= 1 then
        if defDesc ~= "" and description:find(defDesc, 1, true) then
            description = description:gsub(defDesc, defDesc .. "\nItem Level: " .. lvl)
        else
            if description:find("oz%.", 1, true) then
                description = description:gsub("oz%.", "oz.\nItem Level: " .. lvl)
            else
                if description:find("%)%.?", 1, true) then
                    description = description:gsub("(%)%.?)", "%1\nItem Level: " .. lvl)
                else
                    description = description .. "\nItem Level: " .. lvl
                end
            end
        end
    else
        if description:find("%)%.?", 1, true) then
            description = description:gsub("(%)%.?)", "%1\nItem Level: " .. lvl)
        else
            description = description .. "\nItem Level: " .. lvl
        end
    end

    return description
end

--- Shows total item level on a looked-at player.
-- @param observer Player Observer
-- @param player Player Player being looked at
-- @param description string Original description
-- @return string Enhanced description
function AttributeService.enhancePlayerDescription(observer, player, description)
    local sum = 0
    for slot = CONST_SLOT_HEAD, CONST_SLOT_AMMO do
        local it = player:getSlotItem(slot)
        if it then
            sum = sum + it:getItemLevel()
        end
    end
    return description .. "\nTotal Item Level: " .. sum
end

--- Validate and handle item movement, applying equip logic.
-- @param player Player Player moving the item
-- @param item Item Item being moved
-- @param fromPosition Position Source position
-- @param toPosition Position Target position
-- @return boolean True if allowed
function AttributeService.handleItemMove(player, item, fromPosition, toPosition)
    -- Skip processing for non-upgradable/non-leveled items or when moving to ammo slot
    if (not item:getType():isUpgradable() and not item:getType():canHaveItemLevel()) or toPosition.y == CONST_SLOT_AMMO then
        return true
    end

    -- Skip if item doesn't use the target slot
    if not item:getType():usesSlot(toPosition.y) then
        return true
    end

    -- Check level requirement
    if US_CONFIG.REQUIRE_LEVEL and isEquipPosition(toPosition) then
        if player:getLevel() < item:getItemLevel() and not item:isLimitless() then
            player:sendTextMessage(MESSAGE_STATUS_SMALL, "You need a higher level to equip that item.")
            return false
        end
    end

    -- Handle equip logic
    if isEquipPosition(toPosition) and (fromPosition.y >= 64 or fromPosition.x ~= CONTAINER_POSITION) then
        -- Remove conditions from old item in slot
        local oldItem = player:getSlotItem(toPosition.y)
        if oldItem and oldItem:getType():isUpgradable() then
            AttributeService.removeItemConditions(player, oldItem)
        end

        -- Apply new item conditions
        if item:getType():isUpgradable() then
            local newBonuses = item:getBonusAttributes()
            if newBonuses then
                -- Apply magic level bonus immediately
                local bonusML = item:getCustomAttribute("bonus_magiclevel")
                if bonusML and bonusML > 0 then
                    local c = Condition(CONDITION_ATTRIBUTES)
                    c:setParameter(CONDITION_PARAM_STAT_MAGICPOINTS, bonusML)
                    c:setParameter(CONDITION_PARAM_TICKS, -1)
                    c:setParameter(CONDITION_PARAM_SUBID, 70000 + player:getId() % 1000)
                    c:setParameter(CONDITION_PARAM_BUFF_SPELL, true)

                    addEvent(function()
                        local p = Player(player:getId())
                        if p then
                            p:addCondition(c)
                        end
                    end, 100)
                end

                -- Schedule other effects after a short delay
                addEvent(AttributeService.applyItemEffects, 10, player:getId(), item:getUniqueId(), toPosition.y)
            end
        end
    end

    return true
end

--- Handle post-move logic for items.
-- @param player Player Player who moved the item
-- @param item Item Item that was moved
-- @param fromPosition Position Source position
-- @param toPosition Position Target position
function AttributeService.handleItemMoved(player, item, fromPosition, toPosition)
    -- Skip non-upgradable items
    if not item:getType():isUpgradable() then
        return
    end

    -- Skip if item is being equipped
    if isEquipPosition(toPosition) then
        return
    end

    -- Skip if item is just being moved within containers
    if fromPosition.y >= 64 and toPosition.y >= 64 then
        return
    end
    if fromPosition.y >= 64 and toPosition.y == CONST_SLOT_BACKPACK then
        return
    end

    -- Handle unequipping an item
    if isEquipPosition(fromPosition) then
        AttributeService.removeItemConditions(player, item)

        -- Remove magic level bonus
        local ml = item:getCustomAttribute("bonus_magiclevel")
        if ml and ml > 0 then
            player:removeCondition(CONDITION_ATTRIBUTES, CONDITIONID_COMBAT, 70000 + player:getId() % 1000)
        end
    end
end

return AttributeService
