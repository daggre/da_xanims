Propset.FenceDefault = {
    objectHash = `p_fence_cattle01x`,
    offset = {
        { angle = 0.0, distance = 0.7, rotation = 10, debug = true },
        { angle = 180.0, distance = 0.7, rotation = 10, debug = true },
    }
}

Propset.Fence4bx = {
    objectHash = `p_fence04bx`,
    offset = {
        { angle = 0.0, distance = 0.69, rotation = 4, debug = true },
        { angle = 180.0, distance = 0.7, rotation = 30, debug = true },
    }
}

Propset.FenceOak2ax = {
    objectHash = `p_emrfence02ax`,
    offset = {
        { angle = 0.0, distance = 0.74, rotation = 20, debug = true },
        { angle = 180.0, distance = 0.7, rotation = 10, debug = true },
    }
}

Propset.FenceTall4ix = {
    objectHash = `p_fencetall_04ix`,
    offset = {
        { angle = 0.0, distance = 0.73, rotation = 10, },
        { angle = 180.0, distance = 0.8, rotation = 10, },
    }
}

Propset.FenceTall4icv = {
    objectHash = `p_fencetall_04ax`,
    offset = {
        { angle = 0.0, distance = 0.7, rotation = 20, },
        { angle = 180.0, distance = 0.8, rotation = 10, },
    }
}

Propset.FenceTall4ax = {
    objectHash = `p_fencetall_04ax`,
    offset = {
        { angle = 0.0, distance = 0.7, rotation = 10, },
        { angle = 180.0, distance = 0.8, rotation = 10, },
    }
}

Propset.FenceCal1 = {
    objectHash = `p_cal_fence01x`,
    offset = {
        { angle = 0.0, distance = 0.86, rotation = 20 },
        { angle = 180.0, distance = 0.55, rotation = 10, },
    }
}

Propset.FenceSnow = {
    objectHash = `p_snow_stablefence01x`,
    offset = {
        { angle = 0.0, distance = 0.75, rotation = 5, },
        { angle = 180.0, distance = 0.67, rotation = 15, },
    }
}

Propset.Fence1 = {
    objectHash = `p_fence_cattle01x`,
    offset = {
        { angle = 0.0, distance = 0.85, rotation = 10, },
        { angle = 180.0, distance = 0.67, rotation = 10, },
    }
}

Propset.Fence2 = {
    objectHash = `p_fence_cattle02x`,
    offset = {
        { angle = 0.0, distance = 0.89, rotation = 10, debug = true },
        { angle = 180.0, distance = 0.65, rotation = 10, debug = true },
    }
}

Propset.Fence3 = {
    objectHash = `p_fence_cattle03x`,
    offset = {
        { angle = 0.0, distance = 0.69, rotation = 0, },
        { angle = 180.0, distance = 0.85, rotation = 20, },
    }
}

Propset.Fence4 = {
    objectHash = `p_fence_cattle04x`,
    offset = {
        { angle = 0.0, distance = 0.85, rotation = 15, },
        { angle = 180.0, distance = 0.72, rotation = 15, },
    }
}

Propset.FencePlank4 = {
    objectHash = `p_fence_plank04`,
    offset = {
        { angle = 0.0, distance = 0.62, rotation = 20, },
        { angle = 180.0, distance = 0.80, },
    }
}

Propset.WaterPump = {
    objectHash = `p_waterpump01x`,
    offset = {
        { angle = 12.0, distance = 0.97, rotation = -12.0, },
    }
}

Propset.WaterTrough1 = {
    objectHash = `p_watertrough01x`,
    offset = {
        { angle = -35.0, distance = 0.8, rotation = 15.0 + 15.0, },
        { angle = 0.0, distance = 0.7, rotation = 0.0, },
        { angle = 35.0, distance = 0.9, rotation = 15.0 - 50.0, },
        { angle = 145.0, distance = 0.8, rotation = 15.0 + 15.0, },
        { angle = 180.0, distance = 0.7, rotation = 0.0, },
        { angle = 215.0, distance = 0.9, rotation = 15.0 - 50.0, },
    }
}

