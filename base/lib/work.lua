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

AnimLib.write_notebook_male = {
    name = "Write Notebook Walk",
    tags = { work=1 },
    key = "e",
    enter = {
        animDict = "amb_work@world_human_write_notebook@male_a@stand_enter",
        anim = "enter_back_lf",
        flag = AnimConfig.Flag.Move,
        blendInSpeed = 1.0,
        prop = { ledger = { anim = "enter_back_lf_ledger", }, },
        onStart = function(info)
            local propset = IsPedMale(info.ped) and Propset.Ledger or Propset.Ledger.FemaleGrab
            info.prop.ledger = Prop:new(propset)
            info.prop.ledger:create()
            return info
        end,
        onTrigger = function(info)
            Citizen.Wait(1000)
            info.prop.ledger:attach(info.ped)
            Citizen.Wait(2000)
            info.prop.ledger:attach(info.ped, Propset.Ledger)
            Citizen.Wait(1500)
            local propset = IsPedMale(info.ped) and Propset.Pencil.Male or Propset.Pencil.Female
            info.prop.pencil = Prop:new()
            info.prop.pencil:attach(info.ped, propset)
            return info
        end,
    },
    exit = {
        animDict = "amb_work@world_human_write_notebook@male_a@stand_exit",
        anim = "exit_front",
        flag = AnimConfig.Flag.Move,
        prop = { ledger = { anim = "exit_front_ledger", }, },
        onTrigger = function(info)
            Citizen.Wait(1000)
            Prop.Detach(info.prop.pencil)
            Citizen.Wait(1700)
            if not IsPedMale(info.ped) then
                info.prop.ledger:attach(info.ped, Propset.Ledger.FemaleGrab)
            end
            Citizen.Wait(1300)
            Prop.Detach(info.prop.ledger)
            info.prop.ledger = nil
            return info
        end

    },
    idles = {
        idle_a = {
            animDict = "amb_work@world_human_write_notebook@male_a@base",
            anim = "base",
            flag = AnimConfig.Flag.MoveLoop,
            idleAnimConfig = {
                canJump = false,
                canRun = false,
                canClimb = false,
            },
            prop = { ledger = { anim = "base_ledger", loop = true, }, },
            transitions = {
                a_a = "1",
                a_b = "2",
                a_c = "3",
                a_d = "a",
                a_e = "w",
                a_f = "q",
                a_g = "e",
                a_h = "s",
            },
        },
    },
    animations = {
        a_a = {
            animDict = "amb_work@world_human_write_notebook@male_a@idle_a",
            anim = "idle_a",
            flag = AnimConfig.Flag.Move,
            duration = 13000,
            prop = { ledger = { anim = "idle_a_ledger", }, },
            name = "Pencil Scratch"
        },
        a_b = {
            animDict = "amb_work@world_human_write_notebook@male_a@idle_a",
            anim = "idle_b",
            duration = 12500,
            flag = AnimConfig.Flag.Move,
            prop = { ledger = { anim = "idle_b_ledger", }, },
            name = "Bite Pencil"
        },
        a_c = {
            animDict = "amb_work@world_human_write_notebook@male_a@idle_a",
            anim = "idle_c",
            flag = AnimConfig.Flag.Move,
            duration = 7500,
            prop = { ledger = { anim = "idle_c_ledger", }, },
            name = "Lift Pencil"
        },
        a_d = {
            animDict = "amb_work@world_human_write_notebook@male_a@idle_b",
            anim = "idle_d",
            duration = 12000,
            blendInSpeed = 1.0,
            flag = AnimConfig.Flag.Move,
            prop = { ledger = { anim = "idle_d_ledger", }, },
            name = "Thinking"
        },
        a_e = {
            animDict = "amb_work@world_human_write_notebook@male_a@idle_b",
            anim = "idle_e",
            duration = 10000,
            flag = AnimConfig.Flag.Move,
            prop = { ledger = { anim = "idle_e_ledger", }, },
            name = "Look Up"
        },
        a_f = {
            animDict = "amb_work@world_human_write_notebook@male_a@idle_b",
            anim = "idle_f",
            duration = 10000,
            flag = AnimConfig.Flag.Move,
            prop = { ledger = { anim = "idle_f_ledger", }, },
            name = "Look Up Right"
        },
        a_g = {
            animDict = "amb_work@world_human_write_notebook@male_a@idle_c",
            anim = "idle_g",
            duration = 8500,
            flag = AnimConfig.Flag.Move,
            prop = { ledger = { anim = "idle_g_ledger", }, },
            name = "Neck Crack",
        },
        a_h = {
            animDict = "amb_work@world_human_write_notebook@male_a@idle_c",
            anim = "idle_h",
            duration = 11000,
            flag = AnimConfig.Flag.Move,
            prop = { ledger = { anim = "idle_h_ledger", }, },
            name = "Write Things"
        },
    },
}
