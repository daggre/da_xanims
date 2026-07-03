AnimLib.chicken_flap = {
    name = "Flap",
    tags = { play=1 },
    key = "f",
    condition = function()
        return Conditions.Check({
            isChicken = true,
            isAnimal = true,
            isSprinting = allow,
        })
    end,
    enter = {
        animDict = "creatures_bird@chicken@reaction@canter",
        anim = "start_fwd_0",
        blendInSpeed = 1.0,
        next = "flap",
        duration = 700,
    },
    exit = {
        animDict = "creatures_bird@chicken@normal@canter",
        anim = "stop_r",
        duration = 50,
    },
    animations = {
        flap = {
            animDict = "creatures_bird@chicken@normal@canter",
            anim = "move",
            name = "Flap",
            flag = AnimConfig.Flag.Move,
            next = "exit",
            duration = 230,
            changeCore = { Stamina = -25 },
        },
    }
}

AnimLib.chicken_sleep = {
    name = "Sleep",
    tags = { rest=1 },
    key = "s",
    condition = function()
        return Conditions.Check({
            isChicken = true,
            isAnimal = true,
        })
    end,
    enter = {
        animDict = "amb_creatures_bird@world_chicken_sleeping@stand_enter",
        anim = "enter",
        blendInSpeed = 1.0,
    },
    exit = {
        animDict = "amb_creatures_bird@world_chicken_sleeping@stand_exit",
        anim = "exit",
        duration = 200,
    },
    idles = {
        idle_a = {
            animDict = "amb_creatures_bird@world_chicken_sleeping@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
            transitions = {
                a_a = "w",
            },
        },
    },
    animations = {
        a_a = {
            animDict = "amb_creatures_bird@world_chicken_sleeping@idle_a",
            anim = "idle_a",
            name = "Wiggle",
        },
    },
}

AnimLib.chicken_rest = {
    name = "Rest",
    tags = { rest=1 },
    key = "r",
    condition = function()
        return Conditions.Check({
            isChicken = true,
            isAnimal = true,
        })
    end,
    enter = {
        animDict = "amb_creatures_bird@world_chicken_resting@stand_enter",
        anim = "enter",
        blendInSpeed = 1.0,
    },
    exit = {
        animDict = "amb_creatures_bird@world_chicken_resting@stand_exit",
        anim = "exit",
        duration = 200,
    },
    idles = {
        idle_a = {
            animDict = "amb_creatures_bird@world_chicken_resting@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
            transitions = {
                a_a = "z",
                a_b = "q",
                a_c = "a",

            },
        },
    },
    animations = {
        a_a = {
            animDict = "amb_creatures_bird@world_chicken_resting@idle_a",
            anim = "idle_a",
            name = "Look Left",
        },
        a_b = {
            animDict = "amb_creatures_bird@world_chicken_resting@idle_a",
            anim = "idle_b",
            name = "Look Around Quick",
        },
        a_c = {
            animDict = "amb_creatures_bird@world_chicken_resting@idle_a",
            name = "Look Around",
            anim = "idle_c",
        },
    },
}

AnimLib.chicken_eat = {
    name = "Eat",
    tags = { consume=1 },
    key = "e",
    condition = function()
        return Conditions.Check({
            isChicken = true,
            isAnimal = true,
        })
    end,
    enter = {
        animDict = "amb_creatures_bird@world_chicken_eating@stand_enter",
        anim = "enter",
        blendInSpeed = 1.0,
    },
    exit = {
        animDict = "amb_creatures_bird@world_chicken_eating@stand_exit",
        anim = "exit",
        duration = 200,
    },
    idles = {
        idle_a = {
            animDict = "amb_creatures_bird@world_chicken_eating@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
            transitions = {
                a_a = "q",
                wander_a = "1",
                a_b = "w",
                wander_b = "2",
                wander_c = "3",

            },
        },
    },
    animations = {
        a_a = {
            animDict = "amb_creatures_bird@world_chicken_eating@idle",
            anim = "idle_a",
            name = "Peck Reach",
            onTrigger = function(info)
                Citizen.Wait(1500)
                API.eat(5)
                return info
            end,
        },
        a_b = {
            animDict = "amb_creatures_bird@world_chicken_eating@idle",
            anim = "idle_b",
            name = "Peck Slow",
            onTrigger = function(info)
                Citizen.Wait(1500)
                API.eat(5)
                return info
            end,
        },
        wander_a = {
            animDict = "amb_creatures_bird@world_chicken_eating@wander",
            anim = "wander_a",
            name = "Walk and Eat",
            onTrigger = function(info)
                Citizen.Wait(1500)
                API.eat(5)
                return info
            end,
        },
        wander_b = {
            animDict = "amb_creatures_bird@world_chicken_eating@wander",
            anim = "wander_b",
            name = "Walk and Eat B",
            onTrigger = function(info)
                Citizen.Wait(1500)
                API.eat(5)
                return info
            end,
        },
        wander_c = {
            animDict = "amb_creatures_bird@world_chicken_eating@wander",
            anim = "wander_c",
            name = "Walk and Eat C",
            onTrigger = function(info)
                Citizen.Wait(1500)
                API.eat(5)
                return info
            end,
        },
    },
}

AnimLib.chicken_drink = {
    name = "Drink",
    tags = { consume=1, },
    key = "d",
    condition = function()
        return Conditions.Check({
            isChicken = true,
            isAnimal = true,
            isSwimming = allow,
        })
    end,
    enter = {
        animDict = "amb_creatures_bird@world_chicken_eating@stand_enter",
        anim = "enter",
        blendInSpeed = 1.0,
        next = "a_a",
    },
    exit = {
        animDict = "amb_creatures_bird@world_chicken_eating@stand_exit",
        anim = "exit",
        duration = 200,
    },
    idles = {
        idle_a = {
            animDict = "amb_creatures_bird@world_chicken_eating@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
            transitions = {
                a_a = "q",
                a_b = "w",

            },
        },
    },
    animations = {
        a_a = {
            animDict = "amb_creatures_bird@world_chicken_eating@idle",
            anim = "idle_a",
            name = "Drink Reach",
            onTrigger = function(info)
                Citizen.Wait(1500)
                if IsEntityInWater(info.ped) then API.drink(); end
                return info
            end,
        },
        a_b = {
            animDict = "amb_creatures_bird@world_chicken_eating@idle",
            anim = "idle_b",
            name = "Drink Slow",
            onTrigger = function(info)
                Citizen.Wait(1500)
                if IsEntityInWater(info.ped) then API.drink(); end
                return info
            end,
        },
    }
}
