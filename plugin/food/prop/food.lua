Propset.apple = {
    objectHash = `s_bit_apple01x`,
    bone = "PH_R_Hand",
    position = vec3(-0.04, 0.02, 0.06),
    rotation = vec3(91.0, 0.0, 76.0),
    -- position = vec3(0.0, 0.0, 0.0),
    -- rotation = vec3(0.0, 0.0, 80.0),
    expression = { type = 0, DOF_Name = "meat_filet_bite", },
    Throw = {
        objectHash = `s_bit_apple01x`,
        bone = "SKEL_R_Finger12",
        position = vec3(0.01, -0.055, 0.05),
        rotation = vec(16.0, 176.0, 201.0),
    },
}

Propset.pear = {
    objectHash = `s_bit_pear_02x`,
    bone = "PH_R_Hand",
    position = vec3(-0.04, 0.02, 0.06),
    rotation = vec3(91.0, 0.0, 76.0),
    expression = { type = 0, DOF_Name = "meat_filet_bite", },
    Throw = {
        objectHash = `s_bit_pear_02x`,
        bone = "SKEL_R_Finger12",
        position = vec3(0.01, -0.055, 0.05),
        rotation = vec(16.0, 176.0, 201.0),
    },
}

Propset.breadroll = {
    objectHash = `s_bit_bread06`,
    bone = "PH_R_Hand",
    position = vec3(-0.01, 0.0, 0.0),
    rotation = vec3(0.0, 0.0, 30.0),
    expression = { type = 0, DOF_Name = "Meat_Filet_Bite", },
    Throw = {
        objectHash = `s_bit_bread06`,
        bone = "SKEL_R_Finger12",
        position = vec3(0.01, -0.055, 0.045),
        rotation = vec(6.0, 186.0, 166.0),
    },
}

Propset.canned_goods = {
    objectHash = `s_cornedbeef01x`,
    bone = "PH_R_Hand",
    fadeIn = true,
    Hold = {
        objectHash = `s_cornedbeef01x`,
        bone = "SKEL_R_HAND",
        position = vec3(0.07, -0.01, -0.05),
        rotation = vec3(-53.0, 84.0, 0.0),
        fadeIn = true,
    },
}

Propset.spoon = {
    EmptySpoon = {
        objectHash = `p_spoon01x`,
        bone = "PH_R_Hand",
    },
    Stew = {
        objectHash = `p_beefstew_spoon01x`,
        bone = "PH_R_Hand",
        fadeIn = true,
    },
    Cobbler = {
        objectHash = `p_peach_spoon01x`,
        bone = "PH_R_Hand",
        fadeIn = true,
    },
    Cabbage = {
        objectHash = `p_oatmeal_spoon01x`,
        bone = "PH_R_Hand",
        fadeIn = true,
    },
    Porridge = {
        objectHash = `p_oatmeal_spoon01x`,
        bone = "PH_R_Hand",
        fadeIn = true,
    },
    FishStew = {
        objectHash = `p_fishstew_spoon01x`,
        bone = "PH_R_Hand",
        fadeIn = true,
    },
    Bisque = {
        objectHash = `p_lobster_spoon01x`,
        bone = "PH_R_Hand",
        fadeIn = true,
    },
}

Propset.bowl = {
    EmptyNoFade = {
        objectHash = `p_beefstew01x`,
        bone = "PH_L_Hand",
    },
    Stew = {
        objectHash = `p_beefstew01x`,
        bone = "PH_L_Hand",
        fadeIn = true,
        expression = { type = 0, DOF_Name = "stew_fill", },
    },
    Cobbler = {
        objectHash = `p_peach_cobbler01x`,
        bone = "PH_L_Hand",
        fadeIn = true,
        expression = { type = 0, DOF_Name = "stew_fill", },
    },
    Cabbage = {
        objectHash = `p_bacon_cabbage01x`,
        bone = "PH_L_Hand",
        fadeIn = true,
        expression = { type = 0, DOF_Name = "stew_fill", },
    },
    Porridge = {
        objectHash = `p_wheat_milk01x`,
        bone = "PH_L_Hand",
        fadeIn = true,
        expression = { type = 0, DOF_Name = "stew_fill", },
    },
    FishStew = {
        objectHash = `p_fishstew01x`,
        bone = "PH_L_Hand",
        fadeIn = true,
        expression = { type = 0, DOF_Name = "stew_fill", },
    },
    Bisque = {
        objectHash = `p_lobster_bisque01x`,
        bone = "PH_L_Hand",
        fadeIn = true,
        expression = { type = 0, DOF_Name = "stew_fill", },
    },
}
