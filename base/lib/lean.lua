AnimLib.lean_railing_male_a = {
    name = "Two Hands On Railing",
    tags = { lean_front=1, },
    key = "r",
    enter = {
        animDict = "amb_rest_lean@world_human_lean@railing@male_a@stand_enter",
        anim = "enter_back_rf",
        blendInSpeed = 1.0,
    },
    exit = {
        animDict = "amb_rest_lean@world_human_lean@railing@male_a@stand_exit",
        anim = "exit_front",
        duration = 2300,
    },
    idles = {
        idle_a = {
            animDict = "amb_rest_lean@world_human_lean@railing@male_a@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
            transitions = {
                a_a = "a",
                a_b = "d",
                a_c = "q",
                a_d = "w",
                -- a_e = "q",
                a_f = "t",
                -- a_g = "e",
                -- a_h = "r",
                a_i = "z",
                a_j = "x",
                -- a_k = "u",
                -- a_l = "i",
                -- a_m = "a",
                trans_a_b = "e",
            },
        },
    },
    animations = {
        a_a = {
            animDict = "amb_rest_lean@world_human_lean@railing@male_a@idle_a",
            anim = "idle_a",
            name = "Look Left",
        },
        a_b = {
            animDict = "amb_rest_lean@world_human_lean@railing@male_a@idle_a",
            anim = "idle_b",
            name = "Look Right",
        },
        a_c = {
            animDict = "amb_rest_lean@world_human_lean@railing@male_a@idle_a",
            anim = "idle_c",
            name = "Look Up Left",
        },
        a_d = {
            animDict = "amb_rest_lean@world_human_lean@railing@male_a@idle_b",
            anim = "idle_d",
            name = "Look Right",
        },
        a_e = {
            animDict = "amb_rest_lean@world_human_lean@railing@male_a@idle_b",
            anim = "idle_e",
        },
        a_f = {
            animDict = "amb_rest_lean@world_human_lean@railing@male_a@idle_b",
            anim = "idle_f",
            name = "React Right",
        },
        a_g = {
            animDict = "amb_rest_lean@world_human_lean@railing@male_a@idle_c",
            anim = "idle_g",
        },
        a_h = {
            animDict = "amb_rest_lean@world_human_lean@railing@male_a@idle_c",
            anim = "idle_h",
        },
        a_i = {
            animDict = "amb_rest_lean@world_human_lean@railing@male_a@idle_c",
            anim = "idle_i",
            name = "Scratch Neck",
        },
        a_j = {
            animDict = "amb_rest_lean@world_human_lean@railing@male_a@idle_d",
            anim = "idle_j",
            name = "Scratch Chin",
        },
        a_k = {
            animDict = "amb_rest_lean@world_human_lean@railing@male_a@idle_d",
            anim = "idle_k",
        },
        a_l = {
            animDict = "amb_rest_lean@world_human_lean@railing@male_a@idle_d",
            anim = "idle_l",
        },
        a_m = {
            animDict = "amb_rest_lean@world_human_lean@railing@male_a@idle_e",
            anim = "idle_m",
        },
        trans_a_b = {
            animDict = "amb_rest_lean@world_human_lean@railing@male_a@trans",
            anim = "a_trans_b",
            next = "idle_a",
            animLibName = "lean_railing_male_b",
            name = "Transition to Elbows",
        },
    }
}

AnimLib.lean_barrel_newspaper = {
    name = "Lean Newspaper",
    tags = { lean_front=1, },
    key = "q",
    enter = {
        animDict = "amb_rest_lean@world_human_lean@barrel@read_newspaper@male_a@stand_enter_withprop",
        anim = "enter_front_lf",
        blendInSpeed = 1.0,
        duration = 6500,
        prop = { newspaper = { anim = "enter_front_lf_newspaper", }, },
        onStart = function(info)
            local propset = IsPedMale(info.ped) and Propset.Newspaper or Propset.Newspaper.FemaleGrab
            info.prop.newspaper = Prop:new(propset)
            info.prop.newspaper:create()
            return info
        end,
        onTrigger = function(info)
            Citizen.Wait(1400)
            info.prop.newspaper:attach(info.ped)
            Citizen.Wait(600)
            if not IsPedMale(info.ped) then
                info.prop.newspaper:attach(info.ped, Propset.Newspaper.Female)
            end
            return info
        end,
    },
    exit = {
        animDict = "amb_rest_lean@world_human_lean@barrel@read_newspaper@male_a@stand_exit_withprop",
        anim = "exit_front",
        duration = 2500,
        prop = { newspaper = { anim = "exit_front_newspaper", }, },
        onTrigger = function(info)
            Citizen.Wait(1500)
            if not IsPedMale(info.ped) then
                info.prop.newspaper:attach(info.ped, Propset.Newspaper.FemaleGrab)
            end
            Citizen.Wait(1300)
            Prop.Detach(info.prop.newspaper)
            info.prop.newspaper = nil
            return info
        end
    },
    idles = {
        idle_a = {
            animDict = "amb_rest_lean@world_human_lean@barrel@read_newspaper@male_a@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
            prop = { newspaper = { anim = "base_newspaper", loop = true, }, },
            transitions = {
                a_a = "s",
                a_b = "w",
                a_c = "e",
                a_d = "q",
                a_e = "a",
                a_f = "d",
                a_g = "1",
                a_h = "x",
            },
        },
    },
    animations = {
        a_a = {
            animDict = "amb_rest_lean@world_human_lean@barrel@read_newspaper@male_a@idle_a",
            anim = "idle_a",
            duration = 8000,
            prop = { newspaper = { anim = "idle_a_newspaper", }, },
            name = "Point Read",
        },
        a_b = {
            animDict = "amb_rest_lean@world_human_lean@barrel@read_newspaper@male_a@idle_a",
            anim = "idle_b",
            duration = 5000,
            prop = { newspaper = { anim = "idle_b_newspaper", }, },
            name = "Scratch Forehead",
        },
        a_c = {
            animDict = "amb_rest_lean@world_human_lean@barrel@read_newspaper@male_a@idle_a",
            anim = "idle_c",
            duration = 5000,
            prop = { newspaper = { anim = "idle_c_newspaper", }, },
            name = "Shake Head",
        },
        a_d = {
            animDict = "amb_rest_lean@world_human_lean@barrel@read_newspaper@male_a@idle_b",
            anim = "idle_d",
            duration = 8000,
            prop = { newspaper = { anim = "idle_d_newspaper", }, },
            name = "Nod Head",
        },
        a_e = {
            animDict = "amb_rest_lean@world_human_lean@barrel@read_newspaper@male_a@idle_b",
            anim = "idle_e",
            duration = 6500,
            prop = { newspaper = { anim = "idle_e_newspaper", }, },
            name = "Scratch Face"
        },
        a_f = {
            animDict = "amb_rest_lean@world_human_lean@barrel@read_newspaper@male_a@idle_b",
            anim = "idle_f",
            duration = 7000,
            prop = { newspaper = { anim = "idle_f_newspaper", }, },
            name = "Quiet Cough"
        },
        a_g = {
            animDict = "amb_rest_lean@world_human_lean@barrel@read_newspaper@male_a@idle_c",
            anim = "idle_g",
            duration = 11000,
            prop = { newspaper = { anim = "idle_g_newspaper", }, },
            name = "Re-adjust Lean"
        },
        a_h = {
            animDict = "amb_rest_lean@world_human_lean@barrel@read_newspaper@male_a@idle_c",
            anim = "idle_h",
            duration = 8000,
            prop = { newspaper = { anim = "idle_h_newspaper", }, },
            name = "Scratch, Point"
        },
    },
}

