-- Removed newspaper. It now just looks like elbows on the counter
AnimLib.bartender_lean_newspaper = {
    name = "Bar Bored",
    tags = { patron=1, },
    key = "s",
    enter = {
        animDict = "amb_rest_lean@world_human_lean@bar@read_newspaper@male_d@base",
        anim = "base",
        blendInSpeed = 0.9,
        duration = 3000,
        flag = AnimConfig.Flag.Loop,
    },
    exit = {
        animDict = "amb_rest_lean@world_human_lean@bar@read_newspaper@male_d@base",
        anim = "base",
        blendOutSpeed = 0.9,
        duration = 100,
    },
    idles = {
            idle_a = {
            animDict = "amb_rest_lean@world_human_lean@bar@read_newspaper@male_d@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
            transitions = {
                a_a = "w",
                a_b = "1",
                a_c = "a",
                a_e = "e",
                a_f = "2",
                a_h = "s",
            },
        },
    },
    animations = {
        a_a = {
            animDict = "amb_rest_lean@world_human_lean@bar@read_newspaper@male_d@idle_a",
            anim = "idle_a",
            name = "Scratch Face"
        },
        a_b = {
            animDict = "amb_rest_lean@world_human_lean@bar@read_newspaper@male_d@idle_a",
            anim = "idle_b",
            name = "Lean Forward"
        },
        a_c = {
            animDict = "amb_rest_lean@world_human_lean@bar@read_newspaper@male_d@idle_a",
            anim = "idle_c",
            name = "Look Left"
        },
        a_e = {
            animDict = "amb_rest_lean@world_human_lean@bar@read_newspaper@male_d@idle_b",
            anim = "idle_e",
            name = "Glance Around"
        },
        a_f = {
            animDict = "amb_rest_lean@world_human_lean@bar@read_newspaper@male_d@idle_b",
            anim = "idle_f",
            name = "Exasperated"
        },
        a_h = {
            animDict = "amb_rest_lean@world_human_lean@bar@read_newspaper@male_d@idle_c",
            anim = "idle_h",
            name = "Butt Scratch",
        },
    },
}

AnimLib.barcustomer_sober_arthur = {
    name = "Lean Forearms",
    tags = { patron=1, },
    key = "d",
    enter = {
        animDict = "amb_rest_drunk@world_human_barcustomer@sober@no_drink@arthur@stand_enter",
        anim = "enter_back_lf",
        duration = 900,
        blendInSpeed = 0.7,
        blendOutSpeed = 0.9,
        nextBlendInSpeed = 0.8,
    },
    exit = {
        animDict = "amb_rest_drunk@world_human_barcustomer@sober@no_drink@arthur@stand_exit",
        anim = "exit_front",
        duration = 1800,
        blendInSpeed = 0.8,
    },
    idles = {
        idle_a = {
        animDict = "amb_rest_drunk@world_human_barcustomer@sober@no_drink@arthur@base",
        anim = "base",
        flag = AnimConfig.Flag.Loop,
        transitions = {
            a_a = "d",
            a_b = "a",
            a_c = "e",
            a_d = "s",
            a_e = "1",
            a_g = "w",
            a_h = "2",
            },
        },
    },
    animations = {
        a_a = { --? Up-Down on Females
            animDict = "amb_rest_drunk@world_human_barcustomer@sober@no_drink@arthur@idle_a",
            anim = "idle_a",
            name = "Look Right, Scratch Nose",
            blendInSpeed = 0.9,
            nextBlendInSpeed = 0.9,
        },
        a_b = { --? Up-Down on Females
            animDict = "amb_rest_drunk@world_human_barcustomer@sober@no_drink@arthur@idle_a",
            anim = "idle_b",
            name = "Shift Weight",
            blendInSpeed = 0.9,
            nextBlendInSpeed = 0.9,
        },
        a_c = { --? Up-Down on Females
            animDict = "amb_rest_drunk@world_human_barcustomer@sober@no_drink@arthur@idle_a",
            anim = "idle_c",
            name = "Shake Head, Yawn",
            blendInSpeed = 0.9,
            nextBlendInSpeed = 0.9,
        },
        a_d = { --? Up-Down on Females
            animDict = "amb_rest_drunk@world_human_barcustomer@sober@no_drink@arthur@idle_b",
            anim = "idle_d",
            name = "Look Behind",
            blendInSpeed = 0.9,
            nextBlendInSpeed = 0.9,
        },
        a_e = { --? Up-Down on Females
            animDict = "amb_rest_drunk@world_human_barcustomer@sober@no_drink@arthur@idle_b",
            anim = "idle_e",
            name = "Impatient Counter Tap",
            blendInSpeed = 0.9,
            nextBlendInSpeed = 0.9,
        },
        -- a_f = {
        --     animDict = "amb_rest_drunk@world_human_barcustomer@sober@no_drink@arthur@idle_b",
        --     anim = "idle_f",
        --     name = "Crotch Scratch",
        -- },
        a_g = { --? Up-Down on Females
            animDict = "amb_rest_drunk@world_human_barcustomer@sober@no_drink@arthur@idle_c",
            anim = "idle_g",
            name = "Scratch Jaw",
            blendInSpeed = 0.9,
            nextBlendInSpeed = 0.9,
        },
        a_h = { --? Up-Down on Females
            animDict = "amb_rest_drunk@world_human_barcustomer@sober@no_drink@arthur@idle_c",
            anim = "idle_h",
            name = "Tap Feet",
            blendInSpeed = 0.9,
            nextBlendInSpeed = 0.9,
        },
    },
}

