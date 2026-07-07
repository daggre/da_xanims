AnimLib.handshovel = {
    name = "Handshovel Kneeling",
    tags = { work=1, },
    key = "h",
    condition = function() return Conditions.Check({ canFarmHandSpade = false, hasSpade = true }) end,
    enter = {
        animDict = "amb_camp@world_camp_jack_plant@enter",
        anim = "enter",
        blendInSpeed = 1.0,
        onTrigger = function(info)
            info.prop.handshovel = Prop:new()
            Citizen.Wait(2600)
            info.prop.handshovel:attach(info.ped, Propset.HandShovel)
            return info
        end,
    },
    exit = {
        animDict = "amb_camp@world_camp_jack_plant@exit",
        anim = "exit",
        duration = 3500,
        onTrigger = function(info)
            Citizen.Wait(2300)
            Prop.Detach(info.prop.handshovel)
            return info
        end,
    },
    idles = {
        idle_a = {
            animDict = "amb_camp@world_camp_jack_plant@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
            transitions = {
                -- a_a = "1",
                -- a_b = "2",
                -- a_c = "3",
            }
        },
    },
    animations = {
        a_a = {
            animDict = "amb_camp@world_camp_jack_plant@idle_a",
            anim = "idle_a",
        },
        a_b = {
            animDict = "amb_camp@world_camp_jack_plant@idle_a",
            anim = "idle_b",
        },
        a_c = {
            animDict = "amb_camp@world_camp_jack_plant@idle_a",
            anim = "idle_c",
        },
    }
}

AnimLib.harvest_handshovel = {
    name = "Dig Up Produce",
    tags = { root=1, },
    key = "z",
    condition = function() return Conditions.Check({ canFarmHandSpade = true, hasSpade = true, }) end,
    enter = {
        animDict = "amb_work@world_human_farmer_weeding@male_a@stand_enter",
        anim = "enter_back_lf",
        blendInSpeed = 1.0,
        duration = 4500,
        next = "pick_base",
        changeCore = { Stamina = -10 },
        onStart = function(info)
            info.field = AnimUtil.GetInteractiveZone("farm", "farmHandSpade")
            if not info.field then info.exit = true; end
            return info
        end,
    },
    exit = {
        condition = function() return Conditions.Check({ canFarmHandSpade = allow, }) end,
        animDict = "amb_work@world_human_farmer_weeding@male_a@stand_exit",
        anim = "exit_front",
        duration = 3300,
    },
    animations = {
        pick_base = {
            animDict = "amb_work@world_human_farmer_weeding@male_a@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
            animDuration = -1,
            duration = 100,
            next = "harvest_1",
            changeCore = { Stamina = -10 },
        },
        jack_putdownshovel = {
            animDict = "amb_camp@world_camp_jack_plant@exit",
            anim = "exit",
            duration = 4000,
            flag = AnimConfig.Flag.Move,
            next = "exit",
            onTrigger = function(info)
                Citizen.Wait(2300)
                Prop.Detach(info.prop.handshovel)
                return info
            end,
            onFinish = function(info)
                AnimUtil.Farm(info.field)
                return info
            end,
            changeCore = { Stamina = -15 },
        },
        harvest_1 = {
            animDict = "amb_camp@world_camp_jack_plant@base",
            anim = "base",
            duration = 15000,
            flag = AnimConfig.Flag.MoveLoop,
            blendInSpeed = 1.0,
            onTrigger = function(info)
                info.prop.handshovel = Prop:new()
                info.prop.handshovel:attach(info.ped, Propset.HandShovel)
                return info
            end,
            next = "jack_putdownshovel",
            changeCore = { Stamina = -22.5 },
        },
    }
}

