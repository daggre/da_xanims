AnimLib.bar_waiting = {
    name = "Bar Waiting",
    tags = { bar=1 },
    key = "a",
    enter = {
        animDict = "amb_work@world_human_bartender@pre_service@male_a@stand_enter",
        anim = "enter_back_lf",
        blendInSpeed = 1.0,
    },
    exit = {
        animDict = "amb_work@world_human_bartender@pre_service@male_a@stand_exit",
        anim = "exit_front",
        duration = 1100,
    },
    idles = {
        idle_a = {
            animDict = "amb_work@world_human_bartender@pre_service@male_a@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
            transitions = {
                a_b = "1",
                a_c = "e",
                a_d = "2",
                a_e = "q",
                a_f = "a",
                a_g = "s",
                a_h = "w",
                trans_service = "z",
            },
        },
    },
    animations = {
        a_b = {
            animDict = "amb_work@world_human_bartender@pre_service@male_a@idle_a",
            anim = "idle_b",
            name = "Tap Foot",
        },
        a_c = {
            animDict = "amb_work@world_human_bartender@pre_service@male_a@idle_a",
            anim = "idle_c",
            name = "Lean Forward",
        },
        a_d = {
            animDict = "amb_work@world_human_bartender@pre_service@male_a@idle_b",
            anim = "idle_d",
            name = "Tap Foot, Look Down",
        },
        a_e = {
            animDict = "amb_work@world_human_bartender@pre_service@male_a@idle_b",
            anim = "idle_e",
            name = "Lean Forward, Look Left",
        },
        a_f = {
            animDict = "amb_work@world_human_bartender@pre_service@male_a@idle_b",
            anim = "idle_f",
            name = "Wipe Crumbs",
        },
        a_g = {
            animDict = "amb_work@world_human_bartender@pre_service@male_a@idle_c",
            anim = "idle_g",
            name = "Look Down",
        },
        a_h = {
            animDict = "amb_work@world_human_bartender@pre_service@male_a@idle_c",
            anim = "idle_h",
            name = "Wipe Nose",
        },
        trans_service = {
            name = "Transition to Service",
            animLibName = "bar_service",
            next = "idle_a",
            nextBlendInSpeed = 0.9,
        },
    },
}

