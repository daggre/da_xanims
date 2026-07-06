AnimLib.wolf_sniffing_ground = {
    name = "Sniffing Ground",
    tags = { environment=1, },
    key = "g",
    condition = function()
        return Conditions.Check({
            isWolf = true,
            isAnimal = true,
        })
    end,
    enter = {
        animDict = "amb_creature_mammal@world_wolf_sniffing_ground@stand_enter",
        anim = "enter",
        blendInSpeed = 1.0,
    },
    exit = {
        animDict = "amb_creature_mammal@world_wolf_sniffing_ground@stand_exit",
        anim = "exit",
        duration = 800,
    },
    idles = {
        idle_a = {
            animDict = "amb_creature_mammal@world_wolf_sniffing_ground@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
        },
    },
}

AnimLib.wolf_howling_sitting = {
    name = "Sitting Howl",
    tags = { vocalize=1, },
    key = "z",
    condition = function()
        return Conditions.Check({
            isWolf = true,
            isAnimal = true,
        })
    end,
    enter = {
        animDict = "amb_creature_mammal@world_wolf_howling_sitting@stand_enter",
        anim = "enter",
        blendInSpeed = 1.0,
    },
    exit = {
        animDict = "amb_creature_mammal@world_wolf_howling_sitting@stand_exit",
        anim = "exit",
        duration = 500,
    },
    idles = {
        idle_a = {
            animDict = "amb_creature_mammal@world_wolf_howling_sitting@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
            transitions = {
                a_a = "w",
                a_b = "a",
                -- a_c = "3",
                a_d = "d",
            },
        },
    },
    animations = {
        a_a = {
            animDict = "amb_creature_mammal@world_wolf_howling_sitting@idle",
            anim = "idle_a",
            name = "Howl",
        },
        a_b = {
            animDict = "amb_creature_mammal@world_wolf_howling_sitting@idle",
            anim = "idle_b",
            name = "Look Left, Howl Right",
        },
        a_c = {
            animDict = "amb_creature_mammal@world_wolf_howling_sitting@idle",
            anim = "idle_c",
            name = "Howl",
        },
        a_d = {
            animDict = "amb_creature_mammal@world_wolf_howling_sitting@idle0",
            anim = "idle_d",
            name = "Look Right, Howl Left"
        },
    },
}

AnimLib.wolf_eating = {
    name = "Eat Carcass",
    tags = { consume=1, },
    key = "b",
    condition = function()
        return Conditions.Check({
            isWolf = true,
            isAnimal = true,
        })
    end,
    enter = {
        animDict = "amb_creature_mammal@world_wolf_eating@stand_enter",
        anim = "enter",
        blendInSpeed = 1.0,
    },
    exit = {
        animDict = "amb_creature_mammal@world_wolf_eating@stand_exit",
        anim = "exit",
    },
    idles = {
        idle_a = {
            animDict = "amb_creature_mammal@world_wolf_eating@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
            onTrigger = function(info)
                Citizen.Wait(1500)
                API.eat(10)
                return info
            end,
            transitions = {
                a_a = "g",
                a_b = "e",
                a_c = "b",
                a_ripping_wolf = "f",
            },
        },
    },
    animations = {
        a_a = {
            animDict = "amb_creature_mammal@world_wolf_eating@idle",
            anim = "idle_a",
            name = "Tear Guts"
        },
        a_b = {
            animDict = "amb_creature_mammal@world_wolf_eating@idle",
            anim = "idle_b",
            name = "Rip and Chew",
        },
        a_c = {
            animDict = "amb_creature_mammal@world_wolf_eating@idle",
            anim = "idle_c",
            name = "Big Rip",
        },
        a_ripping_wolf = {
            animDict = "amb_creature_mammal@world_wolf_eating@ripping",
            anim = "wolf_ripping_a",
            name = "Ferocious Paw",
        },
    },
}

AnimLib.wolf_eat_corpse = {
    name = "Eat Vicious",
    tags = { consume=1, },
    key = "v",
    condition = function()
        return Conditions.Check({
            isWolf = true,
            isAnimal = true,
        })
    end,
    enter = {
        animDict = "amb_creature_mammal@world_wolf_eat_corpse@stand_enter",
        anim = "enter",
        blendInSpeed = 1.0,
    },
    exit = {
        animDict = "amb_creature_mammal@world_wolf_eat_corpse@stand_exit",
        anim = "exit",
    },
    idles = {
        idle_a = {
            animDict = "amb_creature_mammal@world_wolf_eat_corpse@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
            onTrigger = function(info)
                Citizen.Wait(1500)
                API.eat(10)
                return info
            end,
            transitions = {
                a_a = "b",
                a_b = "y",
                a_c = "g",
                a_d = "q",
            },
        },
    },
    animations = {
        a_a = {
            animDict = "amb_creature_mammal@world_wolf_eat_corpse@idle",
            anim = "idle_a",
            name = "Two bites",
        },
        a_b = {
            animDict = "amb_creature_mammal@world_wolf_eat_corpse@idle",
            anim = "idle_b",
            name = "Yank",
        },
        a_c = {
            animDict = "amb_creature_mammal@world_wolf_eat_corpse@idle",
            anim = "idle_c",
            name = "Growl",
        },
        a_d = {
            animDict = "amb_creature_mammal@world_wolf_eat_corpse@idle0",
            anim = "idle_d",
            name = "Use paw",
        },
    },
}