-- amb_rest_drunk@world_human_barcustomer@sober@no_drink@male_b@base (two hands on table)
-- AnimLib.barcustomer_sober_male_b_male = {
--     name = "Hands on Bar",
--     tags = { patron=1, },
--     key = "w",
--     condition = function() return Conditions.Check({
--         isMale = true,
--     }) end,
--     enter = {
--         animDict = "amb_rest_drunk@world_human_barcustomer@sober@no_drink@male_b@stand_enter",
--         anim = "enter_back_lf",
--         duration = 1500,
--         blendInSpeed = 0.7,
--         blendOutSpeed = 0.9,
--         nextBlendInSpeed = 0.8,
--     },
--     exit = {
--         animDict = "amb_rest_drunk@world_human_barcustomer@sober@no_drink@male_b@stand_exit",
--         anim = "exit_front",
--         duration = 1100,
--         blendInSpeed = 0.8,
--     },
--     idles = {
--         idle_a = {
--         animDict = "amb_rest_drunk@world_human_barcustomer@sober@no_drink@male_b@base",
--         anim = "base",
--         flag = AnimConfig.Flag.Loop,
--         transitions = {
--             a_a = "a",
--             a_b = "d",
--             a_c = "q",
--             a_e = "w",
--             a_f = "e",
--             a_g = "2",
--             a_h = "1",
--             },
--         },
--     },
--     animations = {
--         a_a = {
--             animDict = "amb_rest_drunk@world_human_barcustomer@sober@no_drink@male_b@idle_a",
--             anim = "idle_a",
--             name = "Shift Weight",
--         },
--         a_b = {
--             animDict = "amb_rest_drunk@world_human_barcustomer@sober@no_drink@male_b@idle_a",
--             anim = "idle_b",
--             name = "Look Right",
--         },
--         a_c = {
--             animDict = "amb_rest_drunk@world_human_barcustomer@sober@no_drink@male_b@idle_a",
--             anim = "idle_c",
--             name = "Look Around",
--         },
--         -- a_d = { -- Similar to one above
--         --     animDict = "amb_rest_drunk@world_human_barcustomer@sober@no_drink@male_b@idle_b",
--         --     anim = "idle_d",
--         --     name = "a_d",
--         -- },
--         a_e = {
--             animDict = "amb_rest_drunk@world_human_barcustomer@sober@no_drink@male_b@idle_b",
--             anim = "idle_e",
--             name = "Wipe Nose",
--         },
--         a_f = {
--             animDict = "amb_rest_drunk@world_human_barcustomer@sober@no_drink@male_b@idle_b",
--             anim = "idle_f",
--             name = "Scratch Nose, Tap Feet",
--         },
--         a_g = {
--             animDict = "amb_rest_drunk@world_human_barcustomer@sober@no_drink@male_b@idle_c",
--             anim = "idle_g",
--             name = "Scratch Neck, Wipe Face",
--         },
--         a_h = {
--             animDict = "amb_rest_drunk@world_human_barcustomer@sober@no_drink@male_b@idle_c",
--             anim = "idle_h",
--             name = "Stretch Arms",
--         },
--     },
-- }

