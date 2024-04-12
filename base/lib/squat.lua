AnimLib.inspect_tracks = {
    name = "Inspect Tracks",
    tags = { squat=1, },
    key = "z",
    enter = {
        animDict = "script_rc@prsn@ig@ig2_inspecttracks",
        anim = "ig2_inspect_tracks_charles",
        blendInSpeed = 1.0,
        duration = 600,
        nextBlendInSpeed = 1.0,
    },
    exit = {
        animDict = "script_rc@prsn@ig@ig2_inspecttracks",
        anim = "ig2_inspect_idletostand_charles",
        duration = 700,
    },
    idles = {
        idle_a = {
            animDict = "script_rc@prsn@ig@ig2_inspecttracks",
            anim = "ig2_inspect_idle_charles",
            flag = AnimConfig.Flag.Loop,
            transitions = {
                a_a = "w",
                a_b = "d",
                a_c = "a",
            },
        },
    },
    animations = {
        a_a = {
            animDict = "script_rc@prsn@ig@ig2_inspecttracks",
            anim = "ig2_inspect_idle_04_charles",
            name = "Touch Ground",
        },
        a_b = {
            animDict = "script_rc@prsn@ig@ig2_inspecttracks",
            anim = "ig2_inspect_idle_02_charles",
            name = "Inspect Ground Right",
        },
        a_c = {
            animDict = "script_rc@prsn@ig@ig2_inspecttracks",
            anim = "ig2_inspect_idle_03_charles",
            name = "Inspect Ground Left",
            duration = 5100,
            nextBlendInSpeed = 1.0,
        },
    },
}

--- Campfire
AnimLib.world_camp_fire_tend_sit_add_logs = {
    name = "Tend Fire",
    tags = { squat=1,fire=1 },
    key = "t",
    enter = {
        animDict = "amb_camp@world_camp_fire_tend_sit@add_logs@male_a@enter",
        anim = "enter_front",
    },
    exit = {
        animDict = "amb_camp@world_camp_fire_tend_sit@add_logs@male_a@exit",
        anim = "exit_back",
        blendInSpeed = 1.0,
        duration = 3500,
    },
    idles = {
        idle_a = {
            animDict = "amb_camp@world_camp_fire_tend_sit@add_logs@male_a@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
            transitions = {
                trans_a_poke = "w",
                add_logs = "q",
                a_a = "n",
                a_b = "b",
                a_c = "s",
                a_d = "e",
            }
        },
    },
    animations = {
        add_logs = {
            animDict = "amb_camp@world_camp_fire_tend_sit@poke_fire@male_a@transition_add_logs",
            anim = "transition_add_logs_alt",
            blendInSpeed = 0.3,
            blendOutSpeed = 0.6,
            onTrigger = function(info)
                info.prop.log = Prop:new(Propset.Firewood,
                    da.Util.GetOffsetFromEntity(
                        info.ped,
                        133.5, 0.708, -1.0,
                        vec3(2, 80, 233)))
                info.prop.log:create()
                FreezeEntityPosition(info.prop.log.entity, true)
                Citizen.Wait(3600)
                FreezeEntityPosition(info.prop.log.entity, false)
                info.prop.log:attach(info.ped)
                Citizen.Wait(1850)
                Prop.Detach(info.proplog, { forceWait = 3500, distance = 1.8, angle = 15 })
                info.prop.log = nil
                return info
            end,
            name = "Add Log",
        },
        a_a = {
            animDict = "amb_camp@world_camp_fire_tend_sit@add_logs@male_a@idle_a",
            anim = "idle_a",
            name = "Scratch Neck",
        },
        a_b = {
            animDict = "amb_camp@world_camp_fire_tend_sit@add_logs@male_a@idle_a",
            anim = "idle_b",
            name = "Wipe Brow",
        },
        a_c = {
            animDict = "amb_camp@world_camp_fire_tend_sit@add_logs@male_a@idle_a",
            anim = "idle_c",
            name = "Stretch",
        },
        a_d = {
            animDict = "amb_camp@world_camp_fire_tend_sit@add_logs@male_a@idle_b",
            anim = "idle_d",
            name = "Swat Smoke"
        },
        trans_a_poke = {
            animDict = "amb_camp@world_camp_fire_tend_sit@add_logs@male_a@transition_poke_fire",
            anim = "transition_poke_fire",
            animLibName = "world_camp_fire_tend_sit_poke_fire",
            next = "idle_poke",
            onTrigger = function(info)
                info.prop.firepoker = Prop:new()
                Citizen.Wait(2600)
                info.prop.firepoker:attach(info.ped, Propset.Firepoker)
                return info
            end,
            name = "Transition to Poke Fire",
        },
    },
}

