--- Copyright © 2024 Joshua Nelson

AnimLib.revolver_inspect = {
    name = "Examine Revolver",
    tags = { weapon=1, },
    key = "e",
    condition = function() return Conditions.Check({
        hasWeapon = true,
        hasPrimaryWeapon = true,
        hasPrimaryRevolver = true,
        hasSecondaryWeapon = false,
    }) end,
    enter = {
        animDict = "mech_inspection@weapons@shortarms@cattleman@base",
        anim = "base_enter",
        blendInSpeed = 1.0,
        nextBlendInSpeed = 1.0,
        flag = AnimConfig.Flag.DontSuppressLoco,
        next = "idle_exhibit",
        onTrigger = function(info)
            AnimUtil.DisableFiring(true)
            info.final = function() AnimUtil.DisableFiring(false) end
            return info
        end,
    },
    exit = {
        animDict = "mech_inspection@weapons@shortarms@cattleman@base",
        anim = "base_exit",
        flag = AnimConfig.Flag.DontSuppressLoco,
        duration = 100,
    },
    idles = {
        idle_a = {
            animDict = "mech_inspection@weapons@shortarms@cattleman@base",
            anim = "base_idle_pose",
            name = "Hold Still",
            blendInSpeed = 1.0,
            flag = AnimConfig.Flag.Loop | AnimConfig.Flag.DontSuppressLoco,
            transitions = {
                idle_exhibit = "e",
                trans_inspect_clean = "w",
                trans_inspect_aim = "s",
            },
        },
        idle_exhibit = {
            animDict = "mech_inspection@weapons@shortarms@cattleman@base",
            anim = "base_sweep",
            name = "Examine Revolver",
            flag = AnimConfig.Flag.Loop | AnimConfig.Flag.DontSuppressLoco,
            transitions = {
                idle_a = "e",
                trans_inspect_clean = "w",
                trans_inspect_aim = "s",
            },
        },
    },
    animations = {
        trans_inspect_clean = {
            animDict = "mech_inspection@weapons@shortarms@cattleman@base",
            anim = "base_idle_pose",
            duration = 100,
            name = "Clean With Rag",
            flag = AnimConfig.Flag.DontSuppressLoco,
            animLibName = "revolver_clean",
            next = "a_enter",
        },
        trans_inspect_aim = {
            animDict = "mech_inspection@weapons@shortarms@cattleman@base",
            anim = "base_idle_pose",
            duration = 100,
            name = "Inspect Sights",
            flag = AnimConfig.Flag.DontSuppressLoco,
            animLibName = "revolver_aim",
            next = "a_enter",
        },
    },
}

AnimLib.revolver_clean = {
    name = "Clean With Rag",
    tags = { weapon=1, },
    key = "w",
    condition = function() return Conditions.Check({
        hasWeapon = true,
        hasPrimaryWeapon = true,
        hasPrimaryRevolver = true,
        hasSecondaryWeapon = false,
    }) end,
    enter = {
        animDict = "mech_inspection@weapons@shortarms@cattleman@base",
        anim = "clean_enter",
        blendInSpeed = 1.0,
        flag = AnimConfig.Flag.DontSuppressLoco,
        onTrigger = function(info)
            info.prop.rag = Prop:new()
            AnimUtil.DisableFiring(true)
            info.final = function() AnimUtil.DisableFiring(false) end
            info.prop.rag:attach(info.ped, Propset.Rag)
            return info
        end,
    },
    exit = {
        animDict = "mech_inspection@weapons@shortarms@cattleman@base",
        anim = "clean_exit",
        flag = AnimConfig.Flag.DontSuppressLoco,
        next = "exit_2",
        duration = 1000,
    },
    idles = {
        idle_a = {
            animDict = "mech_inspection@weapons@shortarms@cattleman@base",
            anim = "clean_loop",
            flag = AnimConfig.Flag.Loop | AnimConfig.Flag.DontSuppressLoco,
            transitions = {
                trans_clean_inspect = "e",
                trans_clean_aim = "s",
            },
        },
    },
    animations = {
        a_enter = {
            animDict = "mech_inspection@weapons@shortarms@cattleman@base",
            anim = "clean_enter",
            blendInSpeed = 1.0,
            flag = AnimConfig.Flag.DontSuppressLoco,
            next = "idle_a",
            onTrigger = function(info)
                info.prop.rag = Prop:new()
                info.prop.rag:attach(info.ped, Propset.Rag)
                return info
            end,
        },
        exit_2 = {
            animDict = "mech_inspection@weapons@shortarms@cattleman@base",
            anim = "base_exit",
            flag = AnimConfig.Flag.DontSuppressLoco,
            duration = 50,
            onTrigger = function(info)
                Citizen.Wait(500)
                Prop.Delete(info.prop.rag)
                return info
            end,
        },
        trans_clean_inspect = {
            animDict = "mech_inspection@weapons@shortarms@cattleman@base",
            anim = "clean_exit",
            name = "Examine Revolver",
            flag = AnimConfig.Flag.DontSuppressLoco,
            animLibName = "revolver_inspect",
            next = "idle_exhibit",
            onTrigger = function(info)
                Citizen.Wait(500)
                Prop.Delete(info.prop.rag)
                return info
            end,
        },
        trans_clean_aim = {
            animDict = "mech_inspection@weapons@shortarms@cattleman@base",
            anim = "clean_exit",
            name = "Inspect Sights",
            flag = AnimConfig.Flag.DontSuppressLoco,
            animLibName = "revolver_aim",
            next = "a_enter",
            onTrigger = function(info)
                Citizen.Wait(500)
                Prop.Delete(info.prop.rag)
                return info
            end,
        },
    },
}