AnimLib.lean_railing_male_b = {
    name = "Elbows On Railing",
    tags = { lean_front=1, },
    key = "e",
    enter = {
        animDict = "amb_rest_lean@world_human_lean@railing@male_b@stand_enter",
        anim = "enter_back_rf",
        blendInSpeed = 1.0,
    },
    exit = {
        animDict = "amb_rest_lean@world_human_lean@railing@male_b@stand_exit",
        anim = "exit_front",
        duration = 4200,
    },
    idles = {
        idle_a = {
            animDict = "amb_rest_lean@world_human_lean@railing@male_b@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
            transitions = {
                a_a = "1",
                a_b = "2",
                a_c = "3",
                a_d = "4",
                a_e = "q",
                a_f = "w",
                a_g = "e",
                a_h = "r",
                a_i = "t",
                -- a_j = "y",
                a_k = "u",
                trans_b_a = "h",
            },
        },
    },
    animations = {
        a_a = {
            animDict = "amb_rest_lean@world_human_lean@railing@male_b@idle_a",
            anim = "idle_a",
            name = "Look Left",
        },
        a_b = {
            animDict = "amb_rest_lean@world_human_lean@railing@male_b@idle_a",
            anim = "idle_b",
            name = "Look Right",
        },
        a_c = {
            animDict = "amb_rest_lean@world_human_lean@railing@male_b@idle_a",
            anim = "idle_c",
            name = "Look Back Left",
        },
        a_d = {
            animDict = "amb_rest_lean@world_human_lean@railing@male_b@idle_b",
            anim = "idle_d",
            name = "Look Around",
        },
        a_e = {
            animDict = "amb_rest_lean@world_human_lean@railing@male_b@idle_b",
            anim = "idle_e",
            name = "React Right",
        },
        a_f = {
            animDict = "amb_rest_lean@world_human_lean@railing@male_b@idle_b",
            anim = "idle_f",
            name = "Adjust Feet",
        },
        a_g = {
            animDict = "amb_rest_lean@world_human_lean@railing@male_b@idle_c",
            anim = "idle_g",
            name = "Wipe Face",
        },
        a_h = {
            animDict = "amb_rest_lean@world_human_lean@railing@male_b@idle_c",
            anim = "idle_h",
            name = "Scratch Back",
        },
        a_i = {
            animDict = "amb_rest_lean@world_human_lean@railing@male_b@idle_c",
            anim = "idle_i",
            name = "Look Down, Left",
        },
        a_j = {
            animDict = "amb_rest_lean@world_human_lean@railing@male_b@idle_d",
            anim = "idle_j",
        },
        a_k = {
            animDict = "amb_rest_lean@world_human_lean@railing@male_b@idle_d",
            anim = "idle_k",
            name = "Stretch Arms",
        },
        trans_b_a = {
            animDict = "amb_rest_lean@world_human_lean@railing@male_a@trans",
            anim = "b_trans_a",
            next = "idle_a",
            animLibName = "lean_railing_male_a",
            name = "Transition to Hands",
        },
    }
}

AnimLib.lean_railing_male_c = {
    name = "Left Elbow Railing",
    tags = { lean_front=1, },
    key = "w",
    enter = {
        animDict = "amb_rest_lean@world_human_lean@railing@male_c@stand_enter",
        anim = "enter_back_rf",
        blendInSpeed = 1.0,
    },
    exit = {
        animDict = "amb_rest_lean@world_human_lean@railing@male_c@stand_exit",
        anim = "exit_front",
        duration = 1800,
    },
    idles = {
        idle_a = {
            animDict = "amb_rest_lean@world_human_lean@railing@male_c@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
            transitions = {
                a_a = "s",
                -- a_b = "2",
                a_c = "x",
                a_d = "f",
                a_e = "w",
                a_f = "z",
                a_g = "q",
                a_h = "a",
            },
        },
    },
    animations = {
        a_a = {
            animDict = "amb_rest_lean@world_human_lean@railing@male_c@idle_a",
            anim = "idle_a",
            name = "Cough, Scratch Cheek",
        },
        a_b = {
            animDict = "amb_rest_lean@world_human_lean@railing@male_c@idle_a",
            anim = "idle_b",
        },
        a_c = {
            animDict = "amb_rest_lean@world_human_lean@railing@male_c@idle_a",
            anim = "idle_c",
            name = "Cough",
        },
        a_d = {
            animDict = "amb_rest_lean@world_human_lean@railing@male_c@idle_b",
            anim = "idle_d",
            name = "Lean Forward",
        },
        a_e = {
            animDict = "amb_rest_lean@world_human_lean@railing@male_c@idle_b",
            anim = "idle_e",
            name = "Chin",
        },
        a_f = {
            animDict = "amb_rest_lean@world_human_lean@railing@male_c@idle_b",
            anim = "idle_f",
            name = "Look Left",
        },
        a_g = {
            animDict = "amb_rest_lean@world_human_lean@railing@male_c@idle_c",
            anim = "idle_g",
            name = "Nod Left"
        },
        a_h = {
            animDict = "amb_rest_lean@world_human_lean@railing@male_c@idle_c",
            anim = "idle_h",
            name = "Stretch Arm",
        },
    },
}

AnimLib.lean_railing_male_d = {
    name = "Right Elbow Railing",
    tags = { lean_front=1, },
    key = "t",
    enter = {
        animDict = "amb_rest_lean@world_human_lean@railing@male_d@stand_enter",
        anim = "enter_back_rf",
        blendInSpeed = 1.0,
    },
    exit = {
        animDict = "amb_rest_lean@world_human_lean@railing@male_d@stand_exit",
        anim = "exit_front",
        duration = 1700,
    },
    idles = {
        idle_a = {
            animDict = "amb_rest_lean@world_human_lean@railing@male_d@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
            transitions = {
                a_a = "t",
                a_b = "d",
                a_c = "b",
                a_d = "a",
                a_e = "q",
                a_f = "r",
                a_g = "s",
            },
        },
    },
    animations = {
        a_a = {
            animDict = "amb_rest_lean@world_human_lean@railing@male_d@idle_a",
            anim = "idle_a",
            name = "Clear Throat",
        },
        a_b = {
            animDict = "amb_rest_lean@world_human_lean@railing@male_d@idle_a",
            anim = "idle_b",
            name = "Glance Right",
        },
        a_c = {
            animDict = "amb_rest_lean@world_human_lean@railing@male_d@idle_a",
            anim = "idle_c",
            name = "Stretch Back",
        },
        a_d = {
            animDict = "amb_rest_lean@world_human_lean@railing@male_d@idle_b",
            anim = "idle_d",
            name = "Stretch Arm",
        },
        a_e = {
            animDict = "amb_rest_lean@world_human_lean@railing@male_d@idle_b",
            anim = "idle_e",
            name = "Scratch Neck",
        },
        a_f = {
            animDict = "amb_rest_lean@world_human_lean@railing@male_d@idle_b",
            anim = "idle_f",
            name = "Look Around",
        },
        a_g = {
            animDict = "amb_rest_lean@world_human_lean@railing@male_d@idle_c",
            anim = "idle_g",
            name = "Spit",
        },
    },
}