AnimLib.world_camp_fire_tend_sit_poke_fire = {
    name = "Poke Fire",
    tags = { squat=1,fire=1 },
    key = "f",
    enter = {
        animDict = "amb_camp@world_camp_fire_tend_sit@add_logs@male_a@enter",
        anim = "enter_front",
        next = "intro_enter_poke",
        blendInSpeed = 1.0,
        nextBlendInSpeed = 1.0,
        onTrigger = function(info)
            info.prop.firepoker = Prop:new()
            Citizen.Wait(4800)
            info.prop.firepoker:attach(info.ped, Propset.Firepoker)
            return info
        end,
    },
    exit = {
        animDict = "amb_camp@world_camp_fire_tend_sit@poke_fire@male_a@exit",
        anim = "exit_back",
        blendInSpeed = 1.0,
        duration = 5000,
        onTrigger = function(info)
            Citizen.Wait(500)
            Prop.Detach(info.prop.firepoker, { forceWait = 3500, angle = 15, distance = 1.2 })
            info.prop.firepoker = nil
            return info
        end,
    },
    idles = {
        idle_poke = {
            animDict = "amb_camp@world_camp_fire_tend_sit@poke_fire@male_a@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
            onTrigger = function(info)
                return info
            end,
            transitions = {
                trans_logs = "t",
                poke_a = "b",
                poke_b = "q",
                poke_c = "s",
                poke_d = "e",
            }
        },
    },
    animations = {
        intro_enter_poke = {
            animDict = "amb_camp@world_camp_fire_tend_sit@add_logs@male_a@transition_poke_fire",
            anim = "transition_poke_fire",
        },
        poke_a = {
            animDict = "amb_camp@world_camp_fire_tend_sit@poke_fire@male_a@idle_a",
            anim = "idle_a",
            name = "Blow On Fire",
        },
        poke_b = {
            animDict = "amb_camp@world_camp_fire_tend_sit@poke_fire@male_a@idle_a",
            anim = "idle_b",
            name = "Prod Fire"
        },
        poke_c = {
            animDict = "amb_camp@world_camp_fire_tend_sit@poke_fire@male_a@idle_a",
            anim = "idle_c",
            name = "Smokey Fire"
        },
        poke_d = {
            animDict = "amb_camp@world_camp_fire_tend_sit@poke_fire@male_a@idle_b",
            anim = "idle_d",
            name = "Prod and Look"
        },
        trans_logs = {
            animDict = "amb_camp@world_camp_fire_tend_sit@poke_fire@male_a@transition_add_logs",
            anim = "transition_add_logs_alt",
            animLibName = "world_camp_fire_tend_sit_add_logs",
            blendInSpeed = 0.7,
            next = "idle_a",
            name = "Transition to Tend Fire",
            onTrigger = function(info)
                info.prop.log = Prop:new(Propset.Firewood,
                    da.Util.GetOffsetFromEntity(
                        info.ped,
                        133.5, 0.708, -1.0,
                        vec3(2, 80, 233)))
                info.prop.log:create()
                FreezeEntityPosition(info.prop.log.entity, true)
                Citizen.Wait(700)
                Prop.Detach(info.prop.firepoker, { forceWait = 3500, distance = 0.6, angle = 10 })
                info.prop.firepoker = nil
                Citizen.Wait(2800)
                FreezeEntityPosition(info.prop.log.entity, false)
                info.prop.log:attach()
                Citizen.Wait(2000)
                Prop.Detach(info.prop.log, { forceWait = 3500, angle = 15, distance = 1.8 })
                info.prop.log = nil
                return info
            end,
        },
    },
}

