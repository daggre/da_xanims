--- Copyright © 2024 Joshua Nelson

AnimLib.dog_eat_ground = {
    name = "Eat Kibble",
    tags = { consume=1, },
    key = "e",
    condition = function()
        return Conditions.Check({
            isDog = true,
            isAnimal = true,
        })
    end,
    enter = {
        animDict = "amb_creature_mammal@world_dog_eating_ground@stand_enter",
        anim = "enter",
        blendInSpeed = 1.0,
    },
    exit = {
        animDict = "amb_creature_mammal@world_dog_eating_ground@stand_exit",
        anim = "exit",
        duration = 1000,
    },
    idles = {
        idle_a = {
            animDict = "amb_creature_mammal@world_dog_eating_ground@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
            onTrigger = function(info)
                Citizen.Wait(1500)
                API.eat(20)
                return info
            end,
            transitions = {
                a_a = "g",
                a_b = "h",
                a_c = "s",
            },
        },
    },
    animations = {
        a_a = {
            animDict = "amb_creature_mammal@world_dog_eating_ground@idle_a",
            anim = "idle_a",
            name = "Nibble On Ground",
        },
        a_b = {
            animDict = "amb_creature_mammal@world_dog_eating_ground@idle_a",
            anim = "idle_b",
            name = "Nibble and Chomp",
        },
        a_c = {
            animDict = "amb_creature_mammal@world_dog_eating_ground@idle_a",
            anim = "idle_c",
            name = "Swallow a Bite",
        },
    },
}

AnimLib.dog_roll_ground = {
    name = "Roll On Ground",
    tags = { play=1, },
    key = "r",
    condition = function()
        return Conditions.Check({
            isDog = true,
            isAnimal = true,
        })
    end,
    enter = {
        animDict = "amb_creature_mammal@world_dog_roll_ground@stand_enter",
        anim = "enter",
        blendInSpeed = 1.0,
    },
    exit = {
        animDict = "amb_creature_mammal@world_dog_roll_ground@stand_exit",
        anim = "exit",
    },
    idles = {
        idle_a = {
            animDict = "amb_creature_mammal@world_dog_roll_ground@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
            transitions = {
                a_a = "r",
                a_b = "f",
                a_c = "b",
            },
        },
    },
    animations = {
        a_a = {
            animDict = "amb_creature_mammal@world_dog_roll_ground@idle",
            anim = "idle_a",
            name = "Roll Over",
        },
        a_b = {
            animDict = "amb_creature_mammal@world_dog_roll_ground@idle",
            anim = "idle_b",
            name = "Rub Face",
        },
        a_c = {
            animDict = "amb_creature_mammal@world_dog_roll_ground@idle",
            anim = "idle_c",
            name = "Itch Back",
        },
    },
}

AnimLib.dog_sitting = {
    name = "Sit",
    tags = { rest=1, },
    key = "z",
    condition = function()
        return Conditions.Check({
            isDog = true,
            isAnimal = true,
        })
    end,
    enter = {
        animDict = "amb_creature_mammal@world_dog_sitting@stand_enter",
        anim = "enter",
        blendInSpeed = 1.0,
    },
    exit = {
        animDict = "amb_creature_mammal@world_dog_sitting@stand_exit",
        anim = "exit",
        duration = 600,
    },
    idles = {
        idle_a = {
            animDict = "amb_creature_mammal@world_dog_sitting@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
            transitions = {
                a_a = "y",
                a_b = "s",
                a_c = "w",
            },
        },
    },
    animations = {
        a_a = {
            animDict = "amb_creature_mammal@world_dog_sitting@idle",
            anim = "idle_a",
            name = "Yawn",
        },
        a_b = {
            animDict = "amb_creature_mammal@world_dog_sitting@idle",
            anim = "idle_b",
            name = "Sniff",
        },
        a_c = {
            animDict = "amb_creature_mammal@world_dog_sitting@idle",
            anim = "idle_c",
            name = "Whine",
        },
    },
}

