AnimLib.horse_duckleft = {
    name = "Duck Left",
    tags = { horseback=1, },
    key = "a",
    condition = function() return Conditions.Check({ onMount = true, }) end,
    enter = {
        animDict = "veh_horseback@seat_saddle@male@cover@walk@left",
        anim = "intro",
        blendInSpeed = 1.0,
    },
    exit = {
        animDict = "veh_horseback@seat_saddle@male@cover@walk@left",
        anim = "outro",
        playbackRate = 0.03,
        duration = 800,
    },
    idles = {
        idle_a = {
            animDict = "veh_horseback@seat_saddle@male@cover@walk@left",
            anim = "move",
            flag = AnimConfig.Flag.Loop,
            blendInSpeed = 1.0,
            onTrigger = function(info)
                local animDict = "veh_horseback@seat_saddle@male@cover@walk@left"
                local anim = "move"
                while IsEntityPlayingAnim(info.ped, animDict, anim, 3) do
                    AnimUtil.AdjustStaminaCore(info.ped, -3)
                    local staminaCore = Citizen.InvokeNative(0x36731AC041289BB1, info.ped, 1) -- GetAttributeCoreValue Stamina
                    if not tonumber(staminaCore) or staminaCore < 5 then
                        SetPedToRagdoll(info.ped, 2000, 3000, 0, false, false, false)
                        Citizen.Wait(5)
                        TriggerEvent('da_xanims:queueAnim', "horse_duckleft", "exit")
                        Citizen.Wait(100)
                        ResetPedRagdollTimer(info.ped)
                        break
                    end
                    Citizen.Wait(300)
                end
                return info
            end,
        },
    },
}

AnimLib.horse_duckright = {
    name = "Duck Right",
    tags = { horseback=1, },
    key = "d",
    condition = function() return Conditions.Check({ onMount = true, }) end,
    enter = {
        animDict = "veh_horseback@seat_saddle@male@cover@walk@right",
        anim = "intro",
        blendInSpeed = 1.0,
    },
    exit = {
        animDict = "veh_horseback@seat_saddle@male@cover@walk@right",
        anim = "outro",
        playbackRate = 0.03,
        duration = 800,
    },
    idles = {
        idle_a = {
            animDict = "veh_horseback@seat_saddle@male@cover@walk@right",
            anim = "move",
            flag = AnimConfig.Flag.Loop,
            blendInSpeed = 1.0,
            onTrigger = function(info)
                local animDict = "veh_horseback@seat_saddle@male@cover@walk@right"
                local anim = "move"
                while IsEntityPlayingAnim(info.ped, animDict, anim, 3) do
                    AnimUtil.AdjustStaminaCore(info.ped, -2)
                    local staminaCore = Citizen.InvokeNative(0x36731AC041289BB1, info.ped, 1) -- GetAttributeCoreValue Stamina
                    if not tonumber(staminaCore) or staminaCore < 5 then
                        SetPedToRagdoll(info.ped, 2000, 3000, 0, false, false, false)
                        Citizen.Wait(5)
                        TriggerEvent('da_xanims:queueAnim', "horse_duckright", "exit")
                        Citizen.Wait(100)
                        ResetPedRagdollTimer(info.ped)
                        break
                    end
                    Citizen.Wait(300)
                end
                return info
            end,
        },
    },
}

-- Horseback gestures

AnimLib.ridentalk_pos_nodding = {
    name = "Nod Yes",
    tags = { react=1, },
    key = "5",
    condition = function() return Conditions.Check({ onMount = true, }) end,
    enter = {
        animDict = "ai_gestures@script_story@ridentalk",
        anim = "positive_nodding_002",
        flag = AnimConfig.Flag.Move,
        blendInSpeed = 1.0,
        duration = 1200,
    },
}

AnimLib.ridentalk_pos_punct_2 = {
    name = "Agree Right Hand",
    tags = { talk_positive=1, },
    key = "f",
    condition = function() return Conditions.Check({ onMount = true, }) end,
    enter = {
        animDict = "ai_gestures@script_story@ridentalk",
        anim = "positive_punctuate_002",
        blendInSpeed = 1.0,
        flag = AnimConfig.Flag.Move,
        duration = 2000,
    },
}
