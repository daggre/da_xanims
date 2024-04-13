AnimLib.squat_drink = {
    name = "Drink Water",
    tags = { root=1, squat=1, ["food_&_drink"]=1, },
    key = "d",
    condition = function() return Conditions.Check({
        atWaterSource = true,
        isRunning = false,
    }) end,
    enter = {
        animDict = "amb_rest_drunk@world_human_bucket_drink@ground@male_a@stand_enter",
        anim = "enter_back_lf",
        blendInSpeed = 1.0,
        nextBlendInSpeed = 1.0,
        duration = 2000,
        next = "a_a",
    },
    exit = {
        animDict = "amb_rest_drunk@world_human_bucket_drink@ground@male_a@stand_exit",
        anim = "exit_front",
        duration = 1600,
    },
    idles = {
        idle_a = {
            animDict = "amb_rest_drunk@world_human_bucket_drink@ground@male_a@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
            onTrigger = function(info)
                if Conditions.Check({ atWaterSource = true }) then da.Fn.Drink(); end
                return info
            end,
            transitions = {
                a_a = "d",
                a_b = "r",
                -- a_c = "3",
                a_d = "w",
                -- a_e = "q",
                -- a_f = "w",
                a_g = "f",
                a_h = "q",
            },
        },
    },
    animations = {
        a_a = {
            animDict = "amb_rest_drunk@world_human_bucket_drink@ground@male_a@idle_a",
            anim = "idle_a",
            name = "Drink Water",
        },
        a_b = {
            animDict = "amb_rest_drunk@world_human_bucket_drink@ground@male_a@idle_a",
            anim = "idle_b",
            name = "Rub Eyes",
        },
        a_c = {
            animDict = "amb_rest_drunk@world_human_bucket_drink@ground@male_a@idle_a",
            anim = "idle_c",
            name = "Wring Hands",
        },
        a_d = {
            animDict = "amb_rest_drunk@world_human_bucket_drink@ground@male_a@idle_b",
            anim = "idle_d",
            name = "Wring Hands",
        },
        a_e = {
            animDict = "amb_rest_drunk@world_human_bucket_drink@ground@male_a@idle_b",
            anim = "idle_e",
            name = "Inspect Hands, Spit Right",
        },
        a_f = {
            animDict = "amb_rest_drunk@world_human_bucket_drink@ground@male_a@idle_b",
            anim = "idle_f",
            name = "Spit Left",
        },
        a_g = {
            animDict = "amb_rest_drunk@world_human_bucket_drink@ground@male_a@idle_c",
            anim = "idle_g",
            name = "Wipe Face, Wring Hands",
        },
        a_h = {
            animDict = "amb_rest_drunk@world_human_bucket_drink@ground@male_a@idle_c",
            anim = "idle_h",
            name = "Quick Sips",
        },
    },
}

AnimLib.fill_canteen = {
    name = "Fill Canteen",
    tags = { root=1,["food_&_drink"]={key="f"}, },
    key = "j",
    triggerCondition = function() return Conditions.Check({
        canteenNotFull = true,
        atWaterSource = true,
        isRunning = false,
    }) end,
    enter = {
        animDict = "mech_inventory@item@_templates@cylinder@d12_h6-7_inspecty@offhand@base",
        anim = "unholster",
        blendInSpeed = 1.0,
        duration = 600,
        onTrigger = function(info)
            info.prop.canteen = Prop:new()
            Citizen.Wait(600)
            info.prop.canteen:attach(info.ped, Propset.Canteen.Fill)
            return info
        end,
        next = "bend_down",
    },
    exit = {
        animDict = "amb_player@world_player_chore@bucket_put_down@male_a@stand_exit",
        anim = "exit_front",
        next = "exit_2",
        duration = 800,
    },
    idles = {
        idle_a = {
            animDict = "amb_player@world_player_chore@bucket_pick_up@male_a@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
            duration = 4000,
            onTrigger = function(info)
                local canteen = info.args
                if not canteen then
                    local canteens = da.API.GetItems(function(item)
                        return item.name == "canteen" and (not item.info or item.info.water ~= 100)
                    end)
                    if canteens and next(canteens) then
                        canteen = canteens[1]
                    end
                end
                if not canteen then return info; end

                Citizen.Wait(1000)
                da.API.SetItemMetadata(canteen, {water=100})
                da.API.Notify("Canteen refilled", "success")
                return info
            end,
            next = "exit",
        },
    },
    animations = {
        bend_down = {
            animDict = "amb_player@world_player_chore@bucket_pick_up@male_a@stand_enter",
            anim = "enter_back_rf",
            blendInSpeed = 1.0,
            next = "idle_a",
        },
        exit_2 = {
            animDict = "mech_inventory@item@_templates@cylinder@d12_h6-7_inspecty@offhand@base",
            anim = "holster",
            duration = 450,
            playbackRate = 0.02,
            blendInSpeed = 2.0,
        }
    }
}

