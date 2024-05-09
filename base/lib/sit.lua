--- Copyright © 2024 Joshua Nelson

AnimLib.world_human_sit_ground_legoutkneeup = {
    name = "Knee Up",
    tags = { sit=1, },
    key = "k",
    enter = {
        animDict = "amb_rest_sit@world_human_sit_ground@male_a@stand_enter",
        anim = "enter_back_lf",
        blendInSpeed = 1.0,
        nextBlendInSpeed = 1.0,
    },
    exit = {
        animDict = "amb_rest_sit@world_human_sit_ground@male_a@stand_exit",
        anim = "exit_front",
        blendInSpeed = 1.0,
        duration = 4000,
    },
    idles = {
        idle_a = {
            animDict = "amb_rest_sit@world_human_sit_ground@male_a@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
            transitions = {
                a_a = "g",
                a_b = "f",
                a_c = "a",
                -- a_d = "v",
                a_e = "e",
                a_f = "s",
                a_g = "h",
                a_h = "q",
                a_i = "b",
                a_j = "w",
                -- a_k = "z",
                a_l = "d",
                trans_a_c = "4",
            },
        },
    },
    animations = {
        a_a = {
            animDict = "amb_rest_sit@world_human_sit_ground@male_a@idle_a",
            anim = "idle_a",
            name = "Glance Up",
        },
        a_b = {
            animDict = "amb_rest_sit@world_human_sit_ground@male_a@idle_a",
            anim = "idle_b",
            name = "Look Forward",
        },
        a_c = {
            animDict = "amb_rest_sit@world_human_sit_ground@male_a@idle_a",
            anim = "idle_c",
            name = "Adjust Arm",
        },
        -- a_d = {
        --     animDict = "amb_rest_sit@world_human_sit_ground@male_a@idle_a",
        --     anim = "idle_d",
        --     name = "?",
        -- },
        a_e = {
            animDict = "amb_rest_sit@world_human_sit_ground@male_a@idle_b",
            anim = "idle_e",
            name = "Look at Fingernails",
        },
        a_f = {
            animDict = "amb_rest_sit@world_human_sit_ground@male_a@idle_b",
            anim = "idle_f",
            name = "Look Right Spit Left",
        },
        a_g = {
            animDict = "amb_rest_sit@world_human_sit_ground@male_a@idle_c",
            anim = "idle_g",
            name = "Look at Hand",
        },
        a_h = {
            animDict = "amb_rest_sit@world_human_sit_ground@male_a@idle_c",
            anim = "idle_h",
            name = "Scratch Neck",
        },
        a_i = {
            animDict = "amb_rest_sit@world_human_sit_ground@male_a@idle_c",
            anim = "idle_i",
            name = "Lean Back Adjust",
        },
        a_j = {
            animDict = "amb_rest_sit@world_human_sit_ground@male_a@idle_d",
            anim = "idle_j",
            name = "Wipe Hands",
        },
        a_k = {
            animDict = "amb_rest_sit@world_human_sit_ground@male_a@idle_d",
            anim = "idle_k",
            name = "Scratch Crotch",
        },
        a_l = {
            animDict = "amb_rest_sit@world_human_sit_ground@male_a@idle_d",
            anim = "idle_l",
            name = "Lean Back Twist Adjust",
        },
        trans_a_c = {
            animDict = "amb_rest_sit@world_human_sit_ground@male_a@trans",
            anim = "a_trans_c",
            animLibName = "world_human_sit_ground_figurefour",
            next = "idle_c",
            nextBlendInSpeed = 1.0,
            name = "Transition to Figure Four",
        },
    },
}

