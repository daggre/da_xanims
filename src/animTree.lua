--- Copyright © 2024 Joshua Nelson

local BackupKeys = { "z","y","x","w","v","u","t","s","r","q","p","p","n","m","l" }

da_mode.register({
    name = "xanims",
    priority = 10,
    onActivate = function() log.debug("da_mode start xanims") end,
    onDeactivate = function() log.debug("da_mode stop xanims") end,
    keymaps = {
        {
            key = "Escape",
            event = "justPressed",
            primary = true,
            fn = function()
                da_mode.deactivate("xanims")
            end,
        },
        -- The x key that enters this mode is registered on the baseline Game
        -- keymap (da_mode.addGameKey, below) rather than here, so the Mode
        -- Controller suppresses it whenever a take-over mode is active.
    },
})

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
    local trie = {}
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
                    log.warn(log.line(1), "Duplicate keymap for "..tostring(transitionData[2]).." '"..tostring(animStateKeyMap).."' detected in "..tostring(animLibName).." animlib.")
                end
                _keymap[key] = transitionData[2]
                if backupIndex > 0 then
                    table.insert(trie, #trie-backupIndex+2, {
                        name = formattedName or animStateName,
                        key = key,
                        id = transitionData[2],
                        animLibName = animLibName,
                    })
                else
                    table.insert(trie, {
                        name = formattedName or animStateName,
                        key = key,
                        id = transitionData[2],
                        animLibName = animLibName,
                    })
                end
            end
        end
    end

    return trie
end

local function getAnimOptions(menu, sortFunction)
    local trie = {}
    if not menu or menu.anims == nil then return trie; end

    for _, animOption in pairs(menu.anims) do
        local condition = animOption.triggerCondition or animOption.condition or function() return Conditions.Check({}) end
        if condition() then
            table.insert(trie, {
                key = animOption.key,
                name = animOption.name,
                id = animOption.id,
                animLibName = animOption.animLibName,
            })
        end
    end
    table.sort(trie, sortFunction)
    return trie
end

local function getSubMenuOptions(menu, sortFunction)
    local trie = {}
    if not menu or menu.submenu == nil then return trie; end

    for subMenuName, subMenuData in pairs(menu.submenu) do
        subMenuName = string.gsub(subMenuName, "_", " ")
        -- Get the condition from the menu / submenu conditions
        local condition = subMenuData.condition or function() return Conditions.Check({}) end
        if condition() then
            local sortedSubmenuOptions = getSubMenuOptions(subMenuData, sortFunction)
            local sortedAnimOptions = getAnimOptions(subMenuData, sortFunction)
            if next(sortedSubmenuOptions) or next(sortedAnimOptions) then
                table.insert(trie, {
                    key = subMenuData.key,
                    name = subMenuName,
                    anims = next(sortedAnimOptions) and sortedAnimOptions or nil,
                    submenu = next(sortedSubmenuOptions) and sortedSubmenuOptions or nil,
                })
            end
        end
    end
    table.sort(trie, sortFunction)
    return trie
end

local function getOptionTrie(animMenu)
    local optionTrie = { submenu = {}, anims = {}, }
    local animLib, animState = table.unpack(getFinalAnim())
    local animLibName = animLib and animLib.id
    local alphaKeySort = function(a,b) return a.key < b.key; end

    if animLib and animState then
        local condition = animLib.condition or function() return Conditions.Check({}) end
        -- We are grabbing in progress condition, dont use the triggerCondition
        if condition() then
            optionTrie.anims = addSortedTransitions(animLib, animState, animLibName)
        end
        table.insert(optionTrie.anims, {
            key = "c",
            name = "Exit",
            id = "exit",
            animLibName = animLibName,
        })
        return optionTrie
    end

    optionTrie = {
        submenu = getSubMenuOptions(animMenu, alphaKeySort),
        anims = getAnimOptions(animMenu, alphaKeySort),
    }
    -- Append sorted animTrie to sorted optionTrie

    if ActiveAnim and not IsStateType(ActiveAnim[3], "exit") then
        table.insert(optionTrie.anims, {
            key = "c",
            name = "Exit",
            id = "exit",
            animLibName = animLibName,
        })
    end

    return optionTrie
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
        log.warn(log.line(1), "Invalid tag '"..tostring(tag).."' detected when populating anim menu.")
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
                        log.warn(log.line(1), tostring(animLib.id).." has invalid tag '"..tostring(tag).."'")
                    elseif animTags[tag]._keyMap[key] ~= nil then
                        log.warn(log.line(1), "Duplicate keymap for "..tostring(animLib.id).." '"..tostring(key).."' detected in "..tostring(tag).." menu.")
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