AnimLib.revolver_aim = {
    name = "Inspect Sights",
    tags = { weapon=1, },
    key = "s",
    condition = function() return Conditions.Check({
        hasWeapon = true,
        hasPrimaryWeapon = true,
        hasPrimaryRevolver = true,
        hasSecondaryWeapon = false,
    }) end,
    enter = {
        animDict = "mech_inspection@weapons@shortarms@cattleman@base",
        anim = "aim_enter",
        blendInSpeed = 1.0,
        nextBlendInSpeed = 1.0,
        flag = AnimConfig.Flag.DontSuppressLoco,
        next = "idle_exhibit",
        onTrigger = function(info)
            AnimUtil.DisableFiring(true)
            info.final = function() AnimUtil.DisableFiring(false) end
            return info
        end,
    },
    exit = {
        animDict = "mech_inspection@weapons@shortarms@cattleman@base",
        anim = "aim_exit",
        flag = AnimConfig.Flag.DontSuppressLoco,
        next = "exit_2",
        duration = 800,
    },
    idles = {
        idle_a = {
            animDict = "mech_inspection@weapons@shortarms@cattleman@base",
            anim = "aim_idle_pose",
            name = "Hold Still",
            flag = AnimConfig.Flag.Loop | AnimConfig.Flag.DontSuppressLoco,
            transitions = {
                idle_exhibit = "s",
                trans_aim_inspect = "e",
                trans_aim_clean = "w",
            }
        },
        idle_exhibit = {
            animDict = "mech_inspection@weapons@shortarms@cattleman@base",
            anim = "aim_sweep",
            flag = AnimConfig.Flag.Loop | AnimConfig.Flag.DontSuppressLoco,
            name = "Inspect Sights",
            transitions = {
                idle_a = "s",
                trans_aim_inspect = "e",
                trans_aim_clean = "w",
            }
        },
    },
    animations = {
        a_enter = {
            animDict = "mech_inspection@weapons@shortarms@cattleman@base",
            anim = "aim_enter",
            flag = AnimConfig.Flag.DontSuppressLoco,
            next = "idle_exhibit",
        },
        exit_2 = {
            animDict = "mech_inspection@weapons@shortarms@cattleman@base",
            anim = "base_exit",
            flag = AnimConfig.Flag.DontSuppressLoco,
            duration = 150,
        },
        trans_aim_inspect = {
            animDict = "mech_inspection@weapons@shortarms@cattleman@base",
            anim = "aim_exit",
            name = "Examine Revolver",
            flag = AnimConfig.Flag.DontSuppressLoco,
            animLibName = "revolver_inspect",
            next = "idle_exhibit",
        },
        trans_aim_clean= {
            animDict = "mech_inspection@weapons@shortarms@cattleman@base",
            anim = "aim_exit",
            name = "Clean With Rag",
            flag = AnimConfig.Flag.DontSuppressLoco,
            animLibName = "revolver_clean",
            next = "a_enter",
        },
    },
}

AnimLib.pistol_inspect = {
    name = "Examine Pistol",
    tags = { weapon=1, },
    key = "e",
    condition = function() return Conditions.Check({
        hasWeapon = true,
        hasPrimaryWeapon = true,
        hasPrimaryPistol = true,
        hasSecondaryWeapon = false,
    }) end,
    enter = {
        animDict = "mech_inspection@weapons@shortarms@volcanic@base",
        anim = "base_enter",
        blendInSpeed = 1.0,
        nextBlendInSpeed = 1.0,
        flag = AnimConfig.Flag.DontSuppressLoco,
        next = "idle_exhibit",
        onTrigger = function(info)
            AnimUtil.DisableFiring(true)
            info.final = function() AnimUtil.DisableFiring(false) end
            return info
        end,
    },
    exit = {
        animDict = "mech_inspection@weapons@shortarms@volcanic@base",
        anim = "base_exit",
        flag = AnimConfig.Flag.DontSuppressLoco,
    },
    idles = {
        idle_a = {
            animDict = "mech_inspection@weapons@shortarms@volcanic@base",
            anim = "base_idle_pose",
            name = "Hold Still",
            blendInSpeed = 1.0,
            flag = AnimConfig.Flag.Loop | AnimConfig.Flag.DontSuppressLoco,
            transitions = {
                idle_exhibit = "e",
                trans_inspect_clean = "w",
                trans_inspect_aim = "s",
            },
        },
        idle_exhibit = {
            animDict = "mech_inspection@weapons@shortarms@volcanic@base",
            anim = "base_sweep",
            name = "Examine Pistol",
            flag = AnimConfig.Flag.Loop | AnimConfig.Flag.DontSuppressLoco,
            transitions = {
                idle_a = "e",
                trans_inspect_clean = "w",
                trans_inspect_aim = "s",
            },
        },
    },
    animations = {
        trans_inspect_clean = {
            animDict = "mech_inspection@weapons@shortarms@volcanic@base",
            anim = "base_idle_pose",
            duration = 100,
            name = "Clean With Rag",
            flag = AnimConfig.Flag.DontSuppressLoco,
            animLibName = "pistol_clean",
            next = "a_enter",
        },
        trans_inspect_aim = {
            animDict = "mech_inspection@weapons@shortarms@volcanic@base",
            anim = "base_idle_pose",
            duration = 100,
            name = "Inspect Sights",
            flag = AnimConfig.Flag.DontSuppressLoco,
            animLibName = "pistol_aim",
            next = "a_enter",
        },
    },
}

AnimLib.pistol_clean = {
    name = "Clean With Rag",
    tags = { weapon=1, },
    key = "w",
    condition = function() return Conditions.Check({
        hasWeapon = true,
        hasPrimaryWeapon = true,
        hasPrimaryPistol = true,
        hasSecondaryWeapon = false,
    }) end,
    enter = {
        animDict = "mech_inspection@weapons@shortarms@volcanic@base",
        anim = "clean_enter",
        blendInSpeed = 1.0,
        flag = AnimConfig.Flag.DontSuppressLoco,
        onTrigger = function(info)
            info.prop.rag = Prop:new()
            AnimUtil.DisableFiring(true)
            info.final = function() AnimUtil.DisableFiring(false) end
            info.prop.rag:attach(info.ped, Propset.Rag)
            return info
        end,
    },
    exit = {
        animDict = "mech_inspection@weapons@shortarms@volcanic@base",
        anim = "clean_exit",
        flag = AnimConfig.Flag.DontSuppressLoco,
        next = "exit_2",
    },
    idles = {
        idle_a = {
            animDict = "mech_inspection@weapons@shortarms@volcanic@base",
            anim = "clean_loop",
            flag = AnimConfig.Flag.Loop | AnimConfig.Flag.DontSuppressLoco,
            transitions = {
                trans_clean_inspect = "e",
                trans_clean_aim = "s",
            },
        },
    },
    animations = {
        a_enter = {
            animDict = "mech_inspection@weapons@shortarms@volcanic@base",
            anim = "clean_enter",
            flag = AnimConfig.Flag.DontSuppressLoco,
            next = "idle_a",
            onTrigger = function(info)
                info.prop.rag = Prop:new()
                info.prop.rag:attach(info.ped, Propset.Rag)
                return info
            end,
        },
        exit_2 = {
            animDict = "mech_inspection@weapons@shortarms@volcanic@base",
            anim = "base_exit",
            flag = AnimConfig.Flag.DontSuppressLoco,
            onTrigger = function(info)
                Citizen.Wait(500)
                Prop.Delete(info.prop.rag)
                return info
            end,
        },
        trans_clean_inspect = {
            animDict = "mech_inspection@weapons@shortarms@volcanic@base",
            anim = "clean_exit",
            name = "Examine Pistol",
            flag = AnimConfig.Flag.DontSuppressLoco,
            animLibName = "pistol_inspect",
            next = "idle_exhibit",
            onTrigger = function(info)
                Citizen.Wait(500)
                Prop.Delete(info.prop.rag)
                return info
            end,
        },
        trans_clean_aim = {
            animDict = "mech_inspection@weapons@shortarms@volcanic@base",
            anim = "clean_exit",
            name = "Inspect Sights",
            flag = AnimConfig.Flag.DontSuppressLoco,
            animLibName = "pistol_aim",
            next = "a_enter",
            onTrigger = function(info)
                Citizen.Wait(500)
                Prop.Delete(info.prop.rag)
                return info
            end,
        },
    },
}