AnimLib.wolf_howling = {
    name = "Howl",
    tags = { vocalize=1, },
    key = "h",
    condition = function()
        return Conditions.Check({
            isWolf = true,
            isAnimal = true,
        })
    end,
    enter = {
        animDict = "amb_creature_mammal@world_wolf_howling@stand_enter",
        anim = "enter",
        blendInSpeed = 1.0,
    },
    exit = {
        animDict = "amb_creature_mammal@world_wolf_howling@stand_exit",
        anim = "exit",
    },
    idles = {
        idle_a = {
            animDict = "amb_creature_mammal@world_wolf_howling@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
            transitions = {
                a_a = "a",
                a_b = "d",
                a_c = "e",
                a_d = "w",
                a_e = "q",
            },
        },
    },
    animations = {
        a_a = {
            animDict = "amb_creature_mammal@world_wolf_howling@idle",
            anim = "idle_a",
            name = "Left",
        },
        a_b = {
            animDict = "amb_creature_mammal@world_wolf_howling@idle",
            anim = "idle_b",
            name = "Right",
        },
        a_c = {
            animDict = "amb_creature_mammal@world_wolf_howling@idle",
            anim = "idle_c",
            name = "Look Left, Howl Right",
        },
        a_d = {
            animDict = "amb_creature_mammal@world_wolf_howling@idle0",
            anim = "idle_d",
            name = "Front",
        },
        a_e = {
            animDict = "amb_creature_mammal@world_wolf_howling@idle0",
            anim = "idle_e",
            name = "Look Right, Howl Left",
        },
    },
}

AnimLib.wolf_mark_territory = {
    name = "Smelling",
    tags = { environment=1, },
    key = "s",
    condition = function()
        return Conditions.Check({
            isWolf = true,
            isAnimal = true,
        })
    end,
    enter = {
        animDict = "amb_creature_mammal@world_wolf_mark_territory@stand_enter",
        anim = "enter",
        blendInSpeed = 1.0,
    },
    exit = {
        animDict = "amb_creature_mammal@world_wolf_mark_territory@stand_exit",
        anim = "exit_left",
        duration = 300,
    },
    idles = {
        idle_a = {
            animDict = "amb_creature_mammal@world_wolf_mark_territory@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
            transitions = {
                a_a = "q",
                a_b = "a",
                a_c = "z",
            },
        },
    },
    animations = {
        a_a = {
            animDict = "amb_creature_mammal@world_wolf_mark_territory@idle",
            anim = "idle_a",
            name = "High",
        },
        a_b = {
            animDict = "amb_creature_mammal@world_wolf_mark_territory@idle",
            anim = "idle_b",
            name = "Middle",
        },
        a_c = {
            animDict = "amb_creature_mammal@world_wolf_mark_territory@idle",
            anim = "idle_c",
            name = "Low",
        },
    },
}

AnimLib.wolf_sleeping = { -- TODO names
    name = "Sleep",
    tags = { rest=1, },
    key = "s",
    condition = function()
        return Conditions.Check({
            isWolf = true,
            isAnimal = true,
        })
    end,
    enter = {
        animDict = "amb_creature_mammal@world_wolf_sleeping@stand_enter",
        anim = "enter",
        blendInSpeed = 1.0,
    },
    exit = {
        animDict = "amb_creature_mammal@world_wolf_sleeping@stand_exit",
        anim = "exit",
    },
    idles = {
        idle_a = {
            animDict = "amb_creature_mammal@world_wolf_sleeping@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
            transitions = {
                a_a = "1",
                a_b = "2",
                a_c = "3",
            },
        },
    },
    animations = {
        a_a = {
            animDict = "amb_creature_mammal@world_wolf_sleeping@idle",
            anim = "idle_a",
        },
        a_b = {
            animDict = "amb_creature_mammal@world_wolf_sleeping@idle",
            anim = "idle_b",
        },
        a_c = {
            animDict = "amb_creature_mammal@world_wolf_sleeping@idle",
            anim = "idle_c",
        },
    },
}

AnimLib.wolf_resting = {
    name = "Rest",
    tags = { rest=1, },
    key = "r",
    condition = function()
        return Conditions.Check({
            isWolf = true,
            isAnimal = true,
        })
    end,
    enter = {
        animDict = "amb_creature_mammal@world_wolf_resting@stand_enter",
        anim = "enter",
        blendInSpeed = 1.0,
    },
    exit = {
        animDict = "amb_creature_mammal@world_wolf_resting@stand_exit",
        anim = "exit",
    },
    idles = {
        idle_a = {
            animDict = "amb_creature_mammal@world_wolf_resting@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
            transitions = {
                a_a = "1",
                a_b = "2",
                a_c = "3",
            },
        },
    },
    animations = {
        a_a = {
            animDict = "amb_creature_mammal@world_wolf_resting@idle",
            anim = "idle_a",
        },
        a_b = {
            animDict = "amb_creature_mammal@world_wolf_resting@idle",
            anim = "idle_b",
        },
        a_c = {
            animDict = "amb_creature_mammal@world_wolf_resting@idle",
            anim = "idle_c",
        },
    },
}