AnimLib.world_human_sit_ground_crisscross = {
    name = "Cross Legs",
    tags = { sit=1, },
    key = "x",
    enter = {
        animDict = "amb_rest_sit@world_human_sit_ground@male_c@stand_enter",
        anim = "enter_back_rf",
        duration = 3500,
        blendInSpeed = 1.0,
        nextBlendInSpeed = 1.0,
    },
    exit = {
        animDict = "amb_rest_sit@world_human_sit_ground@male_c@stand_exit",
        anim = "exit_front",
        blendInSpeed = 1.0,
        duration = 4000,
    },
    idles = {
        idle_b = {
            animDict = "amb_rest_sit@world_human_sit_ground@male_b@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
            transitions = {
                b_a = "1",
                b_b = "2",
                b_c = "3",
                b_d = "4",
                b_e = "5",
                b_f = "f",
                b_g = "g",
                b_h = "h",
                -- trans_b_a = "z",
                -- trans_b_c = "4",
            }
        },
    },
    animations = {
        b_a = {
            animDict = "amb_rest_sit@world_human_sit_ground@male_b@idle_a",
            anim = "idle_a",
            name = "Cover Mouth",
        },
        b_b = {
            animDict = "amb_rest_sit@world_human_sit_ground@male_b@idle_a",
            anim = "idle_b",
            name = "Hand Near Face",
        },
        b_c = {
            animDict = "amb_rest_sit@world_human_sit_ground@male_b@idle_a",
            anim = "idle_c",
            name = "Swat Fly",
        },
        b_d = {
            animDict = "amb_rest_sit@world_human_sit_ground@male_b@idle_b",
            anim = "idle_d",
            name = "Swat Bug Thigh"
        },
        b_e = {
            animDict = "amb_rest_sit@world_human_sit_ground@male_b@idle_b",
            anim = "idle_e",
            name = "Rest Hand Face",
        },
        b_f = {
            animDict = "amb_rest_sit@world_human_sit_ground@male_b@idle_b",
            anim = "idle_f",
            name = "Adjust",
        },
        b_g = {
            animDict = "amb_rest_sit@world_human_sit_ground@male_b@idle_c",
            anim = "idle_g",
            name = "Slight Adjust",
        },
        b_h = {
            animDict = "amb_rest_sit@world_human_sit_ground@male_b@idle_c",
            anim = "idle_h",
            name = "Itch Right Cheek",
        },
    },
}

AnimLib.world_human_sit_ground_figurefour = {
    name = "Figure Four",
    tags = { sit=1, },
    key = "4",
    enter = {
        animDict = "amb_rest_sit@world_human_sit_ground@male_c@stand_enter",
        anim = "enter_back_lf",
        blendInSpeed = 1.0,
        nextBlendInSpeed = 1.0,
    },
    exit = {
        animDict = "amb_rest_sit@world_human_sit_ground@male_c@stand_exit",
        anim = "exit_front",
        blendInSpeed = 1.0,
        duration = 4000,
    },
    idles = {
        idle_c = {
            animDict = "amb_rest_sit@world_human_sit_ground@male_c@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
            transitions = {
                c_a = "g",
                c_b = "q",
                c_c = "f",
                c_d = "a",
                c_e = "b",
                c_f = "r",
                c_g = "t",
                c_h = "n",
                c_i = "e",
                c_j = "z",
                c_k = "w",
                c_l = "s",
                trans_c_a = "1",
            },
        },
    },
    animations = {
        c_a = {
            animDict = "amb_rest_sit@world_human_sit_ground@male_c@idle_a",
            anim = "idle_a",
            name = "Glance Up",
        },
        c_b = {
            animDict = "amb_rest_sit@world_human_sit_ground@male_c@idle_a",
            anim = "idle_b",
            name = "Look Left",
        },
        c_c = {
            animDict = "amb_rest_sit@world_human_sit_ground@male_c@idle_a",
            anim = "idle_c",
            name = "Warm Hands Forward",
        },
        c_d = {
            animDict = "amb_rest_sit@world_human_sit_ground@male_c@idle_b",
            anim = "idle_d",
            name = "Adjust"
        },
        c_e = {
            animDict = "amb_rest_sit@world_human_sit_ground@male_c@idle_b",
            anim = "idle_e",
            name = "Brush Off Thigh",
        },
        c_f = {
            animDict = "amb_rest_sit@world_human_sit_ground@male_c@idle_b",
            anim = "idle_f",
            name = "Lean Right"
        },
        c_g = {
            animDict = "amb_rest_sit@world_human_sit_ground@male_c@idle_c",
            anim = "idle_g",
            name = "Scratch Thigh",
        },
        c_h = {
            animDict = "amb_rest_sit@world_human_sit_ground@male_c@idle_c",
            anim = "idle_h",
            name = "Wipe Nose",
        },
        c_i = {
            animDict = "amb_rest_sit@world_human_sit_ground@male_c@idle_c",
            anim = "idle_i",
            name = "Wipe Eyes",
        },
        c_j = {
            animDict = "amb_rest_sit@world_human_sit_ground@male_c@idle_d",
            anim = "idle_j",
            name = "Adjust and Stretch",
        },
        c_k = {
            animDict = "amb_rest_sit@world_human_sit_ground@male_c@idle_d",
            anim = "idle_k",
            name = "Wipe Hands",
        },
        c_l = {
            animDict = "amb_rest_sit@world_human_sit_ground@male_c@idle_d",
            anim = "idle_l",
            name = "Look Right Scratch Cheek",
        },
        trans_c_a = {
            animDict = "amb_rest_sit@world_human_sit_ground@male_c@trans",
            anim = "c_trans_a",
            animLibName = "world_human_sit_ground_legoutkneeup",
            next = "idle_a",
            nextBlendInSpeed = 1.0,
            name = "Transition to Knee Up",
        },
    },
}