AnimLib.pistol_aim = {
    name = "Inspect Sights",
    tags = { weapon=1, },
    key = "s",
    condition = function() return Conditions.Check({
        hasWeapon = true,
        hasPrimaryWeapon = true,
        hasPrimaryPistol = true,
        hasSecondaryWeapon = false,
    }) end,
    enter = {
        animDict = "mech_inspection@weapons@shortarms@volcanic@base",
        anim = "aim_enter",
        blendInSpeed = 1.0,
        nextBlendInSpeed = 1.0,
        flag = AnimConfig.Flag.DontSuppressLoco,
        next = "idle_exhibit",
        onTrigger = function(info)
            AnimUtil.DisableFiring(true)
            info.final = function() AnimUtil.DisableFiring(false) end
            return info
        end,
    },
    exit = {
        animDict = "mech_inspection@weapons@shortarms@volcanic@base",
        anim = "aim_exit",
        flag = AnimConfig.Flag.DontSuppressLoco,
        next = "exit_2",
    },
    idles = {
        idle_a = {
            animDict = "mech_inspection@weapons@shortarms@volcanic@base",
            anim = "aim_idle_pose",
            name = "Hold Still",
            flag = AnimConfig.Flag.Loop | AnimConfig.Flag.DontSuppressLoco,
            transitions = {
                idle_exhibit = "s",
                trans_aim_inspect = "e",
                trans_aim_clean = "w",
            }
        },
        idle_exhibit = {
            animDict = "mech_inspection@weapons@shortarms@volcanic@base",
            anim = "aim_sweep",
            flag = AnimConfig.Flag.Loop | AnimConfig.Flag.DontSuppressLoco,
            name = "Inspect Sights",
            transitions = {
                idle_a = "s",
                trans_aim_inspect = "e",
                trans_aim_clean = "w",
            }
        },
    },
    animations = {
        a_enter = {
            animDict = "mech_inspection@weapons@shortarms@volcanic@base",
            anim = "aim_enter",
            nextBlendInSpeed = 1.0,
            flag = AnimConfig.Flag.DontSuppressLoco,
            next = "idle_exhibit",
        },
        exit_2 = {
            animDict = "mech_inspection@weapons@shortarms@volcanic@base",
            anim = "base_exit",
            flag = AnimConfig.Flag.DontSuppressLoco,
        },
        trans_aim_inspect = {
            animDict = "mech_inspection@weapons@shortarms@volcanic@base",
            anim = "aim_exit",
            name = "Examine Pistol",
            flag = AnimConfig.Flag.DontSuppressLoco,
            animLibName = "pistol_inspect",
            next = "idle_exhibit",
        },
        trans_aim_clean= {
            animDict = "mech_inspection@weapons@shortarms@volcanic@base",
            anim = "aim_exit",
            name = "Clean With Rag",
            flag = AnimConfig.Flag.DontSuppressLoco,
            animLibName = "pistol_clean",
            next = "a_enter",
        },
    },
}

AnimLib.longarm_male_inspect = {
    name = "Examine Longarm",
    tags = { weapon=1, },
    key = "e",
    condition = function() return Conditions.Check({
        isMale = true,
        hasWeapon = true,
        hasPrimaryWeapon = true,
        hasPrimaryLongarm = true,
        hasSecondaryWeapon = false,
    }) end,
    enter = {
        animDict = "mech_inspection@weapons@longarms@carbine@base",
        anim = "base_enter",
        blendInSpeed = 1.0,
        nextBlendInSpeed = 1.0,
        flag = AnimConfig.Flag.DontSuppressLoco,
        next = "idle_exhibit",
        onTrigger = function(info)
            AnimUtil.DisableFiring(true)
            info.final = function() AnimUtil.DisableFiring(false) end
            return info
        end,
    },
    exit = {
        animDict = "mech_inspection@weapons@longarms@carbine@base",
        anim = "base_exit",
        flag = AnimConfig.Flag.DontSuppressLoco,
        duration = 100,
    },
    idles = {
        idle_a = {
            animDict = "mech_inspection@weapons@longarms@carbine@base",
            anim = "base_idle_pose",
            name = "Hold Still",
            blendInSpeed = 1.0,
            flag = AnimConfig.Flag.Loop | AnimConfig.Flag.DontSuppressLoco,
            transitions = {
                idle_exhibit = "e",
                trans_inspect_clean = "w",
                trans_inspect_aim = "s",
                trans_inspect_flip = "f",
            },
        },
        idle_exhibit = {
            animDict = "mech_inspection@weapons@longarms@carbine@base",
            anim = "base_sweep",
            name = "Examine Longarm",
            flag = AnimConfig.Flag.Loop | AnimConfig.Flag.DontSuppressLoco,
            transitions = {
                idle_a = "e",
                trans_inspect_clean = "w",
                trans_inspect_aim = "s",
                trans_inspect_flip = "f",
            },
        },
    },
    animations = {
        trans_inspect_clean = {
            animDict = "mech_inspection@weapons@longarms@carbine@base",
            anim = "base_idle_pose",
            name = "Clean With Rag",
            flag = AnimConfig.Flag.DontSuppressLoco,
            animLibName = "longarm_male_clean",
            next = "a_enter",
        },
        trans_inspect_aim = {
            animDict = "mech_inspection@weapons@longarms@carbine@base",
            anim = "base_idle_pose",
            name = "Inspect Sights",
            flag = AnimConfig.Flag.DontSuppressLoco,
            animLibName = "longarm_male_aim",
            next = "a_enter",
        },
        trans_inspect_flip = {
            animDict = "mech_inspection@weapons@longarms@carbine@base",
            anim = "flipped_enter",
            name = "Flip Longarm",
            flag = AnimConfig.Flag.DontSuppressLoco,
            animLibName = "longarm_male_flipped",
            next = "idle_exhibit",
        },
    },
}

