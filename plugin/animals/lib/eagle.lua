AnimLib.eagle_drink = {
    name = "Drink",
    tags = { consume=1, },
    key = "d",
    condition = function() return Conditions.Check({ isAnimal = true, isRaptor = true, isSwimming = allow, }) end,
    enter = {
        animDict = "amb_creatures_bird@world_eagle_drink_ground@stand_enter",
        anim = "enter",
        blendInSpeed = 1.0,
    },
    exit = {
        animDict = "amb_creatures_bird@world_eagle_drink_ground@stand_exit",
        anim = "exit",
    },
    idles = {
        idle_a = {
            animDict = "amb_creatures_bird@world_eagle_drink_ground@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
            onTrigger = function(info)
                Citizen.Wait(2500)
                if IsEntityInWater(info.ped) then API.drink(); end
                return info
            end,
            transitions = {
                a_a = "1",
            },
        },
    },
    animations = {
        a_a = {
            animDict = "amb_creatures_bird@world_eagle_drink_ground@idle",
            anim = "idle_a",
            name = "Look Around Drink",
        },
    },
}

AnimLib.eagle_eat = {
    name = "Eat",
    tags = { consume=1 },
    key = "e",
    condition = function() return Conditions.Check({ isAnimal = true, isRaptor = true, isSwimming = allow, }) end,
    enter = {
        animDict = "amb_creatures_bird@world_eagle_eating_ground@stand_enter",
        anim = "enter",
        blendInSpeed = 1.0,
    },
    exit = {
        animDict = "amb_creatures_bird@world_eagle_eating_ground@stand_exit",
        anim = "exit",
    },
    idles = {
        idle_a = {
            animDict = "amb_creatures_bird@world_eagle_eating_ground@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
            onTrigger = function(info)
                Citizen.Wait(1500)
                API.eat(10)
                return info
            end,
            transitions = {
                a_a = "e",
                a_b = "b",
                a_c = "t",
            },
        },
    },
    animations = {
        a_a = {
            animDict = "amb_creatures_bird@world_eagle_eating_ground@idle",
            anim = "idle_a",
            name = "Long Chomps",
        },
        a_b = {
            animDict = "amb_creatures_bird@world_eagle_eating_ground@idle",
            anim = "idle_b",
            name = "Quick Bite",
        },
        a_c = {
            animDict = "amb_creatures_bird@world_eagle_eating_ground@idle",
            anim = "idle_c",
            name = "Tear",
        },
    },
}

AnimLib.eagle_perch = {
    name = "Perch",
    tags = { environment=1 },
    key = "q",
    condition = function() return Conditions.Check({ isAnimal = true, isEagle = true, }) end,
    enter = {
        animDict = "amb_creatures_bird@world_eagle_on_perch@base",
        anim = "base",
        blendInSpeed = 0.6,
        duration = 1000,
    },
    exit = {
        animDict = "amb_creatures_bird@world_eagle_on_perch@base",
        anim = "base",
        duration = 100,
    },
    idles = {
        idle_a = {
            animDict = "amb_creatures_bird@world_eagle_on_perch@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
            transitions = {
                a_a = "a",
                a_b = "s",
            },
        },
    },
    animations = {
        a_a = {
            animDict = "amb_creatures_bird@world_eagle_on_perch@idle",
            anim = "idle_a",
            name = "Look Around",
        },
        a_b = {
            animDict = "amb_creatures_bird@world_eagle_on_perch@idle",
            anim = "idle_b",
            name = "Shake Head",
        },
    },
}

