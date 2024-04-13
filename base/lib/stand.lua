--- Copyright © 2024 Joshua Nelson

AnimLib.generic_standing = {
    name = "Right Foot Forward",
    tags = { stand=1, },
    key = "t",
    enter = {
        animDict = "amb_generic@world_human_generic_standing@rf_fwd@male_a@stand_enter",
        anim = "enter_back_rf",
        blendInSpeed = 1.0,
        nextBlendInSpeed = 1.0,
        duration = 400,
    },
    exit = {
        animDict = "amb_generic@world_human_generic_standing@rf_fwd@male_a@stand_exit",
        anim = "exit_front",
        duration = 400,
    },
    idles = {
        idle_a = {
            animDict = "amb_generic@world_human_generic_standing@rf_fwd@male_a@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
        },
    },
}

AnimLib.stand_badass = {
    name = "Thumbs In Beltloops",
    tags = { stand=1, },
    key = "q",
    enter = {
        animDict = "amb_rest@world_human_badass@male_a@stand_enter",
        anim = "enter_back_rf",
        blendInSpeed = 1.0,
    },
    exit = {
        animDict = "amb_rest@world_human_badass@male_a@stand_exit",
        anim = "exit_front",
        duration = 900,
    },
    idles = {
        idle_a = {
            animDict = "amb_rest@world_human_badass@male_a@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
            transitions = {
                a_a = "a",
                a_b = "w",
                a_c = "g",
                a_d = "f",
                a_e = "s",
                a_f = "q",
                a_g = "d",
                a_h = "r",
            },
        },
    },
    animations = {
        a_a = {
            animDict = "amb_rest@world_human_badass@male_a@idle_a",
            anim = "idle_a",
            name = "Look Around",
        },
        a_b = {
            animDict = "amb_rest@world_human_badass@male_a@idle_a",
            anim = "idle_b",
            name = "Wipe Nose",
        },
        a_c = {
            animDict = "amb_rest@world_human_badass@male_a@idle_a",
            anim = "idle_c",
            name = "Adjust Gunbelt",
        },
        a_d = {
            animDict = "amb_rest@world_human_badass@male_a@idle_b",
            anim = "idle_d",
            name = "Fidget",
        },
        a_e = {
            animDict = "amb_rest@world_human_badass@male_a@idle_b",
            anim = "idle_e",
            name = "Stretch Clap",
        },
        a_f = {
            animDict = "amb_rest@world_human_badass@male_a@idle_b",
            anim = "idle_f",
            name = "Crack Knuckles",
        },
        a_g = {
            animDict = "amb_rest@world_human_badass@male_a@idle_c",
            anim = "idle_g",
            name = "Look Down",
        },
        a_h = {
            animDict = "amb_rest@world_human_badass@male_a@idle_c",
            anim = "idle_h",
            name = "Rub Chin",
        },
    },
}

AnimLib.stand_hand_hip = {
    name = "Hand On Hip",
    tags = { stand=1, },
    key = "h",
    enter = {
        animDict = "amb_misc@world_human_stand_waiting@male_a@stand_enter",
        anim = "enter_back_lf",
        blendInSpeed = 1.0,
    },
    exit = {
        animDict = "amb_misc@world_human_stand_waiting@male_a@stand_exit",
        anim = "exit_front",
        duration = 1000,
    },
    idles = {
        idle_a = {
            animDict = "amb_misc@world_human_stand_waiting@male_a@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
            transitions = {
                a_a = "z",
                a_b = "a",
                a_c = "t",
                a_d = "q",
                a_e = "s",
                a_f = "d",
                a_g = "r",
                -- a_h = "r",
                trans_a_b = "b",
            },
        },
    },
    animations = {
        a_a = {
            animDict = "amb_misc@world_human_stand_waiting@male_a@idle_a",
            anim = "idle_a",
            name = "Glance Down",
        },
        a_b = {
            animDict = "amb_misc@world_human_stand_waiting@male_a@idle_a",
            anim = "idle_b",
            name = "Look Left",
        },
        a_c = {
            animDict = "amb_misc@world_human_stand_waiting@male_a@idle_a",
            anim = "idle_c",
            name = "Scratch Thigh",
        },
        a_d = {
            animDict = "amb_misc@world_human_stand_waiting@male_a@idle_b",
            anim = "idle_d",
            name = "Scratch Neck",
        },
        a_e = {
            animDict = "amb_misc@world_human_stand_waiting@male_a@idle_b",
            anim = "idle_e",
            name = "Slouch",
        },
        a_f = {
            animDict = "amb_misc@world_human_stand_waiting@male_a@idle_b",
            anim = "idle_f",
            name = "Look Right",
        },
        a_g = {
            animDict = "amb_misc@world_human_stand_waiting@male_a@idle_c",
            anim = "idle_g",
            name = "Spit Right",
        },
        a_h = {
            animDict = "amb_misc@world_human_stand_waiting@male_a@idle_c",
            anim = "idle_h",
            name = "Spit Front",
        },
        trans_a_b = {
            animDict = "amb_misc@world_human_stand_waiting@male_a@trans",
            anim = "a_trans_b",
            animLibName = "stand_hands_at_back",
            next = "idle_a",
            name = "Stand Hands At Back",
        },
    },
}

