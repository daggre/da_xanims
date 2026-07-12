AnimLib.point = {
    name = "Point",
    tags = { root = 1 },
    key = "x",
    condition = function()
        return Conditions.Check({ onMount = allow })
    end,
    enter = {
        animDict = "ai_react@point@base",
        anim = "point_fwd",
        blendInSpeed = 1.6,
        duration = 200,
        flag = AnimConfig.Flag.MoveHigh,
        taskFilter = "headneckandrightarm_filter",
    },
    exit = {
        animDict = "ai_react@point@base",
        anim = "point_fwd",
        flag = AnimConfig.Flag.MoveHigh,
        blendOutSpeed = -1.6,
        duration = 100,
        taskFilter = "headneckandrightarm_filter",
    },
    idles = {
        idle_point = {
            animDict = "ai_react@point@base",
            anim = "point_fwd",
            flag = AnimConfig.Flag.MoveLoop,
            taskFilter = "rightarmonly_filter",
        },
    },
}

-- Talk Neg
AnimLib.gesticulate_angry_punctuate1 = {
    name = "Open arms",
    tags = { talk_negative = 1 },
    key = "q",
    condition = function()
        return Conditions.Check({ onMount = allow })
    end,
    enter = {
        animDict = "ai_gestures@arthur@standing@speaker@rt_hand",
        anim = "aggressive_punctuate_f_001",
        flag = AnimConfig.Flag.MoveHigh,
        duration = 1000,
        blendInSpeed = 1.0,
    },
}

AnimLib.gesticulate_apology = {
    name = "My Bad",
    tags = { talk_negative = 1 },
    key = "b",
    condition = function()
        return Conditions.Check({ onMount = allow })
    end,
    enter = {
        animDict = "ai_gestures@arthur@standing@speaker@rt_hand",
        anim = "mild_apologies_f_001",
        flag = AnimConfig.Flag.MoveHigh,
        duration = 1000,
        blendInSpeed = 1.0,
    },
}

AnimLib.gesticulate_point_disagree = {
    name = "Wait, No",
    tags = { talk_negative = 1 },
    key = "w",
    condition = function()
        return Conditions.Check({ onMount = allow })
    end,
    enter = {
        animDict = "ai_gestures@arthur@standing@speaker@rt_hand@prop_rt",
        anim = "stern_punctuate_f_001",
        flag = AnimConfig.Flag.MoveHigh,
        duration = 1400,
        blendInSpeed = 1.0,
    },
}

AnimLib.gesture_angry_point = {
    name = "Angry Point",
    tags = { talk_negative = 1 },
    key = "x",
    condition = function()
        return Conditions.Check({ onMount = allow })
    end,
    enter = {
        animDict = "ai_gestures@arthur@standing@speaker",
        anim = "angry_point_r_002",
        flag = AnimConfig.Flag.MoveHigh,
        taskFilter = "headneckandrightarm_filter",
        blendInSpeed = 1.0,
        duration = 1500,
    },
}

AnimLib.gesture_move_along = {
    name = "Go Away",
    tags = { talk_negative = 1 },
    key = "g",
    condition = function()
        return Conditions.Check({ onMount = allow })
    end,
    enter = {
        animDict = "ai_gestures@arthur@standing@speaker",
        anim = "annoyed_dismiss_l_003",
        flag = AnimConfig.Flag.MoveHigh,
        blendInSpeed = 1.0,
        duration = 700,
        taskFilter = "headneckandleftarm_filter",
    },
}

AnimLib.gesture_subtle_left = {
    name = "On One Hand",
    tags = { talk_negative = 1, talk_positive = 1 },
    key = "1",
    condition = function()
        return Conditions.Check({ onMount = allow })
    end,
    enter = {
        animDict = "ai_gestures@arthur@standing@speaker",
        anim = "confused_punctuate_l_002",
        blendInSpeed = 1.0,
        duration = 1500,
        flag = AnimConfig.Flag.MoveHigh,
    },
}

