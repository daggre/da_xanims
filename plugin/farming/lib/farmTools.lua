AnimLib.rake = {
    name = "Rake",
    tags = {
        work = 1,
        root = {
            name = "Pickup Rake", key = "z",
            condition = function() return Conditions.Check({ pickupRake = true }) end,
        }},
    key = "r",
    triggerCondition = function() return Conditions.Check({ hasRake = true }) end,
    enter = {
        animDict = "amb_work@world_human_rake_pickup@male_a@stand_enter",
        anim = "enter_back_lf",
        blendInSpeed = 1.0,
        next = "e_pickup",
        onTrigger = function(info)
            info.prop.rake = Prop:new()
            Citizen.Wait(1000)
            info.prop.rake:attach(info.ped, Propset.Rake)
            return info
        end,
    },
    exit = {
        animDict = "mech_loco_m@generic@discard@rake@right",
        anim = "casual_discard_right",
        flag = AnimConfig.Flag.Move,
        duration = 200,
        onTrigger = function(info)
            Citizen.Wait(400)
            Prop.Detach(info.prop.rake, { forceWait = 2000 })
            info.prop.rake = nil
            return info
        end,
    },
    idles = {
        idle_holdrake = {
            animDict = "amb_wander@code_human_rake_wander@male_a@base",
            anim = "base",
            blendInSpeed = 4.0,
            flag = AnimConfig.Flag.MoveLoop,
            transitions = {
                trans_rake1= "q",
                trans_rake3 = "a",
                trans_rake6 = "s",
                trans_rake = "w",
                trans_harvest_sweat = "s",
                trans_harvest = "z",
                set_down = "l",
                drop_rake = "d"
            },
            idleAnimConfig = {
                speed = 0.95,
                canJump = false,
            }
        },
    },
    animations = {
        e_pickup = {
            animDict = "amb_work@world_human_rake_pickup@male_a@stand_exit_withprop",
            anim = "exit_front",
            blendOutSpeed = 1.0,
            nextBlendInSpeed = 3.0,
            duration = 1200,
        },
        set_down = {
            name = "Lean Rake",
            animDict = "amb_work@world_human_rake_putdown@male_a@stand_enter_withprop",
            anim = "enter_back_lf",
            next = "exit_set_down",
        },
        exit_set_down = {
            animDict = "amb_work@world_human_rake_putdown@male_a@stand_exit",
            anim = "exit_front",
            duration = 400,
            onTrigger = function(info)
                Prop.Detach(info.prop.rake, { forceWait = 5000 })
                info.prop.rake = nil
                return info
            end,
        },
        hold_rake = {
            animDict = "amb_work@world_human_farmer_rake@male_a@stand_exit_withprop",
            anim = "exit_front",
            duration = 1700,
        },
        drop_rake = {
            name = "Drop Rake",
            next = "exit",
        },
        trans_harvest_sweat = {
            name = "Harvest, Sweating",
            condition = function() return Conditions.Check({ canFarmRake = true, isInClearedVeg = false, }) end,
            animDict = "amb_work@world_human_farmer_rake@male_a@stand_enter_withprop",
            anim = "enter_back_rf",
            animLibName = "rake_active",
            next = "sweat",
            changeCore = { Stamina = -10 },
            onStart = function(info)
                info.field = AnimUtil.GetInteractiveZone("farm", "farmRake")
                if not info.field then info.exit = true; end
                return info
            end,
        },
        trans_harvest = {
            name = "Harvest",
            condition = function() return Conditions.Check({ canFarmRake = true, isInClearedVeg = false, }) end,
            animDict = "amb_work@world_human_farmer_rake@male_a@stand_enter_withprop",
            anim = "enter_back_rf",
            animLibName = "rake_active",
            next = "rake",
            changeCore = { Stamina = -10 },
            onStart = function(info)
                info.field = AnimUtil.GetInteractiveZone("farm", "farmRake")
                log.debug(info.field)
                if not info.field then info.exit = true; end
                return info
            end,
        },
        trans_rake1 = {
            name = "Rake Quick",
            condition = function() return Conditions.Check({ canFarmRake = false, isInClearedVeg = false, }) end,
            animDict = "amb_work@world_human_farmer_rake@male_a@stand_enter_withprop",
            anim = "enter_back_rf",
            animLibName = "rake_active",
            next = "rake1",
            changeCore = { Stamina = -10 },
        },
        trans_rake3 = {
            name = "Rake Long",
            condition = function() return Conditions.Check({ canFarmRake = false, isInClearedVeg = false, }) end,
            animDict = "amb_work@world_human_farmer_rake@male_a@stand_enter_withprop",
            anim = "enter_back_rf",
            animLibName = "rake_active",
            next = "rake3_1",
            changeCore = { Stamina = -10 },
        },
        trans_rake6 = {
            name = "Rake Longer",
            condition = function() return Conditions.Check({ canFarmRake = false, isInClearedVeg = false, }) end,
            animDict = "amb_work@world_human_farmer_rake@male_a@stand_enter_withprop",
            anim = "enter_back_rf",
            animLibName = "rake_active",
            next = "rake6_1",
            changeCore = { Stamina = -10 },
        },
        trans_rake = {
            name = "Keep Raking",
            condition = function() return Conditions.Check({ canFarmRake = false, isInClearedVeg = false, }) end,
            animDict = "amb_work@world_human_farmer_rake@male_a@stand_enter_withprop",
            anim = "enter_back_rf",
            animLibName = "rake_active",
            next = "rakeloop_1",
            changeCore = { Stamina = -10 },
        }
    }
}

