--- Copyright © 2024 Joshua Nelson

local RunningHooks = {}
-- Fill out AnimLib with reverse lookups for index and hashed entries
-- Generates alphabetically sorted transition lists by keymap
-- This needs to run AFTER all AnimLib's are defined
Citizen.CreateThread(function()
    local function keySort(a,b) return a[1] < b[1]; end

    -- Adds an id field in each idles/animations key value pair, which is the key
    -- so that it can be used in reverse lookups
    -- Example:
    --   AnimLib.world_human_smoking.idles.idle_a_armsdown.id = "idle_a_armsdown"
    --   AnimLib.world_human_smoking.animations.a_trans_c.id = "a_trans_c"

    -- Each animation defined in AnimLib
    for animLibName, animLib in pairs(AnimLib) do
        -- Create id key which is reverse lookup of index
        animLib.id = animLibName
        if not animLib.condition then
            animLib.condition = function() return Conditions.Check({}) end
        end
        if animLib.enter then
            animLib.enter.id = "enter"
            if not animLib.enter.animLibName then
                animLib.enter.animLibName = animLibName
            end
        end
        if animLib.exit then
            animLib.exit.id = "exit"
            if not animLib.exit.animLibName then
                animLib.exit.animLibName = animLibName
            end
        end
        if animLib.idles then
            assert(type(animLib.idles) == "table", "Misconfigured idles in AnimLib."..tostring(animLibName))
            for animId, animState in pairs(animLib.idles) do
                assert(type(animLib.idles[animId]) == "table", "Misconfigured idle '"..tostring(animId).."' in AnimLib."..tostring(animLibName))
                -- Add id to animation for reverse lookups
                animState.id = animId
                animState.animLibName = animLibName
                if animState.transitions then
                    -- Created a sorted (by keymap) table
                    animState.sortedtransitions = {}
                    for anim, key in pairs(animState.transitions) do
                        local sortableKeyData = {key, anim}
                        table.insert(animState.sortedtransitions, sortableKeyData)
                    end
                    table.sort(animState.sortedtransitions, keySort)
                end
            end
        end
        if animLib.animations then
            assert(type(animLib.animations) == "table", "Misconfigured animations in AnimLib."..tostring(animLibName))
            for animId, animState in pairs(animLib.animations) do
                assert(type(animLib.animations[animId]) == "table", "Misconfigured animation '"..tostring(animId).."' in AnimLib."..tostring(animLibName))
                -- Add id to animation for reverse lookups
                animState.id = animId
                if not animState.animLibName then
                    animState.animLibName = animLibName
                end
            end
        end
    end
end)

ActiveAnim = nil -- { animLib, animState, animStateName }
AnimStateQueue = {} -- { { animLib, animState, animStateName }, {...} }
AnimInterrupt = false
AnimInfo = nil

