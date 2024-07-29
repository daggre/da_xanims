--- Copyright © 2024 Joshua Nelson

-- cigarette masc
AnimLib.smoke_masc_a = {
    name = "Arms Down",
    tags = { cigarette=1, },
    triggerCondition = function() return Conditions.Check({ hasAnyCig = true, }) end,
    key = "d",
    enter = {
        animDict = "amb_rest@world_human_smoking@male_c@stand_enter",
        anim = "enter_back_rf",
        blendInSpeed = 1.0,
        duration = 6000,
        onTrigger = function(info)
            info.prop.cigarette = Prop:new()
            da.Fn.Consume("cig", info.args)
            Citizen.Wait(950)
            info.prop.cigarette:attach(info.ped, Propset.Cigarette)
            Citizen.Wait(1050)
            info.prop.cigarette:attach(info.ped, Propset.Cigarette.Mouth)
            Citizen.Wait(3000)
            info.prop.cigarette:attach(info.ped, Propset.Cigarette)
            return info
        end,
    },
    exit = {
        animDict = "amb_rest@world_human_smoking@male_a@stand_exit",
        anim = "exit_back",
        duration = 4300,
        blendInSpeed = 1.2,
        onTrigger = function(info)
            Citizen.Wait(200)
            info.prop.cigarette:attach(info.ped, Propset.Cigarette)
            Citizen.Wait(2600)
            Prop.Detach(info.prop.cigarette, { velocity = -1.0, forceWait = 5000 })
            info.prop.cigarette = nil
            return info
        end,
    },
    idles = {
        idle_a_armsdown = {
            animDict = "amb_rest@world_human_smoking@male_a@base",
            anim = "base",
            blendInSpeed = 1.0,
            flag = AnimConfig.Flag.MoveLoop,
            onTrigger = function(info)
                info.prop.cigarette:attach(info.ped, Propset.Cigarette)
                return info
            end,
            transitions = {
                trans_a_c = "x",
                trans_a_d = "s",
                a_smoke2fingers = "f",
                a_2fingertapcherry = "t",
                a_deepinhale = "d",
                a_smokywave = "w",
                a_smokebasic = "q",
                a_lookrightsmoke = "r",
            }
        },
    },
    animations = {
        a_smoke2fingers = {
            animDict = "amb_rest@world_human_smoking@male_a@idle_a",
            anim = "idle_a",
            flag = AnimConfig.Flag.Move,
            name = "Two fingers",
            onTrigger = function(info)
                Citizen.Wait(300)
                info.prop.cigarette:attach(info.ped, Propset.Cigarette.TwoFingers)
                Citizen.Wait(6000)
                info.prop.cigarette:attach(info.ped, Propset.Cigarette)
                return info
            end,
        },
        a_2fingertapcherry = {
            animDict = "amb_rest@world_human_smoking@male_a@idle_a",
            anim = "idle_b",
            flag = AnimConfig.Flag.Move,
            name = "Tap Cherry",
        },
        a_deepinhale = {
            animDict = "amb_rest@world_human_smoking@male_a@idle_a",
            anim = "idle_c",
            flag = AnimConfig.Flag.Move,
            name = "Draw Long",
            onTrigger = function(info)
                info.prop.cigarette:attach(info.ped, Propset.Cigarette.TwoFingers)
                Citizen.Wait(3800)
                info.prop.cigarette:attach(info.ped, Propset.Cigarette)
                Citizen.Wait(400)
                info.prop.cigarette:attach(info.ped, Propset.Cigarette.Mouth)
                Citizen.Wait(2100)
                info.prop.cigarette:attach(info.ped, Propset.Cigarette.TwoFingers)
                return info
            end,
        },
        a_smokywave = {
            animDict = "amb_rest@world_human_smoking@male_a@idle_b",
            anim = "idle_d",
            flag = AnimConfig.Flag.Move,
            name = "Smokey Wave",
            onTrigger = function(info)
                info.prop.cigarette:attach(info.ped, Propset.Cigarette.TwoFingers)
                return info
            end,
        },
        a_smokebasic = {
            animDict = "amb_rest@world_human_smoking@male_a@idle_b",
            anim = "idle_e",
            flag = AnimConfig.Flag.Move,
            name = "Smoke",
        },
        a_lookrightsmoke = {
            animDict = "amb_rest@world_human_smoking@male_a@idle_b",
            anim = "idle_f",
            flag = AnimConfig.Flag.Move,
            name = "Look Right",
        },
        trans_a_c = {
            animDict = "amb_rest@world_human_smoking@male_a@trans",
            anim = "trans_a_c",
            flag = AnimConfig.Flag.Move,
            animLibName = "smoke_masc_c",
            next = "idle_c_slouch",
            nextBlendInSpeed = 1.0,
            name = "Transition to Slouch",
            onTrigger = function(info)
                info.prop.cigarette:attach(info.ped, Propset.Cigarette)
                return info
            end,
        },
        trans_a_d = {
            animDict = "amb_rest@world_human_smoking@male_a@trans",
            anim = "trans_a_d",
            flag = AnimConfig.Flag.Move,
            animLibName = "smoke_masc_d",
            next = "idle_d_stern",
            nextBlendInSpeed = 1.0,
            name = "Transition to Stern",
            onTrigger = function(info)
                info.prop.cigarette:attach(info.ped, Propset.Cigarette)
                return info
            end,
        },
    },
}