AnimLib.bar_service = {
    name = "Bar Service",
    tags = { bartender=1, },
    key = "b",
    enter = {
        animDict = "amb_work@world_human_bartender@pre_service@male_a@stand_enter",
        anim = "enter_back_lf",
        blendInSpeed = 1.0,
    },
    exit = {
        animDict = "amb_work@world_human_bartender@pre_service@male_a@stand_exit",
        anim = "exit_front",
        duration = 1100,
    },
    idles = {
        idle_a = {
            animDict = "amb_work@world_human_bartender@pre_service@male_a@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
            transitions = {
                m_serve_beer = "d",
                f_serve_beer = "d",
                a_serve_beer_cheers = "f",
                m_serve_whiskey = "s",
                f_serve_whiskey = "s",
                trans_waiting = "z",
            },
        },
    },
    animations = {
        f_serve_beer = {
            condition = function() return Conditions.Check({isMale = false, hasBottle = true}) end,
            animDict = "amb_work@world_human_bartender@pre_service@female_a@trans",
            anim = "a_trans_over_a_serve_bottle_over",
            name = "Serve Bottle",
            onStart = function(info)
                info.prop.coins = Prop:new(Propset.Coins)
                info.prop.coins:create()
                info.prop.beer = Prop:new(Propset.Beer)
                info.prop.beer:create()
                return info
            end,
            onTrigger = function(info)
                Citizen.Wait(900)
                info.prop.coins:attach(info.ped)
                Citizen.Wait(1000)
                Prop.Detach(info.prop.coins)
                Citizen.Wait(1400)
                info.prop.beer:attach(info.ped)
                return info
            end,
            next = "f_serve_beer_2",
        },
        f_serve_beer_2 = {
            animDict = "amb_work@world_human_bartender@serve_beer@female_a@serve_bottle@under_bar@trans",
            anim = "under_trans_over_a_serve_bottle",
            duration = 1700,
            next = "f_serve_beer_3"
        },
        f_serve_beer_3 = {
            animDict = "amb_work@world_human_bartender@serve_beer@female_a@serve_bottle@over_bar@trans",
            anim = "over_trans_front_a_serve_bottle",
            duration = 600,
            onTrigger = function(info)
                Citizen.Wait(350)
                Prop.Detach(info.prop.beer)
                return info
            end,
            nextBlendInSpeed = 0.9,
        },
        m_serve_beer = {
            condition = function() return Conditions.Check({isMale = true, hasBottle = true}) end,
            animDict = "amb_work@world_human_bartender@pre_service@male_a@trans",
            anim = "a_trans_over_a_serve_bottle_over",
            name = "Serve Bottle",
            onStart = function(info)
                info.prop.coins = Prop:new(Propset.Coins)
                info.prop.coins:create()
                info.prop.beer = Prop:new(Propset.Beer)
                info.prop.beer:create()
                return info
            end,
            onTrigger = function(info)
                Citizen.Wait(900)
                info.prop.coins:attach(info.ped)
                Citizen.Wait(1200)
                Prop.Detach(info.prop.coins)
                Citizen.Wait(1200)
                info.prop.beer:attach(info.ped)
                return info
            end,
            next = "m_serve_beer_2",
        },
        m_serve_beer_2 = {
            animDict = "amb_work@world_human_bartender@serve_beer@male_a@serve_bottle@under_bar@base",
            anim = "under_trans_over_a",
            duration = 1700,
            next = "m_serve_beer_3"
        },
        m_serve_beer_3 = {
            animDict = "amb_work@world_human_bartender@serve_beer@male_a@serve_bottle@over_bar@base",
            anim = "over_trans_front_a",
            duration = 600,
            onTrigger = function(info)
                Citizen.Wait(350)
                Prop.Detach(info.prop.beer)
                return info
            end,
            nextBlendInSpeed = 0.9,
        },
        a_serve_beer_cheers = {
            condition = function() return Conditions.Check({hasBottle = true}) end,
            animDict = "amb_work@world_human_bartender@pre_service@male_a@trans",
            anim = "a_trans_over_a_serve_bottle_over",
            name = "Serve Bottle Cheers",
            onStart = function(info)
                info.prop.coins = Prop:new(Propset.Coins)
                info.prop.coins:create()
                info.prop.beer = Prop:new(Propset.Beer)
                info.prop.beer:create()
                return info
            end,
            onTrigger = function(info)
                Citizen.Wait(900)
                info.prop.coins:attach(info.ped)
                Citizen.Wait(1200)
                Prop.Detach(info.prop.coins)
                Citizen.Wait(1200)
                info.prop.beer:attach(info.ped)
                return info
            end,
            next = "a_serve_beer_cheers_2",
        },
        a_serve_beer_cheers_2 = {
            animDict = "amb_work@world_human_bartender@serve_beer@male_a@serve_bottle@under_bar@base",
            anim = "under_trans_over_b",
            duration = 2850,
            next = "a_serve_beer_cheers_3"
        },
        a_serve_beer_cheers_3 = {
            animDict = "amb_work@world_human_bartender@serve_beer@male_a@serve_bottle@over_bar@base",
            anim = "over_trans_front_a",
            duration = 600,
            onTrigger = function(info)
                Citizen.Wait(350)
                Prop.Detach(info.prop.beer)
                return info
            end,
            nextBlendInSpeed = 0.9,
        },
        m_serve_whiskey = {
            condition = function() return Conditions.Check({isMale = true, hasShot = true}) end,
            name = "Serve Shot",
            animDict = "amb_work@world_human_bartender@pre_service@male_a@trans", -- takes money and reaches under bar
            anim = "a_trans_undertwo_a_pourglass",
            onStart = function(info)
                info.prop.coins = Prop:new(Propset.Coins)
                info.prop.coins:create()
                info.prop.whiskey = Prop:new(Propset.Whiskey)
                info.prop.whiskey:create()
                info.prop.shotglass = Prop:new(Propset.WhiskeyShotglass)
                info.prop.shotglass:create()
                return info
            end,
            onTrigger = function(info)
                Citizen.Wait(800)
                info.prop.coins:attach(info.ped)
                Citizen.Wait(1500)
                Prop.Detach(info.prop.coins)
                Citizen.Wait(1200)
                info.prop.whiskey:attach(info.ped)
                info.prop.shotglass:attach(info.ped)
                return info
            end,
            blendInSpeed = 0.9,
            next = "m_serve_whiskey_2",
        },
        m_serve_whiskey_2 = {
            animDict = "amb_work@world_human_bartender@serve_whiskey@male_a@pour_glass@under_bar_two_hand@base",
            anim = "undertwo_trans_over_a",
            blendOutSpeed = 0.2,
            next = "m_serve_whiskey_3"
        },
        m_serve_whiskey_3 = {
            animDict = "amb_work@world_human_bartender@serve_whiskey@male_a@pour_glass@over_bar@base", -- pours whiskey shot and puts bottle under counter
            anim = "over_trans_underone_a",
            onTrigger = function(info)
                Citizen.Wait(1300)
                Prop.Detach(info.prop.shotglass)
                return info
            end,
            next = "m_serve_whiskey_4",
        },
        m_serve_whiskey_4 = {
            animDict = "amb_work@world_human_bartender@serve_whiskey@male_a@pour_glass@under_bar_one_hand@base",
            anim = "underone_trans_front_a",
            duration = 500,
            onTrigger = function(info)
                Citizen.Wait(250)
                Prop.Detach(info.prop.whiskey)
                return info
            end,
            nextBlendInSpeed = 0.9,
        },
        f_serve_whiskey = {
            condition = function() return Conditions.Check({isMale = false, hasShot = true}) end,
            name = "Serve Shot",
            animDict = "amb_work@world_human_bartender@pre_service@female_a@trans", -- takes money and reaches under bar
            anim = "a_trans_undertwo_a_pourglass",
            onStart = function(info)
                info.prop.coins = Prop:new(Propset.Coins)
                info.prop.coins:create()
                info.prop.whiskey = Prop:new(Propset.Whiskey)
                info.prop.whiskey:create()
                info.prop.shotglass = Prop:new(Propset.WhiskeyShotglass)
                info.prop.shotglass:create()
                return info
            end,
            onTrigger = function(info)
                Citizen.Wait(800)
                info.prop.coins:attach(info.ped)
                Citizen.Wait(1500)
                Prop.Detach(info.prop.coins)
                Citizen.Wait(1200)
                info.prop.whiskey:attach(info.ped)
                info.prop.shotglass:attach(info.ped)
                return info
            end,
            blendInSpeed = 0.9,
            duration = 3800,
            next = "f_serve_whiskey_2",
        },
        f_serve_whiskey_2 = {
            animDict = "amb_work@world_human_bartender@serve_whiskey@female_a@pour_glass@under_bar_two_hand@trans",
            anim = "undertwo_trans_over_a",
            blendOutSpeed = 0.2,
            next = "f_serve_whiskey_3"
        },
        f_serve_whiskey_3 = {
            animDict = "amb_work@world_human_bartender@serve_whiskey@female_a@pour_glass@over_bar@trans", -- pours whiskey shot and puts bottle under counter
            anim = "over_trans_underone_a",
            onTrigger = function(info)
                Citizen.Wait(1300)
                Prop.Detach(info.prop.shotglass)
                return info
            end,
            next = "f_serve_whiskey_4",
        },
        f_serve_whiskey_4 = {
            animDict = "amb_work@world_human_bartender@serve_whiskey@female_a@pour_glass@under_bar_one_hand@trans",
            anim = "underone_trans_front_a",
            duration = 500,
            onTrigger = function(info)
                Citizen.Wait(250)
                Prop.Detach(info.prop.whiskey)
                return info
            end,
            nextBlendInSpeed = 0.9,
        },
        trans_waiting = {
            name = "Transition to Waiting",
            animLibName = "bar_waiting",
            next = "idle_a",
            nextBlendInSpeed = 0.9,
        },
    },
}