--- Wash
AnimLib.world_human_wash_kneel_river_maleb = {
    name = "Wash In River",
    tags = { squat=1, },
    key = "w",
    enter = {
        animDict = "amb_misc@world_human_wash_kneel_river@male_b@stand_enter",
        anim = "enter_back",
        blendInSpeed = 1.0,
    },
    exit = {
        animDict = "amb_misc@world_human_wash_kneel_river@male_b@stand_exit",
        anim = "exit_back",
        duration = 600,
    },
    idles = {
        idle_b = {
            animDict = "amb_misc@world_human_wash_kneel_river@male_b@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
            transitions = {
                b_a = "t",
                b_b = "z",
                b_c = "f",
                b_d = "e",
                b_e = "h",
                b_f = "w",
                b_g = "q",
                b_h = "a",
                b_i = "r",
                b_j = "d",
                b_k = "s",
                b_l = "p",
            },
        },
    },
    animations = {
        b_a = {
            animDict = "amb_misc@world_human_wash_kneel_river@male_b@idle_a",
            anim = "idle_a",
            name = "Right Thigh",
        },
        b_b = {
            animDict = "amb_misc@world_human_wash_kneel_river@male_b@idle_a",
            anim = "idle_b",
            name = "Cheeks",
        },
        b_c = {
            animDict = "amb_misc@world_human_wash_kneel_river@male_b@idle_a",
            anim = "idle_c",
            name = "Face",
        },
        b_d = {
            animDict = "amb_misc@world_human_wash_kneel_river@male_b@idle_b",
            anim = "idle_d",
            name = "Right Ear",
        },
        b_e = {
            animDict = "amb_misc@world_human_wash_kneel_river@male_b@idle_b",
            anim = "idle_e",
            name = "Hands",
        },
        b_f = {
            animDict = "amb_misc@world_human_wash_kneel_river@male_b@idle_b",
            anim = "idle_f",
            name = "Eyes",
        },
        b_g = {
            animDict = "amb_misc@world_human_wash_kneel_river@male_b@idle_c",
            anim = "idle_g",
            name = "Fingernails",
        },
        b_h = {
            animDict = "amb_misc@world_human_wash_kneel_river@male_b@idle_c",
            anim = "idle_h",
            name = "Neck",
        },
        b_i = {
            animDict = "amb_misc@world_human_wash_kneel_river@male_b@idle_c",
            anim = "idle_i",
            name = "Rinse Face",
        },
        b_j = {
            animDict = "amb_misc@world_human_wash_kneel_river@male_b@idle_d",
            anim = "idle_j",
            name = "Rinse Mouth",
        },
        b_k = {
            animDict = "amb_misc@world_human_wash_kneel_river@male_b@idle_d",
            anim = "idle_k",
            name = "Drink and Spit",
            onTrigger = function(info)
                Citizen.Wait(2500)
                if IsEntityInWater(info.ped) then da.Fn.Drink(); end
                return info
            end,
        },
        b_l = {
            animDict = "amb_misc@world_human_wash_kneel_river@male_b@idle_d",
            anim = "idle_l",
            name = "Armpits",
        },
    },
}