AnimLib.smoke_masc_c = {
    name = "Slouch",
    tags = { cigarette=1, },
    triggerCondition = function() return Conditions.Check({ hasAnyCig = true, }) end,
    key = "s",
    enter = {
        animDict = "amb_rest@world_human_smoking@male_c@stand_enter",
        anim = "enter_back_rf",
        blendInSpeed = 1.0,
        duration = 6000,
        onTrigger = function(info)
            info.prop.cigarette = Prop:new()
            da.Fn.Consume("cig", info.args)
            Citizen.Wait(950)
            info.prop.cigarette:attach(info.ped, Propset.Cigarette)
            Citizen.Wait(1050)
            info.prop.cigarette:attach(info.ped, Propset.Cigarette.Mouth)
            Citizen.Wait(3000)
            info.prop.cigarette:attach(info.ped, Propset.Cigarette)
            return info
        end,
    },
    exit = {
        animDict = "amb_rest@world_human_smoking@male_a@stand_exit",
        anim = "exit_back",
        duration = 4300,
        blendInSpeed = 1.2,
        onTrigger = function(info)
            Citizen.Wait(2800)
            Prop.Detach(info.prop.cigarette, { velocity = -1.0, forceWait = 5000 })
            info.prop.cigarette = nil
            return info
        end,
    },
    idles = {
        idle_c_slouch = {
            animDict = "amb_rest@world_human_smoking@male_c@base",
            anim = "base",
            blendInSpeed = 1.0,
            flag = AnimConfig.Flag.MoveLoop,
            transitions = {
                trans_c_a = "a",
                trans_c_d = "d",
                c_smoketapcherry = "t",
                -- c_scratchthigh = "s",
                c_tapcherry = "v",
                c_stretcharm = "w",
                c_swatfly = "f",
                c_smashbugneck = "n",
                c_smashbugneck2 = "q",
                c_longdrag = "e",
            }
        },
    },
    animations = {
        c_smoketapcherry = {
            animDict = "amb_rest@world_human_smoking@male_c@idle_a",
            anim = "idle_a",
            flag = AnimConfig.Flag.Move,
            name = "Smoke and Tap",
        },
        c_scratchthigh = {
            animDict = "amb_rest@world_human_smoking@male_c@idle_a",
            anim = "idle_b",
            flag = AnimConfig.Flag.Move,
            name = "Scratch Thigh",
        },
        c_tapcherry = {
            animDict = "amb_rest@world_human_smoking@male_c@idle_a",
            anim = "idle_c",
            flag = AnimConfig.Flag.Move,
            name = "Tap Cherry",
        },
        c_stretcharm = {
            animDict = "amb_rest@world_human_smoking@male_c@idle_b",
            anim = "idle_d",
            flag = AnimConfig.Flag.Move,
            name = "Stretch Arm",
        },
        c_swatfly = {
            animDict = "amb_rest@world_human_smoking@male_c@idle_b",
            anim = "idle_e",
            flag = AnimConfig.Flag.Move,
            name = "Swat Fly",
        },
        c_smashbugneck = {
            animDict = "amb_rest@world_human_smoking@male_c@idle_b",
            anim = "idle_f",
            flag = AnimConfig.Flag.Move,
            name = "Bug on Neck",
        },
        c_smashbugneck2 = {
            animDict = "amb_rest@world_human_smoking@male_c@idle_c",
            anim = "idle_g",
            flag = AnimConfig.Flag.Move,
            name = "Smash Bug Neck",
        },
        c_longdrag = {
            animDict = "amb_rest@world_human_smoking@male_c@idle_c",
            anim = "idle_h",
            flag = AnimConfig.Flag.Move,
            name = "Long Drag",
        },
        trans_c_a = {
            animDict = "amb_rest@world_human_smoking@male_c@trans",
            anim = "trans_c_a",
            flag = AnimConfig.Flag.Move,
            animLibName = "smoke_masc_a",
            next = "idle_a_armsdown",
            nextBlendInSpeed = 1.0,
            name = "Transition to Arms Down",
            onTrigger = function(info)
                Citizen.Wait(1000)
                info.prop.cigarette:attach(info.ped, Propset.Cigarette.TwoFingers)
                return info
            end,
        },
        trans_c_d = {
            animDict = "amb_rest@world_human_smoking@male_c@trans",
            anim = "trans_c_d",
            flag = AnimConfig.Flag.Move,
            animLibName = "smoke_masc_d",
            next = "idle_d_stern",
            nextBlendInSpeed = 1.0,
            name = "Transition to Stern",
            onTrigger = function(info)
                info.prop.cigarette:attach(info.ped, Propset.Cigarette)
                return info
            end,
        },
    },
}

AnimLib.smoke_masc_d = {
    name = "Stern",
    tags = { cigarette=1, },
    key = "t",
    triggerCondition = function() return Conditions.Check({ hasAnyCig = true, }) end,
    enter = {
        animDict = "amb_rest@world_human_smoking@male_c@stand_enter",
        anim = "enter_back_rf",
        blendInSpeed = 1.0,
        duration = 6000,
        onTrigger = function(info)
            info.prop.cigarette = Prop:new()
            da.Fn.Consume("cig", info.args)
            Citizen.Wait(950)
            info.prop.cigarette:attach(info.ped, Propset.Cigarette)
            Citizen.Wait(1050)
            info.prop.cigarette:attach(info.ped, Propset.Cigarette.Mouth)
            Citizen.Wait(3000)
            info.prop.cigarette:attach(info.ped, Propset.Cigarette)
            return info
        end,
    },
    exit = {
        animDict = "amb_rest@world_human_smoking@male_a@stand_exit",
        anim = "exit_back",
        duration = 4300,
        blendInSpeed = 1.2,
        onTrigger = function(info)
            Citizen.Wait(2800)
            Prop.Detach(info.prop.cigarette, { velocity = -1.0, forceWait = 5000 }, function() Citizen.Wait(2000); end)
            info.prop.cigarette = nil
            return info
        end,
    },
    idles = {
        idle_d_stern = {
            animDict = "amb_rest@world_human_smoking@male_d@base",
            anim = "base",
            name = "Stance (Stern)",
            blendInSpeed = 1.0,
            flag = AnimConfig.Flag.MoveLoop,
            transitions = {
                trans_d_a = "a",
                trans_d_c = "x",
                d_smokedistracted = "d",
                d_spit = "s",
                d_boredlookleft = "q",
                d_covermouth = "m",
                d_longdrag = "v",
                d_cough = "g",
                d_focusstraight = "f",
                d_wipeshirt = "w",
            }
        },
    },
    animations = {
        d_smokedistracted = {
            animDict = "amb_rest@world_human_smoking@male_d@idle_a",
            anim = "idle_a",
            flag = AnimConfig.Flag.Move,
            name = "Distracted",
        },
        d_spit  = {
            animDict = "amb_rest@world_human_smoking@male_d@idle_a",
            anim = "idle_b",
            flag = AnimConfig.Flag.Move,
            name = "Spit",
        },
        d_boredlookleft = {
            animDict = "amb_rest@world_human_smoking@male_d@idle_a",
            anim = "idle_c",
            flag = AnimConfig.Flag.Move,
            name = "Bored Look Left",
        },
        d_covermouth= {
            animDict = "amb_rest@world_human_smoking@male_d@idle_b",
            anim = "idle_d",
            flag = AnimConfig.Flag.Move,
            name = "Cover Mouth",
        },
        d_longdrag = {
            animDict = "amb_rest@world_human_smoking@male_d@idle_b",
            anim = "idle_e",
            flag = AnimConfig.Flag.Move,
            name = "Long Drag",
        },
        d_cough = {
            animDict = "amb_rest@world_human_smoking@male_d@idle_b",
            anim = "idle_f",
            flag = AnimConfig.Flag.Move,
            name = "Cough",
        },
        d_focusstraight = {
            animDict = "amb_rest@world_human_smoking@male_d@idle_c",
            anim = "idle_g",
            flag = AnimConfig.Flag.Move,
            name = "Scowl",
        },
        d_wipeshirt = { animDict = "amb_rest@world_human_smoking@male_d@idle_c",
            anim = "idle_h",
            flag = AnimConfig.Flag.Move,
            name = "Wipe Shirt",
        },
        trans_d_a = {
            animDict = "amb_rest@world_human_smoking@male_d@trans",
            anim = "d_trans_a",
            flag = AnimConfig.Flag.Move,
            animLibName = "smoke_masc_a",
            next = "idle_a_armsdown",
            nextBlendInSpeed = 1.0,
            name = "Transition to Arms Down",
        },
        trans_d_c = {
            animDict = "amb_rest@world_human_smoking@male_d@trans",
            anim = "d_trans_c",
            flag = AnimConfig.Flag.Move,
            animLibName = "smoke_masc_c",
            next = "idle_c_slouch",
            nextBlendInSpeed = 1.0,
            name = "Transition to Slouch",
            onTrigger = function(info)
                Citizen.Wait(1000)
                info.prop.cigarette:attach(info.ped, Propset.Cigarette.Mouth)
                Citizen.Wait(2350)
                info.prop.cigarette:attach(info.ped, Propset.Cigarette)
                return info
            end,
        },
    },
}

