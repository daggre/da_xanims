AnimLib.ragdoll = {
    name = "Ragdoll",
    tags = { root=1, },
    key = "r",
    condition = function() return Conditions.Check({
        isAnimal = "allow",
        isSwimming = "allow",
        isAiming = "allow",
        hasPrimaryWeapon = "allow",
        hasSecondaryWeapon = "allow",
        hasWeapon = "allow",
        onMount = "allow",
        isSprinting = "allow",
        isMountSprinting = "allow",
    }) end,
    enter = {
        animDict = "",
        anim = "",
        onTrigger = function(info)
            info.ragdoll = true
            Citizen.CreateThread(function()
                while info.ragdoll do
                    SetPedToRagdoll(info.ped, 2000, 3000, 0, false, false, false)
                    Citizen.Wait(500)
                    ResetPedRagdollTimer(info.ped)
                end
            end)
            return info
        end,
    },
    exit = {
        animDict = "",
        anim = "",
        onTrigger = function(info)
            if info then info.ragdoll = nil; end
            return info
        end,
    },
}

AnimLib.medical_bandage = {
    name = "Bandage Kneeling",
    tags = { medical=1, },
    key = "z",
    enter = {
        animDict = "amb_camp@world_camp_fire_crouch@tend@male_a@stand_enter",
        anim = "enter_back_lf",
        duration = 2400,
        blendInSpeed = 1.0,
        nextBlendInSpeed = 0.6,
    },
    exit = {
        animDict = "amb_camp@world_camp_fire_crouch@tend@male_a@stand_exit",
        anim = "exit_front",
        duration = 3800,
        blendInSpeed = 0.6,
    },
    idles = {
        idle_bandage = {
            animDict = "mini_games@story@mob4@heal_jules@bandage@arthur",
            anim = "bandage_slow",
            flag = AnimConfig.Flag.Loop,
            name = "Bandage",
        },
    },
}

AnimLib.medical_bandage_standing = {
    name = "Bandage Standing",
    tags = { medical=1, },
    key = "b",
    enter = {
        animDict = "mini_games@story@mob4@heal_jules@bandage@arthur",
        anim = "bandage_enter",
        duration = 2400,
        flag = AnimConfig.Flag.UpperBody,
        blendInSpeed = 1.0,
        nextBlendInSpeed = 0.6,
        next = "idle_a",
    },
    exit = {
    },
    idles = {
        idle_a = {
            animDict = "mini_games@story@mob4@heal_jules@bandage@arthur",
            anim = "bandage_jules_idle2",
            flag = AnimConfig.Flag.UpperBody | AnimConfig.Flag.Loop,
            name = "Wait",
            blendInSpeed = 1.0,
            transitions = {
                bandage = "b",
                bandage_wet = "s",
                -- sweep = "b",
            }
        },
    },
    animations = {
        bandage = {
            animDict = "mini_games@story@mob4@heal_jules@bandage@arthur",
            anim = "bandage_slow",
            flag = AnimConfig.Flag.UpperBody,
            name = "Bandage",
        },
        bandage_wet = {
            animDict = "mini_games@story@mob4@heal_jules@bandage@arthur",
            anim = "bandage_sweep_full",
            flag = AnimConfig.Flag.UpperBody,
            name = "Bandage Noisy",
        },
    },
}

AnimLib.injured_left_arm = {
    name = "Left Arm",
    tags = { injured=1, },
    key = "a",
    enter = {
        animDict = "mech_loco_m@generic@injured@unarmed@left_arm@idle",
        anim = "idle_intro",
        blendInSpeed = 1.0,
        flag = AnimConfig.Flag.Move,
    },
    exit = {
        animDict = "mech_loco_m@generic@injured@unarmed@left_arm@idle",
        anim = "idle",
        flag = AnimConfig.Flag.Move,
        duration = 100,
    },
    idles = {
        idle_a = {
            animDict = "mech_loco_m@generic@injured@unarmed@left_arm@idle",
            anim = "idle",
            flag = AnimConfig.Flag.MoveLoop,
        },
    },
}

