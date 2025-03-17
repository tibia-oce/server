function Party:onJoin(player)
	onDungeonPartyJoin(self, player)
	local onJoin = EventCallback.onJoin
	if onJoin then
		return onJoin(self, player)
	end
	return true
end

function Party:onLeave(player)
	onDungeonPartyLeave(self, player)
	local onLeave = EventCallback.onLeave
	if onLeave then
		return onLeave(self, player)
	end
	return true
end

function Party:onDisband()
	onDungeonPartyDisband(self)
	local onDisband = EventCallback.onDisband
	if onDisband then
		return onDisband(self)
	end
	return true
end

function Party:onShareExperience(exp)
    local rawExp = exp
    local partyComposition = self:getPartyComposition()
    local expMultiplier = self:calculateExperienceMultiplier(partyComposition.uniqueVocationCount, partyComposition.totalMembers)
    local sharedExp = math.ceil((exp * expMultiplier) / partyComposition.totalMembers)
    local onShareExperience = EventCallback.onShareExperience
    return onShareExperience and onShareExperience(self, sharedExp, rawExp) or sharedExp
end

function Party:onInvite(player)
	local onInvite = EventCallback.onInvite
	if onInvite then
		return onInvite(self, player)
	end
	return true
end

function Party:onRevokeInvitation(player)
	local onRevokeInvitation = EventCallback.onRevokeInvitation
	if onRevokeInvitation then
		return onRevokeInvitation(self, player)
	end
	return true
end

function Party:onPassLeadership(player)
	onDungeonPartyLeaderPass(self, oldLeader, newLeader)
	local onPassLeadership = EventCallback.onPassLeadership
	if onPassLeadership then
		return onPassLeadership(self, player)
	end
	return true
end

function Party:getPartyComposition()
    local uniqueVocations = {}
    local composition = {
        uniqueVocationCount = 0,
        totalMembers = 1
    }

    local leaderVocationId = self:getLeader():getVocation():getBase():getId()
    if leaderVocationId ~= VOCATION_NONE then
        uniqueVocations[leaderVocationId] = true
    end

    local members = self:getMembers()
    composition.totalMembers = composition.totalMembers + #members

    for _, member in ipairs(members) do
        local vocationId = member:getVocation():getBase():getId()
        if vocationId ~= VOCATION_NONE then
            uniqueVocations[vocationId] = true
        end
    end

    for _ in pairs(uniqueVocations) do
        composition.uniqueVocationCount = composition.uniqueVocationCount + 1
    end

    return composition
end

function Party:calculateExperienceMultiplier(uniqueVocationCount, partySize)
    -- A re-balanced hybrid experience formula to reward party play but bring it more in line with solo play/vocation non-diversity
    -- Interactive comparison available at: https://gist.github.com/jordanhoare/b55456968c5e673d414b992ab95e9798
    
    if uniqueVocationCount <= 1 then
        return 1.20
    end
    
    local rawVocationBonus = ((uniqueVocationCount * (5 * (uniqueVocationCount - 1) + 15)) / 100)
    local scalingFactor = 1 / (1 + 0.15 * (partySize - 1))
    
    return 1.0 + (rawVocationBonus * scalingFactor)
end