AnimLib.lean_railing_female_a = {
    name = "Elbows On Railing (F)",
    tags = { lean_front=1, },
    key = "s",
    enter = {
        animDict = "amb_rest_lean@world_human_lean@railing@female_a@stand_enter",
        anim = "enter_back_lf",
        blendInSpeed = 1.0,
    },
    exit = {
        animDict = "amb_rest_lean@world_human_lean@railing@female_a@stand_exit",
        anim = "exit_front",
        duration = 1500,
    },
    idles = {
        idle_a = {
            animDict = "amb_rest_lean@world_human_lean@railing@female_a@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
            transitions = {
                -- a_a = "1",
                a_b = "t",
                a_c = "a",
                a_d = "d",
                a_e = "s",
                a_f = "r",
                a_g = "q",
                a_h = "e",
                a_i = "z",
                a_j = "w",
                trans_a_b = "f",
            },
        },
    },
    animations = {
        -- a_a = {
        --     animDict = "amb_rest_lean@world_human_lean@railing@female_a@idle_a",
        --     anim = "idle_a",
        -- },
        a_b = {
            animDict = "amb_rest_lean@world_human_lean@railing@female_a@idle_a",
            anim = "idle_b",
            name = "Subtle Adjust",
        },
        a_c = {
            animDict = "amb_rest_lean@world_human_lean@railing@female_a@idle_a",
            anim = "idle_c",
            name = "Look Left",
        },
        a_d = {
            animDict = "amb_rest_lean@world_human_lean@railing@female_a@idle_b",
            anim = "idle_d",
            name = "Look Right",
        },
        a_e = {
            animDict = "amb_rest_lean@world_human_lean@railing@female_a@idle_b",
            anim = "idle_e",
            name = "Scratch Cheek",
        },
        a_f = {
            animDict = "amb_rest_lean@world_human_lean@railing@female_a@idle_b",
            anim = "idle_f",
            name = "Hands On Railing",
        },
        a_g = {
            animDict = "amb_rest_lean@world_human_lean@railing@female_a@idle_c",
            anim = "idle_g",
            name = "Look Around",
        },
        a_h = {
            animDict = "amb_rest_lean@world_human_lean@railing@female_a@idle_c",
            anim = "idle_h",
            name = "Rub Eye",
        },
        a_i = {
            animDict = "amb_rest_lean@world_human_lean@railing@female_a@idle_c",
            anim = "idle_i",
            name = "Cough",
        },
        a_j = {
            animDict = "amb_rest_lean@world_human_lean@railing@female_a@idle_d",
            anim = "idle_j",
            name = "Adjust",
        },
        trans_a_b = {
            animDict = "amb_rest_lean@world_human_lean@railing@female_a@trans",
            anim = "a_trans_b",
            next = "idle_a",
            animLibName = "lean_railing_female_b",
            name = "Transition Right Elbow",
        },
    }
}

AnimLib.lean_railing_female_b = {
    name = "Right Elbow Railing (F)",
    tags = { lean_front=1, },
    key = "a",
    enter = {
        animDict = "amb_rest_lean@world_human_lean@railing@female_b@stand_enter",
        anim = "enter_back",
        blendInSpeed = 1.0,
    },
    exit = {
        animDict = "amb_rest_lean@world_human_lean@railing@female_b@stand_exit",
        anim = "exit_left",
        duration = 2700,
    },
    idles = {
        idle_a = {
            animDict = "amb_rest_lean@world_human_lean@railing@female_b@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
            transitions = {
                a_a = "w",
                a_b = "a",
                a_c = "q",
                a_d = "g",
                a_e = "b",
                a_f = "r",
                a_g = "s",
                a_h = "d",
                a_i = "h",
                a_j = "z",
                a_k = "x",
                trans_b_a = "e",
            },
        },
    },
    animations = {
        a_a = {
            animDict = "amb_rest_lean@world_human_lean@railing@female_b@idle_a",
            anim = "idle_a",
            name = "Look Around",
        },
        a_b = {
            animDict = "amb_rest_lean@world_human_lean@railing@female_b@idle_a",
            anim = "idle_b",
            name = "Look Left",
        },
        a_c = {
            animDict = "amb_rest_lean@world_human_lean@railing@female_b@idle_a",
            anim = "idle_c",
            name = "Glance Left",
        },
        a_d = {
            animDict = "amb_rest_lean@world_human_lean@railing@female_b@idle_b",
            anim = "idle_d",
            name = "Glance Down Right",
        },
        a_e = {
            animDict = "amb_rest_lean@world_human_lean@railing@female_b@idle_b",
            anim = "idle_e",
            name = "Glance Back Left",
        },
        a_f = {
            animDict = "amb_rest_lean@world_human_lean@railing@female_b@idle_b",
            anim = "idle_f",
            name = "Glance Back Right",
        },
        a_g = {
            animDict = "amb_rest_lean@world_human_lean@railing@female_b@idle_c",
            anim = "idle_g",
            name = "Lean Back",
        },
        a_h = {
            animDict = "amb_rest_lean@world_human_lean@railing@female_b@idle_c",
            anim = "idle_h",
            name = "Look Down Right",
        },
        a_i = {
            animDict = "amb_rest_lean@world_human_lean@railing@female_b@idle_c",
            anim = "idle_i",
            name = "Hand To Brow",
        },
        a_j = {
            animDict = "amb_rest_lean@world_human_lean@railing@female_b@idle_d",
            anim = "idle_j",
            name = "Cough",
        },
        a_k = {
            animDict = "amb_rest_lean@world_human_lean@railing@female_b@idle_d",
            anim = "idle_k",
            name = "Stretch Shoulders",
        },
        trans_b_a = {
            animDict = "amb_rest_lean@world_human_lean@railing@female_b@trans",
            anim = "b_trans_a",
            next = "idle_a",
            animLibName = "lean_railing_female_a",
            name = "Transition To Elbows",
        },
    }
}

AnimLib.lean_wall_male_a = {
    name = "Cross Ankles",
    tags = { lean_back=1, },
    key = "a",
    enter = {
        animDict = "amb_rest_lean@world_human_lean@wall@male_a@stand_enter",
        anim = "enter_back_rf",
        blendInSpeed = 1.0,
    },
    exit = {
        animDict = "amb_rest_lean@world_human_lean@wall@male_a@stand_exit",
        anim = "exit_front",
        duration = 3000,
    },
    idles = {
        idle_a = {
            animDict = "amb_rest_lean@world_human_lean@wall@male_a@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
            transitions = {
                -- a_a = "1",
                a_b = "r",
                a_c = "q",
                -- a_d = "4",
                a_e = "w",
                a_f = "s",
                a_g = "e",
                a_h = "x",
                -- trans_a_b = "0",
                trans_a_c = "b",
                trans_a_d = "d",
            },
        },
    },
    animations = {
        -- a_a = {
        --     animDict = "amb_rest_lean@world_human_lean@wall@male_a@idle_a",
        --     anim = "idle_a",
        --     name = "Slight Look Right",
        -- },
        a_b = {
            animDict = "amb_rest_lean@world_human_lean@wall@male_a@idle_a",
            anim = "idle_b",
            name = "Look Right",
        },
        a_c = {
            animDict = "amb_rest_lean@world_human_lean@wall@male_a@idle_a",
            anim = "idle_c",
            name = "Look Left",
        },
        -- a_d = {
        --     animDict = "amb_rest_lean@world_human_lean@wall@male_a@idle_b",
        --     anim = "idle_d",
        --     name = "Do Nothing",
        -- },
        a_e = {
            animDict = "amb_rest_lean@world_human_lean@wall@male_a@idle_b",
            anim = "idle_e",
            name = "Scratch Chin",
        },
        a_f = {
            animDict = "amb_rest_lean@world_human_lean@wall@male_a@idle_b",
            anim = "idle_f",
            name = "Scratch Neck",
        },
        a_g = {
            animDict = "amb_rest_lean@world_human_lean@wall@male_a@idle_c",
            anim = "idle_g",
            name = "Look Right, Scratch Jaw",
        },
        a_h = {
            animDict = "amb_rest_lean@world_human_lean@wall@male_a@idle_c",
            anim = "idle_h",
            name = "Crack Knuckles",
        },
        -- trans_a_b = {
        --     animDict = "amb_rest_lean@world_human_lean@wall@male_a@trans",
        --     anim = "a_trans_b",
        --     next = "idle_a",
        --     animLibName = "lean_wall_male_b",
        --     name = "Transition to Face Right",
        -- },
        trans_a_c = {
            animDict = "amb_rest_lean@world_human_lean@wall@male_a@trans",
            anim = "a_trans_c",
            next = "idle_a",
            animLibName = "lean_wall_male_c",
            name = "Transition Hands Belt",
        },
        trans_a_d = {
            animDict = "amb_rest_lean@world_human_lean@wall@male_a@trans",
            anim = "a_trans_d",
            next = "idle_a",
            animLibName = "lean_wall_male_d",
            name = "Transition to Beltloop",
        },
    }
}