AnimLib.sit_hopeless = {
    name = "Hopeless",
    tags = { sit=1, },
    key = "h",
    enter = {
        animDict = "amb_rest_sit@world_human_depressed_sit_ground@male_a@enter",
        anim = "enter",
        blendInSpeed = 1.0,
    },
    exit = {
        animDict = "amb_rest_sit@world_human_depressed_sit_ground@male_a@exit",
        anim = "exit",
        duration = 8000,
    },
    idles = {
        idle_a = {
            animDict = "amb_rest_sit@world_human_depressed_sit_ground@male_a@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
            transitions = {
                a_a = "b",
                a_b = "a",
                a_c = "f",
                a_d = "t",
                a_e = "q",
            },
        },
    },
    animations = {
        a_a = {
            animDict = "amb_rest_sit@world_human_depressed_sit_ground@male_a@idle_a",
            anim = "idle_a",
            name = "Pinch Brow",
        },
        a_b = {
            animDict = "amb_rest_sit@world_human_depressed_sit_ground@male_a@idle_a",
            anim = "idle_b",
            name = "Toss Away",
        },
        a_c = {
            animDict = "amb_rest_sit@world_human_depressed_sit_ground@male_a@idle_a",
            anim = "idle_c",
            name = "Bury Face In Arm",
        },
        a_d = {
            animDict = "amb_rest_sit@world_human_depressed_sit_ground@male_a@idle_b",
            anim = "idle_d",
            name = "Throw Rock",
        },
        a_e = {
            animDict = "amb_rest_sit@world_human_depressed_sit_ground@male_a@idle_b",
            anim = "idle_e",
            name = "Look Left",
        },
    },
}

