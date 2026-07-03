--- Copyright © 2024 Joshua Nelson

AnimLib.horse_drink_trough = {
    name = "Drink Trough",
    tags = { consume=1, },
    condition = function() return Conditions.Check({ isHorse = true, isAnimal = true, }) end,
    key = "d",
    enter = {
        animDict = "amb_creature_mammal@prop_horse_drink_trough@stand_enter",
        anim = "enter",
        blendInSpeed = 1.0,
    },
    exit = {
        animDict = "amb_creature_mammal@prop_horse_drink_trough@stand_exit",
        anim = "exit",
    },
    idles = {
        idle_a = {
            animDict = "amb_creature_mammal@prop_horse_drink_trough@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
            transitions = {
                a_a = "d",
                a_b = "a",
                a_c = "s",
                a_d = "q",
            },
        },
    },
    animations = {
        a_a = {
            name = "Drink",
            animDict = "amb_creature_mammal@prop_horse_drink_trough@idle0",
            anim = "idle_a",
        },
        a_b = {
            name = "Drink Left",
            animDict = "amb_creature_mammal@prop_horse_drink_trough@idle0",
            anim = "idle_b",
        },
        a_c = {
            name = "Drink Stretch",
            animDict = "amb_creature_mammal@prop_horse_drink_trough@idle0",
            anim = "idle_c",
        },
        a_d = {
            name = "Lick",
            animDict = "amb_creature_mammal@prop_horse_drink_trough@idle0",
            anim = "idle_d",
        },
    },
}

AnimLib.horse_drink_ground = {
    name = "Drink River",
    tags = { consume=1, },
    condition = function() return Conditions.Check({ isHorse = true, isAnimal = true, }) end,
    key = "r",
    enter = {
        animDict = "amb_creature_mammal@world_horse_drink_ground@stand_enter",
        anim = "enter",
        blendInSpeed = 1.0,
    },
    exit = {
        animDict = "amb_creature_mammal@world_horse_drink_ground@stand_exit",
        anim = "exit",
    },
    idles = {
        idle_a = {
            animDict = "amb_creature_mammal@world_horse_drink_ground@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
            transitions = {
                a_a = "1",
            },
        },
    },
    animations = {
        a_a = {
            name = "Drink",
            animDict = "amb_creature_mammal@world_horse_drink_ground@idle",
            anim = "idle_a",
        },
    },
}

AnimLib.horse_grazing = {
    name = "Graze",
    tags = { consume=1 },
    condition = function() return Conditions.Check({ isHorse = true, isAnimal = true, }) end,
    key = "g",
    enter = {
        animDict = "amb_creature_mammal@world_horse_grazing@stand_enter",
        anim = "enter",
        blendInSpeed = 1.0,
    },
    exit = {
        animDict = "amb_creature_mammal@world_horse_grazing@stand_exit",
        anim = "exit",
    },
    idles = {
        idle_a = {
            animDict = "amb_creature_mammal@world_horse_grazing@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
            transitions = {
                a_a = "w",
                a_b = "d",
                a_c = "y",
                a_d = "q",
                a_e = "e",
            },
        },
    },
    animations = {
        a_a = {
            name = "Graze",
            animDict = "amb_creature_mammal@world_horse_grazing@idle",
            anim = "idle_a",
        },
        a_b = {
            name = "Graze Left",
            animDict = "amb_creature_mammal@world_horse_grazing@idle",
            anim = "idle_b",
        },
        a_c = {
            name = "Yank Grass",
            animDict = "amb_creature_mammal@world_horse_grazing@idle",
            anim = "idle_c",
        },
        a_d = {
            name = "Look Front Left",
            animDict = "amb_creature_mammal@world_horse_grazing@idle0",
            anim = "idle_d",
        },
        a_e = {
            name = "Look Right",
            animDict = "amb_creature_mammal@world_horse_grazing@idle",
            anim = "idle_e",
        },
    },
}

AnimLib.horse_resting = {
    name = "Rest",
    tags = { rest=1, },
    condition = function() return Conditions.Check({ isHorse = true, isAnimal = true, }) end,
    key = "r",
    enter = {
        animDict = "amb_creature_mammal@world_horse_resting@stand_enter",
        anim = "enter",
        blendInSpeed = 1.0,
    },
    exit = {
        animDict = "amb_creature_mammal@world_horse_resting@stand_exit",
        anim = "exit",
    },
    idles = {
        idle_a = {
            animDict = "amb_creature_mammal@world_horse_resting@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
            transitions = {
                a_a = "e",
                -- a_b = "r", -- Does nothing really
                trans_sleep = "s",
            },
        },
    },
    animations = {
        a_a = {
            name = "Look Back Right",
            animDict = "amb_creature_mammal@world_horse_resting@idle",
            anim = "idle_a",
        },
        a_b = {
            name = "Rest",
            animDict = "amb_creature_mammal@world_horse_resting@idle",
            anim = "idle_b",
        },
    },
    transitions = {
        trans_sleep = {
            name = "Transition to Sleep",
            animLibName = "horse_sleep",
            animDict = "amb_creature_mammal@world_horse_resting@trans",
            anim = "resting_trans_sleeping",
            next = "idle_a",
        },
    }
}

AnimLib.horse_sleep = {
    name = "Sleep",
    tags = { rest=1, },
    condition = function() return Conditions.Check({ isHorse = true, isAnimal = true, }) end,
    key = "s",
    enter = {
        animDict = "amb_creature_mammal@world_horse_sleeping@stand_enter",
        anim = "enter",
        blendInSpeed = 1.0,
    },
    exit = {
        animDict = "amb_creature_mammal@world_horse_sleeping@stand_exit",
        anim = "exit",
    },
    idles = {
        idle_a = {
            animDict = "amb_creature_mammal@world_horse_sleeping@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
            transitions = {
                trans_rest = "r",
            },
        },
    },
    transitions = {
        trans_rest = {
            name = "Transition to Rest",
            animLibName = "horse_resting",
            animDict = "amb_creature_mammal@world_horse_sleeping@trans",
            anim = "sleeping_trans_resting",
            next = "idle_a",
        },
    }
}

AnimLib.horse_wallow_shake = {
    name = "Wallow Shake",
    tags = { play=1, },
    condition = function() return Conditions.Check({ isHorse = true, isAnimal = true, }) end,
    key = "w",
    enter = {
        animDict = "amb_creature_mammal@world_horse_wallow_shake@stand_enter",
        anim = "enter",
        blendInSpeed = 1.0,
    },
    exit = {
        animDict = "amb_creature_mammal@world_horse_wallow_shake@stand_exit",
        anim = "exit",
    },
    idles = {
        idle_a = {
            animDict = "amb_creature_mammal@world_horse_wallow_shake@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
            transitions = {
                a_a = "s",
            },
        },
    },
    animations = {
        a_a = {
            name = "Scratch Cheek On Leg",
            animDict = "amb_creature_mammal@world_horse_wallow_shake@idle",
            anim = "idle_a",
        },
    },
}

-- Add more in creatures_mammal@horse
-- - footscratch
-- - rear
-- -
-- -
-- -
-- -