AnimLib.lean_wall_male_b = {
    name = "Slouch",
    tags = { lean_right=1, },
    key = "s",
    enter = {
        animDict = "amb_rest_lean@world_human_lean@wall@male_b@stand_enter",
        anim = "enter_frontright",
        blendInSpeed = 1.0,
    },
    exit = {
        animDict = "amb_rest_lean@world_human_lean@wall@male_b@walk_exit",
        anim = "exit_frontleft",
        duration = 200,
    },
    idles = {
        idle_a = {
            animDict = "amb_rest_lean@world_human_lean@wall@male_b@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
            transitions = {
                a_a = "x",
                a_b = "w",
                a_c = "a",
                a_d = "d",
                a_e = "s",
                a_f = "b",
            },
        },
    },
    animations = {
        a_a = {
            animDict = "amb_rest_lean@world_human_lean@wall@male_b@idle_a",
            anim = "idle_a",
            name = "Look Around, Think",
        },
        a_b = {
            animDict = "amb_rest_lean@world_human_lean@wall@male_b@idle_a",
            anim = "idle_b",
            name = "Look Around",
        },
        a_c = {
            animDict = "amb_rest_lean@world_human_lean@wall@male_b@idle_a",
            anim = "idle_c",
            name = "Look Left",
        },
        a_d = {
            animDict = "amb_rest_lean@world_human_lean@wall@male_b@idle_b",
            anim = "idle_d",
            name = "Look Right, Scratch Jaw",
        },
        a_e = {
            animDict = "amb_rest_lean@world_human_lean@wall@male_b@idle_b",
            anim = "idle_e",
            name = "Stretch, Touch Chin",
        },
        a_f = {
            animDict = "amb_rest_lean@world_human_lean@wall@male_b@idle_b",
            anim = "idle_f",
            name = "Scratch Back",
        },
    },
}

AnimLib.lean_wall_male_c = {
    name = "Hold Belt",
    tags = { lean_back=1, },
    key = "b",
    enter = {
        animDict = "amb_rest_lean@world_human_lean@wall@male_c@stand_enter",
        anim = "enter_back_lf",
        blendInSpeed = 1.0,
    },
    exit = {
        animDict = "amb_rest_lean@world_human_lean@wall@male_c@stand_exit",
        anim = "exit_front",
        duration = 800,
    },
    idles = {
        idle_a = {
            animDict = "amb_rest_lean@world_human_lean@wall@male_c@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
            transitions = {
                a_a = "w",
                a_b = "r",
                -- a_c = "3",
                a_d = "q",
                a_e = "s",
                a_f = "e",
                a_g = "r",
                -- a_h = "r",
                trans_c_a = "v",
                -- trans_c_b = "8",
                trans_c_d = "b",
            },
        },
    },
    animations = {
        a_a = {
            animDict = "amb_rest_lean@world_human_lean@wall@male_c@idle_a",
            anim = "idle_a",
            name = "Look Up",
        },
        a_b = {
            animDict = "amb_rest_lean@world_human_lean@wall@male_c@idle_a",
            anim = "idle_b",
            name = "Look Up And Right",
        },
        -- a_c = {
        --     animDict = "amb_rest_lean@world_human_lean@wall@male_c@idle_a",
        --     anim = "idle_c",
        -- },
        a_d = {
            animDict = "amb_rest_lean@world_human_lean@wall@male_c@idle_b",
            anim = "idle_d",
            name = "Scratch Chin",
        },
        a_e = {
            animDict = "amb_rest_lean@world_human_lean@wall@male_c@idle_b",
            anim = "idle_e",
            name = "Spit",
        },
        a_f = {
            animDict = "amb_rest_lean@world_human_lean@wall@male_c@idle_b",
            anim = "idle_f",
            name = "Scratch Neck",
        },
        a_g = {
            animDict = "amb_rest_lean@world_human_lean@wall@male_c@idle_c",
            anim = "idle_g",
            name = "Look Right, Scratch Jaw",
        },
        -- a_h = {
        --     animDict = "amb_rest_lean@world_human_lean@wall@male_c@idle_c",
        --     anim = "idle_h",
        --     name = "spit",
        -- },
        trans_c_a = {
            animDict = "amb_rest_lean@world_human_lean@wall@male_c@trans",
            anim = "c_trans_a",
            next = "idle_a",
            animLibName = "lean_wall_male_a",
            name = "Transition Cross Ankles",
        },
        -- trans_c_b = {
        --     animDict = "amb_rest_lean@world_human_lean@wall@male_c@trans",
        --     anim = "c_trans_b",
        --     next = "idle_a",
        --     animLibName = "lean_wall_male_b",
        --     name = "Transition to ",
        -- },
        trans_c_d = {
            animDict = "amb_rest_lean@world_human_lean@wall@male_c@trans",
            anim = "c_trans_d",
            next = "idle_a",
            animLibName = "lean_wall_male_d",
            name = "Transition to Beltloop",
        },
    }
}

AnimLib.lean_wall_male_d = {
    name = "Left Hand Belt",
    tags = { lean_back=1, },
    key = "d",
    enter = {
        animDict = "amb_rest_lean@world_human_lean@wall@male_d@stand_enter",
        anim = "enter_back_lf",
        blendInSpeed = 1.0,
    },
    exit = {
        animDict = "amb_rest_lean@world_human_lean@wall@male_d@stand_exit",
        anim = "exit_front",
        duration = 300,
    },
    idles = {
        idle_a = {
            animDict = "amb_rest_lean@world_human_lean@wall@male_d@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
            transitions = {
                a_a = "r",
                a_b = "z",
                a_c = "a",
                -- a_d = "4",
                a_e = "x",
                a_f = "s",
                a_g = "e",
                a_h = "q",
                a_i = "w",
                trans_d_a = "v",
                -- trans_d_b = "8",
                trans_d_c = "b",
            },
        },
    },
    animations = {
        a_a = {
            animDict = "amb_rest_lean@world_human_lean@wall@male_d@idle_a",
            anim = "idle_a",
            name = "Glance Right",
            duration = 3000,
        },
        a_b = {
            animDict = "amb_rest_lean@world_human_lean@wall@male_d@idle_a",
            anim = "idle_b",
            name = "Look Around",
        },
        a_c = {
            animDict = "amb_rest_lean@world_human_lean@wall@male_d@idle_a",
            anim = "idle_c",
            name = "Look Around Slowly",
        },
        -- a_d = {
        --     animDict = "amb_rest_lean@world_human_lean@wall@male_d@idle_b",
        --     anim = "idle_d",
        -- },
        a_e = {
            animDict = "amb_rest_lean@world_human_lean@wall@male_d@idle_b",
            anim = "idle_e",
            name = "Scratch Neck",
        },
        a_f = {
            animDict = "amb_rest_lean@world_human_lean@wall@male_d@idle_b",
            anim = "idle_f",
            name = "Stretch Shoulders",
        },
        a_g = {
            animDict = "amb_rest_lean@world_human_lean@wall@male_d@idle_c",
            anim = "idle_g",
            name = "Cough",
        },
        a_h = {
            animDict = "amb_rest_lean@world_human_lean@wall@male_d@idle_c",
            anim = "idle_h",
            name = "Wipe Nose",
        },
        a_i = {
            animDict = "amb_rest_lean@world_human_lean@wall@male_d@idle_c",
            anim = "idle_i",
            name = "Glance Right",
        },
        trans_d_a = {
            animDict = "amb_rest_lean@world_human_lean@wall@male_d@trans",
            anim = "d_trans_a",
            next = "idle_a",
            animLibName = "lean_wall_male_a",
            name = "Transition Cross Ankles",
        },
        -- trans_d_b = {
        --     animDict = "amb_rest_lean@world_human_lean@wall@male_d@trans",
        --     anim = "d_trans_b",
        --     next = "idle_a",
        --     animLibName = "lean_wall_male_b",
        --     name = "Transition to ",
        -- },
        trans_d_c = {
            animDict = "amb_rest_lean@world_human_lean@wall@male_d@trans",
            anim = "d_trans_c",
            next = "idle_a",
            animLibName = "lean_wall_male_c",
            name = "Transition Hands Belt",
        },
    }
}

