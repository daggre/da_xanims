Propset.Hammer = {
    objectHash = `p_hammer01x`,
    bone = "PH_R_Hand",
    fadeIn = true,
}

Propset.Pitchfork = {
    objectHash = `p_pitchfork01x`,
    bone = "PH_R_Hand",
    fadeIn = true,
    WorkOffset = {
        objectHash = `p_pitchfork01x`,
        bone = "PH_R_Hand",
        position = vec3(0.0, -0.04, -0.04),
        rotation = vec3(-72, 139, 29.5),
    }
}

Propset.ScoopStraw = {
    OneScoop = {
        objectHash = `p_haypilepitchfork01x`,
        bone = nil,
        fadeIn = true,
        position = vec3(0.0, 0.1, 1.47),
        rotation = vec3(-90, 90, 0),
    },
    TwoScoops = {
        objectHash = `p_haypilepitchfork01x`,
        bone = nil,
        fadeIn = true,
        position = vec3(0.0, 0.09, 1.39),
        rotation = vec3(-90, 90, 0),
    },
}

Propset.PoopScoop = {
    objectHash = `s_horsepoop02x`,
    bone = nil,
    fadeIn = true,
    position = vec3(0, 0.02, 1.45),
    rotation = vec3(-90, 0, 0),
}