AnimLib.smoke_masc_b = {
    name = "Nervous",
    tags = { cigarette=1 },
    key = "n",
    triggerCondition = function() return Conditions.Check({ hasAnyCig = true, }) end,
    enter = {
        animDict = "amb_rest@world_human_smoking@male_c@stand_enter",
        anim = "enter_back_rf",
        blendInSpeed = 1.0,
        duration = 6000,
        onTrigger = function(info)
            info.prop.cigarette = Prop:new()
            da.Fn.Consume("cig", info.args)
            Citizen.Wait(950)
            info.prop.cigarette:attach(info.ped, Propset.Cigarette)
            Citizen.Wait(1050)
            info.prop.cigarette:attach(info.ped, Propset.Cigarette.Mouth)
            Citizen.Wait(3000)
            info.prop.cigarette:attach(info.ped, Propset.Cigarette)
            return info
        end,
    },
    exit = {
        animDict = "amb_rest@world_human_smoking@male_a@stand_exit",
        anim = "exit_back",
        duration = 4300,
        blendInSpeed = 1.2,
        onTrigger = function(info)
            Citizen.Wait(2800)
            Citizen.Wait(2000)
            Prop.Detach(info.prop.cigarette, { velocity = -1.0, forceWait = 5000 })
            info.prop.cigarette = nil
            return info
        end,
    },
    idles = {
        idle_b_nervous = {
            animDict = "amb_rest@world_human_smoking@nervous_stressed@male_b@base",
            anim = "base",
            name = "Stance (Nervous)",
            blendInSpeed = 1.0,
            flag = AnimConfig.Flag.MoveLoop,
            transitions = {
                b_nervous = "n",
                b_nervouslong = "l",
                b_feetnervous = "f",
                b_lookaround = "r",
                b_lookleftright = "q",
                b_wobblefrontback = "w",
                b_tapcigcheckshoe = "s",
                b_looklefttapcig = "t",
            }
        },
    },
    animations = {
        b_nervous = {
            animDict = "amb_rest@world_human_smoking@nervous_stressed@male_b@idle_a",
            anim = "idle_a",
            flag = AnimConfig.Flag.Move,
            name = "Quick Drag",
        },
        b_lookaround = {
            animDict = "amb_rest@world_human_smoking@nervous_stressed@male_b@idle_a",
            anim = "idle_b",
            flag = AnimConfig.Flag.Move,
            name = "Look Around",
        },
        b_lookleftright = {
            animDict = "amb_rest@world_human_smoking@nervous_stressed@male_b@idle_a",
            anim = "idle_c",
            flag = AnimConfig.Flag.Move,
            name = "Look Left Right",
        },
        b_wobblefrontback = {
            animDict = "amb_rest@world_human_smoking@nervous_stressed@male_b@idle_b",
            anim = "idle_d",
            flag = AnimConfig.Flag.Move,
            name = "Wobble",
        },
        b_tapcigcheckshoe = {
            animDict = "amb_rest@world_human_smoking@nervous_stressed@male_b@idle_b",
            anim = "idle_e",
            name = "Check Shoe",
        },
        b_looklefttapcig = {
            animDict = "amb_rest@world_human_smoking@nervous_stressed@male_b@idle_b",
            anim = "idle_f",
            name = "Look Left Tap",
            flag = AnimConfig.Flag.Move,
        },
        b_nervouslong = {
            animDict = "amb_rest@world_human_smoking@nervous_stressed@male_b@idle_c",
            anim = "idle_g",
            name = "Drag, Tap, Wobble",
            flag = AnimConfig.Flag.Move,
            blendOutSpeed = 0.15,
        },
        b_feetnervous = {
            animDict = "amb_rest@world_human_smoking@nervous_stressed@male_b@idle_c",
            anim = "idle_h",
            name = "Nervous Feet",
            duration = 6500,
            next = "idle_b_nervous",
            blendInSpeed = 2.0,
            blendOutSpeed = 0.3,
        },
    },
}

AnimLib.lean_smoke_a = {
    name = "Lean Back Smoke",
    tags = {
        cigarette = { name = "Lean Back", },
        lean_back = { name = "Smoke Cigarette", }
    },
    key = "q",
    triggerCondition = function() return Conditions.Check({ hasAnyCig = true, }) end,
    enter = {
        animDict = "amb_rest_lean@world_human_lean@wall@male_a@trans",
        anim = "a_trans_smoking_a",
        blendInSpeed = 1.0,
        onTrigger = function(info)
            info.prop.matchstick = Prop:new()
            info.prop.cigarette = Prop:new()
            da.Fn.Consume("cig", info.args)
            Citizen.Wait(3000)
            info.prop.matchstick:attach(info.ped, Propset.Matchstick)
            Citizen.Wait(200)
            info.prop.cigarette:attach(info.ped, Propset.Cigarette.LeftHand)
            Citizen.Wait(1300)
            info.prop.cigarette:attach(info.ped, Propset.Cigarette.Mouth)
            Citizen.Wait(3900)
            Prop.Detach(info.prop.matchstick, { forceWait = 3000, velocity = -1.0 }, function() Citizen.Wait(1000); end)
            info.prop.matchstick = nil
            Citizen.Wait(2200)
            info.prop.cigarette:attach(info.ped, Propset.Cigarette)
            Citizen.Wait(800)
            info.prop.cigarette:attach(info.ped, Propset.Cigarette.TwoFingers)
            return info
        end,
    },
    exit = {
        animDict = "amb_rest_lean@world_human_lean@wall@smoking@male_a@trans",
        anim = "smoking_a_trans_a",
        duration = 8000,
        onTrigger = function(info)
            info.prop.cigarette:attach(info.ped, Propset.Cigarette.LeanExit)
            Citizen.Wait(5900)
            Prop.Detach(info.prop.cigarette, { velocity = -1.0, forceWait = 5000 })
            info.prop.cigarette = nil
            return info
        end,
    },
    idles = {
        idle_a = {
            animDict = "amb_rest_lean@world_human_lean@wall@smoking@male_a@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
            onTrigger = function(info)
                info.prop.cigarette:attach(info.ped, Propset.Cigarette.TwoFingers)
                return info
            end,
            transitions = {
                a_a = "w",
                a_b = "t",
                a_c = "e",
                -- a_d = "4",
                a_e = "r",
                a_f = "q",
            },
        },
    },
    animations = {
        a_a = {
            animDict = "amb_rest_lean@world_human_lean@wall@smoking@male_a@idle_a",
            anim = "idle_a",
            name = "Hold In Mouth",
            onTrigger = function(info)
                info.prop.cigarette:attach(info.ped, Propset.Cigarette)
                Citizen.Wait(3800)
                info.prop.cigarette:attach(info.ped, Propset.Cigarette.Mouth)
                Citizen.Wait(3300)
                info.prop.cigarette:attach(info.ped, Propset.Cigarette)
                return info
            end
        },
        a_b = {
            animDict = "amb_rest_lean@world_human_lean@wall@smoking@male_a@idle_a",
            anim = "idle_b",
            name = "Tap Cherry",
        },
        a_c = {
            animDict = "amb_rest_lean@world_human_lean@wall@smoking@male_a@idle_a",
            anim = "idle_c",
            name = "Exagerrated",
        },
        -- a_d = {
        --     animDict = "amb_rest_lean@world_human_lean@wall@smoking@male_a@idle_b",
        --     anim = "idle_d",
        --     name = "",
        -- },
        a_e = {
            animDict = "amb_rest_lean@world_human_lean@wall@smoking@male_a@idle_b",
            anim = "idle_e",
            name = "Casual",
        },
        a_f = {
            animDict = "amb_rest_lean@world_human_lean@wall@smoking@male_a@idle_b",
            anim = "idle_f",
            name = "Pinch and Tap",
            onTrigger = function(info)
                Citizen.Wait(1000)
                info.prop.cigarette:attach(info.ped, Propset.Cigarette)
                Citizen.Wait(4000)
                info.prop.cigarette:attach(info.ped, Propset.Cigarette.TwoFingers)
                return info
            end,
        },
    },
}