AnimLib.lean_wall_female_a = {
    name = "Hands Crossed Front (F)",
    tags = { lean_left=1, },
    key = "f",
    enter = {
        animDict = "amb_rest_lean@world_human_lean@wall@female_a@stand_enter",
        anim = "enter_front_lf",
        blendInSpeed = 1.0,
    },
    exit = {
        animDict = "amb_rest_lean@world_human_lean@wall@female_a@stand_exit",
        anim = "exit_front",
        duration = 2200,
    },
    idles = {
        idle_a = {
            animDict = "amb_rest_lean@world_human_lean@wall@female_a@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
            transitions = {
                a_a = "z",
                a_b = "s",
                a_c = "a",
                a_d = "w",
                a_e = "r",
                a_f = "f",
                a_g = "g",
                a_h = "d",
                trans_a_b = "r",
            },
        },
    },
    animations = {
        a_a = {
            animDict = "amb_rest_lean@world_human_lean@wall@female_a@idle_a",
            anim = "idle_a",
            name = "Cover Mouth",
        },
        a_b = {
            animDict = "amb_rest_lean@world_human_lean@wall@female_a@idle_a",
            anim = "idle_b",
            name = "Scratch Arm",
        },
        a_c = {
            animDict = "amb_rest_lean@world_human_lean@wall@female_a@idle_a",
            anim = "idle_c",
            name = "Adjust",
        },
        a_d = {
            animDict = "amb_rest_lean@world_human_lean@wall@female_a@idle_b",
            anim = "idle_d",
            name = "React Front",
        },
        a_e = {
            animDict = "amb_rest_lean@world_human_lean@wall@female_a@idle_b",
            anim = "idle_e",
            name = "Lean Forward",
        },
        a_f = {
            animDict = "amb_rest_lean@world_human_lean@wall@female_a@idle_b",
            anim = "idle_f",
            name = "Fidget Hand, Hat",
        },
        a_g = {
            animDict = "amb_rest_lean@world_human_lean@wall@female_a@idle_c",
            anim = "idle_g",
            duration = 1500,
            name = "Glance",
        },
        a_h = {
            animDict = "amb_rest_lean@world_human_lean@wall@female_a@idle_c",
            anim = "idle_h",
            name = "Look Right, Adjust",
        },
        trans_a_b = {
            animDict = "amb_rest_lean@world_human_lean@wall@female_a@trans",
            anim = "a_trans_b",
            next = "idle_a",
            animLibName = "lean_wall_female_b",
            name = "Transition to Face Right",
        },
    }
}

AnimLib.lean_wall_female_b = {
    name = "Right Shoulder",
    tags = { lean_back=1, },
    key = "z",
    enter = {
        animDict = "amb_rest_lean@world_human_lean@wall@female_b@stand_enter",
        anim = "enter_back_rf",
        blendInSpeed = 1.0,
    },
    exit = {
        animDict = "amb_rest_lean@world_human_lean@wall@female_b@stand_exit",
        anim = "exit_front",
        duration = 2400,
    },
    idles = {
        idle_a = {
            animDict = "amb_rest_lean@world_human_lean@wall@female_b@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
            transitions = {
                a_a = "a",
                -- a_b = "2",
                -- a_c = "3",
                -- a_d = "4",
                a_e = "d",
                a_f = "s",
                trans_b_a = "f",
            },
        },
    },
    animations = {
        a_a = {
            animDict = "amb_rest_lean@world_human_lean@wall@female_b@idle_a",
            anim = "idle_a",
            name = "Scratch Left Arm",
        },
        -- a_b = {
        --     animDict = "amb_rest_lean@world_human_lean@wall@female_b@idle_a",
        --     anim = "idle_b",
        -- },
        -- a_c = {
        --     animDict = "amb_rest_lean@world_human_lean@wall@female_b@idle_a",
        --     anim = "idle_c",
        -- },
        -- a_d = {
        --     animDict = "amb_rest_lean@world_human_lean@wall@female_b@idle_b",
        --     anim = "idle_d",
        -- },
        a_e = {
            animDict = "amb_rest_lean@world_human_lean@wall@female_b@idle_b",
            anim = "idle_e",
            name = "Scratch Right Arm",
        },
        a_f = {
            animDict = "amb_rest_lean@world_human_lean@wall@female_b@idle_b",
            anim = "idle_f",
            name = "Sigh",
        },
        trans_b_a = {
            animDict = "amb_rest_lean@world_human_lean@wall@female_b@trans",
            anim = "b_trans_a",
            next = "idle_a",
            animLibName = "lean_wall_female_a",
            name = "Face Left, Hands Crossed",
        },
    }
}

AnimLib.lean_wall_check_pistol = {
    name = "Examine Pistol",
    tags = { lean_back=1, },
    key = "g",
    triggerCondition = function() return Conditions.Check({
        hasAttachPointRightHip = true,
    }) end,
    condition = function() return Conditions.Check({
        hasWeapon = true,
        hasPrimaryWeapon = true,
        hasPrimaryLongarm = false,
    }) end,
    enter = {
        animDict = "amb_rest_lean@world_human_lean@wall@check_pistol@male_a@stand_enter",
        anim = "enter_front_rf",
        blendInSpeed = 1.0,
        onTrigger = function(info)
            AnimUtil.DisableFiring(true)
            info.final = function() AnimUtil.DisableFiring(false) end
            Citizen.Wait(980)
            AnimUtil.EquipWeapon(2)
            return info
        end,
    },
    exit = {
        animDict = "amb_rest_lean@world_human_lean@wall@check_pistol@male_a@stand_exit",
        anim = "exit_front",
        duration = 4200,
        onTrigger = function(info)
            info.final()
            info.final = nil
            Citizen.Wait(4000)
            AnimUtil.UnequipWeapon(2)
            return info
        end,
    },
    idles = {
        idle_a = {
            animDict = "amb_rest_lean@world_human_lean@wall@check_pistol@male_a@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
            transitions = {
                a_a = "r",
                a_b = "2",
                a_c = "a",
                a_d = "q",
                a_e = "s",
                a_f = "b",
                a_g = "d",
                a_h = "e",
            },
        },
    },
    animations = {
        a_a = {
            animDict = "amb_rest_lean@world_human_lean@wall@check_pistol@male_a@idle_a",
            anim = "idle_a",
            name = "Rotate",
        },
        a_b = {
            animDict = "amb_rest_lean@world_human_lean@wall@check_pistol@male_a@idle_a",
            anim = "idle_b",
            name = "Check Sights Two Hands",
        },
        a_c = {
            animDict = "amb_rest_lean@world_human_lean@wall@check_pistol@male_a@idle_a",
            anim = "idle_c",
            name = "Aim One Hand",
        },
        a_d = {
            animDict = "amb_rest_lean@world_human_lean@wall@check_pistol@male_a@idle_b",
            anim = "idle_d",
            name = "Quick Sight Check",
        },
        a_e = {
            animDict = "amb_rest_lean@world_human_lean@wall@check_pistol@male_a@idle_b",
            anim = "idle_e",
            name = "Brush, Spit",
        },
        a_f = {
            animDict = "amb_rest_lean@world_human_lean@wall@check_pistol@male_a@idle_b",
            anim = "idle_f",
            name = "Brush",
        },
        a_g = {
            animDict = "amb_rest_lean@world_human_lean@wall@check_pistol@male_a@idle_c",
            anim = "idle_g",
            name = "Look Right",
        },
        a_h = {
            animDict = "amb_rest_lean@world_human_lean@wall@check_pistol@male_a@idle_c",
            anim = "idle_h",
            name = "Look Right, Show",
        },
    },
}