AnimLib.sit_angry = {
    name = "Angry",
    tags = { sit=1, },
    key = "a",
    enter = {
        animDict = "amb_rest_sit@world_human_depressed_sit_ground@male_b@enter",
        anim = "enter",
        blendInSpeed = 1.0,
    },
    exit = {
        animDict = "amb_rest_sit@world_human_depressed_sit_ground@male_b@exit",
        anim = "exit",
        duration = 6000,
    },
    idles = {
        idle_a = {
            animDict = "amb_rest_sit@world_human_depressed_sit_ground@male_b@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
            transitions = {
                a_a = "s",
                a_b = "d",
                a_c = "f",
                a_d = "q",
                -- a_f = "q",
            },
        },
    },
    animations = {
        a_a = {
            animDict = "amb_rest_sit@world_human_depressed_sit_ground@male_b@idle_a",
            anim = "idle_a",
            name = "Swat",
        },
        a_b = {
            animDict = "amb_rest_sit@world_human_depressed_sit_ground@male_b@idle_a",
            anim = "idle_b",
            name = "Pound Dirt",
        },
        a_c = {
            animDict = "amb_rest_sit@world_human_depressed_sit_ground@male_b@idle_a",
            anim = "idle_c",
            name = "Kick Frustrated",
        },
        a_d = {
            animDict = "amb_rest_sit@world_human_depressed_sit_ground@male_b@idle_b",
            anim = "idle_d",
            name = "Shake Head, Look Up",
        },
        -- a_f = {
        --     animDict = "amb_rest_sit@world_human_depressed_sit_ground@male_b@idle_b",
        --     anim = "idle_e",
        -- },
    },
}

AnimLib.sit_exhausted = {
    name = "Exhausted",
    tags = { sit=1, },
    key = "e",
    enter = {
        animDict = "amb_rest_sit@world_human_sit_back@exhausted@male_a@stand_enter",
        anim = "enter_front_rf",
        blendInSpeed = 1.0,
    },
    exit = {
        animDict = "amb_rest_sit@world_human_sit_back@exhausted@male_a@stand_exit",
        anim = "exit_front",
        duration = 5300,
    },
    idles = {
        idle_a = {
            animDict = "amb_rest_sit@world_human_sit_back@exhausted@male_a@base",
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
            },
        },
    },
    animations = {
        a_a = {
            animDict = "amb_rest_sit@world_human_sit_back@exhausted@male_a@idle_a",
            anim = "idle_a",
            name = "Move Head Side to Side",
        },
        a_b = {
            animDict = "amb_rest_sit@world_human_sit_back@exhausted@male_a@idle_a",
            anim = "idle_b",
            name = "Breath Deeply",
        },
        a_c = {
            animDict = "amb_rest_sit@world_human_sit_back@exhausted@male_a@idle_a",
            anim = "idle_c",
            name = "Scratch Cheek",
        },
        a_d = {
            animDict = "amb_rest_sit@world_human_sit_back@exhausted@male_a@idle_b",
            anim = "idle_d",
            name = "Scratch Neck",
        },
        a_e = {
            animDict = "amb_rest_sit@world_human_sit_back@exhausted@male_a@idle_b",
            anim = "idle_e",
            name = "Spit Right",
        },
        a_f = {
            animDict = "amb_rest_sit@world_human_sit_back@exhausted@male_a@idle_b",
            anim = "idle_f",
            name = "Rub Eyes",
        },
        a_g = {
            animDict = "amb_rest_sit@world_human_sit_back@exhausted@male_a@idle_c",
            anim = "idle_g",
            name = "Scratch Chin",
        },
        a_h = {
            animDict = "amb_rest_sit@world_human_sit_back@exhausted@male_a@idle_c",
            anim = "idle_h",
            name = "Rub Chin",
        },
    },
}

AnimLib.kneel_attend_injured = {
    name = "Tend to Body",
    tags = {
        medical = { key = "t", },
        squat = 1,
    },
    key = "b",
    enter = {
        animDict = "script_story@ntv3@ig@ig12_nativewapitireaction_p2",
        anim = "enter_native_female",
        blendInSpeed = 1.0,
    },
    exit = {
        animDict = "script_story@ntv3@ig@ig12_nativewapitireaction_p2",
        anim = "exit_native_female",
        duration = 3800,
    },
    idles = {
        idle_a = {
            animDict = "script_story@ntv3@ig@ig12_nativewapitireaction_p2",
            anim = "loop_native_female",
            flag = AnimConfig.Flag.Loop,
        },
    },
}

