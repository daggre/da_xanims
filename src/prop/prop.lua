local InteractivePropType = {
    bale = "Bale",
    bucket = "Bucket",
    crate = "Crate",
    feedTrough = "HayTrough",
    inspectFence = "InspectFence",
    sack = "Sack",
    shortFence = "ShortFence",
    tallFence = "TallFence",
    waterPump = "WaterPump",
    waterTrough = "WaterTrough",
    wheelbarrow = "Wheelbarrow",
}
local InteractiveZoneType = {
    stall = "AnimalStall",
    paddock = "Paddock",
}

Prop = {}
function Prop:new(propset, propData, id)
    local prop = {}
    setmetatable(prop, self)
    prop.propset = propset
    prop.propData = propData
    prop.id = id
    self.__index = self
    return prop
end

function Prop:init(entity, propset, propData, id)
    local p = Prop:new(propset, propData, id)
    p.entity = entity
    return p
end

function Prop:initNearby(type, worldEntity)
    local interactType, interactTypeSpecific = nil, nil
    if InteractivePropType[type] then
        interactType = "object"
        interactTypeSpecific = InteractivePropType[type]
    elseif InteractiveZoneType[type] then
        interactType = "zone"
        interactTypeSpecific = InteractiveZoneType[type]
    end
    if not interactTypeSpecific then return nil; end

    local id, propData = AnimUtil.GetClosestInteract(interactType, interactTypeSpecific)
    if not id or not propData then return nil; end

    local propset = propData.propset or Propset.Lookup[propData.objectHash]
    local entities = worldEntity and da_util.GetEntitiesNearPoint(propData.coords, 1.0, function(entity)
            return GetEntityModel(entity) == propData.objectHash
    end)
    local entity = entities and entities[1] or nil
    if propset and propset.interactRange ~= nil and not propData.disablePropSpawn then propData.attachWait = true; end -- Track race between removing groundprop and cleaninfo creating a new one
    return Prop:init(entity, propset, propData, id)
end

function Prop:create(coords)
    local coords = coords or self.propData and self.propData.coords or vec3(0, 0, 0)
    local rotation = self.propData and self.propData.spawnParams and self.propData.spawnParams.rotation or self.propset and self.propset.rotation or nil
    local objectHash = self.propData and self.propData.objectHash or self.propset and self.propset.objectHash or nil
    self.entity = da_obj.createObj(objectHash, coords, {
        network = true,
        netMissionEntity = true,
        rotation = rotation,
        fadeIn = self.propset.fadeIn,
        frozen = true,
})
    log.spam(("Entity (%s) created at %s"):format(self.entity, coords))
end

function Prop:attach(prop, propset)
    local entity = tonumber(prop) or (prop and tonumber(prop.entity)) or PlayerPedId()
    if not DoesEntityExist(entity) then return; end
    if propset then self.propset = propset; end
    local boneIndex = -1
    local position = self.propset and self.propset.position or vec3(0.0, 0.0, 0.0)
    local rotation = self.propset and self.propset.rotation or vec3(0.0, 0.0, 0.0)

    if self.propset.interactRange ~= nil then
        if self.propData then
            TriggerBlockingServerEvent("intprop:server:remove", 2000, self.propData)
            local numRemovals = da.Zone.Remove(function(zoneData)
                return zoneData.interactType == "object" and zoneData.id == self.propData.id
            end)
            log.debug(("Removed %s interactive prop zone(s) with id %s"):format(numRemovals or 0, self.propData.id))
        end
        if self.propData and self.propData.attachWait then self.propData.attachWait = nil; end -- Race is done, allow clean anim to spawn a new one
    end
    if self.entity == nil or not DoesEntityExist(self.entity) then
        self:create(GetEntityCoords(entity))
    end
    if self.propset and self.propset.bone then
        boneIndex = GetEntityBoneIndexByName(entity, self.propset.bone)
    end
    log.spam(("Attaching prop (%s) to entity (%s) at bone index %s (%s)"):format(self.entity, entity, boneIndex, self.propset.bone))
    da_obj.attach(self.entity, entity, boneIndex, position, rotation, { frozen = false, })
end

function Prop.Detach(prop, data, fn)
    if not prop then return; end
    if not data then prop:detach(); return; end

    local detachProp = prop
    Citizen.CreateThread(function()
        if fn then fn(); end
        detachProp:detach(data)
    end)
end

function Prop:detach(data)
    data = data or {}
    if not self.entity then return; end
    local playerVelocity = GetEntityVelocity(PlayerPedId())
    local x, y = 0, 0
    local velocity = data.velocity or 0.0
    velocity = velocity + playerVelocity.z
    local dropAngle = data.angle or 0.0
    local dropDist = data.distance or 0.0
    log.debug(("Detaching entity (%s)"):format(self.entity))

    x, y = da_util.TranslateCartesian(dropDist, GetEntityHeading(PlayerPedId()) - dropAngle)
    x += playerVelocity.x
    y += playerVelocity.y
    da_obj.set(self.entity, { frozen = false, collision = true })
    if data.forceWait then DetachEntity(self.entity, true, true); end
    SetEntityVelocity(self.entity, x, y, velocity)
    if data.forceWait then Citizen.Wait(data.forceWait); end
    local dropTimeout = GetGameTimer() + 30000
    while #GetEntityVelocity(self.entity) > 0.005 and GetGameTimer() < dropTimeout do
        Citizen.Wait(0)
    end
    if self.propData and not self.propData.disablePropSpawn and self.propset and self.propset.interactRange ~= nil and not self.propData.attachWait then
        self:spawnIntProp()
        Citizen.Wait(500)
    end
    if not data.forceWait then DetachEntity(self.entity, true, true); end
    self:_delete()