AnimLib.world_human_wash_kneel_river_femaleb = {
    name = "Wash in River Engrossed",
    tags = { squat=1, },
    key = "e",
    enter = {
        animDict = "amb_misc@world_human_wash_kneel_river@female_b@stand_enter",
        anim = "enter_back_rf",
        blendInSpeed = 1.0,
    },
    exit = {
        animDict = "amb_misc@world_human_wash_kneel_river@female_b@walk_exit",
        anim = "exit_back",
        duration = 500,
    },
    idles = {
        idle_b = {
            animDict = "amb_misc@world_human_wash_kneel_river@female_b@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
            transitions = {
                b_a = "t",
                b_b = "r",
                b_c = "s",
                b_d = "d",
                b_e = "h",
                b_f = "n",
                b_g = "a",
                -- b_h = "e",
                b_i = "f",
                b_j = "q",
                b_k = "e",
                b_l = "w",
            },
        },
    },
    animations = {
        b_a = {
            animDict = "amb_misc@world_human_wash_kneel_river@female_b@idle_a",
            anim = "idle_a",
            name = "Brush Teeth",
        },
        b_b = {
            animDict = "amb_misc@world_human_wash_kneel_river@female_b@idle_a",
            anim = "idle_b",
            name = "Rinse Mouth",
        },
        b_c = {
            animDict = "amb_misc@world_human_wash_kneel_river@female_b@idle_a",
            anim = "idle_c",
            name = "Splash Face",
        },
        b_d = {
            animDict = "amb_misc@world_human_wash_kneel_river@female_b@idle_b",
            anim = "idle_d",
            name = "Drink Water",
            onTrigger = function(info)
                Citizen.Wait(8000)
                if IsEntityInWater(info.ped) then da.Fn.Drink(); end
                return info
            end,
        },
        b_e = {
            animDict = "amb_misc@world_human_wash_kneel_river@female_b@idle_b",
            anim = "idle_e",
            name = "Cheeks and Collarbone",
        },
        b_f = {
            animDict = "amb_misc@world_human_wash_kneel_river@female_b@idle_b",
            anim = "idle_f",
            name = "Upper Arms",
        },
        b_g = {
            animDict = "amb_misc@world_human_wash_kneel_river@female_b@idle_c",
            anim = "idle_g",
            name = "Face and Neck",
        },
        b_h = {
            animDict = "amb_misc@world_human_wash_kneel_river@female_b@idle_c",
            anim = "idle_h",
            name = "Arms, Face and Neck",
        },
        b_i = {
            animDict = "amb_misc@world_human_wash_kneel_river@female_b@idle_c",
            anim = "idle_i",
            name = "Face and Neck",
        },
        b_j = {
            animDict = "amb_misc@world_human_wash_kneel_river@female_b@idle_d",
            anim = "idle_j",
            name = "Face and Arms",
        },
        b_k = {
            animDict = "amb_misc@world_human_wash_kneel_river@female_b@idle_d",
            anim = "idle_k",
            name = "Face, Neck and Ears",
        },
        b_l = {
            animDict = "amb_misc@world_human_wash_kneel_river@female_b@idle_d",
            anim = "idle_l",
            name = "Neck Thorough",
        },
        -- trans_b_a = {
        --     animDict = "amb_misc@world_human_wash_kneel_river@female_b@trans",
        --     anim = "b_trans_a",
        --     name = "Transition to a"
        -- },
    },
}

AnimLib.throw_snowball = {
    name = "Snowball",
    tags = { squat=1, },
    key = "s",
    triggerCondition = function() return Conditions.Check({ inSnow = true, inWater = false, }) end,
    enter = {
        animDict = "script_common@shared_scenarios@kneel@rummage@male_a@stand_enter",
        anim = "enter_back_lf",
        duration = 2300,
        onStart = function(info)
            info.prop.snowball = Prop:new()
            return info
        end,
        next = "kneel_to_stand",
    },
    exit = {
        animDict = "amb_misc@world_human_eat_apple@male_a@exit",
        anim = "exit",
        flag = AnimConfig.Flag.Move,
        onTrigger = function(info)
            Citizen.Wait(650)
            Prop.Detach(info.prop.snowball, { forceWait = 5000, })
            info.prop.snowball = nil
            return info
        end,
    },
    idles = {
        idle_a = {
            animDict = "amb_misc@world_human_eat_apple@male_a@base",
            anim = "base",
            flag = AnimConfig.Flag.MoveLoop,
            transitions = {
                exit_throw = "t",
            },
        },
    },
    animations = {
        kneel_to_stand = {
            animDict = "ai_react@breakouts@player@kneel_r_down@slow",
            anim = "breakout_slow_front",
            animDuration = 1000,
            blendInSpeed = 1.0,
            duration = 200,
            next = "scoop_snow"
        },
        scoop_snow = {
            animDict = "amb_camp@world_camp_jack_throws_rocks_ledge@idle_a",
            anim = "idle_c",
            blendInSpeed = 1.0,
            duration = 400,
            nextBlendInSpeed = 0.5,
            flag = AnimConfig.Flag.Move,
            onTrigger = function(info)
                Citizen.Wait(200)
                info.prop.snowball:attach(info.ped, Propset.snowball.Throw)
                SetEntityLodDist(info.prop.snowball.entity, 30)
                return info
            end,
        },
        exit_throw = {
            animDict = "amb_camp@world_camp_jack_throws_rocks_ledge@idle_a",
            anim = "idle_c",
            flag = AnimConfig.Flag.Move,
            name = "Throw Snowball",
            blendInSpeed = 0.5,
            duration = 3200,
            onTrigger = function(info)
                Citizen.Wait(500)
                info.prop.snowball:attach(info.ped, Propset.snowball.Throw)
                Citizen.Wait(2300)
                Prop.Detach(info.prop.snowball, { forceWait = 10000, velocity = 3.7, angle = -2, distance = 25 })
                info.prop.snowball = nil
                return info
            end,
        }
    },
}