AnimLib.rake_active = {
    name = "",
    tags = {},
    key = "",
    enter = { },
    exit = {
        animDict = "amb_work@world_human_farmer_rake@male_a@base",
        anim = "base",
        blendInSpeed = 1.3,
        duration = 400,
        next = "trans_exit",
    },
    animations = {
        rake = {
            name = "Work",
            animDict = "amb_work@world_human_farmer_rake@male_a@idle_a",
            anim = "idle_a",
            next = "r_2",
            changeCore = { Stamina = -20 },
        },
        r_2 = {
            animDict = "amb_work@world_human_farmer_rake@male_a@base",
            anim = "base",
            next = "r_3",
            changeCore = { Stamina = -20 },
        },
        r_3 = {
            animDict = "amb_work@world_human_farmer_rake@male_a@idle_a",
            anim = "idle_b",
            next = "r_4",
            changeCore = { Stamina = -20 },
        },
        r_4 = {
            animDict = "amb_work@world_human_farmer_rake@male_a@idle_c",
            anim = "idle_h",
            next = "trans_holdrake",
            changeCore = { Stamina = -20 },
        },
        sweat = {
            animDict = "amb_work@world_human_farmer_rake@male_a@idle_a",
            anim = "idle_a",
            next = "sw_2",
            changeCore = { Stamina = -20 },
        },
        sw_2 = {
            animDict = "amb_work@world_human_farmer_rake@male_a@base",
            anim = "base",
            next = "sw_3",
            changeCore = { Stamina = -20 },
        },
        sw_3 = {
            animDict = "amb_work@world_human_farmer_rake@male_a@idle_a",
            anim = "idle_c",
            next = "sw_4",
            changeCore = { Stamina = -20 },
        },
        sw_4 = {
            animDict = "amb_work@world_human_farmer_rake@male_a@idle_c",
            anim = "idle_h",
            next = "trans_holdrake",
            changeCore = { Stamina = -20 },
        },
        rake1 = {
            animDict = "amb_work@world_human_farmer_rake@male_a@idle_c",
            anim = "idle_h",
            next = "trans_holdrake_nofarm",
            changeCore = { Stamina = -20 },
        },
        rake3_1 = {
            animDict = "amb_work@world_human_farmer_rake@male_a@idle_a",
            anim = "idle_a",
            next = "rake3_2",
            changeCore = { Stamina = -20 },
        },
        rake3_2 = {
            animDict = "amb_work@world_human_farmer_rake@male_a@idle_a",
            anim = "idle_b",
            next = "rake3_3",
            changeCore = { Stamina = -20 },
        },
        rake3_3 = {
            animDict = "amb_work@world_human_farmer_rake@male_a@idle_c",
            anim = "idle_h",
            next = "trans_holdrake_nofarm",
            changeCore = { Stamina = -20 },
        },
        rake6_1 = {
            animDict = "amb_work@world_human_farmer_rake@male_a@idle_a",
            anim = "idle_a",
            next = "rake6_2",
            changeCore = { Stamina = -20 },
        },
        rake6_2 = {
            animDict = "amb_work@world_human_farmer_rake@male_a@base",
            anim = "base",
            next = "rake6_3",
            changeCore = { Stamina = -20 },
        },
        rake6_3 = {
            animDict = "amb_work@world_human_farmer_rake@male_a@idle_a",
            anim = "idle_c",
            next = "rake6_4",
            changeCore = { Stamina = -20 },
        },
        rake6_4 = {
            animDict = "amb_work@world_human_farmer_rake@male_a@idle_c",
            anim = "idle_h",
            next = "rake6_5",
            changeCore = { Stamina = -20 },
        },
        rake6_5 = {
            animDict = "amb_work@world_human_farmer_rake@male_a@idle_a",
            anim = "idle_b",
            next = "rake6_6",
            changeCore = { Stamina = -20 },
        },
        rake6_6 = {
            animDict = "amb_work@world_human_farmer_rake@male_a@idle_c",
            anim = "idle_h",
            next = "trans_holdrake_nofarm",
            changeCore = { Stamina = -20 },
        },
        rakeloop_1 = {
            animDict = "amb_work@world_human_farmer_rake@male_a@idle_a",
            anim = "idle_a",
            next = "rakeloop_2",
            changeCore = { Stamina = -20 },
        },
        rakeloop_2 = {
            animDict = "amb_work@world_human_farmer_rake@male_a@base",
            anim = "base",
            next = "rakeloop_3",
            changeCore = { Stamina = -20 },
        },
        rakeloop_3 = {
            animDict = "amb_work@world_human_farmer_rake@male_a@idle_a",
            anim = "idle_c",
            next = "rakeloop_4",
            changeCore = { Stamina = -20 },
        },
        rakeloop_4 = {
            animDict = "amb_work@world_human_farmer_rake@male_a@idle_c",
            anim = "idle_h",
            next = "rakeloop_5",
            changeCore = { Stamina = -20 },
        },
        rakeloop_5 = {
            animDict = "amb_work@world_human_farmer_rake@male_a@idle_a",
            anim = "idle_b",
            next = "rakeloop_6",
            changeCore = { Stamina = -20 },
        },
        rakeloop_6 = {
            animDict = "amb_work@world_human_farmer_rake@male_a@base",
            anim = "base",
            next = "rakeloop_1",
            changeCore = { Stamina = -20 },
        },
        -- base = { animDict = "amb_work@world_human_farmer_rake@male_a@base", anim = "base", },
        -- a_ss_sss = { animDict = "amb_work@world_human_farmer_rake@male_a@idle_a", anim = "idle_a", },
        -- a_ssllll = { animDict = "amb_work@world_human_farmer_rake@male_a@idle_a", anim = "idle_b", },
        -- a_sws = { animDict = "amb_work@world_human_farmer_rake@male_a@idle_a", anim = "idle_c", },
        -- a_sbs = { animDict = "amb_work@world_human_farmer_rake@male_a@idle_b", anim = "idle_d", },
        -- a_pull = { animDict = "amb_work@world_human_farmer_rake@male_a@idle_b", anim = "idle_f", },
        -- a_hhp = { animDict = "amb_work@world_human_farmer_rake@male_a@idle_c", anim = "idle_h", },
        trans_holdrake = {
            animDict = "amb_work@world_human_farmer_rake@male_a@idle_b",
            anim = "idle_f",
            animLibName = "rake",
            next = "hold_rake",
            onTrigger = function(info)
                Citizen.Wait(5500)
                AnimUtil.Farm(info.field)
                return info
            end,
            changeCore = { Stamina = -20 },
        },
        trans_holdrake_nofarm = {
            animDict = "amb_work@world_human_farmer_rake@male_a@idle_b",
            anim = "idle_f",
            animLibName = "rake",
            next = "hold_rake",
            changeCore = { Stamina = -20 },
        },
        trans_exit = {
            animDict = "",
            anim = "",
            animLibName = "rake",
            next = "hold_rake",
        }
    }
}