AnimLib.weeding = {
    name = "Weeding",
    tags = { work=1, },
    key = "w",
    condition = function() return Conditions.Check({ canFarmRoot = false }) end,
    enter = {
        animDict = "amb_work@world_human_farmer_weeding@male_a@stand_enter",
        anim = "enter_back_lf",
        blendInSpeed = 1.0,
        changeCore = { Stamina = -15 },
    },
    exit = {
        animDict = "amb_work@world_human_farmer_weeding@male_a@stand_exit",
        anim = "exit_front",
        duration = 3000,
    },
    idles = {
        idle_a = {
            animDict = "amb_work@world_human_farmer_weeding@male_a@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
            transitions = {
                inspect = "1",
                bothtug = "2",
                leanleft = "3",
                yank = "4",
                switch = "q",
                breaktwo = "w",
                bigtug = "e",
                wipesweat = "r",
            },
        },
    },
    animations = {
        inspect = {
            animDict = "amb_work@world_human_farmer_weeding@male_a@idle_a",
            anim = "idle_a",
            name = "Inspect",
            changeCore = { Stamina = -15 },
        },
        bothtug = {
            animDict = "amb_work@world_human_farmer_weeding@male_a@idle_a",
            anim = "idle_b",
            name = "Easy Tug",
            changeCore = { Stamina = -15 },
        },
        leanleft = {
            animDict = "amb_work@world_human_farmer_weeding@male_a@idle_a",
            anim = "idle_c",
            name = "Lean Left Hand",
            changeCore = { Stamina = -15 },
        },
        yank = {
            animDict = "amb_work@world_human_farmer_weeding@male_a@idle_b",
            anim = "idle_d",
            name = "Yank",
            changeCore = { Stamina = -15 },
        },
        switch = {
            animDict = "amb_work@world_human_farmer_weeding@male_a@idle_b",
            anim = "idle_e",
            name = "Switch Hands",
            changeCore = { Stamina = -15 },
        },
        breaktwo = {
            animDict = "amb_work@world_human_farmer_weeding@male_a@idle_b",
            anim = "idle_f",
            name = "Stubborn Pull",
            changeCore = { Stamina = -15 },
        },
        bigtug = {
            animDict = "amb_work@world_human_farmer_weeding@male_a@idle_c",
            anim = "idle_g",
            name = "Big Tug",
            changeCore = { Stamina = -15 },
        },
        wipesweat = {
            animDict = "amb_work@world_human_farmer_weeding@male_a@idle_c",
            anim = "idle_h",
            name = "Wipe Sweat",
            changeCore = { Stamina = -15 },
        },
    },
}

AnimLib.harvest_root = {
    name = "Pull Crop",
    tags = { root=1, },
    key = "z",
    condition = function() return Conditions.Check({ canFarmRoot = true }) end,
    enter = {
        animDict = "amb_work@world_human_farmer_weeding@male_a@stand_enter",
        anim = "enter_back_lf",
        blendInSpeed = 1.0,
        changeCore = { Stamina = -15 },
        next = "harvest_1",
        onStart = function(info)
            info.field = AnimUtil.GetInteractiveZone("farm", "farmRoot")
            if not info.field then info.exit = true; end
            return info
        end,
    },
    exit = {
        animDict = "amb_work@world_human_farmer_weeding@male_a@stand_exit",
        anim = "exit_front",
        duration = 3000,
    },
    animations = {
        harvest_1 = {
            animDict = "amb_work@world_human_farmer_weeding@male_a@idle_a",
            anim = "idle_c",
            duration = 4300,
            next = "harvest_2",
            changeCore = { Stamina = -15 },
        },
        harvest_2 = {
            next = "harvest_3",
            animDict = "amb_work@world_human_farmer_weeding@male_a@idle_c",
            duration = 4400,
            blendInSpeed = 1.0,
            anim = "idle_g",
            changeCore = { Stamina = -15 },
        },
        harvest_3 = {
            animDict = "amb_work@world_human_farmer_weeding@male_a@idle_b",
            anim = "idle_f",
            duration = 5500,
            blendInSpeed = 1.0,
            next = "harvest_4",
            changeCore = { Stamina = -15 },
        },
        harvest_4 = {
            animDict = "amb_work@world_human_farmer_weeding@male_a@idle_c",
            anim = "idle_g",
            duration = 4400,
            blendInSpeed = 1.0,
            next = "harvest_5",
            changeCore = { Stamina = -15 },
        },
        harvest_5 = {
            animDict = "amb_work@world_human_farmer_weeding@male_a@idle_b",
            anim = "idle_e",
            duration = 5000,
            blendInSpeed = 1.0,
            next = "harvest_6",
            changeCore = { Stamina = -15 },
        },
        harvest_6 = {
            animDict = "amb_work@world_human_farmer_weeding@male_a@idle_c",
            anim = "idle_h",
            duration = 8500,
            blendInSpeed = 1.0,
            next = "harvest_7",
            changeCore = { Stamina = -19 },
        },
        harvest_7 = {
            next = "exit",
            onTrigger = function(info)
                AnimUtil.Farm(info.field)
                return info
            end,
        },
        inspect = {
            animDict = "amb_work@world_human_farmer_weeding@male_a@idle_a",
            anim = "idle_a",
        },
        bothtug = {
            animDict = "amb_work@world_human_farmer_weeding@male_a@idle_a",
            anim = "idle_b",
        },
        leanleft = {
            animDict = "amb_work@world_human_farmer_weeding@male_a@idle_a",
            anim = "idle_c",
        },
        yank = {
            animDict = "amb_work@world_human_farmer_weeding@male_a@idle_b",
            anim = "idle_d",
        },
        switch = {
            animDict = "amb_work@world_human_farmer_weeding@male_a@idle_b",
            anim = "idle_e",
        },
        breaktwo = {
            animDict = "amb_work@world_human_farmer_weeding@male_a@idle_b",
            anim = "idle_f",
        },
        bigtug = {
            animDict = "amb_work@world_human_farmer_weeding@male_a@idle_c",
            anim = "idle_g",
        },
        wipesweat = {
            animDict = "amb_work@world_human_farmer_weeding@male_a@idle_c",
            anim = "idle_h",
        },
    },
}

