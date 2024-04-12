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