AnimLib.throw_rock = {
    name = "Rock",
    tags = { squat=1, },
    key = "r",
    enter = {
        animDict = "script_common@shared_scenarios@kneel@rummage@male_a@stand_enter",
        anim = "enter_back_lf",
        duration = 2300,
        onStart = function(info)
            info.prop.rock = Prop:new()
            return info
        end,
        next = "kneel_to_stand",
    },
    exit = {
        animDict = "amb_misc@world_human_eat_apple@male_a@exit",
        anim = "exit",
        flag = AnimConfig.Flag.Move,
        onTrigger = function(info)
            Citizen.Wait(650)
            Prop.Detach(info.prop.rock, { forceWait = 5000, })
            info.prop.rock = nil
            return info
        end,
    },
    idles = {
        idle_a = {
            animDict = "amb_misc@world_human_eat_apple@male_a@base",
            anim = "base",
            flag = AnimConfig.Flag.MoveLoop,
            transitions = {
                exit_throw = "t",
                exit_skip = "s",
            },
        },
    },
    animations = {
        kneel_to_stand = {
            animDict = "ai_react@breakouts@player@kneel_r_down@slow",
            anim = "breakout_slow_front",
            animDuration = 1000,
            blendInSpeed = 1.0,
            duration = 200,
            next = "pickup_rock"
        },
        pickup_rock = {
            animDict = "amb_camp@world_camp_jack_throws_rocks_ledge@idle_a",
            anim = "idle_c",
            blendInSpeed = 1.0,
            duration = 400,
            nextBlendInSpeed = 0.5,
            flag = AnimConfig.Flag.Move,
            onTrigger = function(info)
                Citizen.Wait(200)
                info.prop.rock:attach(info.ped, Propset.rock.Throw)
                SetEntityLodDist(info.prop.rock.entity, 30)
                return info
            end,
        },
        exit_skip = {
            animDict = "amb_misc@world_human_skip_rocks@male_a@wip_base",
            anim = "wip_base",
            flag = AnimConfig.Flag.Move,
            name = "Skip Rock",
            blendInSpeed = 0.5,
            duration = 2200,
            onTrigger = function(info)
                Citizen.Wait(1600)
                local angle = math.min(math.random(-30,5), math.random(-20,5))
                Prop.Detach(info.prop.rock, { forceWait = 10000, velocity = 1.7, angle = angle, distance = 25 })
                info.prop.rock = nil
                return info
            end,
        },
        exit_throw = {
            animDict = "amb_camp@world_camp_jack_throws_rocks_ledge@idle_a",
            anim = "idle_c",
            flag = AnimConfig.Flag.Move,
            name = "Throw Rock",
            blendInSpeed = 0.5,
            duration = 3200,
            onTrigger = function(info)
                Citizen.Wait(500)
                info.prop.rock:attach(info.ped, Propset.rock.Throw)
                Citizen.Wait(2300)
                Prop.Detach(info.prop.rock, { forceWait = 10000, velocity = 10.0, angle = -2, distance = 25 })
                info.prop.rock = nil
                return info
            end,
        }
    },
}