AnimLib.harvest_shell = {
    name = "Collect Oyster",
    tags = { root=1, },
    key = "z",
    condition = function() return Conditions.Check({ canFarmShell = true }) end,
    enter = {
        animDict = "amb_work@world_human_farmer_weeding@male_a@stand_enter",
        anim = "enter_back_lf",
        blendInSpeed = 1.0,
        changeCore = { Stamina = -15 },
        next = "harvest_1",
        onStart = function(info)
            info.field = AnimUtil.GetInteractiveZone("farm", "farmShell")
            if not info.field then info.exit = true; end
            return info
        end
    },
    exit = {
        animDict = "amb_work@world_human_farmer_weeding@male_a@stand_exit",
        anim = "exit_front",
        duration = 3000,
    },
    animations = {
        harvest_1 = {
            animDict = "amb_work@world_human_farmer_weeding@male_a@idle_a",
            anim = "idle_c",
            duration = 4300,
            next = "harvest_2",
            changeCore = { Stamina = -15 },
        },
        harvest_2 = {
            next = "harvest_3",
            animDict = "amb_work@world_human_farmer_weeding@male_a@idle_c",
            duration = 4400,
            blendInSpeed = 1.0,
            anim = "idle_h",
            changeCore = { Stamina = -15 },
        },
        harvest_3 = {
            animDict = "amb_work@world_human_farmer_weeding@male_a@idle_a",
            anim = "idle_c",
            duration = 5500,
            blendInSpeed = 1.0,
            next = "harvest_7",
            changeCore = { Stamina = -18 },
        },
        harvest_7 = {
            next = "exit",
            onTrigger = function(info)
                AnimUtil.Farm(info.field)
                return info
            end,
        },
        inspect = {
            animDict = "amb_work@world_human_farmer_weeding@male_a@idle_a",
            anim = "idle_a",
        },
        bothtug = {
            animDict = "amb_work@world_human_farmer_weeding@male_a@idle_a",
            anim = "idle_b",
        },
        leanleft = {
            animDict = "amb_work@world_human_farmer_weeding@male_a@idle_a",
            anim = "idle_c",
        },
        yank = {
            animDict = "amb_work@world_human_farmer_weeding@male_a@idle_b",
            anim = "idle_d",
        },
        switch = {
            animDict = "amb_work@world_human_farmer_weeding@male_a@idle_b",
            anim = "idle_e",
        },
        breaktwo = {
            animDict = "amb_work@world_human_farmer_weeding@male_a@idle_b",
            anim = "idle_f",
        },
        bigtug = {
            animDict = "amb_work@world_human_farmer_weeding@male_a@idle_c",
            anim = "idle_g",
        },
        wipesweat = {
            animDict = "amb_work@world_human_farmer_weeding@male_a@idle_c",
            anim = "idle_h",
        },
    },
}