Propset.WaterTrough2 = {
    objectHash = `p_watertrough02x`,
    offset = {
        { angle = 180.0, distance = 0.5, rotation = 15.0, }
    }
}

Propset.Wheelbarrow = {
    objectHash = `p_poopwheelbarrow02x`,
    interact = { rotation = 270.0, },
    offset = {
        { angle = 0.0, distance = 1.2, rotation = -25, },
        { angle = 45.0, distance = 1.2, rotation = -25, },
        { angle = 90.0, distance = 1.2, rotation = -25, },
        { angle = 135.0, distance = 1.2, rotation = -25, },
        { angle = 180.0, distance = 1.2, rotation = -25, },
        { angle = 225.0, distance = 1.2, rotation = -25, },
        { angle = 270.0, distance = 1.2, rotation = -25, },
        { angle = 285.0, distance = 1.2, rotation = -25, },
        { angle = 315.0, distance = 1.2, rotation = -25, },
    }
}

Propset.HayTrough = {
    objectHash = `p_feedtroughsml01x`,
    offset = {
        { angle = 170.0, distance = 1.0, rotation = 10, },
    }
}

Propset.Lookup[`p_feedtroughsml01x`] = Propset.HayTrough
Propset.Lookup[`p_cs_bucket01bx`] = Propset.BucketEmpty
Propset.Lookup[`p_cs_bucket01x`] = Propset.BucketWater
Propset.Lookup[`p_bucket02x`] = Propset.Bucket2
Propset.Lookup[`p_bucket03x`] = Propset.Bucket3
Propset.Lookup[`p_waterpump01x`] = Propset.WaterPump
Propset.Lookup[`p_watertrough01x`] = Propset.WaterTrough1
Propset.Lookup[`p_watertrough02x`] = Propset.WaterTrough2
Propset.Lookup[`p_watertroughsml01x`] = Propset.WaterTrough2
Propset.Lookup[`p_watertrough03x`] = Propset.WaterTrough2
Propset.Lookup[`p_fence_cattle01x`] = Propset.Fence1
Propset.Lookup[`p_fence_cattle02x`] = Propset.Fence2
Propset.Lookup[`p_fence_cattle03x`] = Propset.Fence3
Propset.Lookup[`p_fence_cattle04x`] = Propset.Fence4
Propset.Lookup[`p_fence_plank04`] = Propset.FencePlank4
Propset.Lookup[`p_fence04bx`] = Propset.Fence4bx
Propset.Lookup[`p_fence06ax`] = Propset.FenceDefault
Propset.Lookup[`p_fence04ax`] = Propset.FenceDefault
Propset.Lookup[`p_fence11x`] = Propset.FenceDefault
Propset.Lookup[`p_rid_fence01x`] = Propset.FenceDefault
Propset.Lookup[`p_app_stablefence01x`] = Propset.FenceDefault
Propset.Lookup[`p_fencetall_04ix`] = Propset.FenceTall4ix
Propset.Lookup[`p_fencetall_04icv`] = Propset.FenceTall4icv
Propset.Lookup[`p_fencetall_04ax`] = Propset.FenceTall4ax
Propset.Lookup[`p_fencetall_04jx`] = Propset.FenceTall4ax
Propset.Lookup[`p_cal_fence01x`] = Propset.FenceCal1
Propset.Lookup[`p_cal_fence02x`] = Propset.FenceCal1
Propset.Lookup[`p_cal_fence03x`] = Propset.FenceCal1
Propset.Lookup[`p_bra_fence01x`] = Propset.FenceDefault
Propset.Lookup[`p_bra_fence03x`] = Propset.FenceDefault
Propset.Lookup[`p_emrfence02ax`] = Propset.FenceOak2ax
Propset.Lookup[`p_emrfence02bx`] = Propset.FenceOak2ax
Propset.Lookup[`p_emrfence03ax`] = Propset.FenceOak2ax
Propset.Lookup[`p_snow_stablefence01x`] = Propset.FenceSnow
Propset.Lookup[`p_fence02_snglpostx`] = Propset.FenceDefault
Propset.Lookup[`p_poopwheelbarrow02x`] = Propset.Wheelbarrow
