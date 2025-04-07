-- data/scripts/custom/itemupgrades/core.lua
-- Main bridging code (no TFS event registrations here).
print(">> Loading Upgrade System")

dofile('data/scripts/custom/itemupgrades/augments.lua')
dofile('data/scripts/custom/itemupgrades/magiclevel.lua')

US_CONDITIONS = {}
US_BUFFS = {}
local US_SUBID = {}

--- Checks if two creatures are in the same party.
-- @param creature1 Creature
-- @param creature2 Creature
-- @return boolean
function isInSameParty(creature1, creature2)
    if creature1:isPlayer() and creature2:isPlayer() and creature1:getParty() and creature2:getParty() then
        return creature1:getParty() == creature2:getParty()
    end
    return false
end

--- Process kill triggers for a player when they kill a monster.
-- @param player Player
-- @param center Position
-- @param target Creature
function processKillTriggers(player, center, target)
    for slot = CONST_SLOT_HEAD, CONST_SLOT_AMMO do
        local item = player:getSlotItem(slot)
        if item then
            local values = item:getBonusAttributes()
            if values then
                for _, v in pairs(values) do
                    local attr = US_ENCHANTMENTS[v[1]]
                    if attr and attr.triggerType == US_TRIGGERS.KILL then
                        attr.execute(player, v[2], center, target)
                    end
                end
            end
        end
    end
end

--- Checks if a player's gear should revive them upon death.
-- @param creature Creature
-- @return boolean : True if revived
function checkReviveOnDeath(creature)
    for slot = CONST_SLOT_HEAD, CONST_SLOT_AMMO do
        local item = creature:getSlotItem(slot)
        if item then
            local values = item:getBonusAttributes()
            if values then
                for _, v in pairs(values) do
                    local attr = US_ENCHANTMENTS[v[1]]
                    if attr and attr.name == "Revive on death" then
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

--- Adjusts experience gained based on equipment bonuses.
-- @param player Player
-- @param exp number
-- @return number : Modified experience
function calculateModifiedExperience(player, exp)
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

--- Validates and handles item movement, applying equip logic if needed.
-- @param player Player
-- @param item Item
-- @param fromPosition Position
-- @param toPosition Position
-- @return boolean : True if allowed
function handleItemMove(player, item, fromPosition, toPosition)
    if (not item:getType():isUpgradable() and not item:getType():canHaveItemLevel()) or toPosition.y == CONST_SLOT_AMMO then
        return true
    end
    if not item:getType():usesSlot(toPosition.y) then
        return true
    end

    if US_CONFIG.REQUIRE_LEVEL and isEquipPosition(toPosition) then
        if player:getLevel() < item:getItemLevel() and not item:isLimitless() then
            player:sendTextMessage(MESSAGE_STATUS_SMALL, "You need a higher level to equip that item.")
            return false
        end
    end

    -- Equip logic
    if isEquipPosition(toPosition) and (fromPosition.y >= 64 or fromPosition.x ~= CONTAINER_POSITION) then
        local oldItem = player:getSlotItem(toPosition.y)
        if oldItem and oldItem:getType():isUpgradable() then
            removeItemConditions(player, oldItem)
        end

        if item:getType():isUpgradable() then
            local newBonuses = item:getBonusAttributes()
            if newBonuses then
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
                addEvent(us_onEquip, 10, player:getId(), item:getUniqueId(), toPosition.y)
            end
        end
    end
    return true
end

--- Checks if a Position is an equipment slot.
-- @param position Position
-- @return boolean
function isEquipPosition(position)
    return position.y <= CONST_SLOT_AMMO and position.y ~= CONST_SLOT_BACKPACK
end