AnimLib.stand_hands_at_back = {
    name = "Stand Hands At Back",
    tags = { stand=1, },
    key = "b",
    enter = {
        animDict = "amb_misc@world_human_stand_waiting@male_b@stand_enter",
        anim = "enter_back_lf",
        blendInSpeed = 1.0,
    },
    exit = {
        animDict = "amb_misc@world_human_stand_waiting@male_b@stand_exit",
        anim = "exit_front",
        duration = 1900,
    },
    idles = {
        idle_a = {
            animDict = "amb_misc@world_human_stand_waiting@male_b@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
            transitions = {
                -- a_a = "1",
                a_b = "1",
                a_c = "s",
                a_d = "q",
                a_e = "a",
                a_f = "2",
                -- a_g = "e",
                -- a_h = "r",
                trans_b_a = "h",
            },
        },
    },
    animations = {
        a_a = {
            animDict = "amb_misc@world_human_stand_waiting@male_b@idle_a",
            anim = "idle_a",
            name = "Scratch crotch",
        },
        a_b = {
            animDict = "amb_misc@world_human_stand_waiting@male_b@idle_a",
            anim = "idle_b",
            name = "Fidget Clap",
        },
        a_c = {
            animDict = "amb_misc@world_human_stand_waiting@male_b@idle_a",
            anim = "idle_c",
            name = "Scratch Neck",
        },
        a_d = {
            animDict = "amb_misc@world_human_stand_waiting@male_b@idle_b",
            anim = "idle_d",
            name = "Scratch Chin",
        },
        a_e = {
            animDict = "amb_misc@world_human_stand_waiting@male_b@idle_b",
            anim = "idle_e",
            name = "Cross Arms",
        },
        a_f = {
            animDict = "amb_misc@world_human_stand_waiting@male_b@idle_b",
            anim = "idle_f",
            name = "Fidget Clap Twice",
        },
        a_g = {
            animDict = "amb_misc@world_human_stand_waiting@male_b@idle_c",
            anim = "idle_g",
            name = "Scratch Inner Thigh",
        },
        a_h = {
            animDict = "amb_misc@world_human_stand_waiting@male_b@idle_c",
            anim = "idle_h",
            name = "Fidget Feet",
        },
        trans_b_a = {
            animDict = "amb_misc@world_human_stand_waiting@male_b@trans",
            anim = "b_trans_a",
            animLibName = "stand_hand_hip",
            next = "idle_a",
            name = "Stand Hand On Hip",
        },
    },
}