AnimLib.sit_legs_straight = {
    name = "Legs Straight",
    tags = { sit=1, },
    key = "w",
    enter = {
        animDict = "amb_generic@world_human_generic_sit_ground@legs_down@female_a@stand_enter",
        anim = "enter_back_rf",
        blendInSpeed = 1.0,
    },
    exit = {
        animDict = "amb_generic@world_human_generic_sit_ground@legs_down@female_a@stand_exit",
        anim = "exit_front",
        duration = 3800,
    },
    idles = {
        idle_a = {
            animDict = "amb_generic@world_human_generic_sit_ground@legs_down@female_a@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
        },
    },
}

AnimLib.sit_legs_bent_front = {
    name = "Legs Bent Front",
    tags = { sit=1, },
    key = "s",
    enter = {
        animDict = "amb_generic@world_human_generic_sit_ground@legs_up@female_a@stand_enter",
        anim = "enter_back_rf",
        blendInSpeed = 1.0,
    },
    exit = {
        animDict = "amb_generic@world_human_generic_sit_ground@legs_up@female_a@stand_exit",
        anim = "exit_front",
        duration = 3800,
    },
    idles = {
        idle_a = {
            animDict = "amb_generic@world_human_generic_sit_ground@legs_up@female_a@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
        },
    },
}

AnimLib.sit_right_leg_under = {
    name = "Right Leg Under",
    tags = { sit=1, },
    key = "r",
    enter = {
        animDict = "amb_generic@world_human_generic_sit_ground@lf_fwd@male_a@stand_enter",
        anim = "enter_back_rf",
        blendInSpeed = 1.0,
    },
    exit = {
        animDict = "amb_generic@world_human_generic_sit_ground@lf_fwd@male_a@stand_exit",
        anim = "exit_front",
        duration = 3500,
    },
    idles = {
        idle_a = {
            animDict = "amb_generic@world_human_generic_sit_ground@lf_fwd@male_a@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
        },
    },
}

AnimLib.sit_left_leg_under = {
    name = "Left Leg Under",
    tags = { sit=1, },
    key = "q",
    enter = {
        animDict = "amb_generic@world_human_generic_sit_ground@rf_fwd@male_a@stand_enter",
        anim = "enter_front_rf",
        blendInSpeed = 1.0,
    },
    exit = {
        animDict = "amb_generic@world_human_generic_sit_ground@rf_fwd@male_a@stand_exit",
        anim = "exit_front",
        duration = 3500,
    },
    idles = {
        idle_a = {
            animDict = "amb_generic@world_human_generic_sit_ground@rf_fwd@male_a@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
        },
    },
}

AnimLib.sit_read_legs_right = { -- DISABLED: Need book prop anim -- TODO anim names
    name = "Read Book Legs Right",
    tags = {},
    key = "b",
    enter = {
        animDict = "amb_rest_sit@world_human_sit_ground@read_book@female_a@stand_enter_withprop",
        anim = "enter_back_rf",
        blendInSpeed = 1.0,
    },
    exit = {
        animDict = "amb_rest_sit@world_human_sit_ground@read_book@female_a@stand_exit_withprop",
        anim = "exit_front",
    },
    idles = {
        idle_a = {
            animDict = "amb_rest_sit@world_human_sit_ground@read_book@female_a@base",
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
                a_j = "y",
                a_k = "u",
                a_l = "i",
            },
        },
    },
    animations = {
        a_a = {
            animDict = "amb_rest_sit@world_human_sit_ground@read_book@female_a@idle_a",
            anim = "idle_a",
        },
        a_b = {
            animDict = "amb_rest_sit@world_human_sit_ground@read_book@female_a@idle_a",
            anim = "idle_b",
        },
        a_c = {
            animDict = "amb_rest_sit@world_human_sit_ground@read_book@female_a@idle_a",
            anim = "idle_c",
        },
        a_d = {
            animDict = "amb_rest_sit@world_human_sit_ground@read_book@female_a@idle_b",
            anim = "idle_d",
        },
        a_e = {
            animDict = "amb_rest_sit@world_human_sit_ground@read_book@female_a@idle_b",
            anim = "idle_e",
        },
        a_f = {
            animDict = "amb_rest_sit@world_human_sit_ground@read_book@female_a@idle_b",
            anim = "idle_f",
        },
        a_g = {
            animDict = "amb_rest_sit@world_human_sit_ground@read_book@female_a@idle_c",
            anim = "idle_g",
        },
        a_h = {
            animDict = "amb_rest_sit@world_human_sit_ground@read_book@female_a@idle_c",
            anim = "idle_h",
        },
        a_i = {
            animDict = "amb_rest_sit@world_human_sit_ground@read_book@female_a@idle_c",
            anim = "idle_i",
        },
        a_j = {
            animDict = "amb_rest_sit@world_human_sit_ground@read_book@female_a@idle_d",
            anim = "idle_j",
        },
        a_k = {
            animDict = "amb_rest_sit@world_human_sit_ground@read_book@female_a@idle_d",
            anim = "idle_k",
        },
        a_l = {
            animDict = "amb_rest_sit@world_human_sit_ground@read_book@female_a@idle_d",
            anim = "idle_l",
        },
    },
}