AnimLib.lean_wall_whittle = {
    name = "Whittle",
    tags = { lean_back=1, },
    key = "w",
    enter = {
        animDict = "amb_rest_lean@world_human_lean@wall@whittle@male_d@stand_enter_withprop",
        anim = "enter_back_rf",
        blendInSpeed = 1.0,
        onTrigger = function(info)
            info.prop.knife = Prop:new()
            info.prop.stick = Prop:new()
            Citizen.Wait(2000)
            info.prop.knife:attach(info.ped, Propset.Knife2)
            Citizen.Wait(50)
            info.prop.stick:attach(info.ped, Propset.WhittleWood)
            return info
        end,
    },
    exit = {
        animDict = "amb_rest_lean@world_human_lean@wall@whittle@male_d@stand_exit",
        anim = "exit_front",
        duration = 4300,
        onTrigger = function(info)
            Citizen.Wait(1800)
            Prop.Delete(info.prop.knife)
            Citizen.Wait(2500)
            Prop.Delete(info.prop.stick)
            return info
        end,
    },
    idles = {
        idle_a = {
            animDict = "amb_rest_lean@world_human_lean@wall@whittle@male_d@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
            transitions = {
                a_a = "t",
                a_b = "w",
                a_c = "z",
                a_d = "e",
                a_e = "x",
                a_f = "q",
                a_g = "s",
                a_h = "d",
            },
        },
    },
    animations = {
        a_a = {
            animDict = "amb_rest_lean@world_human_lean@wall@whittle@male_d@idle_a",
            anim = "idle_a",
            name = "Turn Item",
        },
        a_b = {
            animDict = "amb_rest_lean@world_human_lean@wall@whittle@male_d@idle_a",
            anim = "idle_b",
            name = "Whittle Knot",
        },
        a_c = {
            animDict = "amb_rest_lean@world_human_lean@wall@whittle@male_d@idle_a",
            anim = "idle_c",
            name = "Cut And Examine",
        },
        a_d = {
            animDict = "amb_rest_lean@world_human_lean@wall@whittle@male_d@idle_b",
            anim = "idle_d",
            name = "Examine Close",
        },
        a_e = {
            animDict = "amb_rest_lean@world_human_lean@wall@whittle@male_d@idle_b",
            anim = "idle_e",
            name = "Examine, Cut Knot",
        },
        a_f = {
            animDict = "amb_rest_lean@world_human_lean@wall@whittle@male_d@idle_b",
            anim = "idle_f",
            name = "Examine Quick",
        },
        a_g = {
            animDict = "amb_rest_lean@world_human_lean@wall@whittle@male_d@idle_c",
            anim = "idle_g",
            name = "Look Up",
        },
        a_h = {
            animDict = "amb_rest_lean@world_human_lean@wall@whittle@male_d@idle_c",
            anim = "idle_h",
            name = "Whittle Detailed",
        },
    },
}

AnimLib.lean_post_female_a = {
    name = "Right Hand Hip",
    tags = { lean_left=1, },
    key = "h",
    enter = {
        animDict = "amb_rest_lean@world_human_lean@post@left@female_a@stand_enter",
        anim = "enter_back_rf",
        blendInSpeed = 1.0,
    },
    exit = {
        animDict = "amb_rest_lean@world_human_lean@post@left@female_a@stand_exit",
        anim = "exit_front",
        duration = 1000,
    },
    idles = {
        idle_a = {
            animDict = "amb_rest_lean@world_human_lean@post@left@female_a@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
            transitions = {
                a_a = "d",
                a_b = "x",
                a_c = "h",
                a_d = "b",
                a_e = "e",
                a_f = "t",
                a_g = "s",
                a_h = "a",
            },
        },
    },
    animations = {
        a_a = {
            animDict = "amb_rest_lean@world_human_lean@post@left@female_a@idle_a",
            anim = "idle_a",
            name = "Glance Down",
        },
        a_b = {
            animDict = "amb_rest_lean@world_human_lean@post@left@female_a@idle_a",
            anim = "idle_b",
            name = "Look Boot, Brush Thigh",
        },
        a_c = {
            animDict = "amb_rest_lean@world_human_lean@post@left@female_a@idle_a",
            anim = "idle_c",
            name = "Look Down At Hand",
        },
        a_d = {
            animDict = "amb_rest_lean@world_human_lean@post@left@female_a@idle_b",
            anim = "idle_d",
            name = "Look Boot",
        },
        a_e = {
            animDict = "amb_rest_lean@world_human_lean@post@left@female_a@idle_b",
            anim = "idle_e",
            name = "Examine Right Arm",
        },
        a_f = {
            animDict = "amb_rest_lean@world_human_lean@post@left@female_a@idle_b",
            anim = "idle_f",
            name = "Brush Right Thigh",
        },
        a_g = {
            animDict = "amb_rest_lean@world_human_lean@post@left@female_a@idle_c",
            anim = "idle_g",
            name = "Scratch Neck",
        },
        a_h = {
            animDict = "amb_rest_lean@world_human_lean@post@left@female_a@idle_c",
            anim = "idle_h",
            name = "Look Around",
        },
    },
}

AnimLib.lean_post_male_a = {
    name = "Cross Arms",
    tags = { lean_left=1, },
    key = "a",
    condition = function() return Conditions.Check({
        isMale = true,
    }) end,
    enter = {
        animDict = "amb_rest_lean@world_human_lean@post@left@male_a@stand_enter",
        anim = "enter_back_rf",
        blendInSpeed = 1.0,
    },
    exit = {
        animDict = "amb_rest_lean@world_human_lean@post@left@male_a@stand_exit",
        anim = "exit_front",
        duration = 800,
    },
    idles = {
        idle_a = {
            animDict = "amb_rest_lean@world_human_lean@post@left@male_a@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
            transitions = {
                a_a = "x",
                a_b = "e",
                a_c = "b",
                a_d = "h",
                a_e = "q",
                a_f = "g",
                a_g = "s",
                a_h = "w",
            },
        },
    },
    animations = {
        a_a = {
            animDict = "amb_rest_lean@world_human_lean@post@left@male_a@idle_a",
            anim = "idle_a",
            name = "Cough",
        },
        a_b = {
            animDict = "amb_rest_lean@world_human_lean@post@left@male_a@idle_a",
            anim = "idle_b",
            name = "Examine Hands",
        },
        a_c = {
            animDict = "amb_rest_lean@world_human_lean@post@left@male_a@idle_a",
            anim = "idle_c",
            name = "Brush Arms",
        },
        a_d = {
            animDict = "amb_rest_lean@world_human_lean@post@left@male_a@idle_b",
            anim = "idle_d",
            name = "Check Hands, Feet",
        },
        a_e = {
            animDict = "amb_rest_lean@world_human_lean@post@left@male_a@idle_b",
            anim = "idle_e",
            name = "Look Right Left Nosy",
        },
        a_f = {
            animDict = "amb_rest_lean@world_human_lean@post@left@male_a@idle_b",
            anim = "idle_f",
            name = "Cough, Brush Off Gloves",
        },
        a_g = {
            animDict = "amb_rest_lean@world_human_lean@post@left@male_a@idle_c",
            anim = "idle_g",
            name = "Spit",
        },
        a_h = {
            animDict = "amb_rest_lean@world_human_lean@post@left@male_a@idle_c",
            anim = "idle_h",
            name = "Stretch",
        },
    },
}