AnimLib.stand_crossarms_sass = {
    name = "Crossed Arms Sass",
    tags = { stand=1, },
    key = "x",
    enter = {
        animDict = "amb_misc@world_human_stand_waiting@female_a@stand_enter",
        anim = "enter_back_lf",
        blendInSpeed = 1.0,
    },
    exit = {
        animDict = "amb_misc@world_human_stand_waiting@female_a@stand_exit",
        anim = "exit_front",
        duration = 1200,
    },
    idles = {
        idle_a = {
            animDict = "amb_misc@world_human_stand_waiting@female_a@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
            transitions = {
                a_a = "r",
                a_b = "d",
                a_c = "s",
                a_d = "x",
                a_e = "b",
                a_f = "w",
                a_g = "z",
                a_h = "f",
            },
        },
    },
    animations = {
        a_a = {
            animDict = "amb_misc@world_human_stand_waiting@female_a@idle_a",
            anim = "idle_a",
            name = "Roll Shoulders",
        },
        a_b = {
            animDict = "amb_misc@world_human_stand_waiting@female_a@idle_a",
            anim = "idle_b",
            name = "Look Right",
        },
        a_c = {
            animDict = "amb_misc@world_human_stand_waiting@female_a@idle_a",
            anim = "idle_c",
            name = "Scratch Shoulder",
        },
        a_d = {
            animDict = "amb_misc@world_human_stand_waiting@female_a@idle_b",
            anim = "idle_d",
            name = "Cough Two Hands",
        },
        a_e = {
            animDict = "amb_misc@world_human_stand_waiting@female_a@idle_b",
            anim = "idle_e",
            name = "Rock Back And Forth",
        },
        a_f = {
            animDict = "amb_misc@world_human_stand_waiting@female_a@idle_b",
            anim = "idle_f",
            name = "Stretch",
        },
        a_g = {
            animDict = "amb_misc@world_human_stand_waiting@female_a@idle_c",
            anim = "idle_g",
            name = "Kick Dirt Off Shoe",
        },
        a_h = {
            animDict = "amb_misc@world_human_stand_waiting@female_a@idle_c",
            anim = "idle_h",
            name = "Inspect Fingernails",
        },
    },
}

AnimLib.stand_crossarms_relaxed = {
    name = "Relaxed Crossed Arms",
    tags = { stand=1, },
    key = "z",
    enter = {
        animDict = "amb_misc@world_human_stare_stoic@male_a@stand_enter",
        anim = "enter_back_rf",
        duration = 500,
        blendInSpeed = 1.0,
        nextBlendInSpeed = 1.0,
        flag = AnimConfig.Flag.Move,
    },
    exit = {
        animDict = "amb_misc@world_human_stare_stoic@male_a@stand_exit",
        anim = "exit_front",
        duration = 600,
        flag = AnimConfig.Flag.Move,
    },
    idles = {
        idle_a = {
            animDict = "mp_lobby@standard@standing@mp_male_c@base",
            anim = "base",
            flag = AnimConfig.Flag.MoveLoop,
        },
    },
}

AnimLib.stand_crossarms = {
    name = "Cross Arms",
    tags = { stand=1, },
    key = "v",
    enter = {
        animDict = "amb_misc@world_human_stare_stoic@male_a@stand_enter",
        anim = "enter_back_rf",
        blendInSpeed = 1.0,
    },
    exit = {
        animDict = "amb_misc@world_human_stare_stoic@male_a@stand_exit",
        anim = "exit_front",
        duration = 900,
    },
    idles = {
        idle_a = {
            animDict = "amb_misc@world_human_stare_stoic@male_a@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
            transitions = {
                a_a = "d",
                a_b = "q",
                a_c = "s",
                a_d = "a",
                a_e = "w",
                a_f = "e",
                a_g = "z",
                a_h = "h",
            },
        },
    },
    animations = {
        a_a = {
            animDict = "amb_misc@world_human_stare_stoic@male_a@idle_a",
            anim = "idle_a",
            name = "Kick Dirt",
        },
        a_b = {
            animDict = "amb_misc@world_human_stare_stoic@male_a@idle_a",
            anim = "idle_b",
            name = "Cough",
        },
        a_c = {
            animDict = "amb_misc@world_human_stare_stoic@male_a@idle_a",
            anim = "idle_c",
            name = "Spit Left",
        },
        a_d = {
            animDict = "amb_misc@world_human_stare_stoic@male_a@idle_b",
            anim = "idle_d",
            name = "Scratch Cheek",
        },
        a_e = {
            animDict = "amb_misc@world_human_stare_stoic@male_a@idle_b",
            anim = "idle_e",
            name = "Rub Chin",
        },
        a_f = {
            animDict = "amb_misc@world_human_stare_stoic@male_a@idle_b",
            anim = "idle_f",
            name = "Scratch Ear",
        },
        a_g = {
            animDict = "amb_misc@world_human_stare_stoic@male_a@idle_c",
            anim = "idle_g",
            name = "Crack Knuckles",
        },
        a_h = {
            animDict = "amb_misc@world_human_stare_stoic@male_a@idle_c",
            anim = "idle_h",
            name = "Hands On Hips",
        },
    },
}