AnimLib.gesture_subtle_right = {
    name = "On The Other Hand",
    tags = { talk_negative = 1, talk_positive = 1 },
    key = "2",
    condition = function()
        return Conditions.Check({ onMount = allow })
    end,
    enter = {
        animDict = "ai_gestures@arthur@standing@speaker",
        anim = "confused_punctuate_r_002",
        blendInSpeed = 1.0,
        duration = 1500,
        flag = AnimConfig.Flag.MoveHigh,
    },
}

AnimLib.gesture_defeated = {
    name = "Give up",
    tags = { talk_negative = 1 },
    key = "a",
    condition = function()
        return Conditions.Check({ onMount = allow })
    end,
    enter = {
        animDict = "ai_gestures@arthur@standing@speaker",
        anim = "frustrated_punctuate_f_006",
        blendInSpeed = 1.0,
        flag = AnimConfig.Flag.MoveHigh,
        duration = 800,
    },
}

AnimLib.gesture_confused = {
    name = "Confused",
    tags = { talk_negative = 1, react = 1 },
    key = "z",
    enter = {
        animDict = "ai_gestures@gen_female@standing@no_english",
        anim = "guarma_confused_what_f_002",
        flag = AnimConfig.Flag.MoveHigh,
        blendInSpeed = 1.0,
        duration = 800,
    },
}

AnimLib.gesture_disagree = {
    name = "Not Part Of This",
    tags = { talk_negative = 1 },
    key = "v",
    condition = function()
        return Conditions.Check({ onMount = allow })
    end,
    enter = {
        animDict = "ai_gestures@arthur@standing@speaker",
        anim = "negative_disagree_f_001",
        flag = AnimConfig.Flag.MoveHigh,
        blendInSpeed = 1.0,
        duration = 2000,
    },
}

AnimLib.gesture_point_self = {
    name = "Point Self",
    tags = { talk_negative = 1 },
    key = "3",
    condition = function()
        return Conditions.Check({ onMount = allow })
    end,
    enter = {
        animDict = "ai_gestures@john@standing@speaker",
        anim = "john_negative_pointself_r_001",
        blendInSpeed = 1.0,
        duration = 2000,
        flag = AnimConfig.Flag.MoveHigh,
        taskFilter = "headneckandrightarm_filter",
    },
}

AnimLib.gesture_dismiss = {
    name = "Nod Disbelief",
    tags = { talk_negative = 1 },
    key = "d",
    condition = function()
        return Conditions.Check({ onMount = allow })
    end,
    enter = {
        animDict = "ai_gestures@arthur@standing@speaker",
        anim = "frustrated_dismiss_r_001",
        blendInSpeed = 1.0,
        duration = 2100,
        flag = AnimConfig.Flag.MoveHigh,
        taskFilter = "headneckandrightarm_filter",
    },
}

AnimLib.gesture_pleading = {
    name = "Explain Pleading",
    tags = { talk_negative = 1 },
    key = "4",
    condition = function()
        return Conditions.Check({ onMount = allow })
    end,
    enter = {
        animDict = "script_story@trn1@ig@trn1_walk_and_talk",
        anim = "athr_dtch_02_desperate_foolish_dutch",
        blendInSpeed = 1.0,
        duration = 3000,
        flag = AnimConfig.Flag.MoveHigh,
    },
}

-- Talk Positive
AnimLib.gesticulate_neutral_appease = {
    name = "Hands Explain",
    tags = { talk_positive = 1 },
    key = "q",
    condition = function()
        return Conditions.Check({ onMount = allow })
    end,
    enter = {
        animDict = "ai_gestures@arthur@standing@speaker",
        anim = "neutral_appease_f_003",
        blendInSpeed = 1.0,
        duration = 1800,
        flag = AnimConfig.Flag.MoveHigh,
    },
}

AnimLib.gesticulate_defensive_appease = {
    name = "Appease",
    tags = { talk_negative = 1 },
    key = "e",
    condition = function()
        return Conditions.Check({ onMount = allow })
    end,
    enter = {
        animDict = "ai_gestures@arthur@standing@speaker",
        anim = "defensive_appease_f_001",
        duration = 1100,
        blendInSpeed = 1.0,
        flag = AnimConfig.Flag.MoveHigh,
    },
}

