--- Copyright © 2024 Joshua Nelson


-- Hostage
AnimLib.handsup = {
    name = "Hands Up",
    tags = {
        hostage = 1,
        root = { key = "u" }
    },
    key = "h",
    condition = function() return Conditions.Check({ onMount = allow }) end,
    enter = {
        animDict = "mech_loco_f@generic@reaction@handsup@unarmed@normal",
        anim = "intro",
        blendInSpeed = 1.0,
        nextBlendInSpeed = 1.0,
        playbackRate = 0.7,
        flag = AnimConfig.Flag.Move,
    },
    exit = {
        animDict = "mech_loco_f@generic@reaction@handsup@unarmed@normal",
        anim = "outro",
        duration = 800,
        blendInSpeed = 1.0,
        playbackRate = 1.3,
        flag = AnimConfig.Flag.Move,
    },
    idles = {
        idle_a = {
            animDict = "mech_loco_f@generic@reaction@handsup@unarmed@normal",
            anim = "loop",
            flag = AnimConfig.Flag.MoveLoop,
            transitions = {
                trans_relax = "r",
                trans_high = "h",
                trans_handshead = "z",
            }
        },
    },
    animations = {
        trans_relax = {
            animDict = "mech_loco_m@generic@reaction@handsup@unarmed@tough",
            anim = "loop",
            animLibName = "handsup_relax",
            next = "idle_a",
            blendInSpeed = 0.7,
            flag = AnimConfig.Flag.Move,
            name = "Relax",
        },
        trans_high = {
            animDict = "script_proc@robberies@shop@rhodes@gunsmith@inside_upstairs",
            anim = "handsup_register_owner",
            animLibName = "handsup_high",
            next = "idle_a",
            blendInSpeed = 0.7,
            flag = AnimConfig.Flag.Move,
            name = "High",
        },
        trans_handshead = {
            animDict = "mech_busted@unapproved",
            anim = "idle_2_hands_up",
            animLibName = "hands_on_head_kneel",
            next = "idle_a",
            blendInSpeed = 1.4,
            name = "Hands On Head Kneel",
            duration = 2800,
            nextBlendInSpeed = 0.8,
            condition = function() return Conditions.Check({ onMount = false, }) end,
        },
    },
}

AnimLib.handsup_high = {
    name = "Hands Up High",
    tags = {},
    key = "h",
    condition = function() return Conditions.Check({ onMount = allow }) end,
    enter = {
        animDict = "mech_loco_f@generic@reaction@handsup@unarmed@normal",
        anim = "intro",
        blendInSpeed = 1.0,
        nextBlendInSpeed = 1.0,
        playbackRate = 0.7,
        flag = AnimConfig.Flag.Move,
    },
    exit = {
        animDict = "mech_loco_f@generic@reaction@handsup@unarmed@normal",
        anim = "outro",
        duration = 800,
        blendInSpeed = 1.0,
        playbackRate = 1.3,
        flag = AnimConfig.Flag.Move,
    },
    idles = {
        idle_a = {
            animDict = "script_proc@robberies@shop@rhodes@gunsmith@inside_upstairs",
            anim = "handsup_register_owner",
            flag = AnimConfig.Flag.MoveLoop,
            transitions = {
                trans_relax = "r",
                trans_handsup = "a",
                trans_handshead = "z",
            }
        },
    },
    animations = {
        trans_relax = {
            animDict = "mech_loco_m@generic@reaction@handsup@unarmed@tough",
            anim = "loop",
            animLibName = "handsup_relax",
            next = "idle_a",
            blendInSpeed = 0.7,
            flag = AnimConfig.Flag.Move,
            name = "Relax",
        },
        trans_handsup = {
            animDict = "mech_loco_f@generic@reaction@handsup@unarmed@normal",
            anim = "loop",
            animLibName = "handsup",
            next = "idle_a",
            blendInSpeed = 0.7,
            flag = AnimConfig.Flag.Move,
            name = "Close",
        },
        trans_handshead = {
            animDict = "mech_busted@unapproved",
            anim = "idle_2_hands_up",
            animLibName = "hands_on_head_kneel",
            next = "idle_a",
            blendInSpeed = 1.4,
            name = "Hands On Head Kneel",
            duration = 2800,
            nextBlendInSpeed = 0.8,
            condition = function() return Conditions.Check({ onMount = false, }) end,
        },
    },
}