AnimLib.shovel = {
    name = "Shovel",
    tags = {
        work = 1,
        root = {
            name = "Pickup Shovel", key = "z",
            condition = function() return Conditions.Check({ pickupShovel = true }) end,
        }},
    key = "s",
    triggerCondition = function() return Conditions.Check({ hasShovel = true }) end,
    enter = {
        animDict = "amb_work@world_human_gravedig@working@male_b@stand_enter",
        anim = "enter_back_lf",
        blendInSpeed = 1.0,
        prop = { shovel = { anim = "enter_back_lf_shovel" } },
        onTrigger = function(info)
            info.prop.shovel = Prop:new()
            Citizen.Wait(2000)
            info.prop.shovel:attach(info.ped, Propset.Shovel)
            return info
        end,
        duration = 3300,
        next = "return_neutral",
    },
    exit = {
        animDict = "mech_loco_m@generic@discard@2handshovel@right",
        anim = "casual_discard_right",
        duration = 500,
        flag = AnimConfig.Flag.MoveLoop,
        onTrigger = function(info)
            Citizen.Wait(200)
            Prop.Detach(info.prop.shovel, { forceWait = 10000 })
            info.prop.shovel = nil
            return info
        end,
    },
    idles = {
        idle_hold = {
            animDict = "amb_work@world_human_gravedig@working@male_b@react_look@loop@generic",
            anim = "react_look_front_loop",
            prop = { shovel = { anim = "react_look_front_loop_shovel" } },
            flag = AnimConfig.Flag.MoveLoop,
            transitions = {
                trans_scoop3 = "a",
                trans_scoop6 = "s",
                trans_scoop = "w",
                exit_put_down = "x",
                trans_harvest = "z",
            },
            idleAnimConfig = {
                speed = 0.95,
                canJump = false,
            }
        },
    },
    animations = {
        return_neutral = {
            animDict = "amb_work@world_human_gravedig@working@male_b@react_look@enter@med",
            anim = "react_look_front_enter",
            duration = 1200,
            blendInSpeed = 2.0,
            prop = { shovel = { anim = "react_look_front_enter_shovel" } },
            next = "idle_hold",
        },
        a_scoopgruntbase = {
            animDict = "amb_work@world_human_gravedig@working@male_b@base",
            anim = "base",
            changeCore = { Stamina = -15 },
        },
        a_scoopgrunt = {
            animDict = "amb_work@world_human_gravedig@working@male_b@idle_a",
            anim = "idle_a",
            changeCore = { Stamina = -15 },
        },
        a_scoopjuggle = {
            animDict = "amb_work@world_human_gravedig@working@male_b@idle_a",
            anim = "idle_b",
            changeCore = { Stamina = -15 },
        },
        a_scooplever = {
            animDict = "amb_work@world_human_gravedig@working@male_b@idle_a",
            anim = "idle_c",
            changeCore = { Stamina = -15 },
        },
        a_struggle = {
            animDict = "amb_work@world_human_gravedig@working@male_b@idle_b",
            anim = "idle_d",
            changeCore = { Stamina = -15 },
        },
        a_scooplook = {
            animDict = "amb_work@world_human_gravedig@working@male_b@idle_b",
            anim = "idle_e",
            changeCore = { Stamina = -15 },
        },
        exit_put_down = {
            animDict = "amb_work@world_human_gravedig@working@male_b@stand_exit",
            anim = "exit_front",
            duration = 5000,
            name = "Set Shovel Down",
            onTrigger = function(info)
                Citizen.Wait(2600)
                Prop.Detach(info.prop.shovel, { forceWait = 10000 })
                info.prop.shovel = nil
                return info
            end,
        },
        trans_scoop3 = {
            condition = function() return Conditions.Check({ canFarmShovel = false, isInClearedVeg = false, }) end,
            animDict = "amb_work@world_human_gravedig@working@male_b@react_look@exit@generic",
            anim = "react_look_front_exit",
            animLibName = "shovel_scooping",
            blendInSpeed = 1.0,
            duration = 2300,
            next = "scoop_3_1",
            name = "Scoop Thrice",
        },
        trans_scoop6 = {
            condition = function() return Conditions.Check({ canFarmShovel = false, isInClearedVeg = false, }) end,
            animDict = "amb_work@world_human_gravedig@working@male_b@react_look@exit@generic",
            anim = "react_look_front_exit",
            animLibName = "shovel_scooping",
            blendInSpeed = 1.0,
            duration = 2300,
            next = "scoop_6_1",
            name = "Scoop Thrice Twice"
        },
        trans_scoop = {
            condition = function() return Conditions.Check({ canFarmShovel = false, isInClearedVeg = false, }) end,
            animDict = "amb_work@world_human_gravedig@working@male_b@react_look@exit@generic",
            anim = "react_look_front_exit",
            animLibName = "shovel_scooping",
            blendInSpeed = 1.0,
            duration = 2300,
            next = "scoop_loop",
            name = "Keep Shoveling"
        },
        trans_harvest = {
            condition = function() return Conditions.Check({ canFarmShovel = true, isInClearedVeg = false, }) end,
            animDict = "amb_work@world_human_gravedig@working@male_b@react_look@exit@generic",
            anim = "react_look_front_exit",
            animLibName = "shovel_scooping",
            blendInSpeed = 1.0,
            duration = 2300,
            next = "scoop_harvest_1",
            name = "Dig",
            onStart = function(info)
                info.field = AnimUtil.GetInteractiveZone("farm", "farmShovel")
                if not info.field then info.gotoIdle = true; end
                return info
            end,
        },
    }
}