AnimLib.injured_right_arm = {
    name = "Right Arm",
    tags = { injured=1, },
    key = "d",
    enter = {
        animDict = "mech_loco_m@generic@injured@unarmed@right_arm@idle",
        anim = "idle_intro",
        blendInSpeed = 1.0,
        flag = AnimConfig.Flag.Move,
    },
    exit = {
        animDict = "mech_loco_m@generic@injured@unarmed@right_arm@idle",
        anim = "idle",
        flag = AnimConfig.Flag.Move,
        duration = 100,
    },
    idles = {
        idle_a = {
            animDict = "mech_loco_m@generic@injured@unarmed@right_arm@idle",
            anim = "idle",
            flag = AnimConfig.Flag.MoveLoop,
        },
    },
}

AnimLib.injured_left_leg = {
    name = "Left Leg",
    tags = { injured=1, },
    key = "z",
    enter = {
        animDict = "mech_loco_m@generic@injured@unarmed@left_leg@idle",
        anim = "idle_intro",
        blendInSpeed = 1.0,
    },
    exit = {
        animDict = "mech_loco_m@generic@injured@unarmed@left_leg@idle",
        anim = "idle",
        duration = 100,
    },
    idles = {
        idle_a = {
            animDict = "mech_loco_m@generic@injured@unarmed@left_leg@idle",
            anim = "idle",
            flag = AnimConfig.Flag.Loop,
            transitions = {
                trans_a_b = "w",
                trans_a_sit = "t",
            }
        },
    },
    animations = {
        trans_a_b = {
            animDict = "mech_loco_m@generic@injured@unarmed@left_leg@idle",
            anim = "idle",
            duration = 100,
            blendInSpeed = 1.0,
            nextBlendInSpeed = 1.0,
            next = "idle_a",
            animLibName = "injured_left_leg_walk",
            name = "Transition to Walk",
        },
        trans_a_sit = {
            animDict = "amb_rest_sit@world_human_sit_ground@male_c@stand_enter",
            anim = "enter_back_rf",
            duration = 3800,
            blendInSpeed = 1.0,
            nextBlendInSpeed = 1.0,
            next = "idle_a",
            animLibName = "injured_leg_sit",
            name = "Transition to Sit",
        },
    }
}

AnimLib.injured_right_leg = {
    name = "Right Leg",
    tags = { injured=1, },
    key = "x",
    enter = {
        animDict = "mech_loco_m@generic@injured@unarmed@right_leg@idle",
        anim = "idle_intro",
        blendInSpeed = 1.0,
    },
    exit = {
        animDict = "mech_loco_m@generic@injured@unarmed@right_leg@idle",
        anim = "idle",
        duration = 100,
    },
    idles = {
        idle_a = {
            animDict = "mech_loco_m@generic@injured@unarmed@right_leg@idle",
            anim = "idle",
            flag = AnimConfig.Flag.Loop,
            transitions = {
                trans_a_b = "w",
            }
        },
    },
    animations = {
        trans_a_b = {
            animDict = "mech_loco_m@generic@injured@unarmed@right_leg@idle",
            anim = "idle",
            duration = 100,
            blendInSpeed = 1.0,
            nextBlendInSpeed = 1.0,
            next = "idle_a",
            animLibName = "injured_right_leg_walk",
            name = "Transition to Walk",
        },
    }
}