--- Handles post-move logic, e.g. unequipping items.
-- @param player Player
-- @param item Item
-- @param fromPosition Position
-- @param toPosition Position
function handleItemMoved(player, item, fromPosition, toPosition)
    if not item:getType():isUpgradable() then
        return
    end
    if isEquipPosition(toPosition) then
        return
    end
    if fromPosition.y >= 64 and toPosition.y >= 64 then
        return
    end
    if fromPosition.y >= 64 and toPosition.y == CONST_SLOT_BACKPACK then
        return
    end

    if isEquipPosition(fromPosition) then
        removeItemConditions(player, item)
        local ml = item:getCustomAttribute("bonus_magiclevel")
        if ml and ml > 0 then
            player:removeCondition(CONDITION_ATTRIBUTES, CONDITIONID_COMBAT, 70000 + player:getId() % 1000)
        end
    end
end

--- Removes condition bonuses from a player's item.
-- @param player Player
-- @param item Item
function removeItemConditions(player, item)
    local bonuses = item:getBonusAttributes()
    if bonuses then
        local itemId = item:getId()
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

        local ml = item:getCustomAttribute("bonus_magiclevel")
        if ml and ml > 0 and US_CONDITIONS[MAGICLEVEL.ATTR_ID] and US_CONDITIONS[MAGICLEVEL.ATTR_ID][ml] and
            US_CONDITIONS[MAGICLEVEL.ATTR_ID][ml][itemId] then
            player:removeCondition(CONDITION_ATTRIBUTES, CONDITIONID_COMBAT,
                US_CONDITIONS[MAGICLEVEL.ATTR_ID][ml][itemId]:getSubId())
        end
    end
end