AnimLib.bartender_cleaning_glass_female = {
    name = "Clean Glass",
    tags = { bartender=1, },
    key = "w",
    condition = function() return Conditions.Check({
        isMale = false,
    }) end,
    enter = {
        animDict = "amb_work@world_human_bartender@cleaning@glass@female_a@stand_enter",
        anim = "enter_back_lf",
        blendInSpeed = 1.0,
        prop = { rag = { anim = "enter_back_lf_rag", },},
        onStart = function(info)
            info.prop.rag = Prop:new(Propset.Rag)
            info.prop.rag:create()
            info.prop.glass = Prop:new(Propset.Shotglass)
            info.prop.glass:create()
            return info
        end,
        onTrigger = function(info)
            Citizen.Wait(3800)
            info.prop.glass:attach(info.ped)
            Citizen.Wait(200)
            info.prop.rag:attach(info.ped)
            return info
        end
    },
    exit = {
        animDict = "amb_work@world_human_bartender@cleaning@glass@female_a@stand_exit",
        anim = "exit_front",
        duration = 4500,
        prop = { rag = { anim = "exit_front_rag", },},
        onTrigger = function(info)
            Citizen.Wait(3500)
            Prop.Detach(info.prop.glass)
            Citizen.Wait(1000)
            Prop.Detach(info.prop.rag)
            return info
        end,
    },
    idles = {
        idle_a = {
            animDict = "amb_work@world_human_bartender@cleaning@glass@female_a@base",
            anim = "base",
            flag = AnimConfig.Flag.MoveLoop,
            prop = { rag = { anim = "base_rag", loop = true, }, },
            transitions = {
                a_a = "1",
                -- a_b = "w",
                a_c = "d",
                a_d = "q",
                a_e = "2",
                a_f = "3",
                a_g = "e",
                a_h = "a",
            },
        },
    },
    animations = {
        a_a = {
            animDict = "amb_work@world_human_bartender@cleaning@glass@female_a@idle_a",
            anim = "idle_a",
            flag = AnimConfig.Flag.Move,
            duration = 6000,
            prop = { rag = { anim = "idle_a_rag", }, },
            name = "Spit Clean"
        },
        -- a_b = {
        --     animDict = "amb_work@world_human_bartender@cleaning@glass@female_a@idle_a",
        --     anim = "idle_b",
        --     prop = { rag = { anim = "idle_b_rag", }, },
        -- },
        a_c = {
            animDict = "amb_work@world_human_bartender@cleaning@glass@female_a@idle_a",
            anim = "idle_c",
            flag = AnimConfig.Flag.Move,
            duration = 6000,
            prop = { rag = { anim = "idle_c_rag", }, },
            name = "Check Cleanliness"
        },
        a_d = {
            animDict = "amb_work@world_human_bartender@cleaning@glass@female_a@idle_b",
            anim = "idle_d",
            flag = AnimConfig.Flag.Move,
            duration = 8000,
            prop = { rag = { anim = "idle_d_rag", }, },
            name = "Check, Blow"
        },
        a_e = {
            animDict = "amb_work@world_human_bartender@cleaning@glass@female_a@idle_b",
            anim = "idle_e",
            flag = AnimConfig.Flag.Move,
            duration = 7000,
            prop = { rag = { anim = "idle_e_rag", }, },
            name = "Deep Clean"
        },
        a_f = {
            animDict = "amb_work@world_human_bartender@cleaning@glass@female_a@idle_b",
            anim = "idle_f",
            flag = AnimConfig.Flag.Move,
            duration = 6000,
            prop = { rag = { anim = "idle_f_rag", }, },
            name = "Wipe on Shirt"
        },
        a_g = {
            animDict = "amb_work@world_human_bartender@cleaning@glass@female_a@idle_c",
            anim = "idle_g",
            flag = AnimConfig.Flag.Move,
            duration = 6000,
            prop = { rag = { anim = "idle_g_rag", }, },
            name = "Breathe, Wipe"
        },
        a_h = {
            animDict = "amb_work@world_human_bartender@cleaning@glass@female_a@idle_c",
            anim = "idle_h",
            flag = AnimConfig.Flag.Move,
            duration = 7000,
            prop = { rag = { anim = "idle_h_rag", }, },
            name = "Empty Glass"
        },
    },
}