AnimLib.gesticulate_point_defer = {
    name = "Point Defer",
    tags = { talk_positive = 1 },
    key = "d",
    condition = function()
        return Conditions.Check({ onMount = allow })
    end,
    enter = {
        animDict = "ai_gestures@arthur@standing@speaker@rt_hand@prop_rt",
        anim = "neutral_punctuate_r_018",
        flag = AnimConfig.Flag.MoveHigh,
        taskFilter = "headneckandrightarm_filter",
        duration = 1500,
        blendInSpeed = 1.0,
    },
}

AnimLib.gesture_thank = {
    name = "Thank you!",
    tags = { talk_positive = 1 },
    key = "t",
    condition = function()
        return Conditions.Check({ onMount = allow })
    end,
    enter = {
        animDict = "ai_gestures@gen_male@standing@speaker",
        anim = "thank_you_f_002",
        blendInSpeed = 1.0,
        duration = 2000,
        flag = AnimConfig.Flag.MoveHigh,
    },
}

AnimLib.gesture_punctuate1 = {
    name = "Punctuate Quick",
    tags = { talk_positive = 1 },
    key = "w",
    condition = function()
        return Conditions.Check({ onMount = allow })
    end,
    enter = {
        animDict = "ai_gestures@arthur@standing@speaker",
        anim = "positive_punctuate_r_010",
        blendInSpeed = 1.0,
        duration = 700,
        flag = AnimConfig.Flag.MoveHigh,
        taskFilter = "headneckandrightarm_filter",
    },
}

AnimLib.gesture_pointdown = {
    name = "Point Down",
    tags = { talk_positive = 1 },
    key = "a",
    condition = function()
        return Conditions.Check({ onMount = allow })
    end,
    enter = {
        animDict = "ai_gestures@arthur@standing@speaker",
        anim = "stern_pointdown_l_001",
        blendInSpeed = 1.0,
        duration = 1000,
        flag = AnimConfig.Flag.MoveHigh,
        taskFilter = "headneckandleftarm_filter",
    },
}

AnimLib.gesture_lefthand = {
    name = "Explain Left",
    tags = { talk_positive = 1 },
    key = "e",
    condition = function()
        return Conditions.Check({ onMount = allow })
    end,
    enter = {
        animDict = "ai_gestures@arthur@standing@speaker",
        anim = "stern_punctuate_l_002",
        blendInSpeed = 1.0,
        duration = 2000,
        flag = AnimConfig.Flag.MoveHigh,
        taskFilter = "headneckandleftarm_filter",
    },
}

AnimLib.gesture_righthand = {
    name = "Explain Right",
    tags = { talk_positive = 1 },
    key = "r",
    condition = function()
        return Conditions.Check({ onMount = allow })
    end,
    enter = {
        animDict = "ai_gestures@arthur@standing@speaker",
        anim = "stern_punctuate_r_002",
        blendInSpeed = 1.0,
        duration = 2000,
        flag = AnimConfig.Flag.MoveHigh,
        taskFilter = "headneckandrightarm_filter",
    },
}

AnimLib.gesture_right_tilthead = {
    name = "Gesture Right Linger",
    tags = { talk_positive = 1 },
    key = "z",
    condition = function()
        return Conditions.Check({ onMount = allow })
    end,
    enter = {
        animDict = "ai_gestures@arthur@standing@speaker",
        anim = "stern_punctuate_r_006",
        blendInSpeed = 1.0,
        duration = 1500,
        flag = AnimConfig.Flag.MoveHigh,
        taskFilter = "headneckandrightarm_filter",
    },
}

AnimLib.longgesture_finger_right = {
    name = "Right Pointer Long",
    tags = { talk_positive = 1 },
    key = "v",
    enter = {
        animDict = "script_story@sen1@ig@ig1_walk_to_horses",
        anim = "josiah_walk'n'talk",
        blendInSpeed = 1.0,
        duration = 7000,
        flag = AnimConfig.Flag.Move,
        taskFilter = "headneckandrightarm_filter",
    },
}

-- React
AnimLib.react_disgusted = {
    name = "Scowl Scoff",
    tags = { react = 1 },
    key = "x",
    condition = function()
        return Conditions.Check({ onMount = allow })
    end,
    enter = {
        animDict = "ai_react@react_look_layers@base_emotions@generic@male_a@idle_b",
        anim = "idle_e",
        flag = AnimConfig.Flag.MoveHigh,
        blendInSpeed = 1.0,
        duration = 4000,
    },
}

