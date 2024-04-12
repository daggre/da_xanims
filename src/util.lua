local CanShoot = true
local DisableFiringThread = false
local IsHolding = nil

AnimUtil.AdjustStaminaCore = function(ped, amount)
    local staminaCore = Citizen.InvokeNative(0x36731AC041289BB1, ped, 1) -- GetAttributeCoreValue Stamina
    Citizen.InvokeNative(0xC6258F41D86676E0, ped, 1, math.ceil(staminaCore + amount)) -- SetAttributeCoreValue Stamina
end

AnimUtil.AtWaterSource = function(ent)
    local waterSources = da.Util.GetEntitiesNearPoint(GetEntityCoords(ent), 1.8, function(entity)
        return AnimConfig.WaterSources[GetEntityModel(entity)] ~= nil
    end)
    return waterSources and #waterSources > 0
end

AnimUtil.BucketContainsWater = function()
    local bucket = {}
    bucket.id, bucket.metadata = AnimUtil.GetClosestIntObj("Bucket")
    if not bucket.metadata then return false; end
    return bucket.metadata.resourceAmount and bucket.metadata.resourceAmount > 0 or false
end

AnimUtil.ChangeCore = function(entity, changeData)
    for stat, value in pairs(changeData) do
        if AnimUtil.StatModifiers[stat] then
            AnimUtil.StatModifiers[stat](entity, value)
        else
            da.Log.Warn(da.Log.Line(debug.getinfo(1)), "Encountered invalid stat modifier: "..stat)
        end
    end
end

AnimUtil.CheckAndSetDefaultMetadata = function(item, metadataCondition, defaultMetadata)
    if not defaultMetadata then return item; end
    if not item.info or (type(item.info) ~= "table" and type(metadataCondition) == "table") then
        item.info = defaultMetadata
    end
    for metadataField, defaultValue in pairs(defaultMetadata) do
        if item.info[metadataField] == nil then
            item.info[metadataField] = defaultValue
            da.API.SetItemMetadata(item, item.info)
        end
    end
    return item
end

AnimUtil.DisableFiring = function(bool)
    CanShoot = not bool

    if not DisableFiringThread then
        DisableFiringThread = true
        local playerPedId = PlayerPedId()
        Citizen.CreateThread(function()
            while not CanShoot do
                DisableControlAction(0, `INPUT_AIM`, true)
                DisablePlayerFiring(playerPedId, true)
                Citizen.Wait(1)
            end
            DisableFiringThread = false
        end)
    end
end

AnimUtil.EquipWeapon = function(attachPoint)
    local playerPedId = PlayerPedId()
    local hasWeapon, activeWeapHash = GetCurrentPedWeapon(playerPedId, true, attachPoint, true)
    if not hasWeapon then return false; end
    GiveWeaponToPed_2(playerPedId, activeWeapHash, 0, true, false, 0, true)
end

AnimUtil.GetClosestIntObj = function(interactTypeSpecific)
    da.Log.Debug(("Calling GetClosestIntObj type: %s"):format(interactTypeSpecific))
    local closestZoneId = nil
    local closestZoneData = nil
    local interactTypeHeightPriority = { .Bale, .Sack, .Crate, }

    local zones = AnimUtil.GetInteractiveZones("object", interactTypeSpecific)
    local playerCoords = GetEntityCoords(PlayerPedId())
    local minDist, maxZ = nil, nil
    for _, zoneData in ipairs(zones) do
        if interactTypeHeightPriority[interactTypeSpecific] then
            if not maxZ or zoneData.coords.z > maxZ then
                maxZ = zoneData.coords.z
                closestZoneId = zoneData.id
                closestZoneData = zoneData
            end
        else
            local dist = #(zoneData.coords.xyz - playerCoords)
            if not minDist or minDist > dist then
                minDist = dist
                closestZoneId = zoneData.id
                closestZoneData = zoneData
            end
        end
    end

    return closestZoneId, closestZoneData
end

AnimUtil.GetInteractiveZones = function(interactType, interactTypeSpecific)
    return da.Zone.Filter(function(zoneData)
        return (interactType == nil or zoneData.metadata.interactType == interactType) and
            (interactTypeSpecific == nil or zoneData.metadata.interactTypeSpecific == interactTypeSpecific)
    end)
end

AnimUtil.GetInteractiveZone = function(interactType, interactTypeSpecific)
    return da.Zone.Get(function(zoneData)
        print(zoneData.metadata.interactType, interactType, zoneData.metadata.interactTypeSpecific, interactTypeSpecific)
        if interactType ~= nil and zoneData.metadata.interactType == interactType then
            if interactTypeSpecific ~= nil and zoneData.metadata.interactTypeSpecific == interactTypeSpecific then
                return true
            elseif interactTypeSpecific == nil then
                return true
            end
        end
        return false
    end)
end

AnimUtil.GetStallQuality = function(propData, chore, alternate)
    if not propData or not propData.id or not propData.ranchName then return false; end

    local jobIndex = propData.id
    local ranchName = propData.ranchName
    local quality, quality2 = da.Net.BlockingCb("ranching:server:getChoreData", 2000, ranchName, chore, jobIndex)

    return alternate and tonumber(quality2) or tonumber(quality)
end

AnimUtil.ItemHasMetadata = function(items, metadataCondition, defaultMetadata)
    if not da.API.Active then return true; end
    for _, item in pairs(items) do
        item = AnimUtil.CheckAndSetDefaultMetadata(item, metadataCondition, defaultMetadata)
        for name, evalFn in pairs(metadataCondition) do
            if not item.info[name] and metadataCondition[name] then
                item.info[name] = metadataCondition[name]
            end
            if evalFn(item.info[name]) then
                return true
            end
        end
    end
    return false
end