AnimLib.bartender_cleaning_glass_male = {
    name = "Clean Glass",
    tags = { bartender=1, },
    key = "w",
    condition = function() return Conditions.Check({
        isMale = true,
    }) end,
    enter = {
        animDict = "amb_work@world_human_bartender@cleaning@glass@male_b@stand_enter",
        anim = "enter_back_lf",
        blendInSpeed = 1.0,
        prop = {
            rag = { anim = "enter_back_lf_rag", },
        },
        onStart = function(info)
            info.prop.rag = Prop:new(Propset.Rag)
            info.prop.rag:create()
            info.prop.glass = Prop:new(Propset.Shotglass)
            info.prop.glass:create()
            return info
        end,
        onTrigger = function(info)
            Citizen.Wait(3800)
            info.prop.glass:attach(info.ped)
            Citizen.Wait(200)
            info.prop.rag:attach(info.ped)
            return info
        end
    },
    exit = {
        animDict = "amb_work@world_human_bartender@cleaning@glass@male_b@stand_exit",
        anim = "exit_front",
        duration = 4500,
        prop = { rag = { anim = "exit_front_rag", },},
        onTrigger = function(info)
            Citizen.Wait(3500)
            Prop.Detach(info.prop.glass)
            Citizen.Wait(1000)
            Prop.Detach(info.prop.rag)
            return info
        end,
    },
    idles = {
            idle_a = {
            animDict = "amb_work@world_human_bartender@cleaning@glass@male_b@base",
            anim = "base",
            flag = AnimConfig.Flag.MoveLoop,
            prop = { rag = { anim = "base_rag", loop = true, }, },
            transitions = {
                a_a = "1",
                -- a_b = "w",
                a_c = "d",
                a_d = "q",
                a_e = "2",
                a_f = "3",
                a_g = "e",
                a_h = "a",
            },
        },
    },
    animations = {
        a_a = {
            animDict = "amb_work@world_human_bartender@cleaning@glass@male_b@idle_a",
            anim = "idle_a",
            flag = AnimConfig.Flag.Move,
            duration = 6000,
            prop = { rag = { anim = "idle_a_rag", }, },
            name = "Spit Clean"
        },
        -- a_b = {
        --     animDict = "amb_work@world_human_bartender@cleaning@glass@male_b@idle_a",
        --     anim = "idle_b",
        --     prop = { rag = { anim = "idle_b_rag", }, },
        -- },
        a_c = {
            animDict = "amb_work@world_human_bartender@cleaning@glass@male_b@idle_a",
            anim = "idle_c",
            flag = AnimConfig.Flag.Move,
            duration = 6000,
            prop = { rag = { anim = "idle_c_rag", }, },
            name = "Check Cleanliness"
        },
        a_d = {
            animDict = "amb_work@world_human_bartender@cleaning@glass@male_b@idle_b",
            anim = "idle_d",
            flag = AnimConfig.Flag.Move,
            duration = 8000,
            prop = { rag = { anim = "idle_d_rag", }, },
            name = "Check, Blow"
        },
        a_e = {
            animDict = "amb_work@world_human_bartender@cleaning@glass@male_b@idle_b",
            anim = "idle_e",
            flag = AnimConfig.Flag.Move,
            duration = 7000,
            prop = { rag = { anim = "idle_e_rag", }, },
            name = "Deep Clean"
        },
        a_f = {
            animDict = "amb_work@world_human_bartender@cleaning@glass@male_b@idle_b",
            anim = "idle_f",
            flag = AnimConfig.Flag.Move,
            duration = 6000,
            prop = { rag = { anim = "idle_f_rag", }, },
            name = "Wipe on Shirt"
        },
        a_g = {
            animDict = "amb_work@world_human_bartender@cleaning@glass@male_b@idle_c",
            anim = "idle_g",
            flag = AnimConfig.Flag.Move,
            duration = 6000,
            prop = { rag = { anim = "idle_g_rag", }, },
            name = "Breathe, Wipe"
        },
        a_h = {
            animDict = "amb_work@world_human_bartender@cleaning@glass@male_b@idle_c",
            anim = "idle_h",
            flag = AnimConfig.Flag.Move,
            duration = 7000,
            prop = { rag = { anim = "idle_h_rag", }, },
            name = "Empty Glass"
        },
    },
}

