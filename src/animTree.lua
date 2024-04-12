local function getFinalAnim()
    local animLib, animState, animStateName = nil, nil, nil
    local currentIdle = nil

    if AnimStateQueue and next(AnimStateQueue) then
        animLib, animState, animStateName = table.unpack(AnimStateQueue[#AnimStateQueue])
    elseif ActiveAnim then
        animLib, animState, animStateName = table.unpack(ActiveAnim)
    end
    if not animLib or not animState or not animStateName then return { nil, nil, nil }; end

    -- Iterate through queue
    local queuedAnims = {}
    while animState and animState.next do
        if queuedAnims[animState.next] then
            break
        end
        if animState.next then
            animLib = AnimLib[animState.animLibName]
            animStateName = animState.next
        end
        animState = GetState(animLib, animState.next)
        queuedAnims[animStateName] = 1
    end
    if animLib and animLib.idles then
        _, currentIdle = next(animLib.idles)
    end

    if IsExitingAnimState(animLib, animStateName) then
        -- If exit then just pass nothing
        return { nil, nil, nil }
    elseif animState and not animState.next and not animState.transitions and currentIdle then
        -- If not transitions, then switch to idle
        animStateName = currentIdle.id
        animState = currentIdle
    end

    return { animLib, animState, animStateName }
end

local function addSortedTransitions(animLib, animState, animLibName)
    local tree = {}
    local _keymap = {}

    if animState.transitions then
        for _, transitionData in ipairs(animState.sortedtransitions) do
            local animStateKeyMap = transitionData[1]
            local animStateName = transitionData[2]
            local formattedName = nil
            local condition = nil

            -- Try to find a formatted name
            if animLib.idles and animLib.idles[animStateName] and animLib.idles[animStateName].name then
                condition = animLib.idles[animStateName].condition
                formattedName = animLib.idles[animStateName].name
            elseif animLib.animations and animLib.animations[animStateName] and animLib.animations[animStateName].name then
                condition = animLib.animations[animStateName].condition
                formattedName = animLib.animations[animStateName].name
            end

            if not condition or condition() then
                local key = animStateKeyMap
                local backupIndex = 0
                while _keymap[key] ~= nil and backupIndex <= #BackupKeys do
                    backupIndex = backupIndex + 1
                    key = BackupKeys[backupIndex]
                end
                if _keymap[key] ~= nil then
                    da.Log.Warn(da.Log.Line(debug.getinfo(1)), "Duplicate keymap for "..tostring(transitionData[2]).." '"..tostring(animStateKeyMap).."' detected in "..tostring(animLibName).." animlib.")
                end
                _keymap[key] = transitionData[2]
                if backupIndex > 0 then
                    table.insert(tree, #tree-backupIndex+2, {
                        name = formattedName or animStateName,
                        key = key,
                        id = transitionData[2],
                        animLibName = animLibName,
                    })
                else
                    table.insert(tree, {
                        name = formattedName or animStateName,
                        key = key,
                        id = transitionData[2],
                        animLibName = animLibName,
                    })
                end
            end
        end
    end

    return tree
end

local function getAnimOptions(menu, sortFunction)
    local tree = {}
    if not menu or menu.anims == nil then return tree; end

    for _, animOption in pairs(menu.anims) do
        local condition = animOption.triggerCondition or animOption.condition or function() return Conditions.Check({}) end
        if condition() then
            table.insert(tree, {
                key = animOption.key,
                name = animOption.name,
                id = animOption.id,
                animLibName = animOption.animLibName,
            })
        end
    end
    table.sort(tree, sortFunction)
    return tree
end

local function getSubMenuOptions(menu, sortFunction)
    local tree = {}
    if not menu or menu.submenu == nil then return tree; end

    for subMenuName, subMenuData in pairs(menu.submenu) do
        subMenuName = string.gsub(subMenuName, "_", " ")
        -- Get the condition from the menu / submenu conditions
        local condition = subMenuData.condition or function() return Conditions.Check({}) end
        if condition() then
            local sortedSubmenuOptions = getSubMenuOptions(subMenuData, sortFunction)
            local sortedAnimOptions = getAnimOptions(subMenuData, sortFunction)
            if next(sortedSubmenuOptions) or next(sortedAnimOptions) then
                table.insert(tree, {
                    key = subMenuData.key,
                    name = subMenuName,
                    anims = next(sortedAnimOptions) and sortedAnimOptions or nil,
                    submenu = next(sortedSubmenuOptions) and sortedSubmenuOptions or nil,
                })
            end
        end
    end
    table.sort(tree, sortFunction)
    return tree
end

local function getOptionTree(animMenu)
    local optionTree = { submenu = {}, anims = {}, }
    local animLib, animState = table.unpack(getFinalAnim())
    local animLibName = animLib and animLib.id
    local alphaKeySort = function(a,b) return a.key < b.key; end

    if animLib and animState then
        local condition = animLib.condition or function() return Conditions.Check({}) end
        -- We are grabbing in progress condition, dont use the triggerCondition
        if condition() then
            optionTree.anims = addSortedTransitions(animLib, animState, animLibName)
        end
        table.insert(optionTree.anims, {
            key = "c",
            name = "Exit",
            id = "exit",
            animLibName = animLibName,
        })
        return optionTree
    end

    optionTree = {
        submenu = getSubMenuOptions(animMenu, alphaKeySort),
        anims = getAnimOptions(animMenu, alphaKeySort),
    }
    -- Append sorted animTree to sorted optionTree

    if ActiveAnim and not IsStateType(ActiveAnim[3], "exit") then
        table.insert(optionTree.anims, {
            key = "c",
            name = "Exit",
            id = "exit",
            animLibName = animLibName,
        })
    end

    return optionTree
end

local function clearAnimMenu(tag, menu)
    AnimTags[tag] = { _keyMap = { c = "exit", }, anims = {}, }

    menu.anims = {}
    if menu.submenu ~= nil and next(menu.submenu) then
        for subTag, tagSubMenu in pairs(menu.submenu) do
            tagSubMenu = clearAnimMenu(subTag, tagSubMenu)
        end
    end
    return menu
end

local function populateAnimMenu(tag, menu, tagsData)
    if tagsData[tag] == nil then
        da.Log.Warn(da.Log.Line(debug.getinfo(1)), "Invalid tag '"..tostring(tag).."' detected when populating anim menu.")
        return menu
    end
    menu.anims = tagsData[tag].anims
    if menu.submenu then
        for subTag, tagSubMenu in pairs(menu.submenu) do
            tagSubMenu = populateAnimMenu(subTag, tagSubMenu, tagsData)
        end
    end

    return menu
end

local function populateTags(animLibs, animTags)
    for _, animLib in pairs(animLibs) do
        -- Preempt the menu by populating tags
        if animLib.tags and next(animLib.tags) then
            for tag, tagData in pairs(animLib.tags) do
                local triggerCondition = animLib.triggerCondition
                local name = animLib.name
                local key = animLib.key
                if type(tagData) == "table" then
                    name = tagData.name or name
                    key = tagData.key or key
                    triggerCondition = tagData.condition and tagData.condition or triggerCondition
                end

                local condition = triggerCondition or animLib.condition or function() return Conditions.Check({}); end
                if condition() then
                    local backupIndex = 1
                    while animTags[tag]._keyMap[key] ~= nil and backupIndex <= #BackupKeys do
                        key = BackupKeys[backupIndex]
                        backupIndex = backupIndex + 1
                    end
                    if animTags[tag] == nil then
                        da.Log.Warn(da.Log.Line(debug.getinfo(1)), tostring(animLib.id).." has invalid tag '"..tostring(tag).."'")
                    elseif animTags[tag]._keyMap[key] ~= nil then
                        da.Log.Warn(da.Log.Line(debug.getinfo(1)), "Duplicate keymap for "..tostring(animLib.id).." '"..tostring(key).."' detected in "..tostring(tag).." menu.")
                    else
                        animTags[tag]._keyMap[key] = animLib.id
                        table.insert(animTags[tag].anims, {
                            id = "enter",
                            name = name,
                            key = key,
                            animLibName = animLib.id,
                            condition = animLib.condition,
                            triggerCondition = triggerCondition,
                        })
                    end
                end
            end
        end
    end
    return animTags
end

local function populateAnimConfig(menu, tagsData)
    local rootTag = "root"
    local rootMenu = menu[rootTag]
    local newTagsData = tagsData
    for tag in pairs(newTagsData) do
        newTagsData[tag] = {}
    end

    -- Reset all anims and animKeys tables
    rootMenu = clearAnimMenu(rootTag, rootMenu)
    -- Iterate all anims and assign to tags tables
    Conditions.BatchCache()
    newTagsData = populateTags(AnimLib, newTagsData)
    rootMenu = populateAnimMenu(rootTag, rootMenu, newTagsData)

    menu[rootTag] = rootMenu
    tagsData = newTagsData
    return menu, tagsData
end

-- Init and HUD key listener
Citizen.CreateThread(function()
    local optionTree = {}
    AnimMenu, AnimTags = populateAnimConfig(AnimMenu, AnimTags)
    while true do
        Citizen.Wait(5)
        if IsEntityDead(PlayerPedId()) then
            Citizen.Wait(1000)
        end
        if (IsControlJustPressed(0, 0x7DA48D2A) and IsInputDisabled(0)) then
            AnimMenu, AnimTags = populateAnimConfig(AnimMenu, AnimTags)
        end
        if (IsControlJustReleased(0, 0x7DA48D2A)) and IsInputDisabled(0) then -- 0x8CC9CD42 old x
            Conditions.BatchCache(PlayerPedId())
            optionTree = getOptionTree(AnimMenu.root)
            SetNuiFocus(true, false)
            SendNUIMessage({
                type = 'show',
                optionTree = optionTree,
            })
            optionTree = {}
        end
    end
end)

local AnimThread = nil
QueueAnimState = function(animLib, stateName, info)
    da.Log.Debug("AST init", animLib.id, stateName)
    -- Check if state is valid, before adding to queue
    local animState = GetState(animLib, stateName)
    assert(animState, ("Queue:%s:%s:%s"):format(animLib.id, animState, stateName))

    if IsExitingAnimState(animLib, stateName) then
        -- Clear any queued anims
        AnimStateQueue = {}
        if animState then
            table.insert(AnimStateQueue, {animLib, animState, stateName, info})
        end
        AnimInterrupt = true
        if AnimInfo then AnimInfo.exit = true; end
    else
        table.insert(AnimStateQueue, {animLib, animState, stateName, info})
    end
    if AnimThread then return; end

    -- If not thread then start it
    AnimThread = true
    Citizen.Wait(10)
    while next(AnimStateQueue) do
        local animLibId = AnimStateQueue and AnimStateQueue[1] and AnimStateQueue[1][1] and AnimStateQueue[1][1].id or ""
        local animStateName = AnimStateQueue and AnimStateQueue[1] and AnimStateQueue[1][3] or ""
        da.Log.Debug("AST play", animLibId, animStateName)
        PlayAnimState(table.unpack(table.remove(AnimStateQueue, 1)))
    end
    AnimThread = false
    da.Log.Debug("AST done")
end

RegisterCommand("xanim_force_reset", function(source, args, rawCommand)
    da.Log.Info("Resetting animation system...")
    TriggerEvent("da_xanims:forceExit")
    Citizen.Wait(2000)
    AnimThread = false
    AnimInfo = nil
    Citizen.Wait(1000)
    da.Log.Info("Reset complete")
end, false)

RegisterNUICallback('exit', function(data, cb)
    SetNuiFocus(false, false)
    cb({})
end)

RegisterNUICallback('anim', function(data, cb)
    SetNuiFocus(false, false)
    local animLib = nil
    if data.animStateName == "exit" then
        if not ActiveAnim then return; end
        animLib = ActiveAnim[1]
    elseif not data.animStateName or not data.animLibName then
        return
    else
    if not AnimLib then return; end
        animLib = AnimLib[data.animLibName]
    end
    if not animLib then return; end
    QueueAnimState(animLib, data.animStateName)
    cb({})
end)

RegisterNetEvent("da_xanims:queueAnim")
AddEventHandler("da_xanims:queueAnim", function(animLibName, animStateName, info)
    if not animStateName or not animLibName then return; end
    if ActiveAnim and ActiveAnim[1] and ActiveAnim[1].id == animLibName and animStateName == "enter" then
        return
    end
    if animStateName == "enter" then
        -- Exit the animation
        if ActiveAnim then
            local animLib, _, _ = table.unpack(ActiveAnim)
            QueueAnimState(animLib, "exit")
        end
    elseif not ActiveAnim or ActiveAnim[1].id ~= animLibName then
        da.Log.Error(da.Log.Line(debug.getinfo(1)), "Tried to queue anim outside of "..ActiveAnim[1].id.." lib:", animLibName, animStateName)
        return
    end
    QueueAnimState(AnimLib[animLibName], animStateName, info)
end)

RegisterNetEvent("da_xanims:cancelAnim")
AddEventHandler("da_xanims:cancelAnim", function(info)
    if not ActiveAnim then return; end

    local animState = ActiveAnim[2]
    local animLib = AnimLib[animState.animLibName]
    QueueAnimState(animLib, "exit", info)
end)

RegisterNetEvent("da_xanims:forceExit")
AddEventHandler("da_xanims:forceExit", function(wait)
    if wait then Citizen.Wait(wait); end
    AnimUtil.MonitorIdleAnimHalt()
    -- ClearPedSecondaryTask(AnimInfo.ped)
    -- ClearPedTasks(AnimInfo.ped)
    AnimInfo = CleanAnimInfo(AnimInfo)
    AnimStateQueue = {}
    ActiveAnim = nil
end)