AnimLib.longarm_male_flipped = {
    name = "Examine Longarm",
    tags = {},
    key = "f",
    condition = function() return Conditions.Check({
        isMale = true,
        hasWeapon = true,
        hasPrimaryWeapon = true,
        hasPrimaryLongarm = true,
        hasSecondaryWeapon = false,
    }) end,
    enter = {
        animDict = "mech_inspection@weapons@longarms@carbine@base",
        anim = "flipped_enter",
        blendInSpeed = 1.0,
        nextBlendInSpeed = 1.0,
        flag = AnimConfig.Flag.DontSuppressLoco,
        next = "idle_exhibit",
        onTrigger = function(info)
            AnimUtil.DisableFiring(true)
            info.final = function() AnimUtil.DisableFiring(false) end
            return info
        end,
    },
    exit = {
        animDict = "mech_inspection@weapons@longarms@carbine@base",
        anim = "flipped_exit",
        flag = AnimConfig.Flag.DontSuppressLoco,
        next = "exit_2",
    },
    idles = {
        idle_a = {
            animDict = "mech_inspection@weapons@longarms@carbine@base",
            anim = "flipped_idle_pose",
            name = "Hold Still",
            blendInSpeed = 1.0,
            flag = AnimConfig.Flag.Loop | AnimConfig.Flag.DontSuppressLoco,
            transitions = {
                idle_exhibit = "e",
                trans_flipped_examine = "f",
                trans_flipped_clean = "w",
                trans_flipped_aim = "s",
            },
        },
        idle_exhibit = {
            animDict = "mech_inspection@weapons@longarms@carbine@base",
            anim = "flipped_sweep",
            name = "Examine Longarm",
            flag = AnimConfig.Flag.Loop | AnimConfig.Flag.DontSuppressLoco,
            transitions = {
                idle_a = "e",
                trans_flipped_examine = "f",
                trans_flipped_clean = "w",
                trans_flipped_aim = "s",
            },
        },
    },
    animations = {
        exit_2 = {
            animDict = "mech_inspection@weapons@longarms@carbine@base",
            anim = "base_exit",
            flag = AnimConfig.Flag.DontSuppressLoco,
            duration = 100,
        },
        trans_flipped_clean = {
            animDict = "mech_inspection@weapons@longarms@carbine@base",
            anim = "flipped_exit",
            name = "Clean With Rag",
            flag = AnimConfig.Flag.DontSuppressLoco,
            animLibName = "longarm_male_clean",
            next = "a_enter",
        },
        trans_flipped_aim = {
            animDict = "mech_inspection@weapons@longarms@carbine@base",
            anim = "flipped_exit",
            name = "Inspect Sights",
            flag = AnimConfig.Flag.DontSuppressLoco,
            animLibName = "longarm_male_aim",
            next = "a_enter",
        },
        trans_flipped_examine = {
            animDict = "mech_inspection@weapons@longarms@carbine@base",
            anim = "flipped_exit",
            name = "Flip Longarm",
            flag = AnimConfig.Flag.DontSuppressLoco,
            animLibName = "longarm_male_inspect",
            next = "idle_exhibit",
        },
    },
}

AnimLib.longarm_male_clean = {
    name = "Clean With Rag",
    tags = { weapon=1, },
    key = "w",
    condition = function() return Conditions.Check({
        isMale = true,
        hasWeapon = true,
        hasPrimaryWeapon = true,
        hasPrimaryLongarm = true,
        hasSecondaryWeapon = false,
    }) end,
    enter = {
        animDict = "mech_inspection@weapons@longarms@carbine@base",
        anim = "clean_enter",
        blendInSpeed = 1.0,
        flag = AnimConfig.Flag.DontSuppressLoco,
        onTrigger = function(info)
            info.prop.rag = Prop:new()
            AnimUtil.DisableFiring(true)
            info.final = function() AnimUtil.DisableFiring(false) end
            Citizen.Wait(1000)
            info.prop.rag:attach(info.ped, Propset.Rag)
            return info
        end,
    },
    exit = {
        animDict = "mech_inspection@weapons@longarms@carbine@base",
        anim = "clean_exit",
        next = "exit_2",
        blendInSpeed = 1.0,
        duration = 3000,
        flag = AnimConfig.Flag.DontSuppressLoco,
        onTrigger = function(info)
            Citizen.Wait(500)
            Prop.Delete(info.prop.rag)
            return info
        end,
    },
    idles = {
        idle_a = {
            animDict = "mech_inspection@weapons@longarms@carbine@base",
            anim = "clean_loop",
            flag = AnimConfig.Flag.Loop | AnimConfig.Flag.DontSuppressLoco,
            transitions = {
                trans_clean_inspect = "e",
                trans_clean_aim = "s",
            },
        },
    },
    animations = {
        a_enter = {
            animDict = "mech_inspection@weapons@longarms@carbine@base",
            anim = "clean_enter",
            flag = AnimConfig.Flag.DontSuppressLoco,
            blandInSpeed = 1.0,
            nextBlendInSpeed = 1.0,
            next = "idle_a",
            onTrigger = function(info)
                info.prop.rag = Prop:new()
                Citizen.Wait(1000)
                info.prop.rag:attach(info.ped, Propset.Rag)
                return info
            end,
        },
        exit_2 = {
            animDict = "mech_inspection@weapons@longarms@carbine@base",
            anim = "base_exit",
            flag = AnimConfig.Flag.DontSuppressLoco,
            duration = 100,
            onTrigger = function(info)
                Citizen.Wait(500)
                Prop.Delete(info.prop.rag)
                return info
            end,
        },
        trans_clean_inspect = {
            animDict = "mech_inspection@weapons@longarms@carbine@base",
            anim = "clean_exit",
            name = "Examine Longarm",
            blendInSpeed = 1.0,
            flag = AnimConfig.Flag.DontSuppressLoco,
            animLibName = "longarm_male_inspect",
            next = "idle_exhibit",
            onTrigger = function(info)
                Citizen.Wait(500)
                Prop.Delete(info.prop.rag)
                return info
            end,
        },
        trans_clean_aim = {
            animDict = "mech_inspection@weapons@longarms@carbine@base",
            anim = "clean_exit",
            name = "Inspect Sights",
            blendInSpeed = 1.0,
            flag = AnimConfig.Flag.DontSuppressLoco,
            animLibName = "longarm_male_aim",
            next = "a_enter",
            onTrigger = function(info)
                Citizen.Wait(500)
                Prop.Delete(info.prop.rag)
                return info
            end,
        },
    },
}