AnimLib.shy_hold_wrist = {
    name = "Hold Wrist Shy",
    tags = { stand=1, },
    key = "d",
    enter = {
        animDict = "amb_misc@world_human_stare_stoic@female_a@stand_enter",
        anim = "enter_back_rf",
        blendInSpeed = 1.0,
    },
    exit = {
        animDict = "amb_misc@world_human_stare_stoic@female_a@stand_exit",
        anim = "exit_front",
        duration = 1000,
    },
    idles = {
        idle_a = {
            animDict = "amb_misc@world_human_stare_stoic@female_a@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
            transitions = {
                a_a = "e",
                a_b = "a",
                a_c = "s",
                a_d = "z",
                a_e = "f",
                a_f = "w",
                a_g = "b",
                a_h = "h",
            },
        },
    },
    animations = {
        a_a = {
            animDict = "amb_misc@world_human_stare_stoic@female_a@idle_a",
            anim = "idle_a",
            name = "Look Straight",
        },
        a_b = {
            animDict = "amb_misc@world_human_stare_stoic@female_a@idle_a",
            anim = "idle_b",
            name = "Look Around",
        },
        a_c = {
            animDict = "amb_misc@world_human_stare_stoic@female_a@idle_a",
            anim = "idle_c",
            name = "Stretch Shoulders",
        },
        a_d = {
            animDict = "amb_misc@world_human_stare_stoic@female_a@idle_b",
            anim = "idle_d",
            condition = function() return Conditions.Check({ isMale = false, }) end,
            name = "Fidget Hands",
        },
        a_e = {
            animDict = "amb_misc@world_human_stare_stoic@female_a@idle_b",
            anim = "idle_e",
            name = "Look at Fingernails",
        },
        a_f = {
            animDict = "amb_misc@world_human_stare_stoic@female_a@idle_b",
            anim = "idle_f",
            name = "Wipe Hands",
        },
        a_g = {
            animDict = "amb_misc@world_human_stare_stoic@female_a@idle_c",
            anim = "idle_g",
            name = "Shoulders Back",
        },
        a_h = {
            animDict = "amb_misc@world_human_stare_stoic@female_a@idle_c",
            anim = "idle_h",
            name = "Hands On Hips",
        },
    },
}

AnimLib.wait_impatient_sass = {
    name = "Sassy Impatient",
    tags = { stand=1, },
    key = "s",
    enter = {
        animDict = "amb_misc@world_human_waiting_impatient@female_a@stand_enter",
        anim = "enter_back_rf",
        blendInSpeed = 1.0,
    },
    exit = {
        animDict = "amb_misc@world_human_waiting_impatient@female_a@stand_exit",
        anim = "exit_front",
        duration = 800,
    },
    idles = {
        idle_a = {
            animDict = "amb_misc@world_human_waiting_impatient@female_a@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
            transitions = {
                a_a = "s",
                a_b = "d",
                a_c = "a",
                a_d = "h",
                a_e = "q",
                a_f = "r",
                a_g = "t",
                a_h = "f",
            },
        },
    },
    animations = {
        a_a = {
            animDict = "amb_misc@world_human_waiting_impatient@female_a@idle_a",
            anim = "idle_a",
            name = "Shrug",
        },
        a_b = {
            animDict = "amb_misc@world_human_waiting_impatient@female_a@idle_a",
            anim = "idle_b",
            name = "Look Down",
        },
        a_c = {
            animDict = "amb_misc@world_human_waiting_impatient@female_a@idle_a",
            anim = "idle_c",
            name = "Look Around",
        },
        a_d = {
            animDict = "amb_misc@world_human_waiting_impatient@female_a@idle_b",
            anim = "idle_d",
            name = "Fidget Hands",
        },
        a_e = {
            animDict = "amb_misc@world_human_waiting_impatient@female_a@idle_b",
            anim = "idle_e",
            name = "Scratch Nose",
        },
        a_f = {
            animDict = "amb_misc@world_human_waiting_impatient@female_a@idle_b",
            anim = "idle_f",
            name = "Look Right, Tap Thigh"
        },
        a_g = {
            animDict = "amb_misc@world_human_waiting_impatient@female_a@idle_c",
            anim = "idle_g",
            name = "Tap Thigh",
        },
        a_h = {
            animDict = "amb_misc@world_human_waiting_impatient@female_a@idle_c",
            anim = "idle_h",
            name = "Fidgety"
        },
    },
}