-- cigarette fem
AnimLib.smoke_fem_a = {
    name = "Sassy",
    tags = { cigarette=1 },
    key = "y",
    triggerCondition = function() return Conditions.Check({ hasAnyCig = true, }) end,
    enter = {
        animDict = "amb_rest@world_human_smoking@male_c@stand_enter",
        anim = "enter_back_rf",
        duration = 6000,
        blendInSpeed = 1.0,
        nextBlendInSpeed = 1.0,
        onTrigger = function(info)
            info.prop.cigarette = Prop:new()
            da.Fn.Consume("cig", info.args)
            Citizen.Wait(950)
            info.prop.cigarette:attach(info.ped, Propset.Cigarette)
            Citizen.Wait(1050)
            info.prop.cigarette:attach(info.ped, Propset.Cigarette.Mouth)
            Citizen.Wait(3000)
            info.prop.cigarette:attach(info.ped, Propset.Cigarette)
            return info
        end,
    },
    exit = {
        animDict = "amb_rest@world_human_smoking@male_a@stand_exit",
        anim = "exit_back",
        duration = 4300,
        blendInSpeed = 1.0,
        onTrigger = function(info)
            Citizen.Wait(200)
            info.prop.cigarette:attach(info.ped, Propset.Cigarette)
            Citizen.Wait(2600)
            Prop.Detach(info.prop.cigarette, { velocity = -1.0, forceWait = 5000 })
            info.prop.cigarette = nil
            return info
        end,
    },
    idles = {
        idle_a = {
            animDict = "amb_rest@world_human_smoking@female_a@base",
            anim = "base",
            name = "Sassy",
            flag = AnimConfig.Flag.MoveLoop,
            onTrigger = function(info)
                info.prop.cigarette:attach(info.ped, Propset.Cigarette)
                return info
            end,
            transitions = {
                a_a = "e",
                a_b = "w",
                a_c = "q",
                a_d = "a",
                a_e = "s",
                a_f = "f",
                a_h = "z",
                trans_a_b = "2",
                trans_a_c = "3",
            },
        },
    },
    animations = {
        a_a = {
            animDict = "amb_rest@world_human_smoking@female_a@idle_a",
            anim = "idle_a",
            name = "Thinking",
            flag = AnimConfig.Flag.Move,
        },
        a_b = {
            animDict = "amb_rest@world_human_smoking@female_a@idle_a",
            anim = "idle_b",
            name = "Smoke",
            flag = AnimConfig.Flag.Move,
        },
        a_c = {
            animDict = "amb_rest@world_human_smoking@female_a@idle_a",
            anim = "idle_c",
            name = "Glance Left",
            flag = AnimConfig.Flag.Move,
        },
        a_d = {
            animDict = "amb_rest@world_human_smoking@female_a@idle_b",
            anim = "idle_d",
            name = "Absentminded",
            flag = AnimConfig.Flag.Move,
        },
        a_e = {
            animDict = "amb_rest@world_human_smoking@female_a@idle_b",
            anim = "idle_e",
            name = "Sway",
            flag = AnimConfig.Flag.Move,
        },
        a_f = {
            animDict = "amb_rest@world_human_smoking@female_a@idle_b",
            anim = "idle_f",
            name = "Look at Cig",
            flag = AnimConfig.Flag.Move,
        },
        a_h = {
            animDict = "amb_rest@world_human_smoking@female_a@idle_c",
            anim = "idle_h",
            name = "Dismissive",
            flag = AnimConfig.Flag.Move,
        },
        trans_a_b = {
            animDict = "amb_rest@world_human_smoking@female_a@trans",
            anim = "a_trans_b",
            name = "Transition to Aloof",
            flag = AnimConfig.Flag.Move,
            animLibName = "smoke_fem_b",
            next = "idle_b",
            onTrigger = function(info)
                info.prop.cigarette:attach(info.ped, Propset.Cigarette.SassyRightHand)
                -- Citizen.Wait(4200)
                -- info.prop.cigarette.propset = Propset.Cigarette.AloofRightHand
                -- info.prop.cigarette:attach()
                return info
            end,
        },
        trans_a_c = {
            animDict = "amb_rest@world_human_smoking@female_c@base",
            anim = "base",
            name = "Transition to Focused",
            flag = AnimConfig.Flag.Move,
            animLibName = "smoke_fem_c",
            next = "idle_c",
            blendInSpeed = 1.2,
            onTrigger = function(info)
                Citizen.Wait(200)
                info.prop.cigarette:attach(info.ped, Propset.Cigarette)
                return info
            end,
        },
    },
}