AnimLib.handsup_relax = {
    name = "Hands Up Tough",
    tags = {},
    key = "t",
    condition = function() return Conditions.Check({ onMount = allow }) end,
    enter = {
        animDict = "mech_loco_m@generic@reaction@handsup@unarmed@tough",
        anim = "intro",
        blendInSpeed = 1.0,
        flag = AnimConfig.Flag.Move,
    },
    exit = {
        animDict = "mech_loco_m@generic@reaction@handsup@unarmed@tough",
        anim = "outro",
        blendInSpeed = 1.0,
        duration = 800,
        flag = AnimConfig.Flag.Move,
    },
    idles = {
        idle_a = {
            animDict = "mech_loco_m@generic@reaction@handsup@unarmed@tough",
            anim = "loop",
            flag = AnimConfig.Flag.MoveLoop,
            transitions = {
                trans_high = "h",
                trans_handsup = "a",
            }
        },
    },
    animations = {
        trans_high = {
            animDict = "script_proc@robberies@shop@rhodes@gunsmith@inside_upstairs",
            anim = "handsup_register_owner",
            animLibName = "handsup_high",
            next = "idle_a",
            blendInSpeed = 0.7,
            flag = AnimConfig.Flag.Move,
            name = "High",
        },
        trans_handsup = {
            animDict = "mech_loco_f@generic@reaction@handsup@unarmed@normal",
            anim = "loop",
            animLibName = "handsup",
            next = "idle_a",
            blendInSpeed = 0.7,
            flag = AnimConfig.Flag.Move,
            name = "Close",
        },
    },
}


AnimLib.hands_on_head_kneel = {
    name = "Hands On Head Kneel",
    tags = { hostage=1, },
    key = "z",
    enter = {
        animDict = "mech_busted@unapproved",
        anim = "idle_2_hands_up",
        blendInSpeed = 1.0,
        duration = 2800,
        nextBlendInSpeed = 0.8,
    },
    exit = {
        animDict = "mech_busted@unapproved",
        anim = "hands_up_2_idle",
        duration = 1700,
    },
    idles = {
        idle_a = {
            animDict = "mech_busted@unapproved",
            anim = "idle_a",
            flag = AnimConfig.Flag.Loop,
        },
    },
}

AnimLib.hands_tied = {
    name = "Hands Tied",
    tags = { hostage=1, },
    key = "t",
    enter = {
        animDict = "mini_hostage",
        anim = "gped_host_sit_idl",
        flag = AnimConfig.Flag.UpperBody,
        blendInSpeed = 1.0,
        duration = 1000,
    },
    exit = {
        animDict = "mini_hostage",
        anim = "gped_host_sit_post",
        flag = AnimConfig.Flag.UpperBody,
    },
    idles = {
        idle_stand = {
            animDict = "mini_hostage",
            anim = "gped_host_sit_idl",
            flag = AnimConfig.Flag.MoveLoop,
            transitions = {
                trans_knl = "z",
                trans_sit = "s",
            },
            idleAnimConfig = { .allowWeapon, }
        },
    },
    animations = {
        trans_knl = {
            animDict = "mini_hostage",
            anim = "gped_host_knl_pre",
            animLibName = "hands_tied_kneel",
            next = "idle_kneel",
            name = "Kneel",
        },
        trans_sit = {
            animDict = "mini_hostage",
            anim = "gped_host_sit_pre",
            animLibName = "hands_tied_sit",
            next = "idle_sit",
            name = "Sit",
        },
    },
}

AnimLib.hands_tied_kneel = {
    name = "Hands Tied Kneeling",
    tags = {},
    key = "1",
    enter = {
        animDict = "mini_hostage",
        anim = "gped_host_knl_pre",
        blendInSpeed = 1.0,
    },
    exit = {
        animDict = "mini_hostage",
        anim = "gped_host_knl_pst",
        duration = 11000,
    },
    idles = {
        idle_kneel = {
            animDict = "mini_hostage",
            anim = "gped_host_knl_idl",
            flag = AnimConfig.Flag.Loop,
            transitions = {
                trans_std = "q",
                trans_sit = "s",
            },
        },
    },
    animations = {
        a_kneel = {
            animDict = "mini_hostage",
            anim = "gped_host_knl_pre",
            next = "idle_kneel",
        },
        trans_std = {
            animDict = "mini_hostage",
            anim = "gped_host_knl_stn",
            animLibName = "hands_tied",
            next = "idle_stand",
            name = "Stand",
        },
        trans_sit = {
            animDict = "mini_hostage",
            anim = "gped_host_knl_stn",
            animLibName = "hands_tied_sit",
            next = "a_sit",
            name = "Sit",
            duration = 3000,
        },
    },
}

AnimLib.hands_tied_sit = {
    name = "Hands Tied Sit",
    tags = {},
    key = "2",
    enter = {
        animDict = "mini_hostage",
        anim = "gped_host_sit_pre",
        blendInSpeed = 1.0,
    },
    exit = {
        animDict = "mini_hostage",
        anim = "gped_host_sit_pst",
        duration = 12000,
    },
    idles = {
        idle_sit = {
            animDict = "mini_hostage",
            anim = "gped_host_sit_idl",
            flag = AnimConfig.Flag.Loop,
            transitions = {
                trans_std = "q",
                trans_knl = "z",
            },
        },
    },
    animations = {
        a_sit = {
            animDict = "mini_hostage",
            anim = "gped_host_sit_pre",
            next = "idle_sit",
        },
        trans_std = {
            animDict = "mini_hostage",
            anim = "gped_host_sit_stn",
            animLibName = "hands_tied",
            next = "idle_stand",
            name = "Stand",
        },
        trans_knl = {
            animDict = "mini_hostage",
            anim = "gped_host_sit_stn",
            animLibName = "hands_tied_kneel",
            next = "a_kneel",
            name = "Kneel",
            duration = 5500,
        },
    },
}