AnimLib.handpicking = {
    name = "Handpick",
    tags = {
        work = 1,
        root = { name = "Pick Crop By Hand", key = "z", },
    },
    key = "h",
    triggerCondition = function() return Conditions.Check({ canFarmHandpick = true }) end,
    enter = {
        animDict = "mech_pickup@plant@berries",
        anim = "enter_rf",
        blendInSpeed = 1.0,
        next = "pick_1",
        changeCore = { Stamina = -10 },
        onStart = function(info)
            info.field = AnimUtil.GetInteractiveZone("farm", "farmHandpick")
            if not info.field then info.exit = true; end
            return info
        end,
    },
    exit = {
        animDict = "mech_pickup@plant@berries",
        anim = "base",
        duration = 800,
        blendInSpeed = 1.0,
        blendOutSpeed = 1.5,
    },
    animations = {
        pick_1 = {
            animDict = "mech_pickup@plant@berries",
            anim = "base",
            blendInSpeed = 1.0,
            changeCore = { Stamina = -11 },
            next = "pick_2",
        },
        pick_2 = {
            animDict = "mech_pickup@plant@gold_currant",
            anim = "stn_long_low_skill_pick_n",
            blendInSpeed = 1.0,
            next = "pick_3",
            changeCore = { Stamina = -11 },
        },
        pick_3 = {
            animDict = "mech_pickup@plant@milkweed",
            anim = "stn_pick",
            blendInSpeed = 1.0,
            next = "pick_4",
            changeCore = { Stamina = -10 },
        },
        pick_4 = {
            animDict = "mech_pickup@plant@gold_currant",
            anim = "stn_long_low_skill_pick_n",
            blendInSpeed = 1.0,
            next = "pick_5",
            changeCore = { Stamina = -10 },
        },
        pick_5 = {
            animDict = "mech_pickup@plant@berries",
            anim = "base",
            blendInSpeed = 1.0,
            next = "pick_6",
            changeCore = { Stamina = -7 },
        },
        pick_6 = {
            animDict = "mech_pickup@plant@milkweed",
            anim = "stn_pick",
            blendInSpeed = 1.0,
            next = "exit",
            onFinish = function(info)
                AnimUtil.Farm(info.field)
                return info
            end,
            changeCore = { Stamina = -10 },
        },
    },
}