AnimLib.sit_read_legs_crossed = { -- DISABLED: Need book prop anim -- TODO anim names
    name = "Read Legs Crossed",
    -- tags = { sit=1, },
    tags = {},
    key = "z",
    enter = {
        animDict = "amb_rest_sit@world_human_sit_ground@read_book@male_a@stand_enter_withprop",
        anim = "enter_back_rf",
        blendInSpeed = 1.0,
    },
    exit = {
        animDict = "amb_rest_sit@world_human_sit_ground@read_book@male_a@stand_exit",
        anim = "exit_front",
    },
    idles = {
        idle_a = {
            animDict = "amb_rest_sit@world_human_sit_ground@read_book@male_a@base",
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
                a_j = "y",
                a_k = "u",
                a_l = "i",
            },
        },
    },
    animations = {
        a_a = {
            animDict = "amb_rest_sit@world_human_sit_ground@read_book@male_a@idle_a",
            anim = "idle_a",
        },
        a_b = {
            animDict = "amb_rest_sit@world_human_sit_ground@read_book@male_a@idle_a",
            anim = "idle_b",
        },
        a_c = {
            animDict = "amb_rest_sit@world_human_sit_ground@read_book@male_a@idle_a",
            anim = "idle_c",
        },
        a_d = {
            animDict = "amb_rest_sit@world_human_sit_ground@read_book@male_a@idle_b",
            anim = "idle_d",
        },
        a_e = {
            animDict = "amb_rest_sit@world_human_sit_ground@read_book@male_a@idle_b",
            anim = "idle_e",
        },
        a_f = {
            animDict = "amb_rest_sit@world_human_sit_ground@read_book@male_a@idle_b",
            anim = "idle_f",
        },
        a_g = {
            animDict = "amb_rest_sit@world_human_sit_ground@read_book@male_a@idle_c",
            anim = "idle_g",
        },
        a_h = {
            animDict = "amb_rest_sit@world_human_sit_ground@read_book@male_a@idle_c",
            anim = "idle_h",
        },
        a_i = {
            animDict = "amb_rest_sit@world_human_sit_ground@read_book@male_a@idle_c",
            anim = "idle_i",
        },
        a_j = {
            animDict = "amb_rest_sit@world_human_sit_ground@read_book@male_a@idle_d",
            anim = "idle_j",
        },
        a_k = {
            animDict = "amb_rest_sit@world_human_sit_ground@read_book@male_a@idle_d",
            anim = "idle_k",
        },
        a_l = {
            animDict = "amb_rest_sit@world_human_sit_ground@read_book@male_a@idle_d",
            anim = "idle_l",
        },
    },
}