AnimLib.smoke_fem_b = {
    name = "Aloof",
    tags = { cigarette=1 },
    key = "a",
    triggerCondition = function() return Conditions.Check({ hasAnyCig = true, }) end,
    enter = {
        animDict = "amb_rest@world_human_smoking@male_c@stand_enter",
        anim = "enter_back_rf",
        duration = 6000,
        blendInSpeed = 1.0,
        nextBlendInSpeed = 1.0,
        onTrigger = function(info)
            info.prop.cigarette = Prop:new()
            da.Fn.Consume("cig", info.args)
            Citizen.Wait(950)
            info.prop.cigarette:attach(info.ped, Propset.Cigarette)
            Citizen.Wait(1050)
            info.prop.cigarette:attach(info.ped, Propset.Cigarette.Mouth)
            Citizen.Wait(3000)
            info.prop.cigarette:attach(info.ped, Propset.Cigarette)
            return info
        end,
    },
    exit = {
        animDict = "amb_rest@world_human_smoking@male_a@stand_exit",
        anim = "exit_back",
        duration = 4300,
        blendInSpeed = 1.0,
        onTrigger = function(info)
            Citizen.Wait(200)
            info.prop.cigarette:attach(info.ped, Propset.Cigarette)
            Citizen.Wait(2600)
            Prop.Detach(info.prop.cigarette, { velocity = -1.0, forceWait = 5000 })
            info.prop.cigarette = nil
            return info
        end,
    },
    idles = {
        idle_b = {
            animDict = "amb_rest@world_human_smoking@female_b@base",
            anim = "base",
            name = "Aloof (Stance)",
            flag = AnimConfig.Flag.MoveLoop,
            onTrigger = function(info)
                info.prop.cigarette:attach(info.ped, Propset.Cigarette)
                return info
            end,
            transitions = {
                b_a = "s",
                b_b = "w",
                b_c = "a",
                b_d = "d",
                b_e = "t",
                b_f = "x",
                b_g = "z",
                b_h = "e",
                trans_b_a = "1",
                trans_b_c = "3",
            },
        },
    },
    animations = {
        b_a = {
            animDict = "amb_rest@world_human_smoking@female_b@idle_a",
            anim = "idle_a",
            name = "Sway",
            flag = AnimConfig.Flag.Move,
        },
        b_b = {
            animDict = "amb_rest@world_human_smoking@female_b@idle_a",
            anim = "idle_b",
            name = "Smoke",
            flag = AnimConfig.Flag.Move,
        },
        b_c = {
            animDict = "amb_rest@world_human_smoking@female_b@idle_a",
            anim = "idle_c",
            name = "Sway and Smoke",
            flag = AnimConfig.Flag.Move,
        },
        b_d = {
            animDict = "amb_rest@world_human_smoking@female_b@idle_b",
            anim = "idle_d",
            name = "Smoke and Sway",
            flag = AnimConfig.Flag.Move,
        },
        b_e = {
            animDict = "amb_rest@world_human_smoking@female_b@idle_b",
            anim = "idle_e",
            name = "Tap Cherry",
            flag = AnimConfig.Flag.Move,
        },
        b_f = {
            animDict = "amb_rest@world_human_smoking@female_b@idle_b",
            anim = "idle_f",
            name = "Tap Cherry Low",
            flag = AnimConfig.Flag.Move,
        },
        b_g = {
            animDict = "amb_rest@world_human_smoking@female_b@idle_c",
            anim = "idle_g",
            name = "Wipe Hip",
            flag = AnimConfig.Flag.Move,
        },
        b_h = {
            animDict = "amb_rest@world_human_smoking@female_b@idle_c",
            anim = "idle_h",
            name = "Look Right",
            flag = AnimConfig.Flag.Move,
        },
        trans_b_a = {
            animDict = "amb_rest@world_human_smoking@female_b@trans",
            anim = "b_trans_a",
            name = "Transition to Sass",
            flag = AnimConfig.Flag.Move,
            animLibName = "smoke_fem_a",
            next = "idle_a",
            onTrigger = function(info)
                Citizen.Wait(200)
                info.prop.cigarette:attach(info.ped, Propset.Cigarette)
                return info
            end,
        },
        trans_b_c = {
            animDict = "amb_rest@world_human_smoking@female_c@base",
            anim = "base",
            name = "Transition to Focused",
            flag = AnimConfig.Flag.Move,
            animLibName = "smoke_fem_c",
            next = "idle_c",
            blendInSpeed = 1.2,
            onTrigger = function(info)
                Citizen.Wait(200)
                info.prop.cigarette:attach(info.ped, Propset.Cigarette)
                -- local righthand = GetEntityBoneIndexByName(info.ped, "SKEL_R_Finger23")
                -- AttachEntityToEntity(info.prop.cigarette.entity, info.ped, righthand,
                --     0.00, 0.00, -0.01, 0.0, 11.0, 330.0, true, true, false, true, 1, true)
                return info
            end,
        }
    }
}

AnimLib.smoke_fem_c = {
    name = "Focused",
    tags = { cigarette=1 },
    key = "f",
    triggerCondition = function() return Conditions.Check({ hasAnyCig = true, }) end,
    enter = {
        animDict = "amb_rest@world_human_smoking@male_c@stand_enter",
        anim = "enter_back_rf",
        duration = 6000,
        blendInSpeed = 1.0,
        nextBlendInSpeed = 1.3,
        onTrigger = function(info)
            info.prop.cigarette = Prop:new()
            da.Fn.Consume("cig", info.args)
            Citizen.Wait(950)
            info.prop.cigarette:attach(info.ped, Propset.Cigarette)
            Citizen.Wait(1050)
            info.prop.cigarette:attach(info.ped, Propset.Cigarette.Mouth)
            Citizen.Wait(3000)
            info.prop.cigarette:attach(info.ped, Propset.Cigarette)
            return info
        end,
    },
    exit = {
        animDict = "amb_rest@world_human_smoking@male_a@stand_exit",
        anim = "exit_back",
        duration = 4300,
        blendInSpeed = 1.0,
        onTrigger = function(info)
            Citizen.Wait(200)
            info.prop.cigarette:attach(info.ped, Propset.Cigarette)
            Citizen.Wait(2600)
            Prop.Detach(info.prop.cigarette, { velocity = -1.0, forceWait = 5000 })
            info.prop.cigarette = nil
            return info
        end,
    },
    idles = {
        idle_c = {
            animDict = "amb_rest@world_human_smoking@female_c@base",
            anim = "base",
            name = "Focused",
            flag = AnimConfig.Flag.MoveLoop,
            transitions = {
                c_a = "f",
                c_b = "s",
                c_c = "e",
                c_d = "t",
                c_e = "d",
                c_f = "q",
                c_g = "a",
                c_h = "w",
                trans_c_a = "1",
                trans_c_b = "2",
            },
        },
    },
    animations = {
        c_a = {
            animDict = "amb_rest@world_human_smoking@female_c@idle_a",
            anim = "idle_a",
            name = "Fan With Hand",
            flag = AnimConfig.Flag.Move,
        },
        c_b = {
            animDict = "amb_rest@world_human_smoking@female_c@idle_a",
            anim = "idle_b",
            name = "Scowl",
            flag = AnimConfig.Flag.Move,
        },
        c_c = {
            animDict = "amb_rest@world_human_smoking@female_c@idle_a",
            anim = "idle_c",
            name = "Look at Nails",
            flag = AnimConfig.Flag.Move,
        },
        c_d = {
            animDict = "amb_rest@world_human_smoking@female_c@idle_b",
            anim = "idle_d",
            name = "Twirl Hair",
            flag = AnimConfig.Flag.Move,
        },
        c_e = {
            animDict = "amb_rest@world_human_smoking@female_c@idle_b",
            anim = "idle_e",
            name = "Long Drag",
            flag = AnimConfig.Flag.Move,
        },
        c_f = {
            animDict = "amb_rest@world_human_smoking@female_c@idle_b",
            anim = "idle_f",
            name = "Short Drag",
            flag = AnimConfig.Flag.Move,
        },
        c_g = {
            animDict = "amb_rest@world_human_smoking@female_c@idle_c",
            anim = "idle_g",
            name = "Frustrated",
            flag = AnimConfig.Flag.Move,
        },
        c_h = {
            animDict = "amb_rest@world_human_smoking@female_c@idle_c",
            anim = "idle_h",
            name = "Smoke",
            flag = AnimConfig.Flag.Move,
        },
        trans_c_a = {
            animDict = "amb_rest@world_human_smoking@female_a@base",
            anim = "base",
            name = "Transition to Sassy",
            flag = AnimConfig.Flag.Move,
            animLibName = "smoke_fem_a",
            next = "idle_a",
            blendInSpeed = 1.2,
        },
        trans_c_b = {
            animDict = "amb_rest@world_human_smoking@female_b@base",
            anim = "base",
            name = "Transition to Aloof",
            flag = AnimConfig.Flag.Move,
            animLibName = "smoke_fem_b",
            next = "idle_b",
            blendInSpeed = 1.2,
            onTrigger = function(info)
                Citizen.Wait(500)
                info.prop.cigarette:attach(info.ped, Propset.Cigarette)
                return info
            end,
        },
    }
}