-- Init: populate the anim menu once on startup.
Citizen.CreateThread(function()
    AnimMenu, AnimTags = populateAnimConfig(AnimMenu, AnimTags)
end)

-- The x key lives on the baseline Game keymap so the Mode Controller owns it:
-- it is active-gated by the "Game" pseudo-mode, so any active mode that declares
-- `disableGame = true` (dev tools, interact, wardrobe, tack, ...) suppresses it.
-- Behaviour preserved from the old da_control loop: short tap opens the anim
-- menu; releasing x activates the xanims mode.
da_mode.addGameKey("x", {
    justPressed = function()
        log.debug("x pressed")
        if API.isDead() then return; end
        da_control.trackShortPress("x", function()
            log.debug("x shortpressed")
            -- If we shortpress x, open the x anims menu
            da_mode.activate("xanims")
            Conditions.BatchCache(PlayerPedId())
            local optionTrie = getOptionTrie(AnimMenu.root)
            log.spam(optionTrie)
            SetNuiFocus(true, false)
            da_ui.send("show", { optionTrie = optionTrie })
        end)
        -- Run BatchCache on x press
        AnimMenu, AnimTags = populateAnimConfig(AnimMenu, AnimTags)
    end,
})

local AnimThread = nil
QueueAnimState = function(animLib, stateName, info)
    if not animLib then
        log.error(log.line(1))
        return
    end
    log.spam("AST init", animLib.id, stateName)
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
        log.spam("AST play", animLibId, animStateName)
        PlayAnimState(table.unpack(table.remove(AnimStateQueue, 1)))
    end
    AnimThread = false
    log.spam("AST done")
end

RegisterCommand("xanim_force_reset", function(source, args, rawCommand)
    log.info("Resetting animation system...")
    TriggerEvent("da_xanims:forceExit")
    Citizen.Wait(2000)
    AnimThread = false
    AnimInfo = nil
    Citizen.Wait(1000)
    log.info("Reset complete")
end, false)

local QueueAnim = function(data)
    SetNuiFocus(false, false)
    if not data or not data.animLibName or not data.animStateName then
        return false
    end

    local animLib = nil
    if data.animStateName == "exit" then
        if not ActiveAnim then return true; end
        animLib = ActiveAnim[1]
    else
        animLib = AnimLib[data.animLibName]
    end
    if not animLib then return false; end

    QueueAnimState(animLib, data.animStateName)
end

da_ui.events({
    anim = QueueAnim,
    exit = function() SetNuiFocus(false, false) end, -- TODO: Check if we still need this in a post-mode world
})

RegisterNetEvent("da_xanims:queueAnim")
AddEventHandler("da_xanims:queueAnim", function(animLibName, animStateName, info)
    if not animStateName or not animLibName then return; end
    if ActiveAnim and ActiveAnim[1] and ActiveAnim[1].id == animLibName and animStateName == "enter" then
        log.debug("Already playing anim", animLibName, animStateName)
        return
    end
    if animStateName == "enter" then
        -- Exit the animation
        if ActiveAnim then
            local animLib, _, _ = table.unpack(ActiveAnim)
            QueueAnimState(animLib, "exit")
        end
    elseif not ActiveAnim or ActiveAnim[1].id ~= animLibName then
        log.error("No active animation", log.line(1))
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