--- Called when damage is dealt, adjusting final damage or healing based on gear.
-- @param creature Creature
-- @param attacker Creature
-- @param primaryDamage number
-- @param primaryType number
-- @param secondaryDamage number
-- @param secondaryType number
-- @param origin number
-- @return number, number, number, number
function us_onDamaged(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
    if primaryType == COMBAT_HEALING or secondaryType == COMBAT_HEALING then
        return processHealingModifiers(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType)
    end

    if attacker:isPlayer() then
        local mod = processAttackerModifiers(attacker, creature, primaryDamage, primaryType, secondaryDamage,
            secondaryType)
        primaryDamage = mod.primaryDamage
        secondaryDamage = mod.secondaryDamage
    end

    if creature:isPlayer() then
        local mod = processDefenderModifiers(creature, attacker, primaryDamage, primaryType, secondaryDamage,
            secondaryType)
        primaryDamage = mod.primaryDamage
        secondaryDamage = mod.secondaryDamage
    end
    return primaryDamage, primaryType, secondaryDamage, secondaryType
end

--- Adjusts healing amounts based on gear bonuses (attacker and target).
-- @param creature Creature
-- @param attacker Creature
-- @param primaryDamage number
-- @param primaryType number
-- @param secondaryDamage number
-- @param secondaryType number
-- @return number, number, number, number
function processHealingModifiers(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType)
    if attacker:isPlayer() then
        local primeTotal, secTotal = 0, 0
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
        if primaryType == COMBAT_HEALING and primeTotal > 0 then
            primaryDamage = math.floor(primaryDamage + (primaryDamage * primeTotal / 100))
        end
        if secondaryType == COMBAT_HEALING and secTotal > 0 then
            secondaryDamage = math.floor(secondaryDamage + (secondaryDamage * secTotal / 100))
        end
    end

    if creature:isPlayer() then
        local primeTotal, secTotal = 0, 0
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
        if primeTotal > 0 then
            primaryDamage = math.floor(primaryDamage + (primaryDamage * primeTotal / 100))
        end
        if secTotal > 0 then
            secondaryDamage = math.floor(secondaryDamage + (secondaryDamage * secTotal / 100))
        end
    end

    return primaryDamage, primaryType, secondaryDamage, secondaryType
end

--- Adjusts damage for attacker-based bonuses like life steal or double damage.
-- @param attacker Creature
-- @param target Creature
-- @param primaryDamage number
-- @param primaryType number
-- @param secondaryDamage number
-- @param secondaryType number
-- @return table : {primaryDamage, secondaryDamage}
function processAttackerModifiers(attacker, target, primaryDamage, primaryType, secondaryDamage, secondaryType)
    local doubleDamageTotal, primeTotal, secTotal = 0, 0, 0
    local lifeSteal, manaSteal = 0, 0

    for slot = CONST_SLOT_HEAD, CONST_SLOT_AMMO do
        local it = attacker:getSlotItem(slot)
        if it and it:getType():usesSlot(slot) then
            local values = it:getBonusAttributes()
            if values then
                for _, v in pairs(values) do
                    local a = US_ENCHANTMENTS[v[1]]
                    if a and a.combatType and a.combatType ~= US_TYPES.CONDITION then
                        if a.combatType == US_TYPES.TRIGGER and a.triggerType == US_TRIGGERS.ATTACK then
                            a.execute(attacker, target, v[2])
                        elseif a.name == "Double Damage" then
                            doubleDamageTotal = doubleDamageTotal + v[2]
                        else
                            if a.combatDamage then
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
                            end
                            if a.name == "Life Steal" then
                                lifeSteal = lifeSteal + v[2]
                            elseif a.name == "Mana Steal" then
                                manaSteal = manaSteal + v[2]
                            end
                        end
                    end
                end
            end
        end
    end

    if doubleDamageTotal > 0 and math.random(100) < doubleDamageTotal then
        primaryDamage = primaryDamage * 2
        secondaryDamage = secondaryDamage * 2
    end
    if primeTotal > 0 then
        local bonus = math.floor(primaryDamage * primeTotal / 100)
        primaryDamage = math.floor(primaryDamage + bonus)
    end
    if secTotal > 0 then
        local bonus = math.floor(secondaryDamage * secTotal / 100)
        secondaryDamage = math.floor(secondaryDamage + bonus)
    end

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

--- Adjusts damage for defender-based bonuses like damage reduction or triggers on being hit.
-- @param defender Creature
-- @param attacker Creature
-- @param primaryDamage number
-- @param primaryType number
-- @param secondaryDamage number
-- @param secondaryType number
-- @return table : {primaryDamage, secondaryDamage}
function processDefenderModifiers(defender, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType)
    local primeTotal, secTotal = 0, 0

    for slot = CONST_SLOT_HEAD, CONST_SLOT_AMMO do
        local it = defender:getSlotItem(slot)
        if it and it:getType():usesSlot(slot) then
            local values = it:getBonusAttributes()
            if values then
                for _, v in pairs(values) do
                    local a = US_ENCHANTMENTS[v[1]]
                    if a and a.combatType and a.combatType ~= US_TYPES.CONDITION then
                        if a.combatType == US_TYPES.TRIGGER and a.triggerType == US_TRIGGERS.HIT then
                            a.execute(defender, attacker, v[2])
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

--- Enhances item/creature description with item-level, enchantments, or total item level.
-- @param player Player
-- @param thing Thing
-- @param description string
-- @return string
function enhanceItemDescription(player, thing, description)
    if thing:isItem() then
        if thing.itemid == US_CONFIG.ITEM_MIND_CRYSTAL and thing:hasMemory() then
            description = enhanceMindCrystalDescription(thing, description)
        elseif thing:getType():isUpgradable() then
            description = enhanceUpgradableItemDescription(thing, description)
        elseif thing:getType():canHaveItemLevel() then
            description = enhanceItemLevelDescription(thing, description, 1)
        end
    elseif thing:isPlayer() then
        description = enhancePlayerDescription(player, thing, description)
    end
    return description
end

--- Appends any stored enchant data in a Mind Crystal to its description.
-- @param crystal Item
-- @param description string
-- @return string
function enhanceMindCrystalDescription(crystal, description)
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

local function overrideRequiredLevelText(description, item)
    description = description:gsub("(It can only be wielded properly by [^%.]- of level )(%d+)( or higher)",
        function(prefix, reqStr, suffix)
            local defaultLevel = tonumber(reqStr) or 0
            local lvl = item:getItemLevel()
            if lvl > defaultLevel then
                return prefix .. lvl .. suffix
            end
            return prefix .. reqStr .. suffix
        end)
    return description
end

local function getIndefiniteArticleFor(text)
    if text:sub(1, 1):lower():match("[aeiou]") then
        return "an"
    end
    return "a"
end

local function buildItemNameWithArticle(rarityName, baseName)
    if rarityName ~= "" then
        return string.format("%s %s %s", getIndefiniteArticleFor(rarityName), rarityName, baseName)
    end
    return string.format("%s %s", getIndefiniteArticleFor(baseName), baseName)
end

--- Extends the description of an upgradable item with upgrade level, item level, rarity, etc.
-- @param item Item
-- @param description string
-- @return string
function enhanceUpgradableItemDescription(item, description)
    local baseName = item:getName()
    local r = item:getRarity()
    local rname = (r and r.name ~= "") and r.name or ""
    local upg = item:getUpgradeLevel() or 0
    local lvl = item:getItemLevel()
    local bonuses = item:getBonusAttributes()

    description = description:gsub("You see (an? )", "You see ")
    description = description:gsub("You see the ", "You see ")
    local forcedName = buildItemNameWithArticle(rname, baseName)
    description = description:gsub("^(You see [^%(\n%.]+)", "You see " .. forcedName)

    if item:isUnique() then
        description = description:gsub(baseName, item:getUniqueName())
    end
    if upg > 0 then
        description = description:gsub("^(You see [^%(%.]+)", "%1 +" .. upg)
        description = description:gsub("(%+%d+)%(", "%1 (")
    end

    description = description:gsub("\nItem Level:%s?%d+", "")
    description = description .. "\n\n[ Attributes ]\nItem Level: " .. lvl
    description = MAGICLEVEL.extendDescription(item, description)

    if bonuses and #bonuses > 0 then
        local e = "\n\n[ Enchantments ]"
        for _, b in ipairs(bonuses) do
            local attrId, val = b[1], b[2]
            local attr = US_ENCHANTMENTS[attrId]
            if attr then
                local f = attr.format(val)
                if f and not description:find(f, 1, true) then
                    e = e .. "\n" .. f
                end
            end
        end
        description = description .. e
    end
    if item:isMirrored() and not description:find("Mirrored") then
        description = description .. "\nMirrored"
    end
    description = overrideRequiredLevelText(description, item)
    description = description:gsub("([^%s])%(", "%1 (")
    return description
end

--- Extends an item description for gear that only has an item level (no upgradable bonus).
-- @param item Item
-- @param description string
-- @param distance number
-- @return string
function enhanceItemLevelDescription(item, description, distance)
    local lvl = item:getItemLevel()
    if not description:match("^You see") then
        description = "You see " .. description
    end
    local it = ItemType(item:getId())
    local defDesc = it and it:getDescription() or ""

    description = description:gsub("\nItem Level: %d+", "")

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
-- @param observer Player
-- @param player Player
-- @param description string
-- @return string
function enhancePlayerDescription(observer, player, description)
    local sum = 0
    for slot = CONST_SLOT_HEAD, CONST_SLOT_AMMO do
        local it = player:getSlotItem(slot)
        if it then
            sum = sum + it:getItemLevel()
        end
    end
    return description .. "\nTotal Item Level: " .. sum
end

--- Applies item conditions on equip after a short delay.
-- @param cid number : Player ID
-- @param iuid number : Item UniqueID
-- @param slot number : Equipment slot
function us_onEquip(cid, iuid, slot)
    local player = Player(cid)
    if not player or not player:getSlotItem(slot) then
        return
    end

    local slotUid = player:getSlotItem(slot):getUniqueId()
    if (iuid + 1) ~= slotUid then
        return
    end

    local item = Item(slotUid)
    if not item then
        return
    end

    local newBonuses = item:getBonusAttributes()
    if newBonuses then
        local maxHP = player:getMaxHealth()
        local maxMP = player:getMaxMana()

        for i = 1, #newBonuses do
            local bId = newBonuses[i][1]
            local bVal = newBonuses[i][2]
            local attr = US_ENCHANTMENTS[bId]
            if attr and attr.combatType == US_TYPES.CONDITION then
                applyConditionBonus(player, item, bId, bVal, attr, slot, i, maxHP, maxMP)
            end
        end
        syncItemAugments(item)
    end
end

--- Applies a condition bonus from an attribute (e.g. Max HP%, Mana Shield).
-- @param player Player
-- @param item Item
-- @param bonusId number
-- @param bonusValue number
-- @param attr table
-- @param slot number
-- @param index number
-- @param maxHP number
-- @param maxMP number
function applyConditionBonus(player, item, bonusId, bonusValue, attr, slot, index, maxHP, maxMP)
    if not US_CONDITIONS[bonusId] then
        US_CONDITIONS[bonusId] = {}
    end
    local itemId = item:getId()
    if not US_CONDITIONS[bonusId][bonusValue] then
        US_CONDITIONS[bonusId][bonusValue] = {}
    end
    if not US_CONDITIONS[bonusId][bonusValue][itemId] then
        US_CONDITIONS[bonusId][bonusValue][itemId] = Condition(attr.condition)
        if attr.condition ~= CONDITION_MANASHIELD then
            US_CONDITIONS[bonusId][bonusValue][itemId]:setParameter(CONDITION_PARAM_SUBID,
                1000 + player:getNextSubId(slot, index))
            if attr.percentage then
                US_CONDITIONS[bonusId][bonusValue][itemId]:setParameter(attr.param, 100 + bonusValue)
            else
                US_CONDITIONS[bonusId][bonusValue][itemId]:setParameter(attr.param, bonusValue)
            end
            US_CONDITIONS[bonusId][bonusValue][itemId]:setParameter(CONDITION_PARAM_TICKS, -1)
        else
            US_CONDITIONS[bonusId][bonusValue][itemId]:setParameter(CONDITION_PARAM_TICKS, 86400000)
        end
        US_CONDITIONS[bonusId][bonusValue][itemId]:setParameter(CONDITION_PARAM_BUFF_SPELL, true)
        player:addCondition(US_CONDITIONS[bonusId][bonusValue][itemId])
    else
        player:addCondition(US_CONDITIONS[bonusId][bonusValue][itemId])
    end

    if attr.param == CONDITION_PARAM_STAT_MAXHITPOINTS or
        (attr.param == CONDITION_PARAM_STAT_MAXHITPOINTSPERCENT and player:getHealth() == maxHP) then
        player:addHealth(player:getMaxHealth())
    end
    if attr.param == CONDITION_PARAM_STAT_MAXMANAPOINTS or
        (attr.param == CONDITION_PARAM_STAT_MAXMANAPOINTSPERCENT and player:getMana() == maxMP) then
        player:addMana(player:getMaxMana())
    end
end

--- Applies any magic-level bonuses on login (stub here, actual in magiclevel.lua).
-- @param player Player
function applyMagicLevelBonuses(player)
    -- Overridden in magiclevel.lua if needed
end

--- Provides a unique subId for consecutive condition usage.
-- @param self Player
-- @param itemSlot number
-- @param attrSlot number
-- @return number
function Player.getNextSubId(self, itemSlot, attrSlot)
    local cid = self:getId()
    if not US_SUBID[cid] then
        US_SUBID[cid] = {
            current = 0
        }
    end
    US_SUBID[cid].current = US_SUBID[cid].current + 1
    if not US_SUBID[cid][itemSlot] then
        US_SUBID[cid][itemSlot] = {}
    end
    US_SUBID[cid][itemSlot][attrSlot] = US_SUBID[cid].current
    return US_SUBID[cid].current
end

--- Initializes augment synchronization for any existing players (script reload scenario).
function initializeAugmentIntegration()
    local p = Game.getPlayers()
    for _, pl in ipairs(p) do
        for slot = CONST_SLOT_HEAD, CONST_SLOT_AMMO do
            local it = pl:getSlotItem(slot)
            if it then
                syncItemAugments(it)
            end
        end
    end
end

-- Call once on script load
initializeAugmentIntegration()
