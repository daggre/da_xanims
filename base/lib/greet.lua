--- Copyright © 2024 Joshua Nelson

-- Wave
AnimLib.greet_subtle_left = {
    name = "Subtle Wave Left",
    tags = { wave=1, },
    key = "z",
    condition = function() return Conditions.Check({ onMount = allow }) end,
    enter = {
        animDict = "ai_gestures@arthur@standing@speaker",
        anim = "greet_bored_l_001",
        blendInSpeed = 1.0,
        flag = AnimConfig.Flag.Move,
        duration = 600,
    },
}

AnimLib.greet_subtle_right = {
    name = "Subtle Wave Right",
    tags = { wave=1, },
    key = "x",
    condition = function() return Conditions.Check({ onMount = allow }) end,
    enter = {
        animDict = "ai_gestures@arthur@standing@speaker",
        anim = "greet_bored_r_001",
        blendInSpeed = 1.0,
        flag = AnimConfig.Flag.Move,
        duration = 600,
    },
}

AnimLib.greet_cocky_left = {
    name = "Wave Low Left",
    tags = { wave=1, },
    key = "a",
    condition = function() return Conditions.Check({ onMount = allow }) end,
    enter = {
        animDict = "ai_gestures@arthur@standing@speaker",
        anim = "greet_cocky_l_003",
        blendInSpeed = 1.0,
        flag = AnimConfig.Flag.Move,
        duration = 800,
    },
}

AnimLib.greet_cocky_right = {
    name = "Wave Low Right",
    tags = { wave=1, },
    key = "d",
    condition = function() return Conditions.Check({ onMount = allow }) end,
    enter = {
        animDict = "ai_gestures@arthur@standing@speaker",
        anim = "greet_cocky_r_003",
        blendInSpeed = 1.0,
        flag = AnimConfig.Flag.Move,
        duration = 800,
    },
}

AnimLib.wave_left = {
    name = "Wave Left",
    tags = { wave=1, },
    key = "q",
    condition = function() return Conditions.Check({ onMount = allow }) end,
    enter = {
        animDict = "ai_gestures@arthur@standing@speaker",
        anim = "greet_happy_l_001",
        blendInSpeed = 1.0,
        flag = AnimConfig.Flag.Move,
        duration = 800,
    },
}

AnimLib.wave_right = {
    name = "Wave Right",
    tags = { wave=1, },
    key = "e",
    condition = function() return Conditions.Check({ onMount = allow }) end,
    enter = {
        animDict = "ai_gestures@arthur@standing@speaker",
        anim = "greet_happy_r_001",
        blendInSpeed = 1.0,
        flag = AnimConfig.Flag.Move,
        duration = 800,
    },
}

AnimLib.nod_wave_right = {
    name = "Nod And Wave",
    tags = { wave=1, },
    key = "w",
    condition = function() return Conditions.Check({ onMount = true }) end,
    enter = {
        animDict = "ai_gestures@arthur@standing@speaker@no_hat",
        anim = "greet_hat_tip_r_001",
        blendInSpeed = 1.0,
        flag = AnimConfig.Flag.UpperBody,
        duration = 1000,
    },
}

-- Greet
AnimLib.ack_chin_up = {
    name = "Chin Up",
    tags = { greet=1, },
    key = "q",
    condition = function() return Conditions.Check({ onMount = allow }) end,
    enter = {
        animDict = "ai_gestures@gen_male@standing@silent",
        anim = "aknwoledge_tough_chin_up_f_001",
        blendInSpeed = 0.8,
        duration = 400,
        flag = AnimConfig.Flag.Move,
    },
}

AnimLib.hat_tip_slow = {
    name = "Tip Hat",
    tags = { greet=1, },
    key = "t",
    condition = function() return Conditions.Check({ onMount = allow }) end,
    enter = {
        animDict = "ai_gestures@arthur@standing@speaker",
        anim = "greet_hat_tip_r_001",
        blendInSpeed = 1.0,
        duration = 1700,
        flag = AnimConfig.Flag.Move,
    },
}

AnimLib.hat_tip_quick = {
    name = "Tip Hat Casual",
    tags = { greet=1, },
    key = "r",
    condition = function() return Conditions.Check({ onMount = allow }) end,
    enter = {
        animDict = "ai_gestures@arthur@standing@speaker",
        anim = "greet_hat_tip_r_001",
        blendInSpeed = 1.0,
        duration = 1700,
        flag = AnimConfig.Flag.Move,
    },
}

AnimLib.greet_subtle_nod = {
    name = "Nod Once",
    tags = { greet=1, },
    key = "g",
    condition = function() return Conditions.Check({ onMount = true }) end,
    enter = {
        animDict = "ai_gestures@arthur@standing@speaker@no_hat",
        anim = "greet_hat_tip_l_004",
        flag = AnimConfig.Flag.UpperBody,
        blendInSpeed = 1.0,
        duration = 200,
    },
}

-- Salute
AnimLib.salute_point = {
    name = "Salute Point",
    tags = { salute=1, },
    key = "e",
    condition = function() return Conditions.Check({ onMount = allow }) end,
    enter = {
        animDict = "ai_gestures@gen_male@standing@silent",
        anim = "silent_casual_salute_r_001",
        blendInSpeed = 1.0,
        duration = 1000,
        flag = AnimConfig.Flag.Move,
    },
}

AnimLib.salute_brim = {
    name = "Salute Hat Brim",
    tags = { salute=1, },
    key = "b",
    condition = function() return Conditions.Check({ onMount = allow }) end,
    enter = {
        animDict = "ai_gestures@gen_male@standing@silent",
        anim = "silent_casual_salute_r_002",
        blendInSpeed = 1.0,
        duration = 1000,
        flag = AnimConfig.Flag.Move,
    },
}

AnimLib.salute_look_down = {
    name = "Salute Casual",
    tags = { salute=1, },
    key = "q",
    condition = function() return Conditions.Check({ onMount = allow }) end,
    enter = {
        animDict = "ai_gestures@gen_male@standing@silent",
        anim = "silent_casual_salute_r_003",
        blendInSpeed = 1.0,
        duration = 1000,
        flag = AnimConfig.Flag.Move,
    },
}

AnimLib.salute_hat_touch = {
    name = "Salute Touch",
    tags = { salute=1, },
    key = "t",
    condition = function() return Conditions.Check({ onMount = allow }) end,
    enter = {
        animDict = "ai_gestures@gen_male@standing@silent",
        anim = "silent_neutral_hat_tip_r_004",
        blendInSpeed = 1.0,
        duration = 1300,
        flag = AnimConfig.Flag.Move,
    },
}
