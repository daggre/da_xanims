AnimLib.raccoon_eating = {
    name = "Eat",
    tags = { consume = 1, },
    key = "e",
    condition = function() return Conditions.Check({ isAnimal = true, isRaccoon = true, }) end,
    enter = {
        animDict = "amb_creature_mammal@world_raccoon_eating_ground@stand_enter",
        anim = "enter",
        blendInSpeed = 1.0,
    },
    exit = {
        animDict = "amb_creature_mammal@world_raccoon_eating_ground@stand_exit",
        anim = "exit",
    },
    idles = {
        idle_a = {
            animDict = "amb_creature_mammal@world_raccoon_eating_ground@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
            onTrigger = function(info)
                Citizen.Wait(1500)
                API.eat(10)
                return info
            end,
            transitions = {
                a_a = "1",
            },
        },
    },
    animations = {
        a_a = {
            animDict = "amb_creature_mammal@world_raccoon_eating_ground@idle",
            anim = "idle_a",
            name = "Chomp",
        },
    },
}