AnimLib.lean_post_male_b = {
    name = "Left Arm On High Post",
    tags = { lean_left=1, },
    key = "q",
    enter = {
        animDict = "amb_rest_lean@world_human_lean@post@left@hand_planted@male_b@stand_enter",
        anim = "enter_back_rf",
        blendInSpeed = 1.0,
    },
    exit = {
        animDict = "amb_rest_lean@world_human_lean@post@left@hand_planted@male_b@stand_exit",
        anim = "exit_front",
        duration = 1000,
    },
    idles = {
        idle_a = {
            animDict = "amb_rest_lean@world_human_lean@post@left@hand_planted@male_b@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
            transitions = {
                a_a = "d",
                a_b = "a",
                a_c = "h",
                a_d = "f",
                a_e = "q",
                a_f = "x",
                a_g = "w",
                a_h = "b",
            },
        },
    },
    animations = {
        a_a = {
            animDict = "amb_rest_lean@world_human_lean@post@left@hand_planted@male_b@idle_a",
            anim = "idle_a",
            name = "Glance Down",
        },
        a_b = {
            animDict = "amb_rest_lean@world_human_lean@post@left@hand_planted@male_b@idle_a",
            anim = "idle_b",
            name = "Adjust",
        },
        a_c = {
            animDict = "amb_rest_lean@world_human_lean@post@left@hand_planted@male_b@idle_a",
            anim = "idle_c",
            name = "Rotate Hips",
        },
        a_d = {
            animDict = "amb_rest_lean@world_human_lean@post@left@hand_planted@male_b@idle_b",
            anim = "idle_d",
            name = "Lean Forward",
        },
        a_e = {
            animDict = "amb_rest_lean@world_human_lean@post@left@hand_planted@male_b@idle_b",
            anim = "idle_e",
            name = "Glance Left",
        },
        a_f = {
            animDict = "amb_rest_lean@world_human_lean@post@left@hand_planted@male_b@idle_b",
            anim = "idle_f",
            name = "Cough",
        },
        a_g = {
            animDict = "amb_rest_lean@world_human_lean@post@left@hand_planted@male_b@idle_c",
            anim = "idle_g",
            name = "Wipe Nose",
        },
        a_h = {
            animDict = "amb_rest_lean@world_human_lean@post@left@hand_planted@male_b@idle_c",
            anim = "idle_h",
            name = "Brush Arm",
        },
    },
}

AnimLib.lean_post_right_female_a = {
    name = "Left Hand Hip",
    tags = { lean_right=1, },
    key = "h",
    enter = {
        animDict = "amb_rest_lean@world_human_lean@post@right@female_a@stand_enter",
        anim = "enter_back_rf",
        blendInSpeed = 1.0,
    },
    exit = {
        animDict = "amb_rest_lean@world_human_lean@post@right@female_a@stand_exit",
        anim = "exit_front",
        duration = 1000,
    },
    idles = {
        idle_a = {
            animDict = "amb_rest_lean@world_human_lean@post@right@female_a@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
            transitions = {
                a_a = "s",
                a_b = "q",
                a_c = "x",
                a_d = "e",
                a_e = "t",
                a_f = "f",
                a_g = "b",
                a_h = "a",
            },
        },
    },
    animations = {
        a_a = {
            animDict = "amb_rest_lean@world_human_lean@post@right@female_a@idle_a",
            anim = "idle_a",
            name = "Shake Hair",
        },
        a_b = {
            animDict = "amb_rest_lean@world_human_lean@post@right@female_a@idle_a",
            anim = "idle_b",
            name = "Look Left Sway",
        },
        a_c = {
            animDict = "amb_rest_lean@world_human_lean@post@right@female_a@idle_a",
            anim = "idle_c",
            name = "Scratch Neck",
        },
        a_d = {
            animDict = "amb_rest_lean@world_human_lean@post@right@female_a@idle_b",
            anim = "idle_d",
            name = "Examine Left Arm",
        },
        a_e = {
            animDict = "amb_rest_lean@world_human_lean@post@right@female_a@idle_b",
            anim = "idle_e",
            name = "Brush Thigh",
        },
        a_f = {
            animDict = "amb_rest_lean@world_human_lean@post@right@female_a@idle_b",
            anim = "idle_f",
            name = "Press Foot"
        },
        a_g = {
            animDict = "amb_rest_lean@world_human_lean@post@right@female_a@idle_c",
            anim = "idle_g",
            name = "Examine Boot, Brush Thigh",
        },
        a_h = {
            animDict = "amb_rest_lean@world_human_lean@post@right@female_a@idle_c",
            anim = "idle_h",
            name = "Look Around, Look Hand",
        },
    },
}

AnimLib.lean_post_right_male_a = {
    name = "Cross Arms",
    tags = { lean_right=1, },
    key = "a",
    enter = {
        animDict = "amb_rest_lean@world_human_lean@post@right@male_a@stand_enter",
        anim = "enter_back_rf",
        blendInSpeed = 1.0,
    },
    exit = {
        animDict = "amb_rest_lean@world_human_lean@post@right@male_a@stand_exit",
        anim = "exit_front",
        duration = 800,
    },
    idles = {
        idle_a = {
            animDict = "amb_rest_lean@world_human_lean@post@right@male_a@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
            transitions = {
                a_a = "d",
                a_b = "r",
                a_c = "x",
                a_d = "h",
                a_e = "q",
                a_f = "s",
                a_g = "w",
                a_h = "a",
            },
        },
    },
    animations = {
        a_a = {
            animDict = "amb_rest_lean@world_human_lean@post@right@male_a@idle_a",
            anim = "idle_a",
            name = "Glance Right",
        },
        a_b = {
            animDict = "amb_rest_lean@world_human_lean@post@right@male_a@idle_a",
            anim = "idle_b",
            name = "Glance Left, Right",
        },
        a_c = {
            animDict = "amb_rest_lean@world_human_lean@post@right@male_a@idle_a",
            anim = "idle_c",
            name = "Cough",
        },
        a_d = {
            animDict = "amb_rest_lean@world_human_lean@post@right@male_a@idle_b",
            anim = "idle_d",
            name = "Check Hands, Feet",
        },
        a_e = {
            animDict = "amb_rest_lean@world_human_lean@post@right@male_a@idle_b",
            anim = "idle_e",
            name = "Look Left Right Nosy",
        },
        a_f = {
            animDict = "amb_rest_lean@world_human_lean@post@right@male_a@idle_b",
            anim = "idle_f",
            name = "Spit",
        },
        a_g = {
            animDict = "amb_rest_lean@world_human_lean@post@right@male_a@idle_c",
            anim = "idle_g",
            name = "Stretch",
        },
        a_h = {
            animDict = "amb_rest_lean@world_human_lean@post@right@male_a@idle_c",
            anim = "idle_h",
            name = "Face Left",
        },
    },
}