function IsStateType(state, type)
    if not state then return false; end
    return string.sub(state, 1, #type) == type
end

function GetState(animLib, stateName)
    local animState = nil
    if not animLib then return nil; end

    if not stateName then
        da.Log.DebugVerbose("State not found", stateName, animLib)
    end
    if IsStateType(stateName, "enter") then
        animState = animLib.enter
    elseif IsStateType(stateName, "exit") and not IsStateType(stateName, "exit_") then
        animState = animLib.exit
    elseif IsStateType(stateName, "idle") and animLib.idles then
        animState = animLib.idles[stateName]
    elseif animLib.animations then
        animState = animLib.animations[stateName]
    end

    return animState
end

function CleanAnimInfo(animInfo)
    da.Log.DebugVerbose("Cleaning AnimInfo...", da.Log.Line(debug.getinfo(2)))
    for hookId in pairs(RunningHooks) do
        da.Log.DebugVerbose("Delaying clean, active hook:", hookId)
        local hookTimeout = GetGameTimer() + 10000
        while RunningHooks[hookId] or GetGameTimer() > hookTimeout do
            Citizen.Wait(10)
        end
        da.Log.DebugVerbose("Hook complete", hookId)
    end
    AnimUtil.MonitorIdleAnimHalt()
    if not animInfo then return; end
    if animInfo.final then
        animInfo.final(animInfo)
        animInfo.final = nil
    end
    for propName, prop in pairs(animInfo.prop) do -- I dont think this is necessary after prop rework, perm props shouldnt be added to info.prop
        if not animInfo.permanent or not animInfo.permanent[propName] then
            if prop ~= nil then prop:_delete(); end
        end
        animInfo.prop[propName] = nil
    end
    if animInfo.music then
        StopStream(animInfo.music)
        animInfo.music = nil
    end
    animInfo.nextBlendInSpeed = nil
    animInfo.exit = nil
    animInfo.gotoIdle = nil
    animInfo.gotoExit = nil
    animInfo = nil
    return animInfo
end

function UpdateCurrentIdle(animInfo, animLib)
    if not animInfo then return; end
    if animLib.idles then
        _, animInfo.idle = next(animLib.idles)
    end
    return animInfo
end

local function loadAnimDict(dict)
    local timeout = 200
    local loopWaitTime = 5
    local waitTime = 0
    while ( not HasAnimDictLoaded( dict ) or waitTime > timeout ) do
        RequestAnimDict( dict )
        waitTime = waitTime + loopWaitTime
        Citizen.Wait(loopWaitTime)
    end
end

function playAnim(ped, animDictionary, animName, blendInSpeed, blendOutSpeed, duration, flags, playbackRate, ikFlags, taskFilter)
    blendInSpeed = tonumber(blendInSpeed) or 3.0
    blendOutSpeed = tonumber(blendOutSpeed) or 0.5
    duration = tonumber(duration) or -1
    flags = tonumber(flags) or 0
    playbackRate = tonumber(playbackRate) or 0 -- Values from 0.0 to 1.0 (0.05 is near default)
    ikFlags = tonumber(ikFlags) or 0
    local p10 = 0
    taskFilter = false
    local p12 = 0

    loadAnimDict(animDictionary)
    ClearPedSecondaryTask(ped)
    da.Log.DebugVerbose(ped, animDictionary, animName, blendInSpeed, blendOutSpeed, duration, flags, playbackRate, ikFlags, p10, taskFilter, p12) -- DEBUG
    da.Log.DebugVerbose(("Anim dur: %.1fs @ %.1fs"):format(GetAnimDuration(animDictionary, animName), GetGameTimer()/1000))
    TaskPlayAnim(
        ped,
        animDictionary,
        animName,
        blendInSpeed,
        blendOutSpeed,
        duration,
        flags,
        playbackRate,
        ikFlags,
        p10,
        taskFilter,
        p12
        )
    RemoveAnimDict(animDictionary)
end

function InitializeAnimInfo(animInfo, animLib, entity, info)
    if animInfo == nil then animInfo = { prop = {}, }; end
    if animInfo.ped == nil then animInfo.ped = entity; end
    if info ~= nil then animInfo.args = info; end
    animInfo = UpdateCurrentIdle(animInfo, animLib)
    return animInfo
end

function IsExitingAnimState(animLib, animStateName)
    if not animLib or not animStateName then return false; end

    if IsStateType(animStateName, "exit") then
        return true
    -- elseif not animLib.exit and not animLib.transitions and not animLib.idles then
    elseif not animLib.exit and not animLib.idles then -- TODO and not animState.next
        return true
    end
    return false
end

local function playEntityAnim(entity, animDictionary, animName, loop, stayInAnim, delta, bitset)
    local p3 = 0.0
    loop = loop or 0
    stayInAnim = stayInAnim or 0
    local p6 = ""
    delta = delta or 0.0
    bitset = bitset or 0

    da.Log.DebugVerbose(entity, animDictionary, animName, p3, loop, stayInAnim, p6, delta, bitset)
    loadAnimDict(animDictionary)
    PlayEntityAnim(entity, animName, animDictionary, p3, loop, stayInAnim, p6, delta, bitset)
    RemoveAnimDict(animDictionary)
end

function PlayAnimState(animLib, animState, stateName, info)
    if not animLib or type(animLib) ~= "table" then
        da.Log.Error(da.Log.Line(debug.getinfo(2)), "Playing anim with no animLib.", stateName, animState, info)
        return
    end
    -- Initialize animLib on enter
    if IsStateType(stateName, "enter") then
        -- assert(not ActiveAnim, "Tried to enter animation while animation is already active.")
        if ActiveAnim then
            da.Log.Error(da.Log.Line(debug.getinfo(1)), "Tried to enter animation while animation is already active.")
            return
        end
        local playerPedId = PlayerPedId()
        local condition = animLib.triggerCondition or animLib.condition
        if Conditions.BatchCache(playerPedId) and not condition() then return; end
        AnimInfo = InitializeAnimInfo(AnimInfo, animLib, playerPedId, info)
    else
        if Conditions.BatchCache(playerPedId) and not animLib.condition() then
            -- TODO might just be a few conditions we want to check for on Exit if we do this.
            if IsExitingAnimState(animLib, stateName) then
                AnimUtil.MonitorIdleAnimHalt()
                if AnimInfo then
                    local ped = AnimInfo and AnimInfo.ped or PlayerPedId()
                    AnimInfo = CleanAnimInfo(AnimInfo)
                    ClearPedSecondaryTask(ped)
                    ClearPedTasks(ped)
                end
                ActiveAnim = nil
                return
            end
        end
        if IsStateType(stateName, "idle") then
            if AnimInfo and AnimInfo.gotoIdle then AnimInfo.gotoIdle = nil; end
            AnimInfo = UpdateCurrentIdle(AnimInfo, animLib)
        end
    end

    if IsExitingAnimState(animLib, stateName) and not AnimInfo then
        AnimUtil.MonitorIdleAnimHalt()
        ActiveAnim = nil
        return
    end

    -- assert(AnimInfo, "Tried to play anim without info initialized. "..tostring(stateName))

    AnimUtil.MonitorIdleAnimHalt()
    ActiveAnim = {animLib, animState, stateName}
    if not animState then da.Log.Error(ActiveAnim, da.Log.Line(debug.getinfo(1))) end

    if animState.next then
        if not AnimStateQueue[1] or AnimStateQueue[1][3] ~= "exit" then
            local nextAnimLib = AnimLib[animState.animLibName]
            table.insert(AnimStateQueue, 1, {nextAnimLib, GetState(nextAnimLib, animState.next), animState.next})
            da.Log.DebugVerbose("Next anim added to queue", nextAnimLib.animLibName, animState.next)
        end
    elseif not IsStateType(stateName, "idle") and not IsStateType(stateName, "exit") and (AnimInfo and AnimInfo.idle and not next(AnimStateQueue)) then
        table.insert(AnimStateQueue, 1, {animLib, AnimInfo.idle, AnimInfo.idle.id})
        da.Log.DebugVerbose("Anim added to queue", animLib.animLibName, AnimInfo.idle.id)
    end

    if animState.onStart then
        if not AnimInfo then
            ClearPedSecondaryTask(ped)
            ClearPedTasks(ped)
            AnimStateQueue = {}
            ActiveAnim = nil
            return
        end
        AnimInfo = animState.onStart(AnimInfo)
        if IsStateType(stateName, "enter") and AnimInfo.exit then
            local ped = AnimInfo and AnimInfo.ped or PlayerPedId()
            AnimInfo = CleanAnimInfo(AnimInfo)
            ClearPedSecondaryTask(ped)
            ClearPedTasks(ped)
            AnimStateQueue = {}
            ActiveAnim = nil
            return
        elseif AnimInfo.gotoIdle then
            AnimStateQueue = {}
            table.insert(AnimStateQueue, 1, {animLib, AnimInfo.idle, AnimInfo.idle.id})
            return
        elseif AnimInfo.gotoExit then
            AnimInfo.gotoExit = nil
            AnimStateQueue = {}
            table.insert(AnimStateQueue, 1, {animLib, animLib.exit, "exit"})
        elseif AnimInfo.next then
            AnimStateQueue = {}
            local nextAnimLib = AnimInfo.animLibName or AnimLib[animState.animLibName]
            table.insert(AnimStateQueue, 1, {nextAnimLib, GetState(nextAnimLib, AnimInfo.next), animState.next})
            da.Log.DebugVerbose("info next anim added to queue", nextAnimLib, AnimInfo.next)
            AnimInfo.next = nil
        end
        -- TODO: Modify animState duration
    end

    if AnimInfo and animState and animState.animDict and animState.animDict ~= "" and animState.anim and animState.anim ~= "" then
        playAnim(
            AnimInfo.ped,
            animState.animDict,
            animState.anim,
            AnimInfo.nextBlendInSpeed or animState.blendInSpeed,
            animState.blendOutSpeed,
            animState.animDuration or animState.duration,
            animState.flag,
            animState.playbackRate,
            animState.ikFlags,
            animState.taskFilter
        )
    end

    -- Start the idle loop
    if animState.idleAnimConfig then
        AnimUtil.MonitorIdleAnim(animState, AnimInfo)
    end

    -- Starting animation, run onTrigger logic
    if animState.onTrigger then
        -- There might be waits in onTrigger, allow that without delaying the onFinish
        Citizen.CreateThread(function()
            local hookId = ("%s:%s:onTrigger"):format(animState.animLibName, animState.id)
            RunningHooks[hookId] = true
            if AnimInfo ~= nil then AnimInfo = animState.onTrigger(AnimInfo); end
            RunningHooks[hookId] = nil
        end)
    end

    if AnimInfo and animState.prop then
        for propName, propData in pairs(animState.prop) do
            if propData.anim and AnimInfo.prop and AnimInfo.prop[propName] then
                playEntityAnim(
                    AnimInfo.prop[propName].entity,
                    propData.animDict or animState.animDict,
                    propData.anim,
                    propData.loop,
                    propData.stayInAnim,
                    propData.delta,
                    propData.bitset
                )
            end
        end
    end

    if AnimInfo and AnimInfo.nextBlendInSpeed then
        AnimInfo.nextBlendInSpeed = nil
        -- Allow blend
        Citizen.Wait(1000)
    end
    if AnimInfo and animState.nextBlendInSpeed then AnimInfo.nextBlendInSpeed = animState.nextBlendInSpeed; end

    -- Wait this thread here until anim finishes (unless idle loop)
    AnimInterrupt = false
    if animState.duration then
        local endTime = GetGameTimer() + tonumber(animState.duration)
        while GetGameTimer() < endTime and not AnimInterrupt do
            Citizen.Wait(5)
        end
    elseif not IsStateType(stateName, "idle") then
        -- Not an idle loop, play for length of anim
        Citizen.Wait(100) -- Wait to call IsEntityPlayingAnim, otherwise it might not register just yet
        duration = GetGameTimer()
        while not AnimInterrupt and AnimInfo and IsEntityPlayingAnim(AnimInfo.ped, animState.animDict, animState.anim, 3) do
            Citizen.Wait(5)
        end
        da.Log.DebugVerbose("duration:", GetGameTimer() - duration)
    end
    AnimInterrupt = false

    if animState.changeCore then
        AnimUtil.ChangeCore(AnimInfo.ped, animState.changeCore)
    end

    -- Animation is done, check for onFinish logic or exit state
    if animState.onFinish then
        AnimInfo = animState.onFinish(AnimInfo)
        if AnimInfo and AnimInfo.gotoExit then
            AnimInfo.gotoExit = nil
            AnimStateQueue = {}
            table.insert(AnimStateQueue, 1, {animLib, animLib.exit, "exit"})
        end
    end

    -- If this is exiting then cleanup
    if IsExitingAnimState(animLib, stateName) and not animState.next then
        local ped = AnimInfo and AnimInfo.ped or PlayerPedId()
        AnimInfo = CleanAnimInfo(AnimInfo)
        ClearPedSecondaryTask(ped)
        ClearPedTasks(ped)
        ActiveAnim = nil
        return
    end
end

-- Anim Tree -- CHECKING THINGS ABOVE/BELOW THIS LINE FOR CROSS DEPENDENCIES

AddEventHandler("onResourceStop", function(res)
    if not res == GetCurrentResourceName() then return; end
    -- Delete all props
    if AnimInfo and AnimInfo.ped then ClearPedTasks(AnimInfo.ped); end
    AnimInfo = CleanAnimInfo(AnimInfo)
end)
