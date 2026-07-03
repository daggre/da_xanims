--- Copyright © 2024 Joshua Nelson

-- TODO add cat anims
-- creatures_mammal@cat
-- creatures@cat
-- script_amb@animal@cat

AnimLib.big_cat_drinking = {
    name = "Drink",
    tags = { consume=1, },
    key = "w",
    condition = function()
        return Conditions.Check({
            isAnimal = true,
        })
    end,
    enter = {
        animDict = "amb_creature_mammal@world_big_cat_drinking@stand_enter",
        anim = "enter",
        next = "idle_a",
    },
    exit = {
        animDict = "amb_creature_mammal@world_big_cat_drinking@stand_exit",
        anim = "exit",
    },
    idles = {
        idle_a = {
            animDict = "amb_creature_mammal@world_big_cat_drinking@base",
            anim = "base",
            onTrigger = function(info)
                API.eat(10)
                print("Drinking...")
            end,
            transitions = {
                a_a = "a",
                a_b = "b",
            },
        },
    },
    animations = {
        a_a = {
            animDict = "amb_creature_mammal@world_big_cat_drinking@idle_a",
            anim = "idle_a",
            name = "Look Left",
        },
        a_b = {
            animDict = "amb_creature_mammal@world_big_cat_drinking@idle_a",
            anim = "idle_b",
            name = "Look Right Snarl",
        },
    },
}