AnimLib.drink_canteen = {
    name = "Drink Canteen",
    tags = { ["food_&_drink"]=1, },
    key = "w",
    condition = function() return Conditions.Check({
        onMount = allow,
        hasCanteen = true,
        canteenHasWater = true,
        isRunning = false,
    }) end,
    enter = {
        animDict = "mech_inventory@item@_templates@cylinder@d12_h6-7_inspecty@offhand@base",
        anim = "unholster",
        blendInSpeed = 1.0,
        nextBlendInSpeed = 0.8,
        duration = 600,
        flag = AnimConfig.Flag.Move,
        onTrigger = function(info)
            info.prop.canteen = Prop:new()
            info.canteen = info.args
            if not info.canteen then
                local canteens = da.API.GetItems(function(item)
                    return item.name == "canteen" and AnimUtil.ItemHasMetadata({item}, { water = function(a) return a >= 1 end }, { water = 0 })
                end)
                if canteens and next(canteens) then
                    info.canteen = canteens[1]
                end
            end
            Citizen.Wait(550)
            if not AnimUtil.ItemHasMetadata({info.canteen}, { water = function(a) return a > 1 end }, { water = 0 }) then
                da.API.Notify("This canteen is empty","error")
                info.gotoExit = true
                return info
            end

            Citizen.Wait(50)
            info.prop.canteen:attach(info.ped, Propset.Canteen.Drink)
            return info
        end,
        next = "a_a",
    },
    exit = {
        animDict = "mech_inventory@item@_templates@cylinder@d12_h6-7_inspecty@offhand@base",
        anim = "holster",
        duration = 620,
        playbackRate = 0.02,
        blendInSpeed = 2.0,
        flag = AnimConfig.Flag.Move,
        onTrigger = function(info)
            Citizen.Wait(600)
            Prop.Delete(info.prop.canteen)
            return info
        end,
    },
    idles = {
        idle_a = {
            animDict = "amb_rest_drunk@world_human_drinking@female_a@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop | AnimConfig.Flag.Move,
            onStart = function(info)
                local waterAmount = info.canteen and info.canteen.info and info.canteen.info.water or 0
                local newWaterAmount = waterAmount - 20
                newWaterAmount = newWaterAmount >= 0 and newWaterAmount or 0
                if info.canteen and info.canteen.info then
                    info.canteen.info.water = newWaterAmount
                end
                da.API.SetItemMetadata(info.canteen, {water=newWaterAmount})
                return info
            end,
            onFinish = function(info)
                da.Fn.Drink()
                if not AnimUtil.ItemHasMetadata({info.canteen}, { water = function(a) return a > 1 end }, { water = 0 }) then
                    da.API.Notify("This canteen is empty","error")
                    info.gotoExit = true
                end
                return info
            end,
            transitions = {
                a_a = "d",
                -- a_b = "2",
                a_c = "s",
                -- a_d = "4",
                a_e = "q",
                -- a_f = "w",
                -- a_g = "e",
                -- a_h = "r",
            },
        },
    },
    animations = {
        a_a = {
            animDict = "amb_rest_drunk@world_human_drinking@female_a@idle_a",
            anim = "idle_a",
            flag = AnimConfig.Flag.Move,
            name = "Drink",
        },
        a_b = {
            animDict = "amb_rest_drunk@world_human_drinking@female_a@idle_a",
            anim = "idle_b",
        },
        a_c = {
            animDict = "amb_rest_drunk@world_human_drinking@female_a@idle_a",
            anim = "idle_c",
            flag = AnimConfig.Flag.Move,
            name = "Talk, Swish and Swig",
        },
        a_d = {
            animDict = "amb_rest_drunk@world_human_drinking@female_a@idle_b",
            anim = "idle_d",
        },
        a_e = {
            animDict = "amb_rest_drunk@world_human_drinking@female_a@idle_b",
            anim = "idle_e",
            flag = AnimConfig.Flag.Move,
            name = "Long Drink",
        },
        a_f = {
            animDict = "amb_rest_drunk@world_human_drinking@female_a@idle_b",
            anim = "idle_f",
        },
        a_g = {
            animDict = "amb_rest_drunk@world_human_drinking@female_a@idle_c",
            anim = "idle_g",
        },
        a_h = {
            animDict = "amb_rest_drunk@world_human_drinking@female_a@idle_c",
            anim = "idle_h",
        },
        a_i = {
            animDict = "amb_rest_drunk@world_human_drinking@female_a@idle_c",
            anim = "idle_i",
        },
    },
}