AnimLib.injured_left_leg_walk = {
    name = "Left Leg",
    tags = {},
    key = "",
    enter = {
        animDict = "mech_loco_m@generic@injured@unarmed@left_leg@idle",
        anim = "idle_intro",
        blendInSpeed = 1.0,
        flag = AnimConfig.Flag.Move,
    },
    exit = {
        animDict = "mech_loco_m@generic@injured@unarmed@left_leg@idle",
        anim = "idle",
        flag = AnimConfig.Flag.Move,
        duration = 100,
    },
    idles = {
        idle_a = {
            animDict = "mech_loco_m@generic@injured@unarmed@left_leg@idle",
            anim = "idle",
            flag = AnimConfig.Flag.MoveLoop,
            transitions = {
                trans_a_b = "s",
                trans_a_sit = "t",
            }
        },
    },
    animations = {
        trans_a_b = {
            animDict = "mech_loco_m@generic@injured@unarmed@left_leg@idle",
            anim = "idle",
            duration = 100,
            blendInSpeed = 1.0,
            nextBlendInSpeed = 1.0,
            next = "idle_a",
            animLibName = "injured_left_leg",
            name = "Transition to Stand",
        },
        trans_a_sit = {
            animDict = "amb_rest_sit@world_human_sit_ground@male_c@stand_enter",
            anim = "enter_back_rf",
            duration = 3800,
            blendInSpeed = 1.0,
            nextBlendInSpeed = 1.0,
            next = "idle_a",
            animLibName = "injured_leg_sit",
            name = "Transition to Sit",
        },
    }
}

AnimLib.injured_right_leg_walk = {
    name = "Right Leg",
    tags = {},
    key = "",
    enter = {
        animDict = "mech_loco_m@generic@injured@unarmed@right_leg@idle",
        anim = "idle_intro",
        blendInSpeed = 1.0,
        flag = AnimConfig.Flag.Move,
    },
    exit = {
        animDict = "mech_loco_m@generic@injured@unarmed@right_leg@idle",
        anim = "idle",
        flag = AnimConfig.Flag.Move,
        duration = 100,
    },
    idles = {
        idle_a = {
            animDict = "mech_loco_m@generic@injured@unarmed@right_leg@idle",
            anim = "idle",
            flag = AnimConfig.Flag.MoveLoop,
            transitions = {
                trans_a_b = "s",
            }
        },
    },
    animations = {
        trans_a_b = {
            animDict = "mech_loco_m@generic@injured@unarmed@right_leg@idle",
            anim = "idle",
            duration = 100,
            blendInSpeed = 1.0,
            nextBlendInSpeed = 1.0,
            next = "idle_a",
            animLibName = "injured_right_leg",
            name = "Transition to Stand",
        },
    }
}

AnimLib.injured_writhe = {
    name = "Writhe",
    tags = { injured=1, },
    key = "w",
    enter = {
        animDict = "ai_combat@damage@normal_pistol@to_injured",
        anim = "normal_to_injured",
        blendInSpeed = 0.4,
        next = "injured_to_writhe",
        duration = 200,
    },
    exit = {
        animDict = "amb_rest@world_human_sleep_ground@pillow@female_a@stand_exit",
        anim = "exit_right",
        blendInSpeed = 0.3,
        duration = 8000,
    },
    idles = {
        idle_a = {
            animDict = "ai_combat@damage@writhe@base",
            anim = "writhe_loop",
            flag = AnimConfig.Flag.Loop,
            transitions = {
                a_a = "a",
                a_b = "g",
                a_c = "x",
                a_d = "r",
                a_e = "z",
                a_f = "f",
            }
        },
    },
    animations = {
        injured_to_writhe = {
            animDict = "ai_combat@damage@injured_pistol@to_writhe",
            anim = "variation_a",
            next = "idle_a",
            blendInSpeed = 0.7,
        },
        a_a = {
            animDict = "ai_combat@damage@writhe@idle_a",
            anim = "writhe_idle_a",
            name = "Hold Abs Onto Knees",
        },
        a_b = {
            animDict = "ai_combat@damage@writhe@idle_a",
            anim = "writhe_idle_b",
            name = "Brace Against Ground",
        },
        a_c = {
            animDict = "ai_combat@damage@writhe@idle_a",
            anim = "writhe_idle_c",
            name = "Clench",
        },
        a_d = {
            animDict = "ai_combat@damage@writhe@idle_b",
            anim = "writhe_idle_d",
            name = "Rocking Knees and Back",
        },
        a_e = {
            animDict = "ai_combat@damage@writhe@idle_b",
            anim = "writhe_idle_e",
            name = "Hold Left Leg",
        },
        a_f = {
            animDict = "ai_combat@damage@writhe@idle_b",
            anim = "writhe_idle_f",
            name = "Hold Face",
        },
    }
}