AnimLib.shovel_scooping = {
    name = "",
    tags = {},
    key = "",
    exit = {
        next = "trans_holdshovel",
    },
    animations = {
        scoop_3_1 = {
            animDict = "amb_work@world_human_gravedig@working@male_b@base",
            anim = "base",
            next = "scoop_3_2",
            changeCore = { Stamina = -15 },
        },
        scoop_3_2 = {
            animDict = "amb_work@world_human_gravedig@working@male_b@idle_a",
            anim = "idle_a",
            next = "scoop_3_3",
            changeCore = { Stamina = -15 },
        },
        scoop_3_3 = {
            animDict = "amb_work@world_human_gravedig@working@male_b@idle_b",
            anim = "idle_d",
            next = "trans_holdshovel",
            changeCore = { Stamina = -15 },
        },
        scoop_6_1 = {
            animDict = "amb_work@world_human_gravedig@working@male_b@idle_a",
            anim = "idle_b",
            next = "scoop_6_2",
            changeCore = { Stamina = -15 },
        },
        scoop_6_2 = {
            animDict = "amb_work@world_human_gravedig@working@male_b@idle_a",
            anim = "idle_c",
            next = "scoop_6_3",
            changeCore = { Stamina = -15 },
        },
        scoop_6_3 = {
            animDict = "amb_work@world_human_gravedig@working@male_b@idle_b",
            anim = "idle_e",
            next = "scoop_6_4",
            changeCore = { Stamina = -15 },
        },
        scoop_6_4 = {
            animDict = "amb_work@world_human_gravedig@working@male_b@idle_a",
            anim = "idle_c",
            next = "scoop_6_5",
            changeCore = { Stamina = -15 },
        },
        scoop_6_5 = {
            animDict = "amb_work@world_human_gravedig@working@male_b@idle_b",
            anim = "idle_d",
            next = "scoop_6_6",
            changeCore = { Stamina = -15 },
        },
        scoop_6_6 = {
            animDict = "amb_work@world_human_gravedig@working@male_b@idle_a",
            anim = "idle_a",
            next = "trans_holdshovel",
            changeCore = { Stamina = -15 },
        },
        scoop_loop = {
            animDict = "amb_work@world_human_gravedig@working@male_b@idle_a",
            anim = "idle_b",
            next = "scoop_loop_1",
            changeCore = { Stamina = -15 },
        },
        scoop_loop_1 = {
            animDict = "amb_work@world_human_gravedig@working@male_b@idle_a",
            anim = "idle_b",
            next = "scoop_loop_2",
            changeCore = { Stamina = -15 },
        },
        scoop_loop_2 = {
            animDict = "amb_work@world_human_gravedig@working@male_b@idle_a",
            anim = "idle_c",
            next = "scoop_loop_3",
            changeCore = { Stamina = -15 },
        },
        scoop_loop_3 = {
            animDict = "amb_work@world_human_gravedig@working@male_b@idle_b",
            anim = "idle_e",
            next = "scoop_loop_4",
            changeCore = { Stamina = -15 },
        },
        scoop_loop_4 = {
            animDict = "amb_work@world_human_gravedig@working@male_b@idle_a",
            anim = "idle_c",
            next = "scoop_loop_5",
            changeCore = { Stamina = -15 },
        },
        scoop_loop_5 = {
            animDict = "amb_work@world_human_gravedig@working@male_b@idle_b",
            anim = "idle_d",
            next = "scoop_loop_6",
            changeCore = { Stamina = -15 },
        },
        scoop_loop_6 = {
            animDict = "amb_work@world_human_gravedig@working@male_b@idle_b",
            anim = "idle_e",
            next = "scoop_loop",
            changeCore = { Stamina = -15 },
        },
        scoop_harvest_1 = {
            animDict = "amb_work@world_human_gravedig@working@male_b@idle_a",
            anim = "idle_b",
            next = "scoop_harvest_2",
            changeCore = { Stamina = -15 },
        },
        scoop_harvest_2 = {
            animDict = "amb_work@world_human_gravedig@working@male_b@idle_a",
            anim = "idle_c",
            next = "scoop_harvest_3",
            changeCore = { Stamina = -15 },
        },
        scoop_harvest_3 = {
            animDict = "amb_work@world_human_gravedig@working@male_b@idle_b",
            anim = "idle_e",
            next = "scoop_harvest_4",
            changeCore = { Stamina = -15 },
        },
        scoop_harvest_4 = {
            animDict = "amb_work@world_human_gravedig@working@male_b@idle_a",
            anim = "idle_c",
            next = "scoop_harvest_5",
            changeCore = { Stamina = -15 },
        },
        scoop_harvest_5 = {
            animDict = "amb_work@world_human_gravedig@working@male_b@idle_b",
            anim = "idle_d",
            next = "scoop_harvest_6",
            changeCore = { Stamina = -15 },
        },
        scoop_harvest_6 = {
            animDict = "amb_work@world_human_gravedig@working@male_b@idle_a",
            anim = "idle_a",
            next = "trans_holdshovel_farm",
            changeCore = { Stamina = -15 },
        },
        trans_holdshovel = {
            animDict = "amb_work@world_human_gravedig@working@male_b@react_look@enter@med",
            anim = "react_look_front_enter",
            prop = { shovel = { anim = "react_look_front_enter_shovel" } },
            blendInSpeed = 2.0,
            duration = 1200,
            animLibName = "shovel",
            next = "idle_hold",
        },
        trans_holdshovel_farm = {
            animDict = "amb_work@world_human_gravedig@working@male_b@react_look@enter@med",
            anim = "react_look_front_enter",
            prop = { shovel = { anim = "react_look_front_enter_shovel" } },
            blendInSpeed = 2.0,
            duration = 1200,
            animLibName = "shovel",
            onTrigger = function(info)
                Citizen.Wait(1000)
                AnimUtil.Farm(info.field)
                return info
            end,
            next = "idle_hold",
        }
    }
}

-- AnimLib.rake.idles.idle_holdrake.transitions["testrake"] = "1"
-- AnimLib.rake.animations.testrake = {
--     name = "Test Rake",
--     animDict = "amb_work@world_human_farmer_rake@male_a@base",
--     anim = "base",
--     duration = 1000,
--     onTrigger = function(info)
--         info.field = AnimUtil.GetInteractiveZone("farm", "farmRake")
--         log.debug("anim onTrigger:", info.field)
--         AnimUtil.Farm(info.field)
--         return info
--     end,
-- }