AnimLib.longarm_male_aim = {
    name = "Inspect Sights",
    tags = { weapon=1, },
    key = "s",
    condition = function() return Conditions.Check({
        isMale = true,
        hasWeapon = true,
        hasPrimaryWeapon = true,
        hasPrimaryLongarm = true,
        hasSecondaryWeapon = false,
    }) end,
    enter = {
        animDict = "mech_inspection@weapons@longarms@carbine@base",
        anim = "aim_enter",
        blendInSpeed = 1.0,
        nextBlendInSpeed = 1.0,
        flag = AnimConfig.Flag.DontSuppressLoco,
        next = "idle_exhibit",
        onTrigger = function(info)
            AnimUtil.DisableFiring(true)
            info.final = function() AnimUtil.DisableFiring(false) end
            return info
        end,
    },
    exit = {
        animDict = "mech_inspection@weapons@longarms@carbine@base",
        anim = "aim_exit",
        flag = AnimConfig.Flag.DontSuppressLoco,
        next = "exit_2",
        duration = 1300,
    },
    idles = {
        idle_a = {
            animDict = "mech_inspection@weapons@longarms@carbine@base",
            anim = "aim_idle_pose",
            name = "Hold Still",
            flag = AnimConfig.Flag.Loop | AnimConfig.Flag.DontSuppressLoco,
            transitions = {
                idle_exhibit = "s",
                trans_aim_inspect = "e",
                trans_aim_clean = "w",
            }
        },
        idle_exhibit = {
            animDict = "mech_inspection@weapons@longarms@carbine@base",
            anim = "aim_sweep",
            flag = AnimConfig.Flag.Loop | AnimConfig.Flag.DontSuppressLoco,
            name = "Inspect Sights",
            transitions = {
                idle_a = "s",
                trans_aim_inspect = "e",
                trans_aim_clean = "w",
            }
        },
    },
    animations = {
        a_enter = {
            animDict = "mech_inspection@weapons@longarms@carbine@base",
            anim = "aim_enter",
            flag = AnimConfig.Flag.DontSuppressLoco,
            next = "idle_a",
        },
        exit_2 = {
            animDict = "mech_inspection@weapons@longarms@carbine@base",
            anim = "base_exit",
            flag = AnimConfig.Flag.DontSuppressLoco,
            duration = 100,
        },
        trans_aim_inspect = {
            animDict = "mech_inspection@weapons@longarms@carbine@base",
            anim = "aim_exit",
            name = "Examine Longarm",
            flag = AnimConfig.Flag.DontSuppressLoco,
            animLibName = "longarm_male_inspect",
            next = "idle_exhibit",
        },
        trans_aim_clean= {
            animDict = "mech_inspection@weapons@longarms@carbine@base",
            anim = "aim_exit",
            name = "Clean With Rag",
            blendOutSpeed = 0.8,
            flag = AnimConfig.Flag.DontSuppressLoco,
            animLibName = "longarm_male_clean",
            next = "a_enter",
        },
    },
}

AnimLib.longarm_female_inspect = {
    name = "Examine Longarm",
    tags = { weapon=1, },
    key = "e",
    condition = function() return Conditions.Check({
        isMale = false,
        hasWeapon = true,
        hasPrimaryWeapon = true,
        hasPrimaryLongarm = true,
        hasSecondaryWeapon = false,
    }) end,
    enter = {
        animDict = "mp_mech_inspection@female@weapons@longarms@repeater_evans@base",
        anim = "base_enter",
        blendInSpeed = 1.0,
        nextBlendInSpeed = 1.0,
        flag = AnimConfig.Flag.DontSuppressLoco,
        next = "idle_exhibit",
        onTrigger = function(info)
            AnimUtil.DisableFiring(true)
            info.final = function() AnimUtil.DisableFiring(false) end
            return info
        end,
    },
    exit = {
        animDict = "mp_mech_inspection@female@weapons@longarms@repeater_evans@base",
        anim = "base_exit",
        flag = AnimConfig.Flag.DontSuppressLoco,
        duration = 300,
    },
    idles = {
        idle_a = {
            animDict = "mp_mech_inspection@female@weapons@longarms@repeater_evans@base",
            anim = "base_idle_pose",
            name = "Hold Still",
            blendInSpeed = 1.0,
            flag = AnimConfig.Flag.Loop | AnimConfig.Flag.DontSuppressLoco,
            transitions = {
                idle_exhibit = "e",
                trans_inspect_clean = "w",
                trans_inspect_aim = "s",
                trans_inspect_flip = "f",
            },
        },
        idle_exhibit = {
            animDict = "mp_mech_inspection@female@weapons@longarms@repeater_evans@base",
            anim = "base_sweep",
            name = "Examine Longarm",
            flag = AnimConfig.Flag.Loop | AnimConfig.Flag.DontSuppressLoco,
            transitions = {
                idle_a = "e",
                trans_inspect_clean = "w",
                trans_inspect_aim = "s",
                trans_inspect_flip = "f",
            },
        },
    },
    animations = {
        trans_inspect_clean = {
            animDict = "mp_mech_inspection@female@weapons@longarms@repeater_evans@base",
            anim = "base_idle_pose",
            name = "Clean With Rag",
            flag = AnimConfig.Flag.DontSuppressLoco,
            animLibName = "longarm_female_clean",
            next = "a_enter",
        },
        trans_inspect_aim = {
            animDict = "mp_mech_inspection@female@weapons@longarms@repeater_evans@base",
            anim = "base_idle_pose",
            name = "Inspect Sights",
            flag = AnimConfig.Flag.DontSuppressLoco,
            animLibName = "longarm_female_aim",
            next = "a_enter",
        },
        trans_inspect_flip = {
            animDict = "mp_mech_inspection@female@weapons@longarms@repeater_evans@base",
            anim = "flipped_enter",
            name = "Flip Longarm",
            flag = AnimConfig.Flag.DontSuppressLoco,
            animLibName = "longarm_female_flipped",
            next = "idle_exhibit",
        },
    },
}