AnimLib.injured_pain_back = {
    name = "Back Pain",
    tags = { injured=1, },
    key = "b",
    enter = {
        animDict = "mech_loco_m@character@arthur@fidgets@injured@action@unarmed",
        anim = "pain_back",
        blendInSpeed = 1.0,
        flag = AnimConfig.Flag.Move,
    },
    exit = {
        animDict = "",
        anim = "",
    },
    idles = {
        idle_a = {
            animDict = "mech_loco_m@character@arthur@fidgets@injured@action@unarmed",
            anim = "pain_back",
            flag = AnimConfig.Flag.MoveLoop,
        },
    },
}

AnimLib.injured_pain_side = {
    name = "Pain Right Side",
    tags = { injured=1, },
    key = "r",
    enter = {
        animDict = "mech_loco_m@character@arthur@fidgets@injured@normal@unarmed",
        anim = "pain_03",
        blendInSpeed = 1.0,
        nextBlendInSpeed = 1.0,
        duration = 2500,
        flag = AnimConfig.Flag.Move,
    },
    exit = {},
    idles = {
        idle_a = {
            animDict = "mech_loco_m@character@arthur@fidgets@injured@normal@unarmed",
            anim = "pain_03",
            flag = AnimConfig.Flag.MoveLoop,
            blendOutSpeed = 2.0,
        },
    },
}

AnimLib.injured_pain_stomach = {
    name = "Pain Stomach",
    tags = { injured=1, },
    key = "s",
    enter = {
        animDict = "mech_loco_m@character@arthur@fidgets@injured@normal@unarmed",
        anim = "pain_01",
        blendInSpeed = 1.0,
        duration = 1500,
        flag = AnimConfig.Flag.Move,
        next = "pain_stomach",
    },
    exit = {},
    animations = {
        pain_stomach = {
            animDict = "mech_loco_m@character@arthur@fidgets@injured@normal@unarmed",
            anim = "pain_01",
            duration = 1500,
            flag = AnimConfig.Flag.Move,
            blendInSpeed = 1.0,
            next = "pain_stomach",
        },
    }
}

AnimLib.injured_leg_sit = {
    name = "Left Leg Sitting",
    tags = { injured=1, },
    key = "t",
    enter = {
        animDict = "amb_rest_sit@world_human_sit_ground@male_c@stand_enter",
        anim = "enter_back_rf",
        duration = 3800,
        blendInSpeed = 1.0,
        nextBlendInSpeed = 1.0,
    },
    exit = {
        animDict = "amb_rest_sit@world_human_sit_ground@male_c@stand_exit",
        anim = "exit_front",
        duration = 3800,
        blendInSpeed = 1.0,
    },
    idles = {
        idle_a = {
            animDict = "script_re@animal_mauling",
            anim = "pain_idle_victim",
            flag = AnimConfig.Flag.Loop,
            transitions = {
                trans_a_stand = "s",
                trans_a_walk = "w",
            }
        },
    },
    animations = {
        trans_a_stand = {
            animDict = "amb_rest_sit@world_human_sit_ground@male_c@stand_exit",
            anim = "exit_front",
            duration = 4000,
            blendInSpeed = 1.0,
            nextBlendInSpeed = 1.0,
            animLibName = "injured_left_leg",
            next = "idle_a",
            name = "Transition to Stand",
        },
        trans_a_walk = {
            animDict = "amb_rest_sit@world_human_sit_ground@male_c@stand_exit",
            anim = "exit_front",
            duration = 4000,
            blendInSpeed = 1.0,
            nextBlendInSpeed = 1.0,
            next = "idle_a",
            animLibName = "injured_left_leg_walk",
            name = "Transition to Walk",
        },
    }
}