AnimLib.wait_impatient_swing_arms = {
    name = "Swing Arms",
    tags = { stand=1, },
    key = "a",
    enter = {
        animDict = "amb_misc@world_human_waiting_impatient@male_b@stand_enter",
        anim = "enter_back_rf",
        blendInSpeed = 1.0,
    },
    exit = {
        animDict = "amb_misc@world_human_waiting_impatient@male_b@stand_exit",
        anim = "exit_front",
        blendInSpeed = 1.0,
        duration = 1000,
    },
    idles = {
        idle_a = {
            animDict = "amb_misc@world_human_waiting_impatient@male_b@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
            transitions = {
                a_a = "d",
                a_b = "q",
                a_c = "a",
                a_d = "s",
                a_e = "f",
                a_f = "h",
                a_g = "e",
                a_h = "x",
            },
        },
    },
    animations = {
        a_a = {
            animDict = "amb_misc@world_human_waiting_impatient@male_b@idle_a",
            anim = "idle_a",
            name = "Look Down",
        },
        a_b = {
            animDict = "amb_misc@world_human_waiting_impatient@male_b@idle_a",
            anim = "idle_b",
            name = "Look Left",
        },
        a_c = {
            animDict = "amb_misc@world_human_waiting_impatient@male_b@idle_a",
            anim = "idle_c",
            name = "Look Around",
        },
        a_d = {
            animDict = "amb_misc@world_human_waiting_impatient@male_b@idle_b",
            anim = "idle_d",
            name = "Shake Head",
        },
        a_e = {
            animDict = "amb_misc@world_human_waiting_impatient@male_b@idle_b",
            anim = "idle_e",
            name = "Frustrated Searching",
        },
        a_f = {
            animDict = "amb_misc@world_human_waiting_impatient@male_b@idle_b",
            anim = "idle_f",
            name = "Hands On Hips",
        },
        a_g = {
            animDict = "amb_misc@world_human_waiting_impatient@male_b@idle_c",
            anim = "idle_g",
            name = "Scratch Neck",
        },
        a_h = {
            animDict = "amb_misc@world_human_waiting_impatient@male_b@idle_c",
            anim = "idle_h",
            name = "Cross Arms",
        },
    },
}

AnimLib.wait_impatient_wrist_front = {
    name = "Hold Wrist Front",
    tags = { stand=1, },
    key = "f",
    enter = {
        animDict = "amb_misc@world_human_waiting_impatient@male_d@stand_enter",
        anim = "enter_back_rf",
        blendInSpeed = 1.0,
    },
    exit = {
        animDict = "amb_misc@world_human_waiting_impatient@male_d@stand_exit",
        anim = "exit_front",
        duration = 900,
    },
    idles = {
        idle_a = {
            animDict = "amb_misc@world_human_waiting_impatient@male_d@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
            transitions = {
                a_a = "a",
                a_b = "f",
                a_c = "q",
                a_d = "w",
                a_e = "d",
                a_f = "s",
                a_g = "h",
                a_h = "z",
            },
        },
    },
    animations = {
        a_a = {
            animDict = "amb_misc@world_human_waiting_impatient@male_d@idle_a",
            anim = "idle_a",
            name = "Look Left",
        },
        a_b = {
            animDict = "amb_misc@world_human_waiting_impatient@male_d@idle_a",
            anim = "idle_b",
            name = "Frustrated",
        },
        a_c = {
            animDict = "amb_misc@world_human_waiting_impatient@male_d@idle_a",
            anim = "idle_c",
            name = "Look Left Far",
        },
        a_d = {
            animDict = "amb_misc@world_human_waiting_impatient@male_d@idle_b",
            anim = "idle_d",
            name = "Rock Forward",
        },
        a_e = {
            animDict = "amb_misc@world_human_waiting_impatient@male_d@idle_b",
            anim = "idle_e",
            name = "Look Right",
        },
        a_f = {
            animDict = "amb_misc@world_human_waiting_impatient@male_d@idle_b",
            anim = "idle_f",
            name = "Stretch Shoulders",
        },
        a_g = {
            animDict = "amb_misc@world_human_waiting_impatient@male_d@idle_c",
            anim = "idle_g",
            name = "Shake Head",
        },
        a_h = {
            animDict = "amb_misc@world_human_waiting_impatient@male_d@idle_c",
            anim = "idle_h",
            name = "Adjust Right Leg",
        },
    },
}