AnimLib.handpicking_kneel = {
    name = "Pick Produce",
    tags = { root=1, },
    key = "z",
    condition = function() return Conditions.Check({ canFarmKneel = true }) end,
    enter = {
        animDict = "amb_work@world_human_farmer_weeding@male_a@stand_enter",
        anim = "enter_back_lf",
        blendInSpeed = 1.0,
        duration = 4500,
        next = "pick_base",
        onStart = function(info)
            info.field = AnimUtil.GetInteractiveZone("farm", "farmKneel")
            if not info.field then info.exit = true; end
            return info
        end,
    },
    exit = {
        condition = function() return Conditions.Check({ canFarmKneel = allow }) end,
        animDict = "amb_work@world_human_farmer_weeding@male_a@stand_exit",
        anim = "exit_front",
        duration = 3300,
    },
    animations = {
        pick_base = {
            animDict = "amb_work@world_human_farmer_weeding@male_a@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
            animDuration = -1,
            duration = 100,
            next = "pick_1",
            changeCore = { Stamina = -10 },
        },
        pick_1 = {
            animDict = "mech_pickup@plant@gold_currant",
            anim = "stn_long_low_skill_pick_n",
            flag = AnimConfig.Flag.Move,
            blendInSpeed = 1.0,
            next = "pick_2",
            changeCore = { Stamina = -10 },
        },
        pick_2 = {
            animDict = "mech_pickup@plant@milkweed",
            anim = "stn_pick",
            flag = AnimConfig.Flag.Move,
            blendInSpeed = 1.0,
            next = "pick_3",
            changeCore = { Stamina = -10 },
        },
        pick_3 = {
            animDict = "mech_pickup@plant@berries",
            anim = "base",
            flag = AnimConfig.Flag.Move,
            blendInSpeed = 1.0,
            blendOutSpeed = 1.0,
            next = "pick_4",
            changeCore = { Stamina = -10 },
        },
        pick_4 = {
            animDict = "mech_pickup@plant@gold_currant",
            anim = "stn_long_low_skill_pick_n",
            flag = AnimConfig.Flag.Move,
            blendInSpeed = 1.0,
            next = "pick_5",
            changeCore = { Stamina = -10 },
        },
        pick_5 = {
            animDict = "mech_pickup@plant@berries",
            anim = "base",
            flag = AnimConfig.Flag.Move,
            blendInSpeed = 1.0,
            next = "pick_6",
            changeCore = { Stamina = -10 },
        },
        pick_6 = {
            animDict = "mech_pickup@plant@berries",
            anim = "base",
            flag = AnimConfig.Flag.Move,
            blendInSpeed = 1.0,
            blendOutSpeed = 1.0,
            next = "pick_7",
            changeCore = { Stamina = -10 },
        },
        pick_7 = {
            animDict = "mech_pickup@plant@gold_currant",
            anim = "stn_long_low_skill_pick_n",
            flag = AnimConfig.Flag.Move,
            blendInSpeed = 1.0,
            next = "pick_8",
            changeCore = { Stamina = -10 },
        },
        pick_8 = {
            animDict = "mech_pickup@plant@milkweed",
            anim = "stn_pick",
            flag = AnimConfig.Flag.Move,
            blendInSpeed = 1.0,
            next = "pick_9",
            changeCore = { Stamina = -10 },
        },
        pick_9 = {
            animDict = "mech_pickup@plant@gold_currant",
            anim = "stn_long_low_skill_pick_n",
            flag = AnimConfig.Flag.Move,
            blendInSpeed = 1.0,
            next = "pick_10",
            changeCore = { Stamina = -10 },
        },
        pick_10 = {
            animDict = "mech_pickup@plant@berries",
            anim = "base",
            flag = AnimConfig.Flag.Move,
            blendInSpeed = 1.0,
            next = "pick_11",
            changeCore = { Stamina = -10 },
        },
        pick_11 = {
            animDict = "mech_pickup@plant@milkweed",
            anim = "stn_pick",
            flag = AnimConfig.Flag.Move,
            blendInSpeed = 1.0,
            next = "exit",
            onFinish = function(info)
                AnimUtil.Farm(info.field)
                return info
            end,
            changeCore = { Stamina = -10 },
        },
        harvest_1 = {
            animDict = "amb_work@world_human_farmer_weeding@male_a@idle_a",
            anim = "idle_c",
            next = "harvest_2",
            changeCore = { Stamina = -10 },
        },
        harvest_2 = {
            next = "harvest_3",
            animDict = "amb_work@world_human_farmer_weeding@male_a@idle_c",
            anim = "idle_g",
            changeCore = { Stamina = -10 },
        },
        harvest_3 = {
            animDict = "amb_work@world_human_farmer_weeding@male_a@idle_b",
            anim = "idle_f",
            next = "harvest_4",
            changeCore = { Stamina = -10 },
        },
        harvest_4 = {
            animDict = "amb_work@world_human_farmer_weeding@male_a@idle_c",
            anim = "idle_g",
            next = "harvest_5",
            changeCore = { Stamina = -10 },
        },
        harvest_5 = {
            animDict = "amb_work@world_human_farmer_weeding@male_a@idle_b",
            anim = "idle_e",
            next = "harvest_6",
            changeCore = { Stamina = -10 },
        },
        harvest_6 = {
            animDict = "amb_work@world_human_farmer_weeding@male_a@idle_c",
            anim = "idle_h",
            next = "harvest_7",
            changeCore = { Stamina = -10 },
        },
        harvest_7 = {
            next = "exit",
        },
        inspect = {
            animDict = "amb_work@world_human_farmer_weeding@male_a@idle_a",
            anim = "idle_a",
        },
        bothtug = {
            animDict = "amb_work@world_human_farmer_weeding@male_a@idle_a",
            anim = "idle_b",
        },
        leanleft = {
            animDict = "amb_work@world_human_farmer_weeding@male_a@idle_a",
            anim = "idle_c",
        },
        yank = {
            animDict = "amb_work@world_human_farmer_weeding@male_a@idle_b",
            anim = "idle_d",
        },
        switch = {
            animDict = "amb_work@world_human_farmer_weeding@male_a@idle_b",
            anim = "idle_e",
        },
        breaktwo = {
            animDict = "amb_work@world_human_farmer_weeding@male_a@idle_b",
            anim = "idle_f",
        },
        bigtug = {
            animDict = "amb_work@world_human_farmer_weeding@male_a@idle_c",
            anim = "idle_g",
        },
        wipesweat = {
            animDict = "amb_work@world_human_farmer_weeding@male_a@idle_c",
            anim = "idle_h",
        },
    },
}