AnimUtil.MonitorIdleAnimHalt = function()
    IsHolding = nil
end

AnimUtil.MonitorIdleAnim = function(animState, info)
    IsHolding = { animState.animDict, animState.anim }
    local config = animState.idleAnimConfig

    local exit = false
    local walkSpeed = config.speed or 100
    Citizen.CreateThread(function()
        da.Log.DebugVerbose("Start MonitorIdle", animState.animDict, animState.anim)
        while IsHolding and IsHolding[1] == animState.animDict and IsHolding[2] == animState.anim do
            local wait = 0
            local needsStumble = false
            local needsDrop = false
            local clearPedTasks = true
            local hasWeapon, weaponHash = GetCurrentPedWeapon(info.ped)

            if walkSpeed < 1.0 then SetPedMaxMoveBlendRatio(info.ped, walkSpeed) end
            if IsPedDeadOrDying(info.ped) or
            IsPedFalling(info.ped) or
            Citizen.InvokeNative(0x9682F850056C9ADE, info.ped) or -- IsPedLassoed
            Citizen.InvokeNative(0xD453BB601D4A606E, info.ped) or -- IsPedBeingHogtied
            Citizen.InvokeNative(0x3AA24CCC0D451379, info.ped) then -- IsPedHogtied
                needsStumble = true
            elseif config.canSprint == false or config.canRun == false and IsPedSprinting(info.ped) then
                needsStumble = true
                wait = 100
            elseif config.canRun == false and IsPedRunning(info.ped) then
                needsStumble = true
                wait = 400
            elseif Citizen.InvokeNative(0x3BDFCF25B58B0415, info.ped) then -- IsPedBeingGrappled
                needsDrop = true
                clearPedTasks = false
            elseif not config.allowWeapon and (hasWeapon and weaponHash ~= `weapon_unarmed`) or IsPedInMeleeCombat(info.ped) then
                needsDrop = true
            elseif config.canJump == false and IsPedJumping(info.ped) then
                wait = 140
                needsStumble = true
            elseif config.canClimb == false and (IsPedClimbing(info.ped) or Citizen.InvokeNative(0x59643424B68D52B5, info.ped)) then -- IsPedClimbingLadder
                wait = 400
                needsStumble = true
            elseif config.canClimb == false and IsPedVaulting(info.ped) then
                wait = 400
                needsStumble = true
            elseif config.canRide == false and (
                IsPedOnMount(info.ped) or
                IsPedSittingInAnyVehicle(info.ped) or
                IsPedOnVehicle(info.ped) or
                Citizen.InvokeNative(0x1D46B417F926D34D, info.ped)
            ) then -- IsPedEnteringAnyTransport
                needsStumble = true
            elseif config.canCrouch == false and (Citizen.InvokeNative(0xD5FE956C70FF370B, info.ped)) then
                needsDrop = true
            end
            if needsStumble then
                Citizen.Wait(wait)
                -- Wait(250)
                exit = true
                local rdTimeout = GetGameTimer() + 3000
                while not CanPedRagdoll(info.ped) and rdTimeout >= GetGameTimer() do
                    Citizen.Wait(0);
                    if clearPedTasks then ClearPedTasksImmediately(info.ped); end
                end
                SetPedToRagdoll(info.ped, 2000, 2000, 0, false, false, false)
                needsDrop = true
            end
            if needsDrop then
                if AnimInfo then AnimInfo.exit = true; end
                if clearPedTasks and not needsStumble then ClearPedTasksImmediately(info.ped); end
                exit = true
                for propName, prop in pairs(info.prop) do
                    Prop.Detach(cacheProp, {
                        velocity = 0.8,
                        angle = 24.0,
                        distance = 1.0,
                        forceWait = config.wait or 2000,
                    })
                    info.prop[propName] = nil
                end
                IsHolding = nil
                if config.onDrop then config.onDrop(info) end
                TriggerEvent("da_xanims:forceExit", 1000)
            end
            if IsHolding ~= nil and not exit and not IsEntityPlayingAnim(info.ped, animState.animDict, animState.anim, 49) then
                if animState.animDict and animState.animDict ~= "" and animState.anim and animState.anim ~= "" then
                    playAnim(
                        info.ped,
                        animState.animDict,
                        animState.anim,
                        info.nextBlendInSpeed or animState.blendInSpeed,
                        animState.blendOutSpeed,
                        animState.animDuration or animState.duration,
                        animState.flag,
                        animState.playbackRate,
                        animState.ikFlags,
                        animState.taskFilter
                    )
                end
            end
            Citizen.Wait(0)
        end
    end)
end

AnimUtil.StatModifiers = {}

AnimUtil.StatModifiers.Stamina = function(entity, val)
    val = val + 0.0
    Citizen.InvokeNative(0xC3D4B754C0E86B9E, entity, val) --ChangePedStamina
end

AnimUtil.StatModifiers.Health = function(entity, val)
    val = val + 0.0
    Citizen.InvokeNative(0x835F131E7DC8F97A, entity, val) --ChangeEntityHeath
end

AnimUtil.StatModifiers.Hunger = function(entity, val)
    da.Fn.Eat(val)
end

AnimUtil.StatModifiers.Thirst = function(entity, val)
    da.Fn.Drink(val)
end

AnimUtil.ToggleAttachable = function(attachableId, state)
    TriggerEvent("da_attachable:client:toggle", attachableId, state)
end

AnimUtil.UnequipWeapon = function(attachPoint)
    local playerPedId = PlayerPedId()
    local hasWeapon, activeWeapHash = GetCurrentPedWeapon(playerPedId, true, 0, true)
    if not hasWeapon then return false; end
    GiveWeaponToPed_2(playerPedId, activeWeapHash, 0, false, true, attachPoint, true)
end
