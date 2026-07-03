--- Copyright © 2024 Joshua Nelson

lazy.isInClearedVeg = function()
    if da_util.dependsOn("da_farming") then
        return exports.da_farming:IsInClearedVeg()
    end
    return false
end

lazy.isValidTurnIn = function()
    local resourceAmount = nil
    if AnimInfo and AnimInfo.prop then
        for _, prop in pairs(AnimInfo.prop) do
            log.debug("Checking propData for resourceAmount", _, prop)
            resourceAmount = prop.propData and prop.propData.metadata and tonumber(prop.propData.metadata.resourceAmount)
            if resourceAmount ~= nil and resourceAmount > 0 then
                return true
            end
        end
    end
    return false
end

AnimUtil.Farm = function(fieldData)
    local farmName = fieldData.farmName
    local tool = fieldData.metadata.tool
    local crop = fieldData.metadata.crop
    TriggerServerEvent("da_farming:server:attemptFarm", farmName, tool, crop, GetEntityCoords(PlayerPedId()))
end

AnimUtil.TurnInInteractTask = function(itemTurnInData, farmName)
    TriggerEvent("da_farming:client:taskTurnIn", itemTurnInData, farmName)
end

AnimUtil.IsInClearedVeg = function() lazy(1500).isInClearedVeg() end

AnimUtil.CanTurnInCrop = function(turnInType)
    local crop = nil
    -- Get the crop from the prop
    if AnimInfo and AnimInfo.prop then
        for _, prop in pairs(AnimInfo.prop) do
            crop = prop.propData and prop.propData.metadata and prop.propData.metadata.crop
            if crop then break; end
        end
    end
    if not crop then return false; end
    -- Get turn in zone matching crop
    local zoneData = AnimUtil.GetInteractiveZone(turnInType, crop)
    return zoneData ~= nil
end

AnimUtil.IsValidTurnIn = function() lazy(1500).isValidTurnIn() end