AnimLib.wait_hands_on_hips = {
    name = "Both Hands On Hips",
    tags = { stand=1, },
    key = "2",
    enter = {
        animDict = "amb_rest@world_human_sternguy@male_a@stand_enter",
        anim = "enter_back_rf",
        blendInSpeed = 1.0,
    },
    exit = {
        animDict = "amb_rest@world_human_sternguy@male_a@stand_exit",
        anim = "exit_front",
        duration = 1500,
    },
    idles = {
        idle_a = {
            animDict = "amb_rest@world_human_sternguy@male_a@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
            transitions = {
                a_a = "r",
                a_b = "h",
                a_c = "d",
                a_d = "s",
                a_e = "x",
                a_f = "q",
                a_g = "t",
                a_h = "e",
            },
        },
    },
    animations = {
        a_a = {
            animDict = "amb_rest@world_human_sternguy@male_a@idle_a",
            anim = "idle_a",
            name = "Look Right",
        },
        a_b = {
            animDict = "amb_rest@world_human_sternguy@male_a@idle_a",
            anim = "idle_b",
            name = "Drop Right Hand",
        },
        a_c = {
            animDict = "amb_rest@world_human_sternguy@male_a@idle_a",
            anim = "idle_c",
            name = "Look Down",
        },
        a_d = {
            animDict = "amb_rest@world_human_sternguy@male_a@idle_b",
            anim = "idle_d",
            name = "Spit Left",
        },
        a_e = {
            animDict = "amb_rest@world_human_sternguy@male_a@idle_b",
            anim = "idle_e",
            name = "Scratch Cheek",
        },
        a_f = {
            animDict = "amb_rest@world_human_sternguy@male_a@idle_b",
            anim = "idle_f",
            name = "Scratch Nose",
        },
        a_g = {
            animDict = "amb_rest@world_human_sternguy@male_a@idle_c",
            anim = "idle_g",
            name = "Twist Left",
        },
        a_h = {
            animDict = "amb_rest@world_human_sternguy@male_a@idle_c",
            anim = "idle_h",
            name = "Scratch Neck",
        },
    },
}

AnimLib.hand_on_revolver = {
    name = "Rest Hand On Revolver",
    tags = { stand=1, },
    key = "r",
    enter = {
        animDict = "amb_misc@world_human_stand_waiting@male_b@stand_enter",
        anim = "enter_back_lf",
        blendInSpeed = 1.0,
        nextBlendInSpeed = 1.0,
        duration = 1000;
    },
    exit = {
        animDict = "mp_lobby@standard@standing@mp_male_d@base",
        anim = "base",
        duration = 500;
        blendInSpeed = 1.0,
        blendOutSpeed = 1.0,
    },
    idles = {
        idle_a = {
            animDict = "mp_lobby@standard@standing@mp_male_d@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
        },
    },
}

AnimLib.hands_on_gunbelt = {
    name = "Rest Hands On Gunbelt",
    tags = { stand=1, },
    key = "g",
    enter = {
        animDict = "amb_rest@world_human_badass@male_a@stand_enter",
        anim = "enter_back_rf",
        blendInSpeed = 1.0,
        nextBlendInSpeed = 1.0,
        duration = 400,
    },
    exit = {
        animDict = "amb_rest@world_human_badass@male_a@stand_exit",
        anim = "exit_front",
        blendInSpeed = 1.0,
        duration = 500,
    },
    idles = {
        idle_a = {
            animDict = "mp_lobby@standard@standing@mp_male_b@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
        },
    },
}

AnimLib.lean_on_leg_up = {
    name = "Lean on Leg Up",
    tags = { stand=1, },
    key = "e",
    enter = {
        animDict = "mp_lobby@standard@standing@mp_male_e@base",
        anim = "base",
        blendInSpeed = 1.0,
        nextBlendInSpeed = 1.0,
        duration = 400,
    },
    exit = {
        animDict = "mp_lobby@standard@standing@mp_male_e@base",
        anim = "base",
        duration = 50,
        blendOutSpeed = 1.0,
    },
    idles = {
        idle_a = {
            animDict = "mp_lobby@standard@standing@mp_male_e@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
        },
    },
}