AnimLib.dog_resting = {
    name = "Rest",
    tags = { rest=1, },
    key = "r",
    condition = function()
        return Conditions.Check({
            isDog = true,
            isWolf = false,
            isAnimal = true,
        })
    end,
    enter = {
        animDict = "amb_creature_mammal@world_dog_resting@stand_enter",
        anim = "enter_front",
        blendInSpeed = 1.0,
    },
    exit = {
        animDict = "amb_creature_mammal@world_dog_resting@stand_exit",
        anim = "exit_front",
    },
    idles = {
        idle_a = {
            animDict = "amb_creature_mammal@world_dog_resting@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
            transitions = {
                a_a = "a",
                a_b = "d",
                -- a_c = "t",
                trans_resting_sleeping = "s",
            },
        },
    },
    animations = {
        a_a = {
            animDict = "amb_creature_mammal@world_dog_resting@idle",
            anim = "idle_a",
            name = "Glance Left",
        },
        a_b = {
            animDict = "amb_creature_mammal@world_dog_resting@idle",
            anim = "idle_b",
            name = "Look Right",
        },
        a_c = {
            animDict = "amb_creature_mammal@world_dog_resting@idle",
            anim = "idle_c",
            name = "Do a Think?"
        },
        trans_resting_sleeping = {
            animDict = "amb_creature_mammal@world_dog_resting@trans",
            anim = "resting_trans_sleeping",
            animLibName = "dog_sleeping",
            next = "idle_a",
            name = "Go To Sleep"
        },
    },
}

AnimLib.dog_sleeping = {
    name = "Sleep",
    tags = { rest=1, },
    key = "s",
    condition = function()
        return Conditions.Check({
            isDog = true,
            isWolf = false,
            isAnimal = true,
        })
    end,
    enter = {
        animDict = "amb_creature_mammal@world_dog_sleeping@stand_enter",
        anim = "enter_front_stretch",
        blendInSpeed = 1.0,
    },
    exit = {
        animDict = "amb_creature_mammal@world_dog_sleeping@stand_exit",
        anim = "exit_front_stretch",
    },
    idles = {
        idle_a = {
            animDict = "amb_creature_mammal@world_dog_sleeping@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
            transitions = {
                -- a_a = "1",
                -- a_b = "2",
                a_c = "d",
                trans_sleeping_resting = "r",
            },
        },
    },
    animations = {
        a_a = {
            animDict = "amb_creature_mammal@world_dog_sleeping@idle",
            anim = "idle_a",
        },
        a_b = {
            animDict = "amb_creature_mammal@world_dog_sleeping@idle",
            anim = "idle_b",
        },
        a_c = {
            animDict = "amb_creature_mammal@world_dog_sleeping@idle",
            anim = "idle_c",
            name = "Adjust Head Right",
        },
        trans_sleeping_resting = {
            animDict = "amb_creature_mammal@world_dog_sleeping@trans",
            anim = "sleeping_trans_resting",
            animLibName = "dog_resting",
            next = "idle_a",
            name = "Wake Up",
        },
    },
}

AnimLib.dog_digging = {
    name = "Dig",
    tags = { environment=1, },
    key = "d",
    condition = function()
        return Conditions.Check({
            isDog = true,
            isAnimal = true,
        })
    end,
    enter = {
        animDict = "amb_creature_mammal@world_dog_digging@stand_enter",
        anim = "enter",
        blendInSpeed = 1.0,
    },
    exit = {
        animDict = "amb_creature_mammal@world_dog_digging@stand_exit",
        anim = "exit",
    },
    idles = {
        idle_a = {
            animDict = "amb_creature_mammal@world_dog_digging@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
            transitions = {
                a_a = "2",
                a_b = "d",
                a_c = "s",
            },
        },
    },
    animations = {
        a_a = {
            animDict = "amb_creature_mammal@world_dog_digging@idle",
            anim = "idle_a",
            name = "Two Paws At Once",
        },
        a_b = {
            animDict = "amb_creature_mammal@world_dog_digging@idle",
            anim = "idle_b",
            name = "Dig Dig Dig!"
        },
        a_c = {
            animDict = "amb_creature_mammal@world_dog_digging@idle",
            anim = "idle_c",
            name = "Smell It"
        },
    },
}

AnimLib.dog_drinking = {
    name = "Drink",
    tags = { consume=1, },
    key = "d",
    condition = function()
        return Conditions.Check({
            isDog = true,
            isAnimal = true,
        })
    end,
    enter = {
        animDict = "amb_creature_mammal@world_dog_drink_ground@stand_enter",
        anim = "enter",
        blendInSpeed = 1.0,
    },
    exit = {
        animDict = "amb_creature_mammal@world_dog_drink_ground@stand_exit",
        anim = "exit",
        duration = 2200,
    },
    idles = {
        idle_a = {
            animDict = "amb_creature_mammal@world_dog_drink_ground@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
            onTrigger = function(info)
                Citizen.Wait(2500)
                if IsEntityInWater(info.ped) then API.drink(); end
                return info
            end,
        },
    },
    animations = {
        a_a = {
            animDict = "amb_creature_mammal@world_dog_drink_ground@idle",
            anim = "idle_a",
        },
        a_b = {
            animDict = "amb_creature_mammal@world_dog_drink_ground@idle",
            anim = "idle_b",
        },
    },
}