AnimLib.gesture_shrug = {
    name = "Shrug",
    tags = { react = 1, talk_negative = 1 },
    key = "s",
    condition = function()
        return Conditions.Check({ onMount = allow })
    end,
    enter = {
        animDict = "ai_gestures@john@standing@speaker",
        anim = "john_neutral_shrug_f_001",
        flag = AnimConfig.Flag.MoveHigh,
        blendInSpeed = 1.0,
        duration = 1000,
    },
}

AnimLib.gesture_shrug_stern = {
    name = "Stern Shrug",
    tags = { react = 1, talk_negative = 1 },
    key = "t",
    condition = function()
        return Conditions.Check({ onMount = allow })
    end,
    enter = {
        animDict = "ai_gestures@gen_female@standing@speaker",
        anim = "stern_shrug_f_001",
        flag = AnimConfig.Flag.MoveHigh,
        blendInSpeed = 1.0,
        duration = 400,
    },
}

AnimLib.gesture_disbelief = {
    name = "Disbelief",
    tags = { react = 1 },
    key = "d",
    condition = function()
        return Conditions.Check({ onMount = allow })
    end,
    enter = {
        animDict = "ai_gestures@arthur@standing@speaker",
        anim = "frustrated_disbelieve_l_001",
        blendInSpeed = 1.0,
        flag = AnimConfig.Flag.MoveHigh,
        duration = 400,
    },
}

AnimLib.gesture_nod_positive = {
    name = "Nod Agree",
    tags = { react = 1 },
    key = "n",
    condition = function()
        return Conditions.Check({ onMount = allow })
    end,
    enter = {
        animDict = "ai_gestures@gen_male@standing@speaker",
        anim = "positive_nod_f_001",
        blendInSpeed = 1.0,
        flag = AnimConfig.Flag.MoveHigh,
    },
}

AnimLib.gesture_headshake_empathetic = {
    name = "Head Shake",
    tags = { react = 1 },
    key = "q",
    condition = function()
        return Conditions.Check({ onMount = allow })
    end,
    enter = {
        animDict = "ai_gestures@gen_male@standing@speaker",
        anim = "empathise_headshake_f_001",
        blendInSpeed = 1.0,
        flag = AnimConfig.Flag.MoveHigh,
        taskFilter = "headonly_filter",
        duration = 2300,
    },
}

AnimLib.gesture_stop = {
    name = "Stop",
    tags = { react = 1 },
    key = "f",
    condition = function()
        return Conditions.Check({ onMount = allow })
    end,
    enter = {
        animDict = "ai_gestures@gen_male@standing@silent",
        anim = "silent_defensive_punctuate_l_002",
        duration = 1000,
        blendInSpeed = 1.0,
        flag = AnimConfig.Flag.MoveHigh,
        taskFilter = "headneckandleftarm_filter",
    },
}

-- Signal Right
AnimLib.signal_stop_point_r = {
    name = "Stop, Point",
    tags = { signal_right = 1 },
    key = "s",
    condition = function()
        return Conditions.Check({ onMount = allow })
    end,
    enter = {
        animDict = "ai_gestures@gen_male@standing@silent@script@bounty_hunters@rt_hand",
        anim = "bh_that_way_l_001",
        flag = AnimConfig.Flag.MoveHigh,
        taskFilter = "headneckandrightarm_filter",
        blendInSpeed = 1.0,
        duration = 2500,
    },
}

AnimLib.signal_stop_r = {
    name = "Stop",
    tags = { signal_right = 1 },
    key = "x",
    condition = function()
        return Conditions.Check({ onMount = allow })
    end,
    enter = {
        animDict = "ai_gestures@gen_male@standing@silent@script@bounty_hunters@rt_hand",
        anim = "bh_that_way_l_001",
        flag = AnimConfig.Flag.MoveHigh,
        taskFilter = "headneckandrightarm_filter",
        blendInSpeed = 1.0,
        duration = 750,
    },
}