AnimLib.handpick_tree = {
    name = "Harvest Fruit Tree",
    tags = { root=1, },
    key = "z",
    condition = function() return Conditions.Check({ canFarmTree = true }) end,
    enter = {
        animDict = "mech_pickup@plant@orchid_tree",
        anim = "enter_lf",
        blendInSpeed = 1.0,
        next = "store_produce",
        changeCore = { Stamina = -17.5 },
        onStart = function(info)
            info.field = AnimUtil.GetInteractiveZone("farm", "farmTree")
            log.debug("field", info.field)
            if not info.field then
                info.exit = true
            end
            return info
        end,
    },
    exit = {
        animDict = "mech_pickup@plant@orchid_tree",
        anim = "base",
        duration = 5000,
        onTrigger = function(info)
            info.prop.produce = Prop:new()
            info.prop.produce:attach(info.ped, Propset["pick"..info.field.metadata.crop].OrchardPicking)
            Citizen.Wait(4500)
            Prop.Detach(info.prop.produce)
            AnimUtil.Farm(info.field)
            return info
        end,
    },
    animations = {
        store_produce = {
            animDict = "mech_pickup@plant@orchid_tree",
            anim = "base",
            duration = 5000,
            onTrigger = function(info)
                info.prop.produce = Prop:new()
                info.prop.produce:attach(info.ped, Propset["pick"..info.field.metadata.crop].OrchardPicking)
                Citizen.Wait(5000)
                Prop.Detach(info.prop.produce)
                return info
            end,
            next = "grab_produce",
        },
        grab_produce = {
            animDict = "mech_pickup@plant@orchid_tree",
            anim = "enter_lf",
            blendInSpeed = 1.0,
            next = "exit",
            changeCore = { Stamina = -17.5 },
        },
    }
}

AnimLib.open_oyster = {
    name = "Open Oyster",
    tags = { ["food_&_drink"]=1, },
    key = "o",
    triggerCondition = function() return Conditions.Check({ hasOyster = true, }) end,
    enter = {
        animDict = "amb_rest_lean@world_human_lean@table@sharpen_knife@male_a@stand_enter",
        anim = "enter_back_rf",
        blendInSpeed = 1.0,
        flag = AnimConfig.Flag.Move,
        onTrigger = function(info)
            info.prop.shell = Prop:new()
            info.prop.knife = Prop:new()
            API.consume("oyster", info.args)
            Citizen.Wait(1300)
            info.prop.shell:attach(info.ped, Propset.Oyster)
            info.prop.knife:attach(info.ped, Propset.Knife2)
            return info
        end,
        next = "exit",
    },
    exit = {
        animDict = "amb_rest_lean@world_human_lean@table@sharpen_knife@male_a@walk_exit",
        anim = "exit_front",
        blendInSpeed = 1.0,
        flag = AnimConfig.Flag.Move,
        duration = 5500,
        onTrigger = function(info)
            Citizen.Wait(4200)
            Prop.Detach(info.prop.knife)
            Citizen.Wait(800)
            Prop.Detach(info.prop.shell)
            API.addItem("oystermeat", 1)
            da_chance.item(10, "pearl")
            return info
        end,
    },
}

AnimLib.open_clam = {
    name = "Open Clam",
    tags = { ["food_&_drink"]=1, },
    key = "m",
    triggerCondition = function() return Conditions.Check({ hasClam = true, }) end,
    enter = {
        animDict = "amb_rest_lean@world_human_lean@table@sharpen_knife@male_a@stand_enter",
        anim = "enter_back_rf",
        blendInSpeed = 1.0,
        flag = AnimConfig.Flag.Move,
        onTrigger = function(info)
            info.prop.shell = Prop:new()
            info.prop.knife = Prop:new()
            API.consume("clam", info.args)
            Citizen.Wait(1300)
            info.prop.shell:attach(info.ped, Propset.Oyster)
            info.prop.knife:attach(info.ped, Propset.Knife2)
            return info
        end,
        next = "exit",
    },
    exit = {
        animDict = "amb_rest_lean@world_human_lean@table@sharpen_knife@male_a@walk_exit",
        anim = "exit_front",
        blendInSpeed = 1.0,
        flag = AnimConfig.Flag.Move,
        duration = 5500,
        onTrigger = function(info)
            Citizen.Wait(4200)
            Prop.Detach(info.prop.knife)
            Citizen.Wait(800)
            Prop.Detach(info.prop.shell)
            API.addItem("clammeat", 1)
            return info
        end,
    },
}