AnimLib.barcustomer_sober_male_b_female = { -- Asterisks in names to depict janky up-down anims
    name = "Hands on Bar",
    tags = { patron=1, },
    key = "w",
    enter = {
        animDict = "amb_rest_drunk@world_human_barcustomer@sober@no_drink@male_b@stand_enter",
        anim = "enter_back_lf",
        duration = 1500,
        blendInSpeed = 0.7,
        blendOutSpeed = 0.9,
        nextBlendInSpeed = 0.8,
    },
    exit = {
        animDict = "amb_rest_drunk@world_human_barcustomer@sober@no_drink@male_b@stand_exit",
        anim = "exit_front",
        duration = 1100,
        blendInSpeed = 0.8,
    },
    idles = {
        idle_a = {
        animDict = "amb_rest_drunk@world_human_barcustomer@sober@no_drink@male_b@base",
        anim = "base",
        flag = AnimConfig.Flag.Loop,
        transitions = {
            a_a = "a",
            a_b = "d",
            a_c = "q",
            a_e = "w",
            a_f = "e",
            a_g = "2",
            a_h = "1",
            },
        },
    },
    animations = {
        a_a = {
            animDict = "amb_rest_drunk@world_human_barcustomer@sober@no_drink@male_b@idle_a",
            anim = "idle_a",
            name = "Shift Weight",
            duration = 3000,
            blendInSpeed = 0.9,
            nextBlendInSpeed = 0.9,
        },
        a_b = { --? Up-Down on Females
            animDict = "amb_rest_drunk@world_human_barcustomer@sober@no_drink@male_b@idle_a",
            anim = "idle_b",
            name = "Look Right",
            blendInSpeed = 0.9,
            nextBlendInSpeed = 0.9,
        },
        a_c = { --? Up-Down on Females
            animDict = "amb_rest_drunk@world_human_barcustomer@sober@no_drink@male_b@idle_a",
            anim = "idle_c",
            name = "Look Around",
            duration = 11500,
            blendInSpeed = 0.9,
            nextBlendInSpeed = 0.9,
        },
        -- a_d = { -- Similar to one above
        --     animDict = "amb_rest_drunk@world_human_barcustomer@sober@no_drink@male_b@idle_b",
        --     anim = "idle_d",
        --     name = "a_d*",
        --     blendInSpeed = 0.9,
        --     nextBlendInSpeed = 0.9,
        -- },
        a_e = {
            animDict = "amb_rest_drunk@world_human_barcustomer@sober@no_drink@male_b@idle_b",
            anim = "idle_e",
            name = "Wipe Nose",
            duration = 5000,
            blendInSpeed = 0.9,
            nextBlendInSpeed = 0.9,
        },
        a_f = {
            animDict = "amb_rest_drunk@world_human_barcustomer@sober@no_drink@male_b@idle_b",
            anim = "idle_f",
            name = "Scratch Nose, Tap Feet",
            blendInSpeed = 0.9,
            nextBlendInSpeed = 0.9,
        },
        a_g = { --? Up-Down on Females
            animDict = "amb_rest_drunk@world_human_barcustomer@sober@no_drink@male_b@idle_c",
            anim = "idle_g",
            name = "Scratch Neck, Wipe Face",
            blendInSpeed = 0.9,
            nextBlendInSpeed = 0.9,
        },
        a_h = {
            animDict = "amb_rest_drunk@world_human_barcustomer@sober@no_drink@male_b@idle_c",
            anim = "idle_h",
            name = "Stretch Arms",
            blendInSpeed = 0.9,
            nextBlendInSpeed = 0.9,
        },
    },
}