AnimLib.signal_point_r = {
    name = "Point",
    tags = { signal_right = 1 },
    key = "e",
    condition = function()
        return Conditions.Check({ onMount = allow })
    end,
    enter = {
        animDict = "ai_gestures@gen_male@standing@silent@script@bounty_hunters@rt_hand",
        anim = "bh_that_way_l_002",
        flag = AnimConfig.Flag.MoveHigh,
        taskFilter = "headneckandrightarm_filter",
        blendInSpeed = 1.0,
        duration = 1800,
    },
}

AnimLib.herding_point_right = {
    name = "Point Right",
    tags = { signal_right = 1 },
    key = "1",
    condition = function()
        return Conditions.Check({ onMount = allow })
    end,
    enter = {
        animDict = "veh_horseback@seat_saddle@generic@herding@point@1h@right",
        anim = "right_hand_point_01",
        flag = AnimConfig.Flag.MoveHigh,
        taskFilter = "headneckandrightarm_filter",
        blendInSpeed = 0.5,
    },
}

AnimLib.herding_point_left = {
    name = "Point Left",
    tags = { signal_left = 1 },
    key = "1",
    condition = function()
        return Conditions.Check({ onMount = allow })
    end,
    enter = {
        animDict = "veh_horseback@seat_saddle@generic@herding@point@1h@left",
        anim = "left_hand_point_01",
        flag = AnimConfig.Flag.MoveHigh,
        taskFilter = "headneckandleftarm_filter",
        blendInSpeed = 0.5,
    },
}

AnimLib.signal_onward = {
    name = "Forward, High",
    tags = { signal_right = 1 },
    key = "t",
    condition = function()
        return Conditions.Check({
            onMount = allow,
            hasWeapon = allow,
            hasPrimaryWeapon = allow,
            hasPrimaryLongarm = false,
            hasSecondaryWeapon = allow,
        })
    end,
    enter = {
        animDict = "veh_horseback@seat_saddle@generic@herding@point@1h@front",
        anim = "right_hand_point_01",
        blendInSpeed = 1.0,
        flag = AnimConfig.Flag.MoveHigh,
        taskFilter = "headneckandrightarm_filter",
        duration = 500,
    },
}

-- Signal Left
AnimLib.signal_stop_point_l = {
    name = "Stop, Point",
    tags = { signal_left = 1 },
    key = "s",
    condition = function()
        return Conditions.Check({ onMount = allow })
    end,
    enter = {
        animDict = "ai_gestures@gen_male@standing@silent@script@bounty_hunters@lt_hand",
        anim = "bh_that_way_r_001",
        flag = AnimConfig.Flag.MoveHigh,
        taskFilter = "headneckandleftarm_filter",
        blendInSpeed = 1.0,
        duration = 2500,
    },
}

AnimLib.signal_stop_l = {
    name = "Halt",
    tags = { signal_left = 1 },
    key = "z",
    condition = function()
        return Conditions.Check({ onMount = allow })
    end,
    enter = {
        animDict = "ai_gestures@gen_male@standing@silent@script@bounty_hunters@lt_hand",
        anim = "bh_that_way_r_001",
        flag = AnimConfig.Flag.MoveHigh,
        taskFilter = "headneckandleftarm_filter",
        blendInSpeed = 1.0,
        duration = 750,
    },
}

AnimLib.signal_point_l = {
    name = "Point",
    tags = { signal_left = 1 },
    key = "e",
    condition = function()
        return Conditions.Check({ onMount = allow })
    end,
    enter = {
        animDict = "ai_gestures@gen_male@standing@silent@script@bounty_hunters@lt_hand",
        anim = "bh_that_way_r_002",
        flag = AnimConfig.Flag.MoveHigh,
        taskFilter = "headneckandleftarm_filter",
        blendInSpeed = 1.0,
        duration = 1800,
    },
}

AnimLib.signal_come_here = {
    name = "Come Here",
    tags = { signal_right = 1 },
    key = "q",
    condition = function()
        return Conditions.Check({ onMount = allow })
    end,
    enter = {
        animDict = "ai_gestures@john@standing@speaker",
        anim = "john_neutral_comehere_r_001",
        blendInSpeed = 1.0,
        duration = 1000,
        flag = AnimConfig.Flag.MoveHigh,
        taskFilter = "headneckandrightarm_filter",
    },
}