AnimLib.sit_read_news = {
    name = "Read Newspaper",
    tags = { sit=1, },
    key = "n",
    enter = {
        animDict = "amb_rest_sit@world_human_sit_ground@reading@newspaper@male_a@stand_enter_withprop",
        anim = "enter_back_lf",
        blendInSpeed = 1.0,
        prop = { newspaper = { anim = "enter_back_lf_newspaper", }, },
        onStart = function(info)
            info.prop.newspaper = Prop:new()
            info.prop.newspaper:attach(info.ped, Propset.Newspaper)
            return info
        end,
    },
    exit = {
        animDict = "amb_rest_sit@world_human_sit_ground@reading@newspaper@male_a@stand_exit_withprop",
        anim = "exit_front",
        duration = 4500,
        prop = { newspaper = { anim = "exit_front_newspaper", }, },
        onTrigger = function(info)
            Citizen.Wait(4000)
            Prop.Detach(info.prop.newspaper)
            info.prop.newspaper = nil
            return info
        end,
    },
    idles = {
        idle_a = {
            animDict = "amb_rest_sit@world_human_sit_ground@reading@newspaper@male_a@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
            prop = { newspaper = { anim = "base_newspaper", loop = true, }, },
            transitions = {
                -- a_a = "1",
                -- a_b = "2",
                a_c = "s",
                a_d = "q",
                a_e = "z",
                a_f = "e",
                a_g = "a",
                a_h = "r",
                a_i = "n",
                a_j = "f",
                a_k = "h",
                a_l = "w",
            },
        },
    },
    animations = {
        a_a = {
            animDict = "amb_rest_sit@world_human_sit_ground@reading@newspaper@male_a@idle_a",
            anim = "idle_a",
            prop = { newspaper = { anim = "idle_a_newspaper", }, },
        },
        a_b = {
            animDict = "amb_rest_sit@world_human_sit_ground@reading@newspaper@male_a@idle_a",
            anim = "idle_b",
            prop = { newspaper = { anim = "idle_b_newspaper", }, },
        },
        a_c = {
            animDict = "amb_rest_sit@world_human_sit_ground@reading@newspaper@male_a@idle_a",
            anim = "idle_c",
            name = "Scooch",
            prop = { newspaper = { anim = "idle_c_newspaper", }, },
        },
        a_d = {
            animDict = "amb_rest_sit@world_human_sit_ground@reading@newspaper@male_a@idle_b",
            anim = "idle_d",
            name = "Look Close",
            prop = { newspaper = { anim = "idle_d_newspaper", }, },
        },
        a_e = {
            animDict = "amb_rest_sit@world_human_sit_ground@reading@newspaper@male_a@idle_b",
            anim = "idle_e",
            name = "Look Low",
            prop = { newspaper = { anim = "idle_e_newspaper", }, },
        },
        a_f = {
            animDict = "amb_rest_sit@world_human_sit_ground@reading@newspaper@male_a@idle_b",
            anim = "idle_f",
            name = "Point at Story",
            prop = { newspaper = { anim = "idle_f_newspaper", }, },
        },
        a_g = {
            animDict = "amb_rest_sit@world_human_sit_ground@reading@newspaper@male_a@idle_c",
            anim = "idle_g",
            name = "Adjust Paper",
            prop = { newspaper = { anim = "idle_g_newspaper", }, },
        },
        a_h = {
            animDict = "amb_rest_sit@world_human_sit_ground@reading@newspaper@male_a@idle_c",
            anim = "idle_h",
            name = "Roll Neck",
            prop = { newspaper = { anim = "idle_h_newspaper", }, },
        },
        a_i = {
            animDict = "amb_rest_sit@world_human_sit_ground@reading@newspaper@male_a@idle_c",
            anim = "idle_i",
            name = "Nod",
            prop = { newspaper = { anim = "idle_i_newspaper", }, },
        },
        a_j = {
            animDict = "amb_rest_sit@world_human_sit_ground@reading@newspaper@male_a@idle_d",
            anim = "idle_j",
            name = "Read With Finger",
            prop = { newspaper = { anim = "idle_j_newspaper", }, },
        },
        a_k = {
            animDict = "amb_rest_sit@world_human_sit_ground@reading@newspaper@male_a@idle_d",
            anim = "idle_k",
            name = "Shake out Hand",
            prop = { newspaper = { anim = "idle_k_newspaper", }, },
        },
        a_l = {
            animDict = "amb_rest_sit@world_human_sit_ground@reading@newspaper@male_a@idle_d",
            anim = "idle_l",
            name = "Wipe Face",
            prop = { newspaper = { anim = "idle_l_newspaper", }, },
            -- onTrigger = function(info)
            --     local righthand = GetEntityBoneIndexByName(info.ped, "SKEL_R_Hand")
            --     AttachEntityToEntity(info.prop.newspaper, info.ped, righthand,
            --         0.05, 0.022, -0.24, 105.0, 180.0, 136.0, true, true, false, true, 1, true)
            --     Citizen.Wait(4000)
            --     local lefthand = GetEntityBoneIndexByName(info.ped, "SKEL_L_Hand")
            --     AttachEntityToEntity(info.prop.newspaper, info.ped, lefthand,
            --         0.044, 0.108, 0.19, 46.0, 198.0, 144.0, true, true, false, true, 1, true)
            --     return info
            -- end,
        },
    },
}