-- cigars
AnimLib.smoke_cigar_fem = {
    name = "Standing",
    tags = { cigar= 1 },
    key = "s",
    triggerCondition = function() return Conditions.Check({ isMale = false, hasCigar = true, }) end,
    condition = function() return Conditions.Check({ isMale = false, }) end,
    enter = {
        animDict = "script_mp@emotes@smoke_cigar@female@unarmed@upper",
        anim = "intro",
        blendInSpeed = 1.0,
        flag = AnimConfig.Flag.Move,
        onTrigger = function(info)
            info.prop.cigar = Prop:new()
            da.Fn.Consume("cigar", info.args)
            info.prop.cigar:attach(info.ped, Propset.Cigar.FemaleHand)
            Citizen.Wait(1000)
            info.prop.cigar:attach(info.ped, Propset.Cigar.FemaleMouth)
            Citizen.Wait(2600)
            info.prop.cigar:attach(info.ped, Propset.Cigar.FemaleHand)
            Citizen.Wait(1000)
            return info
        end,
    },
    exit = {
        animDict = "script_mp@emotes@smoke_cigar@female@unarmed@upper",
        anim = "action_alt2",
        next = "exit_2",
        duration = 2000,
        flag = AnimConfig.Flag.Move,
    },
    idles = {
        idle_s = {
            animDict = "script_mp@emotes@smoke_cigar@female@unarmed@upper",
            anim = "loop",
            flag = AnimConfig.Flag.MoveLoop,
            transitions = {
                a_a = "w",
                a_1 = "d",
                a_2 = "q",
            },
        },
    },
    animations = {
        a_a = {
            animDict = "script_mp@emotes@smoke_cigar@female@unarmed@upper",
            anim = "action",
            name = "Blow Smoke Up",
            flag = AnimConfig.Flag.Move,
        },
        a_1 = {
            animDict = "script_mp@emotes@smoke_cigar@female@unarmed@upper",
            anim = "action_alt1",
            name = "Smoke Inspect Cigar",
            flag = AnimConfig.Flag.Move,
        },
        a_2 = {
            animDict = "script_mp@emotes@smoke_cigar@female@unarmed@upper",
            anim = "action_alt2",
            name = "Long Drag Tap Cherry",
            flag = AnimConfig.Flag.Move,
        },
        exit_2 = {
            animDict = "script_mp@emotes@smoke_cigar@female@unarmed@upper",
            anim = "outro",
            blendInSpeed = 1.0,
            duration = 1500,
            flag = AnimConfig.Flag.Move,
            onTrigger = function(info)
                Citizen.Wait(1650)
                Prop.Detach(info.prop.cigar, { velocity = -3.0, angle = 273, distance = 2.0, forceWait = 5000 })
                info.prop.cigar = nil
                return info
            end,
        }
    },
}

AnimLib.smoke_cigar_masc = {
    name = "standing",
    tags = { cigar=1 },
    key = "s",
    triggerCondition = function() return Conditions.Check({ isMale = true,hasCigar = true, }) end,
    condition = function() return Conditions.Check({ isMale = true, }) end,
    enter = {
        animDict = "script_mp@emotes@smoke_cigar@male@unarmed@upper",
        anim = "intro",
        blendInSpeed = 1.0,
        flag = AnimConfig.Flag.Move,
        onTrigger = function(info)
            info.prop.cigar = Prop:new()
            da.Fn.Consume("cigar", info.args)
            info.prop.cigar:attach(info.ped, Propset.Cigar.MaleHand)
            Citizen.Wait(1000)
            info.prop.cigar:attach(info.ped, Propset.Cigar.MaleMouth)
            Citizen.Wait(2600)
            info.prop.cigar:attach(info.ped, Propset.Cigar.MaleHand)
            return info
        end,
    },
    exit = {
        animDict = "script_mp@emotes@smoke_cigar@male@unarmed@upper",
        anim = "action_alt2",
        next = "exit_2",
        duration = 2000,
        flag = AnimConfig.Flag.Move,
    },
    idles = {
        idle_s = {
            animDict = "script_mp@emotes@smoke_cigar@male@unarmed@upper",
            anim = "loop",
            flag = AnimConfig.Flag.MoveLoop,
            transitions = {
                a_a = "w",
                a_1 = "d",
                a_2 = "q",
            },
        },
    },
    animations = {
        a_a = {
            animDict = "script_mp@emotes@smoke_cigar@male@unarmed@upper",
            anim = "action",
            name = "Blow Smoke Up",
            flag = AnimConfig.Flag.Move,
        },
        a_1 = {
            animDict = "script_mp@emotes@smoke_cigar@male@unarmed@upper",
            anim = "action_alt1",
            name = "Smoke Inspect Cigar",
            flag = AnimConfig.Flag.Move,
        },
        a_2 = {
            animDict = "script_mp@emotes@smoke_cigar@male@unarmed@upper",
            anim = "action_alt2",
            name = "Long Drag Tap Cherry",
            flag = AnimConfig.Flag.Move,
        },
        exit_2 = {
            animDict = "script_mp@emotes@smoke_cigar@male@unarmed@upper",
            anim = "outro",
            blendInSpeed = 1.0,
            duration = 1500,
            flag = AnimConfig.Flag.Move,
            onTrigger = function(info)
                Citizen.Wait(1650)
                Prop.Detach(info.prop.cigar, { velocity = -3.0, angle = 273, distance = 2.0, forceWait = 5000 })
                info.prop.cigar = nil
                return info
            end,
        }
    },
}

