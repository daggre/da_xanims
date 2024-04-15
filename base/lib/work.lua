--- Copyright © 2024 Joshua Nelson

AnimLib.ragdoll = {
    name = "Ragdoll",
    tags = { root=1, },
    key = "r",
    condition = function() return Conditions.Check({
        isAnimal = allow,
        isSwimming = allow,
        isAiming = allow,
        hasPrimaryWeapon = allow,
        hasSecondaryWeapon = allow,
        hasWeapon = allow,
        onMount = allow,
        isSprinting = allow,
        isMountSprinting = allow,
    }) end,
    enter = {
        animDict = "",
        anim = "",
        onTrigger = function(info)
            info.ragdoll = true
            Citizen.CreateThread(function()
                while info.ragdoll do
                    SetPedToRagdoll(info.ped, 2000, 3000, 0, false, false, false)
                    Citizen.Wait(500)
                    ResetPedRagdollTimer(info.ped)
                end
            end)
            return info
        end,
    },
    exit = {
        animDict = "",
        anim = "",
        onTrigger = function(info)
            if info then info.ragdoll = nil; end
            return info
        end,
    },
}

AnimLib.WorldHumanClipboard = {
    name = "Clipboard",
    tags = { work=1, },
    key = "q",
    enter = {
        animDict = "amb_work@world_human_clipboard@male_a@stand_enter_withprop",
        anim = "enter_back_rf",
        flag = AnimConfig.Flag.Move,
        onTrigger = function(info)
            info.prop.nubpencil = Prop:new()
            info.prop.clipboard = Prop:new()
            info.prop.nubpencil:attach(info.ped, Propset.Clipboard.Pencil)
            Citizen.Wait(1000)
            info.prop.clipboard:attach(info.ped, Propset.Clipboard)
            return info
        end,
    },
    exit = {
        animDict = "amb_work@world_human_clipboard@male_a@stand_exit_withprop",
        anim = "exit_front",
        duration = 2600,
        flag = AnimConfig.Flag.Move,
        onTrigger = function(info)
            Citizen.Wait(2500)
            Prop.Detach(info.prop.clipboard)
            Prop.Detach(info.prop.nubpencil)
            info.prop.clipboard = nil
            info.prop.nubpencil = nil
            return info
        end,
    },
    idles = {
        idle_a = {
            animDict = "amb_work@world_human_clipboard@male_a@base",
            anim = "base",
            flag = AnimConfig.Flag.MoveLoop,
            transitions = {
                a_a = "w",
                a_b = "d",
                a_c = "q",
                b_d = "a",
                b_e = "r",
                b_f = "s",
                c_g = "1",
                c_h = "e",
                inspect_bedding = "x",
                inspect_cleanliness = "z",
                inspect_waterTrough = "z",
                inspect_hayTrough = "z",
                inspect_paddock = "z",
                inspect_fence = "z",
            },
        },
    },
    animations = {
        a_a = {
            animDict = "amb_work@world_human_clipboard@male_a@idle_a",
            anim = "idle_a",
            name = "Look Up",
            flag = AnimConfig.Flag.Move,
        },
        a_b = {
            animDict = "amb_work@world_human_clipboard@male_a@idle_a",
            anim = "idle_b",
            name = "Look Right",
            flag = AnimConfig.Flag.Move,
        },
        a_c = {
            animDict = "amb_work@world_human_clipboard@male_a@idle_a",
            anim = "idle_c",
            name = "Distracted",
            flag = AnimConfig.Flag.Move,
        },
        b_d = {
            animDict = "amb_work@world_human_clipboard@male_a@idle_b",
            anim = "idle_d",
            name = "Look Left",
            flag = AnimConfig.Flag.Move,
        },
        b_e = {
            animDict = "amb_work@world_human_clipboard@male_a@idle_b",
            anim = "idle_e",
            name = "Relax",
            flag = AnimConfig.Flag.Move,
        },
        b_f = {
            animDict = "amb_work@world_human_clipboard@male_a@idle_b",
            anim = "idle_f",
            name = "Stretch",
            flag = AnimConfig.Flag.Move,
        },
        c_g = {
            animDict = "amb_work@world_human_clipboard@male_a@idle_c",
            anim = "idle_g",
            name = "Count",
            flag = AnimConfig.Flag.Move,
        },
        c_h = {
            animDict = "amb_work@world_human_clipboard@male_a@idle_c",
            anim = "idle_h",
            name = "Wary",
            flag = AnimConfig.Flag.Move,
        },
        inspect_bedding = {
            condition = function() return Conditions.Check({ inAnimalStall = true, }) end,
            animDict = "amb_work@world_human_clipboard@male_a@idle_c",
            anim = "idle_g",
            name = "Inspect Bedding",
            duration = 4000,
            flag = AnimConfig.Flag.Move,
            onStart = function(info)
                info.chore = Prop:initNearby("stall")
                if not info.chore then info.gotoIdle = true; end
                return info
            end,
            onTrigger = function(info)
                Citizen.Wait(1000)
                AnimUtil.InspectRanch("StallBedding", info.chore.propData)
                return info
            end,
        },
        inspect_cleanliness = {
            condition = function() return Conditions.Check({ inAnimalStall = true, }) end,
            animDict = "amb_work@world_human_clipboard@male_a@idle_c",
            anim = "idle_g",
            name = "Inspect Cleanliness",
            duration = 4000,
            flag = AnimConfig.Flag.Move,
            onStart = function(info)
                info.chore = Prop:initNearby("stall")
                if not info.chore then info.gotoIdle = true; end
                return info
            end,
            onTrigger = function(info)
                Citizen.Wait(1000)
                AnimUtil.InspectRanch("StallCleanliness", info.chore.propData)
                return info
            end,
        },
        inspect_waterTrough = {
            condition = function() return Conditions.Check({ interactWaterTrough = true, }) end,
            animDict = "amb_work@world_human_clipboard@male_a@idle_c",
            anim = "idle_g",
            name = "Inspect Water Trough",
            duration = 4000,
            flag = AnimConfig.Flag.Move,
            onStart = function(info)
                info.chore = Prop:initNearby("waterTrough")
                if not info.chore then info.gotoIdle = true; end
                return info
            end,
            onTrigger = function(info)
                Citizen.Wait(1000)
                AnimUtil.InspectRanch("WaterTrough", info.chore.propData)
                return info
            end,
        },
        inspect_hayTrough = {
            condition = function() return Conditions.Check({ interactTrough = true, }) end,
            animDict = "amb_work@world_human_clipboard@male_a@idle_c",
            anim = "idle_g",
            name = "Inspect Feed Trough",
            duration = 4000,
            flag = AnimConfig.Flag.Move,
            onStart = function(info)
                info.chore = Prop:initNearby("feedTrough")
                if not info.chore then info.gotoIdle = true; end
                return info
            end,
            onTrigger = function(info)
                Citizen.Wait(1000)
                AnimUtil.InspectRanch("FeedTrough", info.chore.propData)
                return info
            end,
        },
        inspect_paddock = {
            condition = function() return Conditions.Check({ inPaddock = true, }) end,
            animDict = "amb_work@world_human_clipboard@male_a@idle_c",
            anim = "idle_g",
            name = "Inspect Paddock",
            duration = 4000,
            flag = AnimConfig.Flag.Move,
            onStart = function(info)
                info.chore = Prop:initNearby("paddock")
                if not info.chore then info.gotoIdle = true; end
                return info
            end,
            onTrigger = function(info)
                Citizen.Wait(1000)
                AnimUtil.InspectRanch("Paddock", info.chore.propData)
                return info
            end,
        },
        inspect_fence = {
            condition = function() return Conditions.Check({ inspectFence = true, }) end,
            animDict = "amb_work@world_human_clipboard@male_a@idle_c",
            anim = "idle_g",
            name = "Inspect Fence",
            duration = 4000,
            flag = AnimConfig.Flag.Move,
            onStart = function(info)
                info.chore = Prop:initNearby("inspectFence")
                if not info.chore then info.gotoIdle = true; end
                return info
            end,
            onTrigger = function(info)
                Citizen.Wait(1000)
                AnimUtil.InspectRanch("Fence", info.chore.propData)
                return info
            end,
        },
    },
}