AnimLib.sit_crate_clean_boots = { -- DISABLED: floating sit
    name = "Clean Boots",
    -- tags = { sit=1, },
    tags = {},
    key = "d",
    enter = {
        animDict = "amb_rest_sit@prop_human_seat_crate@clean_boots@male_a@stand_enter",
        anim = "enter_front_rf",
        blendInSpeed = 1.0,
    },
    exit = {
        animDict = "amb_rest_sit@prop_human_seat_crate@clean_boots@male_a@stand_exit",
        anim = "exit_front",
        duration = 5500,
    },
    idles = {
        idle_a = {
            animDict = "amb_rest_sit@prop_human_seat_crate@clean_boots@male_a@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
            transitions = {
                a_a = "s",
                a_b = "t",
                a_c = "f",
                a_d = "w",
                a_e = "r",
                a_f = "h",
                a_g = "d",
                a_h = "b",
            },
        },
    },
    animations = {
        a_a = {
            animDict = "amb_rest_sit@prop_human_seat_crate@clean_boots@male_a@idle_a",
            anim = "idle_a",
            name = "Examine Sole",
        },
        a_b = {
            animDict = "amb_rest_sit@prop_human_seat_crate@clean_boots@male_a@idle_a",
            anim = "idle_b",
            name = "Examine Toe"
        },
        a_c = {
            animDict = "amb_rest_sit@prop_human_seat_crate@clean_boots@male_a@idle_a",
            anim = "idle_c",
            name = "Wipe Forehead",
        },
        a_d = {
            animDict = "amb_rest_sit@prop_human_seat_crate@clean_boots@male_a@idle_b",
            anim = "idle_d",
            name = "Whip Rag"
        },
        a_e = {
            animDict = "amb_rest_sit@prop_human_seat_crate@clean_boots@male_a@idle_b",
            anim = "idle_e",
            name = "Spit On Rag",
        },
        a_f = {
            animDict = "amb_rest_sit@prop_human_seat_crate@clean_boots@male_a@idle_b",
            anim = "idle_f",
            name = "Hold Foot",
        },
        a_g = {
            animDict = "amb_rest_sit@prop_human_seat_crate@clean_boots@male_a@idle_c",
            anim = "idle_g",
            name = "Dust Off",
        },
        a_h = {
            animDict = "amb_rest_sit@prop_human_seat_crate@clean_boots@male_a@idle_c",
            anim = "idle_h",
            name = "Brush Off",
        },
    },
}

