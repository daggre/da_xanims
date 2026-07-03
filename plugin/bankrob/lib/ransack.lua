AnimLib.ransack = {
    name = "",
    tags = { },
    key = "",
    triggerCondition = function() return Conditions.Check({ hasWeapon = "allow", hasPrimaryWeapon = "allow", hasSecondaryWeapon = "allow" }) end,
    enter = {
        animDict = "mech_pickup@loot@desks@drawer_c",
        anim = "loop_no_find",
        blendInSpeed = 1.0,
        flag = AnimConfig.Flag.Loop,
        duration = 5000,
        onStart = function(info)
            if not info.args then
                info.gotoExit = true
                return info
            end
            da_weapon.holster()
            TaskPedSlideToCoord(info.ped, info.args.location.xyz, info.args.location.w, -1)
            -- TODO: Face the thing or is slide not working??
            return info
        end,
        next = "e1",
    },
    exit = {
        animDict = "",
        anim = "",
        onFinish = function(info)
            TriggerEvent("da_bankrob:ransackComplete", info.args)
            return info
        end,
    },
    animations = {
        e1 = {
            animDict = "mech_pickup@loot@desks@drawer_c",
            anim = "loop_find",
            flag = AnimConfig.Flag.Loop,
            duration = 2000,
            onFinish = function(info)
                TriggerEvent("da_bankrob:ransackLoot", 30)
                return info
            end,
            next = "e2",
        },
        e2 = {
            animDict = "mech_pickup@loot@desks@drawer_c",
            anim = "loop_find",
            flag = AnimConfig.Flag.Loop,
            duration = 2000,
            onFinish = function(info)
                TriggerEvent("da_bankrob:ransackLoot", 30)
                return info
            end,
            next = "e3",
        },
        e3 = {
            animDict = "mech_pickup@loot@desks@drawer_c",
            anim = "loop_find",
            flag = AnimConfig.Flag.Loop,
            duration = 2000,
            onFinish = function(info)
                TriggerEvent("da_bankrob:ransackLoot", 60)
                return info
            end,
            next = "e4",
        },
        e4 = {
            animDict = "mech_pickup@loot@desks@drawer_c",
            anim = "loop_find",
            flag = AnimConfig.Flag.Loop,
            duration = 2000,
            onFinish = function(info)
                TriggerEvent("da_bankrob:ransackLoot", 80)
                return info
            end,
            next = "e5",
        },
        e5 = {
            animDict = "mech_pickup@loot@desks@drawer_c",
            anim = "loop_find",
            flag = AnimConfig.Flag.Loop,
            onFinish = function(info)
                TriggerEvent("da_bankrob:ransackLoot", 90)
                return info
            end,
            duration = 2000,
            next = "exit",
        },
    }
}