AnimLib.lean_post_right_male_b = {
    name = "Right Arm On High Post",
    tags = { lean_right=1, },
    key = "q",
    enter = {
        animDict = "amb_rest_lean@world_human_lean@post@right@hand_planted@male_b@stand_enter",
        anim = "enter_back_rf",
        blendInSpeed = 1.0,
    },
    exit = {
        animDict = "amb_rest_lean@world_human_lean@post@right@hand_planted@male_b@stand_exit",
        anim = "exit_front",
        duration = 1000,
    },
    idles = {
        idle_a = {
            animDict = "amb_rest_lean@world_human_lean@post@right@hand_planted@male_b@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
            transitions = {
                a_a = "d",
                a_b = "a",
                a_c = "h",
                a_d = "f",
                a_e = "q",
                a_f = "x",
                a_g = "w",
                a_h = "b",
            },
        },
    },
    animations = {
        a_a = {
            animDict = "amb_rest_lean@world_human_lean@post@right@hand_planted@male_b@idle_a",
            anim = "idle_a",
            name = "Glance Down",
        },
        a_b = {
            animDict = "amb_rest_lean@world_human_lean@post@right@hand_planted@male_b@idle_a",
            anim = "idle_b",
            name = "Adjust",
        },
        a_c = {
            animDict = "amb_rest_lean@world_human_lean@post@right@hand_planted@male_b@idle_a",
            anim = "idle_c",
            name = "Rotate Hips",
        },
        a_d = {
            animDict = "amb_rest_lean@world_human_lean@post@right@hand_planted@male_b@idle_b",
            anim = "idle_d",
            name = "Lean Forward",
        },
        a_e = {
            animDict = "amb_rest_lean@world_human_lean@post@right@hand_planted@male_b@idle_b",
            anim = "idle_e",
            name = "Glance Left",
        },
        a_f = {
            animDict = "amb_rest_lean@world_human_lean@post@right@hand_planted@male_b@idle_b",
            anim = "idle_f",
            name = "Cough",
        },
        a_g = {
            animDict = "amb_rest_lean@world_human_lean@post@right@hand_planted@male_b@idle_c",
            anim = "idle_g",
            name = "Wipe Nose",
        },
        a_h = {
            animDict = "amb_rest_lean@world_human_lean@post@right@hand_planted@male_b@idle_c",
            anim = "idle_h",
            name = "Brush Arm",
        },
    },
}

AnimLib.lean_table_sharpen_knife = {
    name = "Sit Back Sharpen Knife",
    tags = { lean_back=1, },
    key = "x",
    enter = {
        animDict = "amb_rest_lean@world_human_lean@table@sharpen_knife@male_a@stand_enter",
        anim = "enter_back_lf",
        blendInSpeed = 1.0,
        onTrigger = function(info)
            info.prop.stone = Prop:new()
            info.prop.knife = Prop:new()
            Citizen.Wait(100)
            info.prop.stone:attach(info.ped, Propset.SharpeningStone)
            Citizen.Wait(1000)
            info.prop.knife:attach(info.ped, Propset.Knife2)
            return info
        end,
    },
    exit = {
        animDict = "amb_rest_lean@world_human_lean@table@sharpen_knife@male_a@stand_exit",
        anim = "exit_front",
        duration = 5200,
        onTrigger = function(info)
            Citizen.Wait(4200)
            Prop.Delete(info.prop.knife)
            Citizen.Wait(900)
            Prop.Delete(info.prop.stone)
            return info
        end,
    },
    idles = {
        idle_a = {
            animDict = "amb_rest_lean@world_human_lean@table@sharpen_knife@male_a@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
            transitions = {
                a_a = "q",
                a_b = "a",
                a_c = "z",
                a_d = "t",
                a_e = "w",
                a_f = "e",
                a_g = "s",
                a_h = "x",
            },
        },
    },
    animations = {
        a_a = {
            animDict = "amb_rest_lean@world_human_lean@table@sharpen_knife@male_a@idle_a",
            anim = "idle_a",
            name = "Quick Look",
        },
        a_b = {
            animDict = "amb_rest_lean@world_human_lean@table@sharpen_knife@male_a@idle_a",
            anim = "idle_b",
            name = "Look, Spit",
        },
        a_c = {
            animDict = "amb_rest_lean@world_human_lean@table@sharpen_knife@male_a@idle_a",
            anim = "idle_c",
            name = "Quick Tip",
        },
        a_d = {
            animDict = "amb_rest_lean@world_human_lean@table@sharpen_knife@male_a@idle_b",
            anim = "idle_d",
            name = "Spit, Test",
        },
        a_e = {
            animDict = "amb_rest_lean@world_human_lean@table@sharpen_knife@male_a@idle_b",
            anim = "idle_e",
            name = "Spit Top",
        },
        a_f = {
            animDict = "amb_rest_lean@world_human_lean@table@sharpen_knife@male_a@idle_b",
            anim = "idle_f",
            name = "Examine Long",
        },
        a_g = {
            animDict = "amb_rest_lean@world_human_lean@table@sharpen_knife@male_a@idle_c",
            anim = "idle_g",
            name = "Spit On Stone",
        },
        a_h = {
            animDict = "amb_rest_lean@world_human_lean@table@sharpen_knife@male_a@idle_c",
            anim = "idle_h",
            name = "Examine Close",
        },
    },
}

AnimLib.lean_counter_browse = {
    name = "Right Hand Counter",
    tags = { lean_front=1, },
    key = "d",
    enter = {
        animDict = "amb_misc@world_human_shop_browse_counter@male_a@stand_enter",
        anim = "enter_front_rf",
        blendInSpeed = 1.0,
    },
    exit = {
        animDict = "amb_misc@world_human_shop_browse_counter@male_a@stand_exit",
        anim = "exit_front",
        duration = 1500,
    },
    idles = {
        idle_a = {
            animDict = "amb_misc@world_human_shop_browse_counter@male_a@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
            transitions = {
                a_a = "w",
                a_b = "t",
                a_c = "d",
                a_d = "s",
                a_e = "b",
                a_f = "q",
                a_g = "f",
                a_h = "z",
                a_i = "x",
            },
        },
    },
    animations = {
        a_a = {
            animDict = "amb_misc@world_human_shop_browse_counter@male_a@idle_a",
            anim = "idle_a",
            name = "Nod, Look Around",
        },
        a_b = {
            animDict = "amb_misc@world_human_shop_browse_counter@male_a@idle_a",
            anim = "idle_b",
            name = "Tap Fingers, Look Left",
        },
        a_c = {
            animDict = "amb_misc@world_human_shop_browse_counter@male_a@idle_a",
            anim = "idle_c",
            name = "Look Down",
        },
        a_d = {
            animDict = "amb_misc@world_human_shop_browse_counter@male_a@idle_b",
            anim = "idle_d",
            name = "Sigh",
        },
        a_e = {
            animDict = "amb_misc@world_human_shop_browse_counter@male_a@idle_b",
            anim = "idle_e",
            name = "Brush Off",
        },
        a_f = {
            animDict = "amb_misc@world_human_shop_browse_counter@male_a@idle_b",
            anim = "idle_f",
            name = "Look Back Left",
        },
        a_g = {
            animDict = "amb_misc@world_human_shop_browse_counter@male_a@idle_c",
            anim = "idle_g",
            name = "Lean Forward, Look",
        },
        a_h = {
            animDict = "amb_misc@world_human_shop_browse_counter@male_a@idle_c",
            anim = "idle_h",
            name = "Lean Forward, Look Down",
        },
        a_i = {
            animDict = "amb_misc@world_human_shop_browse_counter@male_a@idle_c",
            anim = "idle_i",
            name = "Lean Forward, Point",
        },
    },
}

-- world_human_lean
    -- @railing
        -- @back
            -- @drinking
                -- @male_a
        -- @left
            -- @drinking
                -- @male_a
                -- @male_c

        -- @drinking
            -- @male_b
            -- @male_c
            -- @male_d
            -- @female_b

        -- @smoking
            -- @female_a
            -- @female_b
            -- @male_a
            -- @male_b
            -- @male_d

    -- @wall
        -- @drinking
            -- @male_a
            -- @male_b
            -- @female_a
            -- @female_b

        -- @smoking
            -- @female_a
            -- @female_b
            -- @male_a
            -- @male_b
            -- @male_c
            -- @male_d

        -- @moonshine

        -- THESE MIGHT BE DUPLICATED
        -- @high
            -- @lean_a
        -- @left
            -- @drinking
                -- @male_a
                -- @female_a
            -- @smoking
                -- @male_c
        -- @right
            -- @drinking
                -- @male_a

-- world_human_shop_browse_counter
    -- @male_a

-- amb_rest_lean@world_human_lean_fence_fwd_check_out_livestock@male_a@base
-- amb_rest_lean@world_human_lean_fence_fwd_check_out_livestock@male_f@base
-- amb_rest_lean@world_human_lean_fence_fwd_check_out_livestock@male_e@base