AnimLib.longarm_female_flipped = {
    name = "Examine Longarm",
    tags = {},
    key = "f",
    condition = function() return Conditions.Check({
        isMale = false,
        hasWeapon = true,
        hasPrimaryWeapon = true,
        hasPrimaryLongarm = true,
        hasSecondaryWeapon = false,
    }) end,
    enter = {
        animDict = "mp_mech_inspection@female@weapons@longarms@repeater_evans@base",
        anim = "flipped_enter",
        blendInSpeed = 1.0,
        nextBlendInSpeed = 1.0,
        flag = AnimConfig.Flag.DontSuppressLoco,
        next = "idle_exhibit",
        onTrigger = function(info)
            AnimUtil.DisableFiring(true)
            info.final = function() AnimUtil.DisableFiring(false) end
            return info
        end,
    },
    exit = {
        animDict = "mp_mech_inspection@female@weapons@longarms@repeater_evans@base",
        anim = "flipped_exit",
        flag = AnimConfig.Flag.DontSuppressLoco,
        next = "exit_2",
    },
    idles = {
        idle_a = {
            animDict = "mp_mech_inspection@female@weapons@longarms@repeater_evans@base",
            anim = "flipped_idle_pose",
            name = "Hold Still",
            blendInSpeed = 1.0,
            flag = AnimConfig.Flag.Loop | AnimConfig.Flag.DontSuppressLoco,
            transitions = {
                idle_exhibit = "e",
                trans_flipped_examine = "f",
                trans_flipped_clean = "w",
                trans_flipped_aim = "s",
            },
        },
        idle_exhibit = {
            animDict = "mp_mech_inspection@female@weapons@longarms@repeater_evans@base",
            anim = "flipped_sweep",
            name = "Examine Longarm",
            flag = AnimConfig.Flag.Loop | AnimConfig.Flag.DontSuppressLoco,
            transitions = {
                idle_a = "e",
                trans_flipped_examine = "f",
                trans_flipped_clean = "w",
                trans_flipped_aim = "s",
            },
        },
    },
    animations = {
        exit_2 = {
            animDict = "mp_mech_inspection@female@weapons@longarms@repeater_evans@base",
            anim = "base_exit",
            flag = AnimConfig.Flag.DontSuppressLoco,
            duration = 300,
        },
        trans_flipped_clean = {
            animDict = "mp_mech_inspection@female@weapons@longarms@repeater_evans@base",
            anim = "flipped_exit",
            name = "Clean With Rag",
            flag = AnimConfig.Flag.DontSuppressLoco,
            animLibName = "longarm_female_clean",
            next = "a_enter",
        },
        trans_flipped_aim = {
            animDict = "mp_mech_inspection@female@weapons@longarms@repeater_evans@base",
            anim = "flipped_exit",
            name = "Inspect Sights",
            flag = AnimConfig.Flag.DontSuppressLoco,
            animLibName = "longarm_female_aim",
            next = "a_enter",
        },
        trans_flipped_examine = {
            animDict = "mp_mech_inspection@female@weapons@longarms@repeater_evans@base",
            anim = "flipped_exit",
            name = "Flip Longarm",
            flag = AnimConfig.Flag.DontSuppressLoco,
            animLibName = "longarm_female_inspect",
            next = "idle_exhibit",
        },
    },
}

AnimLib.longarm_female_clean = {
    name = "Clean With Rag",
    tags = { weapon=1, },
    key = "w",
    condition = function() return Conditions.Check({
        isMale = false,
        hasWeapon = true,
        hasPrimaryWeapon = true,
        hasPrimaryLongarm = true,
        hasSecondaryWeapon = false,
    }) end,
    enter = {
        animDict = "mp_mech_inspection@female@weapons@longarms@repeater_evans@base",
        anim = "clean_enter",
        blendInSpeed = 1.0,
        flag = AnimConfig.Flag.DontSuppressLoco,
        onTrigger = function(info)
            info.prop.rag = Prop:new()
            AnimUtil.DisableFiring(true)
            info.final = function() AnimUtil.DisableFiring(false) end
            Citizen.Wait(1000)
            info.prop.rag:attach(info.ped, Propset.Rag)
            return info
        end,
    },
    exit = {
        animDict = "mp_mech_inspection@female@weapons@longarms@repeater_evans@base",
        anim = "clean_exit",
        next = "exit_2",
        blendInSpeed = 1.0,
        flag = AnimConfig.Flag.DontSuppressLoco,
        duration = 2400,
        onTrigger = function(info)
            Citizen.Wait(500)
            Prop.Delete(info.prop.rag)
            return info
        end,
    },
    idles = {
        idle_a = {
            animDict = "mp_mech_inspection@female@weapons@longarms@repeater_evans@base",
            anim = "clean_loop",
            flag = AnimConfig.Flag.Loop | AnimConfig.Flag.DontSuppressLoco,
            transitions = {
                trans_clean_inspect = "e",
                trans_clean_aim = "s",
            },
        },
    },
    animations = {
        a_enter = {
            animDict = "mp_mech_inspection@female@weapons@longarms@repeater_evans@base",
            anim = "clean_enter",
            flag = AnimConfig.Flag.DontSuppressLoco,
            blandInSpeed = 1.0,
            nextBlendInSpeed = 1.0,
            next = "idle_a",
            onTrigger = function(info)
                info.prop.rag = Prop:new()
                Citizen.Wait(1000)
                info.prop.rag:attach(info.ped, Propset.Rag)
                return info
            end,
        },
        exit_2 = {
            animDict = "mp_mech_inspection@female@weapons@longarms@repeater_evans@base",
            anim = "base_exit",
            flag = AnimConfig.Flag.DontSuppressLoco,
            duration = 450,
            onTrigger = function(info)
                Citizen.Wait(500)
                Prop.Delete(info.prop.rag)
                return info
            end,
        },
        trans_clean_inspect = {
            animDict = "mp_mech_inspection@female@weapons@longarms@repeater_evans@base",
            anim = "clean_exit",
            name = "Examine Longarm",
            blendInSpeed = 1.0,
            flag = AnimConfig.Flag.DontSuppressLoco,
            animLibName = "longarm_female_inspect",
            next = "idle_exhibit",
            onTrigger = function(info)
                Citizen.Wait(500)
                Prop.Delete(info.prop.rag)
                return info
            end,
        },
        trans_clean_aim = {
            animDict = "mp_mech_inspection@female@weapons@longarms@repeater_evans@base",
            anim = "clean_exit",
            name = "Inspect Sights",
            blendInSpeed = 1.0,
            flag = AnimConfig.Flag.DontSuppressLoco,
            animLibName = "longarm_female_aim",
            next = "a_enter",
            onTrigger = function(info)
                Citizen.Wait(500)
                Prop.Delete(info.prop.rag)
                return info
            end,
        },
    },
}

