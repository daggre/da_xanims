--- Copyright © 2024 Joshua Nelson

Propset.WhittleWood = {
    objectHash = `p_woodwhittle01x`,
    bone = "PH_L_Hand",
}

Propset.Knife2 = {
    objectHash = `p_knife02x`,
    bone = "SKEL_R_Hand",
    position = vec3(0.12, 0.1, -0.04),
    rotation = vec3(1.0, 3.0, -29.0),
}

Propset.SharpeningStone = {
    objectHash = `p_sharpeningstone01x`,
    bone = "PH_L_Hand",
    -- bone = "SKEL_L_Hand",
    -- position = vec3(0.1, 0.042, 0.04),
    -- rotation = vec3(-24.0, -29.0, -59.0),
}

Propset.Newspaper = {
    objectHash = `p_cs_newspaper_03x`,
    bone = "PH_R_Hand",
    fadeIn = true,
}

Propset.Clipboard = {
    objectHash = `p_amb_clipboard_01`,
    bone = "skel_l_hand",
    position = vec3(0.126, 0.013, 0.125),
    rotation = vec3(24.0, 98.0, 206.0),
    Pencil = {
        objectHash = `p_pencil01x`,
        bone = "SKEL_R_Finger13",
        position = vec3(0.003, -0.004, -0.016),
        rotation = vec3(50.0, -90.0, 0.0),
    },
}