AnimLib.bartender_cleaning_table_male = {
    name = "Clean Table",
    tags = { bartender=1, },
    key = "d",
    condition = function() return Conditions.Check({
        isMale = true,
    }) end,
    enter = {
        animDict = "amb_work@world_human_clean_table@male_a@stand_enter",
        anim = "enter_back_lf",
        duration = 1900,
        prop = { rag = { anim = "enter_back_lf_rag", },},
        blendInSpeed = 1.0,
        nextBlendInSpeed = 0.8,
        onStart = function(info)
            info.prop.rag = Prop:new(Propset.WrungRag)
            info.prop.rag:create()
            return info
        end,
        onTrigger = function(info)
            Citizen.Wait(1000)
            info.prop.rag:attach(info.ped)
            return info
        end
    },
    exit = {
        animDict = "amb_work@world_human_clean_table@male_a@stand_exit",
        anim = "exit_front",
        blendInSpeed = 0.9,
        duration = 1100,
        prop = { rag = { anim = "exit_front_rag", },},
        onTrigger = function(info)
            Citizen.Wait(2000)
            Prop.Detach(info.prop.rag)
            return info
        end,
    },
    idles = {
        idle_a = {
            animDict = "amb_work@world_human_clean_table@male_b@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
            transitions = {
                a_a = "e",
                a_b = "2",
                a_c = "3",
                a_d = "w",
                a_e = "a",
                a_f = "q",
                a_g = "d",
                a_h = "s",
            },
        },
    },
    animations = {
        a_a = {
            animDict = "amb_work@world_human_clean_table@male_b@idle_a",
            anim = "idle_a",
            prop = { rag = { anim = "idle_a_rag", },},
            name = "Pause, Look",
        },
        a_b = {
            animDict = "amb_work@world_human_clean_table@male_b@idle_a",
            anim = "idle_b",
            prop = { rag = { anim = "idle_b_rag", },},
            name = "Scrub Spot",
        },
        a_c = {
            animDict = "amb_work@world_human_clean_table@male_b@idle_a",
            anim = "idle_c",
            prop = { rag = { anim = "idle_c_rag", },},
            name = "Wipe With Hand",
        },
        a_d = {
            animDict = "amb_work@world_human_clean_table@male_b@idle_b",
            anim = "idle_d",
            prop = { rag = { anim = "idle_d_rag", },},
            name = "Reach Further",
        },
        a_e = {
            animDict = "amb_work@world_human_clean_table@male_b@idle_b",
            anim = "idle_e",
            prop = { rag = { anim = "idle_e_rag", },},
            name = "Look Left",
        },
        a_f = {
            animDict = "amb_work@world_human_clean_table@male_b@idle_b",
            anim = "idle_f",
            prop = { rag = { anim = "idle_f_rag", },},
            name = "Two Hands",
        },
        a_g = {
            animDict = "amb_work@world_human_clean_table@male_b@idle_c",
            anim = "idle_g",
            prop = { rag = { anim = "idle_g_rag", },},
            name = "Swipe Away",
        },
        a_h = {
            animDict = "amb_work@world_human_clean_table@male_b@idle_c",
            anim = "idle_h",
            prop = { rag = { anim = "idle_h_rag", },},
            name = "Wring Rag",
        },
    },
}

