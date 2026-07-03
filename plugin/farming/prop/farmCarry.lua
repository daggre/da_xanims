--- Copyright © 2024 Joshua Nelson

Propset.ChickenCrate = {
    objectHash = `p_cratechicken03x_anim`,
    interactRange = 2.0,
    bone = "PH_R_Hand",
    offset = {
        { angle = 90.0, distance = 0.75, },
        { angle = 270.0, distance = 0.75, },
    }
}

Propset.Crate = {
    Open = {
        objectHash = `p_crate03b`,
        interactRange = 2.0,
        bone = "PH_R_Hand",
        offset = {
            { angle = 5.0, distance = 0.69, rotation = -5, },
            { angle = 185.0, distance = 0.69, rotation = -5, },
        }
    },
    Closed = {
        objectHash = `p_crate03x`,
        interactRange = 2.0,
        bone = "PH_R_Hand",
        offset = {
            { angle = 5.0, distance = 0.69, rotation = -5, },
            { angle = 185.0, distance = 0.69, rotation = -5, },
        }
    }
}

Propset.StrawBale = {
    objectHash = `p_haybale03x`,
    interactRange = 2.0,
    bone = "PH_R_Hand",
    offset = {
        { angle = 90.0, distance = 0.75, },
        { angle = 270.0, distance = 0.75, },
        { angle = 80.0, distance = 1.5, rotation = 30, interactType = "pitchfork" },
        { angle = 260.0, distance = 1.5, rotation = 30, interactType = "pitchfork" },
    }
}

Propset.CottonBale = {
    objectHash = `s_cottonbale02x`,
    interactRange = 2.0,
    bone = "PH_R_Hand",
    offset = {
        { angle = 90.0, distance = 0.75, },
        { angle = 270.0, distance = 0.75, },
    }
}

Propset.SackMaize = {
    objectHash = `mp005_p_cs_sackcorn01x`,
    interactRange = 2.0,
    bone = "PH_R_Hand",
    dropVelocity = -0.8,
    dropDist = 0.5,
    offset = {
        { angle = 0.0, distance = 0.75, },
        { angle = 180.0, distance = 0.80, },
    }
}

Propset.SackSugar = {
    objectHash = `mp005_s_mp_moonshinesack02x`,
    interactRange = 2.0,
    bone = "PH_R_Hand",
    dropVelocity = -0.8,
    dropDist = 0.5,
    offset = {
        { angle = 0.0, distance = 0.75, },
        { angle = 180.0, distance = 0.80, },
    }
}

Propset.SackBrighter = {
    objectHash = `mp005_s_mp_moonshinesack03x`,
    interactRange = 2.0,
    bone = "PH_R_Hand",
    dropVelocity = -0.8,
    dropDist = 0.5,
    offset = {
        { angle = 0.0, distance = 0.75, },
        { angle = 180.0, distance = 0.80, },
    }
}

Propset.SackDarker = {
    objectHash = `mp005_s_mp_moonshinesack04x`,
    interactRange = 2.0,
    bone = "PH_R_Hand",
    dropVelocity = -0.8,
    dropDist = 0.5,
    offset = {
        { angle = 0.0, distance = 0.75, },
        { angle = 180.0, distance = 0.80, },
    }
}

Propset.Lookup[`p_haybale03x`] = Propset.StrawBale
Propset.Lookup[`p_cratechicken03x_anim`] = Propset.ChickenCrate
Propset.Lookup[`s_cottonbale02x`] = Propset.CottonBale
Propset.Lookup[`mp005_p_cs_sackcorn01x`] = Propset.SackMaize
Propset.Lookup[`mp005_s_mp_moonshinesack02x`] = Propset.SackSugar
Propset.Lookup[`mp005_s_mp_moonshinesack03x`] = Propset.SackBrighter
Propset.Lookup[`mp005_s_mp_moonshinesack04x`] = Propset.SackDarker
Propset.Lookup[`p_crate03b`] = Propset.Crate.OpenTop
Propset.Lookup[`p_crate03x`] = Propset.Crate.Closed