AnimLib.longarm_female_aim = {
    name = "Inspect Sights",
    tags = { weapon=1, },
    key = "s",
    condition = function() return Conditions.Check({
        isMale = false,
        hasWeapon = true,
        hasPrimaryWeapon = true,
        hasPrimaryLongarm = true,
        hasSecondaryWeapon = false,
    }) end,
    enter = {
        animDict = "mp_mech_inspection@female@weapons@longarms@repeater_evans@base",
        anim = "aim_enter",
        blendInSpeed = 1.0,
        nextBlendInSpeed = 1.0,
        flag = AnimConfig.Flag.DontSuppressLoco,
        next = "idle_exhibit",
        onTrigger = function(info)
            AnimUtil.DisableFiring(true)
            info.final = function() AnimUtil.DisableFiring(false) end
            return info
        end,
    },
    exit = {
        animDict = "mp_mech_inspection@female@weapons@longarms@repeater_evans@base",
        anim = "aim_exit",
        flag = AnimConfig.Flag.DontSuppressLoco,
        next = "exit_2",
        duration = 700,
    },
    idles = {
        idle_a = {
            animDict = "mp_mech_inspection@female@weapons@longarms@repeater_evans@base",
            anim = "aim_idle_pose",
            name = "Hold Still",
            flag = AnimConfig.Flag.Loop | AnimConfig.Flag.DontSuppressLoco,
            transitions = {
                idle_exhibit = "s",
                trans_aim_inspect = "e",
                trans_aim_clean = "w",
            }
        },
        idle_exhibit = {
            animDict = "mp_mech_inspection@female@weapons@longarms@repeater_evans@base",
            anim = "aim_sweep",
            flag = AnimConfig.Flag.Loop | AnimConfig.Flag.DontSuppressLoco,
            name = "Inspect Sights",
            transitions = {
                idle_a = "s",
                trans_aim_inspect = "e",
                trans_aim_clean = "w",
            }
        },
    },
    animations = {
        a_enter = {
            animDict = "mp_mech_inspection@female@weapons@longarms@repeater_evans@base",
            anim = "aim_enter",
            flag = AnimConfig.Flag.DontSuppressLoco,
            next = "idle_a",
        },
        exit_2 = {
            animDict = "mp_mech_inspection@female@weapons@longarms@repeater_evans@base",
            anim = "base_exit",
            flag = AnimConfig.Flag.DontSuppressLoco,
            duration = 200,
        },
        trans_aim_inspect = {
            animDict = "mp_mech_inspection@female@weapons@longarms@repeater_evans@base",
            anim = "aim_exit",
            name = "Examine Longarm",
            flag = AnimConfig.Flag.DontSuppressLoco,
            animLibName = "longarm_female_inspect",
            next = "idle_exhibit",
        },
        trans_aim_clean= {
            animDict = "mp_mech_inspection@female@weapons@longarms@repeater_evans@base",
            anim = "aim_exit",
            name = "Clean With Rag",
            blendOutSpeed = 0.8,
            flag = AnimConfig.Flag.DontSuppressLoco,
            animLibName = "longarm_female_clean",
            next = "a_enter",
        },
    },
}