-- pipe
AnimLib.smoke_pipe = {
    name = "Arm at Side",
    tags = { pipe=1 },
    key = "a",
    condition = function() return Conditions.Check({ hasPipe = true, }) end,
    triggerCondition = function() return Conditions.Check({ hasPipe = true, hasPipeTobacco = true, }) end,
    enter = {
        animDict = "amb_wander@code_human_smoking_wander@male_b@trans",
        anim = "nopipe_trans_pipe",
        duration = 7500,
        blendInSpeed = 1.0,
        flag = AnimConfig.Flag.Move,
        onTrigger = function(info)
            info.prop.pipe = Prop:new()
            da.Fn.Consume("pipetobac", info.args)
            local propset = Conditions.Check({ isMale = true }) and "MaleHandIdle" or "FemaleHandIdle"
            info.prop.pipe:attach(info.ped, Propset.Pipe[propset])
            return info
        end,
    },
    exit = {
        animDict = "amb_wander@code_human_smoking_wander@male_b@trans",
        anim = "pipe_trans_nopipe",
        duration = 6000,
        flag = AnimConfig.Flag.Move,
        blendInSpeed = 1.0,
        onTrigger = function(info)
            Citizen.Wait(5900)
            Prop.Detach(info.prop.pipe)
            info.prop.pipe = nil
            return info
        end,
    },
    idles = {
        idle_a = {
            animDict = "amb_rest@world_human_smoking@male_b@base",
            anim = "base",
            flag = AnimConfig.Flag.MoveLoop,
            onTrigger = function(info)
                local propset = Conditions.Check({ isMale = true }) and "MaleHandIdle" or "FemaleHandIdle"
                info.prop.pipe:attach(info.ped, Propset.Pipe[propset])
                return info
            end,
            transitions = {
                p_1 = "s",
                p_2 = "q",
                p_3 = "t",
                trans_h = "b",
                trans_e = "x",
            },
        },
    },
    animations = {
        p_1 = {
            animDict = "amb_rest@world_human_smoking@male_b@idle_a",
            anim = "idle_a",
            name = "Smoke",
            blendInSpeed = 1.5,
            flag = AnimConfig.Flag.Move,
            onTrigger = function(info)
                local propset = Conditions.Check({ isMale = true }) and "MalePuff" or "FemalePuff"
                info.prop.pipe:attach(info.ped, Propset.Pipe[propset])
                return info
            end,

        },
        p_2 = {
            animDict = "amb_rest@world_human_smoking@male_b@idle_a",
            anim = "idle_b",
            name = "Think and Smoke",
            blendInSpeed = 1,
            flag = AnimConfig.Flag.Move,
            onTrigger = function(info)
                local propset = Conditions.Check({ isMale = true }) and "MaleThink" or "FemaleThink"
                info.prop.pipe:attach(info.ped, Propset.Pipe[propset])
                return info
            end,
        },
        p_3 = {
            animDict = "amb_rest@world_human_smoking@male_b@idle_a",
            anim = "idle_c",
            name = "Tamp Tobacco",
            flag = AnimConfig.Flag.Move,
        },
        trans_h = {
            flag = AnimConfig.Flag.MoveLoop,
            name = "Put Hand Behind Back",
            animLibName = "smoke_pipe_h",
            nextBlendInSpeed = 0.5,
            next = "idle_hands",
            onTrigger = function(info)
                local propset = Conditions.Check({ isMale = true }) and "MaleHandIdle" or "FemaleHandIdle"
                info.prop.pipe:attach(info.ped, Propset.Pipe[propset])
                return info
            end,
        },
        trans_e = {
            flag = AnimConfig.Flag.MoveLoop,
            name = "Cross Arm",
            animLibName = "smoke_pipe_e",
            nextBlendInSpeed = 0.5,
            next = "idle_hands",
            onTrigger = function(info)
                local propset = Conditions.Check({ isMale = true }) and "MaleHandIdle" or "FemaleHandIdle"
                info.prop.pipe:attach(info.ped, Propset.Pipe[propset])
                return info
            end,
        }
    },
}