AnimLib.nod_point_back_left = {
    name = "Nod Back Left",
    tags = { signal_left = 1 },
    key = "d",
    enter = {
        animDict = "ai_gestures@gen_male@standing@speaker",
        anim = "neutral_nod_bl_001",
        blendInSpeed = 1.0,
        duration = 500,
        flag = AnimConfig.Flag.MoveHigh,
        taskFilter = "headneckandleftarm_filter",
    },
}

AnimLib.nod_point_back_right = {
    name = "Nod Back Right",
    tags = { signal_right = 1 },
    key = "d",
    enter = {
        animDict = "ai_gestures@gen_male@standing@speaker",
        anim = "neutral_nod_br_001",
        blendInSpeed = 1.0,
        duration = 500,
        flag = AnimConfig.Flag.MoveHigh,
        taskFilter = "headneckandrightarm_filter",
    },
}

AnimLib.left_hand_whip = {
    name = "Forward, Low",
    tags = { signal_right = 1 },
    condition = function() return Conditions.Check({ onMount = true }) end,
    key = "f",
    enter = {
        animDict = "veh_horseback@seat_saddle@generic@herding@whip@1h@front",
        anim = "left_hand_whip_01",
        blendInSpeed = 1.0,
        duration = 800,
        flag = AnimConfig.Flag.MoveHigh,
        taskFilter = "bonemask_head_neck_and_arms",
    },
}

AnimLib.shush = {
    name = "Shush",
    tags = { react = 1 },
    key = "r",
    enter = {
        animDict = "script_mp@emotes@hush_your_mouth@male@unarmed@full",
        anim = "fullbody_alt_2",
        blendInSpeed = 1.0,
        duration = 1000,
        flag = AnimConfig.Flag.MoveHigh,
    },
}

AnimLib.rps_rock = {
    name = "Rock",
    tags = { rock_paper_scissors = 1 },
    key = "r",
    condition = function() return Conditions.Check({ onMount = allow }) end,
    enter = {
        animDict = "script_mp@emotes@rock_paper_scissors@male@unarmed@full",
        anim = "fullbody",
        flag = AnimConfig.Flag.MoveHigh,
    },
}

AnimLib.rps_paper = {
    name = "Paper",
    tags = { rock_paper_scissors = 1 },
    key = "q",
    condition = function() return Conditions.Check({ onMount = allow }) end,
    enter = {
        animDict = "script_mp@emotes@rock_paper_scissors@male@unarmed@full",
        anim = "fullbody_alt1",
        flag = AnimConfig.Flag.MoveHigh,
    },
}

AnimLib.rps_scissors = {
    name = "Scissors",
    tags = { rock_paper_scissors = 1 },
    key = "s",
    condition = function() return Conditions.Check({ onMount = allow }) end,
    enter = {
        animDict = "script_mp@emotes@rock_paper_scissors@male@unarmed@full",
        anim = "fullbody_alt2",
        flag = AnimConfig.Flag.MoveHigh,
    },
}

AnimLib.rps = {
    name = "Ready",
    tags = { rock_paper_scissors = 1 },
    key = "z",
    condition = function() return Conditions.Check({ onMount = allow }) end,
    enter = {},
    idles = {
        idle_a = {
            transitions = {
                rock = "r",
                paper = "q",
                scissors = "s",
            }
        }
    },
    exit = {},
    animations = {
        rock = {
            animDict = "script_mp@emotes@rock_paper_scissors@male@unarmed@full",
            anim = "fullbody",
            flag = AnimConfig.Flag.MoveHigh,
        },
        paper = {
            animDict = "script_mp@emotes@rock_paper_scissors@male@unarmed@full",
            anim = "fullbody_alt1",
            flag = AnimConfig.Flag.MoveHigh,
        },
        scissors = {
            animDict = "script_mp@emotes@rock_paper_scissors@male@unarmed@full",
            anim = "fullbody_alt2",
            flag = AnimConfig.Flag.MoveHigh,
        },
    }
}