AnimLib.warm_by_fire_f = {
    name = "Warm By Fire",
    tags = {
        stand = 1,
        fire = { name = "Stand Warming" },
    },
    key = "w",
    condition = function() return Conditions.Check({ isMale = false, }) end,
    enter = {
        animDict = "amb_camp@world_human_fire_stand@female_a@stand_enter",
        anim = "enter_back_rf",
        blendInSpeed = 1.0,
    },
    exit = {
        animDict = "amb_camp@world_human_fire_stand@female_a@stand_exit",
        anim = "exit_front",
        duration = 4000,
    },
    idles = {
        idle_a = {
            animDict = "amb_camp@world_human_fire_stand@female_a@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
            transitions = {
                a_a = "b",
                a_b = "x",
                a_c = "s",
                a_d = "q",
                a_e = "a",
                a_f = "f",
                a_g = "w",
            },
        },
    },
    animations = {
        a_a = {
            animDict = "amb_camp@world_human_fire_stand@female_a@idle_a",
            anim = "idle_a",
            name = "Blow on Hands",
        },
        a_b = {
            animDict = "amb_camp@world_human_fire_stand@female_a@idle_a",
            anim = "idle_b",
            name = "Cough",
        },
        a_c = {
            animDict = "amb_camp@world_human_fire_stand@female_a@idle_a",
            anim = "idle_c",
            name = "Scuff Right Shoe",
        },
        a_d = {
            animDict = "amb_camp@world_human_fire_stand@female_a@idle_b",
            anim = "idle_d",
            name = "Scratch Neck",
        },
        a_e = {
            animDict = "amb_camp@world_human_fire_stand@female_a@idle_b",
            anim = "idle_e",
            name = "Lean Away, Swat",
        },
        a_f = {
            animDict = "amb_camp@world_human_fire_stand@female_a@idle_b",
            anim = "idle_f",
            name = "Swat Air, Cover Face",
        },
        a_g = {
            animDict = "amb_camp@world_human_fire_stand@female_a@idle_c",
            anim = "idle_g",
            name = "Warm Hands Over Fire",
        },
    },
}

AnimLib.warm_by_fire = {
    name = "Warm By Fire",
    tags = {
        stand = 1,
        fire = { name = "Stand Warming" },
    },
    key = "w",
    condition = function() return Conditions.Check({ isMale = true, }) end,
    enter = {
        animDict = "amb_camp@world_human_fire_stand@male_a@stand_enter",
        anim = "enter_back_rf",
        blendInSpeed = 1.0,
    },
    exit = {
        animDict = "amb_camp@world_human_fire_stand@male_a@stand_exit",
        anim = "exit_front",
        duration = 700,
    },
    idles = {
        idle_a = {
            animDict = "amb_camp@world_human_fire_stand@male_a@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
            transitions = {
                a_a = "a",
                -- a_b = "2",
                a_c = "s",
                a_d = "w",
                a_e = "d",
                a_f = "h",
                a_g = "z",
            },
        },
    },
    animations = {
        a_a = {
            animDict = "amb_camp@world_human_fire_stand@male_a@idle_a",
            anim = "idle_a",
            name = "Look Around",
        },
        -- a_b = {
        --     animDict = "amb_camp@world_human_fire_stand@male_a@idle_a",
        --     anim = "idle_b",
        --     name = "Look Around 2"
        -- },
        a_c = {
            animDict = "amb_camp@world_human_fire_stand@male_a@idle_a",
            anim = "idle_c",
            name = "Sway Hips",
        },
        a_d = {
            animDict = "amb_camp@world_human_fire_stand@male_a@idle_b",
            anim = "idle_d",
            name = "Warm Feet",
        },
        a_e = {
            animDict = "amb_camp@world_human_fire_stand@male_a@idle_b",
            anim = "idle_e",
            name = "Sway Side to Side",
        },
        a_f = {
            animDict = "amb_camp@world_human_fire_stand@male_a@idle_b",
            anim = "idle_f",
            name = "Stretch Hips",
        },
        a_g = {
            animDict = "amb_camp@world_human_fire_stand@male_a@idle_c",
            anim = "idle_g",
            name = "Face Left",
        },
    },
}

-- Gunslinger Stances
-- mp_lobby@coop@standing@mp_female_a@base
-- mp_lobby@coop@standing@mp_female_b@base