AnimLib.smoke_pipe_h = {
    name = "Hand Behind Back",
    tags = { pipe=1 },
    key = "b",
    condition = function() return Conditions.Check({ hasPipe = true, }) end,
    triggerCondition = function() return Conditions.Check({ hasPipe = true, hasPipeTobacco = true, }) end,
    enter = {
        animDict = "amb_wander@code_human_smoking_wander@male_b@trans",
        anim = "nopipe_trans_pipe",
        blendInSpeed = 0.5,
        flag = AnimConfig.Flag.Move,
        duration = 6500,
        nextBlendInSpeed = 0.75,
        onTrigger = function(info)
            info.prop.pipe = Prop:new()
            da.Fn.Consume("pipetobac", info.args)
            local propset = Conditions.Check({ isMale = true }) and "MaleHandIdle" or "FemaleHandIdle"
            info.prop.pipe:attach(info.ped, Propset.Pipe[propset])
            return info
        end,
    },
    exit = {
        animDict = "amb_wander@code_human_smoking_wander@male_b@trans",
        anim = "pipe_trans_nopipe",
        duration = 6000,
        flag = AnimConfig.Flag.Move,
        blendInSpeed = 1.0,
        onTrigger = function(info)
            Citizen.Wait(5900)
            Prop.Detach(info.prop.pipe)
            info.prop.pipe = nil
            return info
        end,

    },
    idles = {
        idle_hands = {
            animDict = "amb_rest@world_human_smoking@pipe@proper@male_d@wip_base",
            anim = "wip_base",
            flag = AnimConfig.Flag.MoveLoop,
            blendOutSpeed=0.5,
            nextBlendInSpeed=0.5,
            onTrigger = function(info)
                local propset = Conditions.Check({ isMale = true }) and "MaleHandIdle" or "FemaleHandIdle"
                info.prop.pipe:attach(info.ped, Propset.Pipe[propset])
                return info
            end,
            transitions = {
                p_1 = "s",
                p_2 = "q",
                p_3 = "t",
                trans_b ="a",
                trans_e = "x",
            },
        },
    },
    animations = {
        p_1 = {
            animDict = "amb_rest@world_human_smoking@male_b@idle_a",
            anim = "idle_a",
            name = "Smoke",
            blendInSpeed = 0.5,
            blendOutSpeed=0.5,
            nextBlendInSpeed=0.5,
            flag = AnimConfig.Flag.Move,
            onTrigger = function(info)
                local propset = Conditions.Check({ isMale = true }) and "MalePuff" or "FemalePuff"
                info.prop.pipe:attach(info.ped, Propset.Pipe[propset])
                return info
            end,

        },
        p_2 = {
            animDict = "amb_rest@world_human_smoking@male_b@idle_a",
            anim = "idle_b",
            name = "Think and Smoke",
            blendInSpeed = 0.5,
            blendOutSpeed=0.5,
            nextBlendInSpeed=0.5,
            flag = AnimConfig.Flag.Move,
            onTrigger = function(info)
                local propset = Conditions.Check({ isMale = true }) and "MaleThink" or "FemaleThink"
                info.prop.pipe:attach(info.ped, Propset.Pipe[propset])
                return info
            end,
        },
        p_3 = {
            animDict = "amb_rest@world_human_smoking@male_b@idle_a",
            anim = "idle_c",
            name = "Tamp Tobacco",
            flag = AnimConfig.Flag.Move,
            blendInSpeed = 0.5,
            blendOutSpeed=0.5,
            nextBlendInSpeed=0.5,
        },
        trans_b = {
            flag = AnimConfig.Flag.MoveLoop,
            name = "Put Arm at Side",
            animLibName = "smoke_pipe",
            nextBlendInSpeed = 0.5,
            next = "idle_a",
            onTrigger = function(info)
                local propset = Conditions.Check({ isMale = true }) and "MaleHandIdle" or "FemaleHandIdle"
                info.prop.pipe:attach(info.ped, Propset.Pipe[propset])
                return info
            end,
        },
        trans_e = {
            flag = AnimConfig.Flag.MoveLoop,
            name = "Cross Arm",
            animLibName = "smoke_pipe_e",
            nextBlendInSpeed = 0.5,
            next = "idle_hands",
            onTrigger = function(info)
                local propset = Conditions.Check({ isMale = true }) and "MaleHandIdle" or "FemaleHandIdle"
                info.prop.pipe:attach(info.ped, Propset.Pipe[propset])
                return info
            end,
        }
    },
}

AnimLib.smoke_pipe_e = {
    name = "Crossed Arm",
    tags = { pipe=1 },
    key = "x",
    condition = function() return Conditions.Check({ hasPipe = true, }) end,
    triggerCondition = function() return Conditions.Check({ hasPipe = true, hasPipeTobacco = true, }) end,
    enter = {
        animDict = "amb_wander@code_human_smoking_wander@male_b@trans",
        anim = "nopipe_trans_pipe",
        blendInSpeed = 0.5,
        flag = AnimConfig.Flag.Move,
        duration = 7500,
        nextBlendInSpeed = 0.75,
        onTrigger = function(info)
            info.prop.pipe = Prop:new()
            da.Fn.Consume("pipetobac", info.args)
            local propset = Conditions.Check({ isMale = true }) and "MaleHandIdle" or "FemaleHandIdle"
            info.prop.pipe:attach(info.ped, Propset.Pipe[propset])
            return info
        end,
    },
    exit = {
        animDict = "amb_wander@code_human_smoking_wander@male_b@trans",
        anim = "pipe_trans_nopipe",
        duration = 6000,
        flag = AnimConfig.Flag.Move,
        blendInSpeed = 1.0,
        onTrigger = function(info)
            Citizen.Wait(5900)
            Prop.Detach(info.prop.pipe)
            info.prop.pipe = nil
            return info
        end,

    },
    idles = {
        idle_hands = {
            animDict = "amb_rest@world_human_smoking@pipe@proper@male_c@wip_base",
            anim = "wip_base",
            flag = AnimConfig.Flag.MoveLoop,
            blendOutSpeed=0.5,
            nextBlendInSpeed=0.5,
            onTrigger = function(info)
                -- info.prop.pipe:attach(info.ped, Propset.Pipe.UniIdle)
                return info
            end,
            transitions = {
                p_1 = "s",
                p_2 = "q",
                p_3 = "t",
                trans_h = "b",
                trans_b ="a",
            },
        },
    },
    animations = {
        p_1 = {
            animDict = "amb_rest@world_human_smoking@male_b@idle_a",
            anim = "idle_a",
            name = "Smoke",
            blendInSpeed = 0.5,
            blendOutSpeed=0.5,
            nextBlendInSpeed=0.5,
            flag = AnimConfig.Flag.Move,
            onTrigger = function(info)
                local propset = Conditions.Check({ isMale = true }) and "MalePuff" or "FemalePuff"
                info.prop.pipe:attach(info.ped, Propset.Pipe[propset])
                return info
            end,

        },
        p_2 = {
            animDict = "amb_rest@world_human_smoking@male_b@idle_a",
            anim = "idle_b",
            name = "Think and Smoke",
            blendInSpeed = 0.5,
            blendOutSpeed=0.5,
            nextBlendInSpeed=0.5,
            flag = AnimConfig.Flag.Move,
            onTrigger = function(info)
                local propset = Conditions.Check({ isMale = true }) and "MaleThink" or "FemaleThink"
                info.prop.pipe:attach(info.ped, Propset.Pipe[propset])
                return info
            end,
        },
        p_3 = {
            animDict = "amb_rest@world_human_smoking@male_b@idle_a",
            anim = "idle_c",
            name = "Tamp Tobacco",
            flag = AnimConfig.Flag.Move,
            blendInSpeed = 0.5,
            blendOutSpeed=0.5,
            nextBlendInSpeed=0.5,
        },
        trans_h = {
            --animDict = "amb_rest@world_human_smoking@pipe@proper@male_d@wip_base",
            --anim = "wip_base",
            flag = AnimConfig.Flag.MoveLoop,
            name = "Put Hand Behind Back",
            animLibName = "smoke_pipe_h",
            nextBlendInSpeed = 0.5,
            next = "idle_hands",
            onTrigger = function(info)
                local propset = Conditions.Check({ isMale = true }) and "MaleHandIdle" or "FemaleHandIdle"
                info.prop.pipe:attach(info.ped, Propset.Pipe[propset])
                return info
            end,
        },
        trans_b = {
            --animDict = "amb_rest@world_human_smoking@pipe@proper@male_d@wip_base",
            --anim = "wip_base",
            flag = AnimConfig.Flag.MoveLoop,
            name = "Put Arm at Side",
            animLibName = "smoke_pipe",
            nextBlendInSpeed = 0.5,
            next = "idle_a",
            onTrigger = function(info)
                local propset = Conditions.Check({ isMale = true }) and "MaleHandIdle" or "FemaleHandIdle"
                info.prop.pipe:attach(info.ped, Propset.Pipe[propset])
                return info
            end,
        },
    },
}