AnimLib.bartender_cleaning_table_female = {
    name = "Clean Table",
    tags = { bartender=1, },
    key = "d",
    condition = function() return Conditions.Check({
        isMale = false,
    }) end,
    enter = {
        animDict = "amb_work@world_human_clean_table@female_a@stand_enter",
        anim = "enter_back_lf",
        prop = { rag = { anim = "enter_back_lf_rag", },},
        duration = 1900,
        blendInSpeed = 1.0,
        nextBlendInSpeed = 0.8,
        onStart = function(info)
            info.prop.rag = Prop:new(Propset.WrungRag)
            info.prop.rag:create()
            return info
        end,
        onTrigger = function(info)
            Citizen.Wait(1000)
            info.prop.rag:attach(info.ped)
            return info
        end
    },
    exit = {
        animDict = "amb_work@world_human_clean_table@female_a@stand_exit",
        anim = "exit_front",
        prop = { rag = { anim = "exit_front_rag", },},
        blendInSpeed = 0.9,
        duration = 1100,
        onTrigger = function(info)
            Citizen.Wait(2000)
            Prop.Detach(info.prop.rag)
            return info
        end,
    },
    idles = {
        idle_a = {
            animDict = "amb_work@world_human_clean_table@female_b@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
            transitions = {
                a_a = "q",
                a_b = "2",
                a_c = "w",
                a_d = "e",
                a_e = "d",
                a_f = "a",
                a_g = "3",
                a_h = "s",
            },
        },
    },
    animations = {
        a_a = {
            animDict = "amb_work@world_human_clean_table@female_b@idle_a",
            anim = "idle_a",
            prop = { rag = { anim = "idle_a_rag", },},
            name = "Look Up, Annoyed",
        },
        a_b = {
            animDict = "amb_work@world_human_clean_table@female_b@idle_a",
            anim = "idle_b",
            prop = { rag = { anim = "idle_b_rag", },},
            name = "Reach Further",
        },
        a_c = {
            animDict = "amb_work@world_human_clean_table@female_b@idle_a",
            anim = "idle_c",
            prop = { rag = { anim = "idle_c_rag", },},
            name = "Wipe Brow",
        },
        a_d = {
            animDict = "amb_work@world_human_clean_table@female_b@idle_b",
            anim = "idle_d",
            prop = { rag = { anim = "idle_d_rag", },},
            name = "Shake Out Arm",
        },
        a_e = {
            animDict = "amb_work@world_human_clean_table@female_b@idle_b",
            anim = "idle_e",
            prop = { rag = { anim = "idle_e_rag", },},
            name = "Wipe Away",
        },
        a_f = {
            animDict = "amb_work@world_human_clean_table@female_b@idle_b",
            anim = "idle_f",
            prop = { rag = { anim = "idle_f_rag", },},
            name = "Pause, Stretch Shoulder",
        },
        a_g = {
            animDict = "amb_work@world_human_clean_table@female_b@idle_c",
            anim = "idle_g",
            prop = { rag = { anim = "idle_g_rag", },},
            name = "Spit Clean",
        },
        a_h = {
            animDict = "amb_work@world_human_clean_table@female_b@idle_c",
            anim = "idle_h",
            prop = { rag = { anim = "idle_h_rag", },},
            name = "Pause, Back Hurt",
        },
    },
}