end

-- Wrapper for deleting entity
function Prop.Delete(prop)
    if prop then
        prop:_delete()
        prop = nil
    end
end

function Prop:_delete()
    if self and self.entity ~= nil and DoesEntityExist(self.entity) then
        log.spam(("Deleting entity (%s)"):format(self.entity), log.line(3))
        da_obj.delete(self.entity)
        self.entity = nil
    end
end

function Prop:getInteractCoords(entity, variant, debug)
    log.spam("Getting Interact Coords", entity, variant, debug)
    if not self.propData or not self.propset or not self.propset.offset then return; end

    local currentCoords = GetEntityCoords(entity)
    local minDist = nil
    local minCoords = nil

    local heading = self.propData.spawnParams and self.propData.spawnParams.rotation and self.propData.spawnParams.rotation.z or self.propData.coords and self.propData.coords.w or 0
    for _, offset in ipairs(self.propset.offset) do
        if not variant and not offset.interactType or variant == offset.interactType then
            local offRot = tonumber(offset.rotation) and tonumber(offset.rotation) or 0.0
            local offX, offY = da_util.TranslateCartesian(offset.distance, heading + offset.angle)
            local interactPos = vec4(
                self.propData.coords.x + offX,
                self.propData.coords.y + offY,
                self.propData.coords.z,
                heading
            )
            -- log.spam(offset.angle, offX, offY, interactPos)
            local dist = #(currentCoords - interactPos.xyz)
            if not minDist or dist < minDist then
                minDist = dist
                minCoords = vec4(interactPos.xyz, interactPos.w + offset.angle - 180 + offRot)
            end
            -- log.spam("Debugging offset...")
            -- DebugOffset(vec4(interactPos.xyz, interactPos.w + offset.angle - 180 + offRot), offset)
        end
    end

    return minCoords
end

function Prop:expression(value)
    if not self.entity or not self.propset or not self.propset.expression then return; end
    if self.propset.expression.DOF_Name then
        log.spam("Modifying entity expression", self.entity, value)
        da_obj.expression(self.entity, self.propset.expression.DOF_Name, value, self.propset.expression.type)
    end
end

function Prop:moveTo(entity, variant, force)
    local coords = self:getInteractCoords(entity, variant)
    log.debug(("Moving to %s"):format(coords))
    if coords then da_move.to(entity, coords, 2500, force); end
end

function Prop:lock(callbackTimeout, lockTimeout)
    if not self.id then return false; end
    callbackTimeout = callbackTimeout or 2000
    local locked = gl_xlock("da_xanims", self.id, callbackTimeout)
    if not locked then
        API.notify("This area is in use", "info")
    end
    return locked
end

function Prop:spawnIntProp()
    FreezeEntityPosition(self.entity, true)
    local objectHash = self.propData.objectHash
    if not objectHash then return; end

    self.propData.range = self.propData.range or self.propset.interactRange
    log.debug("spawnIntProp propData:", self.propData)
    local coords = GetEntityCoords(self.entity)
    local rotation = GetEntityRotation(self.entity)
    if self.propData and not self.propData.spawnParams then self.propData.spawnParams = {}; end
    self.propData.spawnParams.rotation = rotation
    da.Obj.CreateIntProp(objectHash, coords, self.propData.metadata, self.propData.spawnParams)
end

-- local DebugDraw = true
-- RegisterCommand("da_debug_draw_on", function(source, args, rawCommand)
--     DebugDraw = true
-- end, false)
-- RegisterCommand("da_debug_draw_off", function(source, args, rawCommand)
--     DebugDraw = false
--     da.Draw.Disable()
-- end, false)
-- RegisterCommand("da_debug_draw_reset", function(source, args, rawCommand)
--     DebugDraw = false
--     da.Draw.Disable()
--     DebugDraw = true
-- end, false)
-- RegisterCommand("da_debug_offset", function(source, args, rawCommand)
--     local ped = PlayerPedId()
--     for interactType in pairs(InteractivePropType) do
--         log.spam("Getting nearby interact type:", interactType)
--         local prop = Prop:initNearby(interactType)
--         if prop then prop:getInteractCoords(ped, nil, true); end
--     end
-- end, false)
-- DebugOffset = function(offsetCoords, offsetData)
--     if DebugDraw then
--         da.Draw.LineVert(offsetCoords, 1.5)
--         da.Draw.Text(offsetCoords, tostring(offsetData.angle))
--         offsetCoords += vec4(0,0,1.5,0)
--         da.Draw.LineHoriz(offsetCoords, 0.3)
--     end
-- end
--
-- AddEventHandler('onResourceStop', function(resourceName)
--     if GetCurrentResourceName() == resourceName then
--         da.Draw.Disable()
--     end
-- end)