AnimLib.guntrick = {
    name = "Twirl Gun",
    tags = { weapon=1, },
    key = "t",
    condition = function() return Conditions.Check({
        hasWeapon = true,
        hasPrimaryWeapon = true,
        hasPrimaryShortarm = true,
        hasSecondaryWeapon = false,
    }) end,
    enter = {
        animDict = "",
        anim = "",
        next = "idle_0",
        onTrigger = function(info)
            info.twirlHash = `KIT_EMOTE_TWIRL_GUN`
            return info
        end,
    },
    exit = {
        animDict = "",
        anim = "",
        onTrigger = function(info)
            Citizen.InvokeNative(0xCBCFFF805F1B4596, info.ped, 0)
            return info
        end,
    },
    idles = {
        idle_0 = {
            animDict = "",
            anim = "",
            name = "Reverse Spin",
            onTrigger = function(info)
                Citizen.InvokeNative(0xCBCFFF805F1B4596, info.ped, info.twirlHash)
                Citizen.InvokeNative(0xB31A277C1AC7B7FF, info.ped, 4, 1, info.twirlHash, 1, 1, 0, 0, 0)
                Citizen.InvokeNative(0x01F661BB9C71B465, info.ped, 4, N_0xf4601c1203b1a78d(info.twirlHash, 0))
                Citizen.InvokeNative(0x408CF580C5E96D49, info.ped, 4)
                return info
            end,
            transitions = {
                idle_0 = "r",
                idle_1 = "w",
                idle_2 = "q",
                idle_3 = "f",
                idle_4 = "t",
                idle_5 = "e",
            }
        },
        idle_1 = {
            animDict = "",
            anim = "",
            name = "Spin Up",
            onTrigger = function(info)
                Citizen.InvokeNative(0xCBCFFF805F1B4596, info.ped, info.twirlHash)
                Citizen.InvokeNative(0xB31A277C1AC7B7FF, info.ped, 4, 1, info.twirlHash, 1, 1, 0, 0, 0)
                Citizen.InvokeNative(0x01F661BB9C71B465, info.ped, 4, N_0xf4601c1203b1a78d(info.twirlHash, 1))
                Citizen.InvokeNative(0x408CF580C5E96D49, info.ped, 4)
                return info
            end,
            transitions = {
                idle_0 = "r",
                idle_1 = "w",
                idle_2 = "q",
                idle_3 = "f",
                idle_4 = "t",
                idle_5 = "e",
            }
        },
        idle_2 = {
            animDict = "",
            anim = "",
            name = "Reverse Spin Up",
            onTrigger = function(info)
                Citizen.InvokeNative(0xCBCFFF805F1B4596, info.ped, info.twirlHash)
                Citizen.InvokeNative(0xB31A277C1AC7B7FF, info.ped, 4, 1, info.twirlHash, 1, 0, 0, 0, 0)
                Citizen.InvokeNative(0x01F661BB9C71B465, info.ped, 4, N_0xf4601c1203b1a78d(info.twirlHash, 2))
                Citizen.InvokeNative(0x408CF580C5E96D49, info.ped, 4)
                return info
            end,
            transitions = {
                idle_0 = "r",
                idle_1 = "w",
                idle_2 = "q",
                idle_3 = "f",
                idle_4 = "t",
                idle_5 = "e",
            }
        },
        idle_3 = {
            animDict = "",
            anim = "",
            name = "Alternating Flips",
            onTrigger = function(info)
                Citizen.InvokeNative(0xCBCFFF805F1B4596, info.ped, info.twirlHash)
                Citizen.InvokeNative(0xB31A277C1AC7B7FF, info.ped, 4, 1, info.twirlHash, 1, 0, 0, 0, 0)
                Citizen.InvokeNative(0x01F661BB9C71B465, info.ped, 4, N_0xf4601c1203b1a78d(info.twirlHash, 3))
                Citizen.InvokeNative(0x408CF580C5E96D49, info.ped, 4)
                return info
            end,
            transitions = {
                idle_0 = "r",
                idle_1 = "w",
                idle_2 = "q",
                idle_3 = "f",
                idle_4 = "t",
                idle_5 = "e",
            }
        },
        idle_4 = {
            animDict = "",
            anim = "",
            name = "Shoulder Toss",
            onTrigger = function(info)
                Citizen.InvokeNative(0xCBCFFF805F1B4596, info.ped, info.twirlHash)
                Citizen.InvokeNative(0xB31A277C1AC7B7FF, info.ped, 4, 1, info.twirlHash, 1, 0, 0, 0, 0)
                Citizen.InvokeNative(0x01F661BB9C71B465, info.ped, 4, N_0xf4601c1203b1a78d(info.twirlHash, 4))
                Citizen.InvokeNative(0x408CF580C5E96D49, info.ped, 4)
                return info
            end,
            transitions = {
                idle_0 = "r",
                idle_1 = "w",
                idle_2 = "q",
                idle_3 = "f",
                idle_4 = "t",
                idle_5 = "e",
            }
        },
        idle_5 = {
            animDict = "",
            anim = "",
            name = "Figure Eight Toss",
            onTrigger = function(info)
                Citizen.InvokeNative(0xCBCFFF805F1B4596, info.ped, info.twirlHash)
                Citizen.InvokeNative(0xB31A277C1AC7B7FF, info.ped, 4, 1, info.twirlHash, 1, 0, 0, 0, 0)
                Citizen.InvokeNative(0x01F661BB9C71B465, info.ped, 4, N_0xf4601c1203b1a78d(info.twirlHash, 5))
                Citizen.InvokeNative(0x408CF580C5E96D49, info.ped, 4)
                return info
            end,
            transitions = {
                idle_0 = "r",
                idle_1 = "w",
                idle_2 = "q",
                idle_3 = "f",
                idle_4 = "t",
                idle_5 = "e",
            }
        },
    },
}

AnimLib.longarm_crouch_track = {
    name = "Inspect Tracks",
    tags = { squat=1, },
    key = "z",
    condition = function() return Conditions.Check({
        hasWeapon = true,
        hasPrimaryWeapon = true,
        hasPrimaryLongarm = true,
        hasSecondaryWeapon = false,
    }) end,
    enter = {
        animDict = "amb_camp@world_camp_lenny_guard@crouch_tracks@male_a@stand_enter_withprop",
        anim = "enter_back_rf",
        blendInSpeed = 1.0,
        onTrigger = function(info)
            AnimUtil.DisableFiring(true)
            info.final = function() AnimUtil.DisableFiring(false) end
            return info
        end,
    },
    exit = {
        animDict = "amb_camp@world_camp_lenny_guard@crouch_tracks@male_a@stand_exit_withprop",
        anim = "exit_front",
        duration = 1200,
    },
    idles = {
        idle_a = {
            animDict = "amb_camp@world_camp_lenny_guard@crouch_tracks@male_a@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
            transitions = {
                a_a = "g",
                a_b = "s",
                a_c = "e",
                a_d = "a",
                a_e = "d",
                a_f = "b",
                a_g = "w",
            },
        },
    },
    animations = {
        a_a = {
            animDict = "amb_camp@world_camp_lenny_guard@crouch_tracks@male_a@idle_a",
            anim = "idle_a",
            name = "Scan Ground",
        },
        a_b = {
            animDict = "amb_camp@world_camp_lenny_guard@crouch_tracks@male_a@idle_a",
            anim = "idle_b",
            name = "Stand, Look Around",
        },
        a_c = {
            animDict = "amb_camp@world_camp_lenny_guard@crouch_tracks@male_a@idle_a",
            anim = "idle_c",
            name = "Examine consistency",
        },
        a_d = {
            animDict = "amb_camp@world_camp_lenny_guard@crouch_tracks@male_a@idle_b",
            anim = "idle_d",
            name = "Look Left",
        },
        a_e = {
            animDict = "amb_camp@world_camp_lenny_guard@crouch_tracks@male_a@idle_b",
            anim = "idle_e",
            name = "Look Back Right",
        },
        a_f = {
            animDict = "amb_camp@world_camp_lenny_guard@crouch_tracks@male_a@idle_b",
            anim = "idle_f",
            name = "Clear Brush",
        },
        a_g = {
            animDict = "amb_camp@world_camp_lenny_guard@crouch_tracks@male_a@idle_c",
            anim = "idle_g",
            name = "Stand, Look Front",
        },
    },
}

AnimLib.knife_slash = {
    name = "Cut Front",
    tags = { weapon=1, },
    key = "x",
    condition = function() return Conditions.Check({
        hasWeapon = true,
        hasPrimaryWeapon = true,
        hasPrimaryKnife = true,
        hasSecondaryWeapon = false,
    }) end,
    enter = {
        animDict = "ai_gestures@arthur@standing@to_horse",
        anim = "horse_cut_free_knife",
        blendInSpeed = 1.0,
        duration = 1000,
    },
}
