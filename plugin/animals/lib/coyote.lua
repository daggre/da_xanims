--- Copyright © 2024 Joshua Nelson

AnimLib.coyote_eating_ground = {
    name = "Eat Meat",
    tags = { consume=1, },
    key = "e",
    condition = function()
        return Conditions.Check({
            isDog = true,
            isAnimal = true,
        })
    end,
    enter = {
        animDict = "amb_creature_mammal@world_coyote_eating_ground@stand_enter",
        anim = "enter_front",
        blendInSpeed = 1.0,
        next = "idle_a",
    },
    exit = {
        animDict = "amb_creature_mammal@world_coyote_eating_ground@stand_exit",
        anim = "exit_front",
        duration = 1500,
    },
    idles = {
        idle_a = {
            animDict = "amb_creature_mammal@world_coyote_eating_ground@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
            name = "Eat Meat",
            onTrigger = function(info)
                Citizen.Wait(1500)
                API.eat(10)
                return info
            end,
            transitions = {
                a_a = "z",
                a_b = "t",
                a_c = "s",
                idle_front = "w",
                idle_left = "a",
                idle_right = "d",
                idle_backright = "r",
                idle_backleft = "q",
            },
        },
        idle_front = {
            animDict = "amb_creature_mammal@world_coyote_eating_ground@react_look@loop",
            anim = "front_loop",
            flag = AnimConfig.Flag.Loop,
            blendInSpeed = 1.0,
            transitions = {
                front_exit = "e",
                idle_left = "a",
                idle_right = "d",
                idle_backright = "r",
                idle_backleft = "q",
            },
            name = "Look Front",
        },
        idle_left = {
            animDict = "amb_creature_mammal@world_coyote_eating_ground@react_look@loop",
            anim = "left_loop",
            flag = AnimConfig.Flag.Loop,
            blendInSpeed = 1.0,
            transitions = {
                idle_front = "w",
                left_exit = "e",
                idle_right = "d",
                idle_backright = "r",
                idle_backleft = "q",
            },
            name = "Look Left",
        },
        idle_right = {
            animDict = "amb_creature_mammal@world_coyote_eating_ground@react_look@loop",
            anim = "right_loop",
            flag = AnimConfig.Flag.Loop,
            blendInSpeed = 1.0,
            transitions = {
                idle_front = "w",
                idle_left = "a",
                right_exit = "e",
                idle_backright = "r",
                idle_backleft = "q",
            },
            name = "Look Right",
        },
        idle_backright = {
            animDict = "amb_creature_mammal@world_coyote_eating_ground@react_look@loop",
            anim = "backright_loop",
            flag = AnimConfig.Flag.Loop,
            blendInSpeed = 1.0,
            transitions = {
                idle_front = "w",
                idle_left = "a",
                idle_right = "d",
                backright_exit = "e",
                idle_backleft = "q",
            },
            name = "Look Back Right",
        },
        idle_backleft = {
            animDict = "amb_creature_mammal@world_coyote_eating_ground@react_look@loop",
            anim = "backleft_loop",
            flag = AnimConfig.Flag.Loop,
            blendInSpeed = 1.0,
            transitions = {
                idle_front = "w",
                idle_left = "a",
                idle_right = "d",
                idle_backright = "r",
                backleft_exit = "e",
            },
            name = "Look Back Left",
        },
    },
    animations = {
        a_a = {
            animDict = "amb_creature_mammal@world_coyote_eating_ground@idle",
            anim = "idle_a",
            next = "idle_a",
            name = "Chew",
        },
        a_b = {
            animDict = "amb_creature_mammal@world_coyote_eating_ground@idle",
            anim = "idle_b",
            next = "idle_a",
            name = "Tear Carcass",
        },
        a_c = {
            animDict = "amb_creature_mammal@world_coyote_eating_ground@idle",
            anim = "idle_c",
            next = "idle_a",
            name = "Chew, Squat, Growl",
        },
        front_enter = {
            animDict = "amb_creature_mammal@world_coyote_eating_ground@react_look@enter",
            anim = "front_enter",
            next = "idle_front",
            name = "Look Front",
        },
        front_exit = {
            animDict = "amb_creature_mammal@world_coyote_eating_ground@react_look@exit",
            anim = "front_exit",
            next = "idle_a",
            name = "Eat Carcass",
        },
        left_enter = {
            animDict = "amb_creature_mammal@world_coyote_eating_ground@react_look@enter",
            anim = "left_enter",
            next = "idle_left",
            name = "Look Left",
        },
        left_exit = {
            animDict = "amb_creature_mammal@world_coyote_eating_ground@react_look@exit",
            anim = "left_exit",
            next = "idle_a",
            name = "Eat Carcass",
        },
        right_enter = {
            animDict = "amb_creature_mammal@world_coyote_eating_ground@react_look@enter",
            anim = "right_enter",
            next = "idle_right",
            name = "Look Right",
        },
        right_exit = {
            animDict = "amb_creature_mammal@world_coyote_eating_ground@react_look@exit",
            anim = "right_exit",
            next = "idle_a",
            name = "Eat Carcass",
        },
        backleft_enter = {
            animDict = "amb_creature_mammal@world_coyote_eating_ground@react_look@enter",
            anim = "backleft_enter",
            next = "idle_backleft",
            name = "Look Back Left",
        },
        backleft_exit = {
            animDict = "amb_creature_mammal@world_coyote_eating_ground@react_look@exit",
            anim = "backleft_exit",
            next = "idle_a",
            name = "Eat Carcass",
        },
        backright_enter = {
            animDict = "amb_creature_mammal@world_coyote_eating_ground@react_look@enter",
            anim = "backright_enter",
            next = "idle_backright",
            name = "Look Back Right",
        },
        backright_exit = {
            animDict = "amb_creature_mammal@world_coyote_eating_ground@react_look@exit",
            anim = "backright_exit",
            next = "idle_a",
            name = "Eat Carcass",
        },
    },
}

AnimLib.coyote_howl = {
    name = "Howl Standing",
    tags = { vocalize=1, },
    key = "h",
    condition = function()
        return Conditions.Check({
            isCoyote = true,
            isAnimal = true,
        })
    end,
    enter = {
        animDict = "amb_creature_mammal@world_coyote_howling@stand_enter",
        anim = "enter",
        blendInSpeed = 1.0,
    },
    exit = {
        animDict = "amb_creature_mammal@world_coyote_howling@stand_exit",
        anim = "exit",
        duration = 200,
    },
    idles = {
        idle_a = {
            animDict = "amb_creature_mammal@world_coyote_howling@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
            transitions = {
                a_a = "a",
                a_b = "d",
                a_c = "e",
                a_d = "q",
                a_e = "w",
            },
        },
    },
    animations = {
        a_a = {
            animDict = "amb_creature_mammal@world_coyote_howling@idle",
            anim = "idle_a",
            name = "Howl Left Up",
        },
        a_b = {
            animDict = "amb_creature_mammal@world_coyote_howling@idle",
            anim = "idle_b",
            name = "Howl Up Right",
        },
        a_c = {
            animDict = "amb_creature_mammal@world_coyote_howling@idle",
            anim = "idle_c",
            name = "Look Left, Howl Up Right",
        },
        a_d = {
            animDict = "amb_creature_mammal@world_coyote_howling@idle0",
            anim = "idle_d",
            name = "Howl Up Left"
        },
        a_e = {
            animDict = "amb_creature_mammal@world_coyote_howling@idle0",
            anim = "idle_e",
            name = "Front Then Left Up"
        },
    },
}

AnimLib.coyote_howl_sitting = {
    name = "Howl Sitting",
    tags = { vocalize=1, },
    key = "z",
    condition = function()
        return Conditions.Check({
            isCoyote = true,
            isAnimal = true,
        })
    end,
    enter = {
        animDict = "amb_creature_mammal@world_coyote_howling_sitting@stand_enter",
        anim = "enter",
        blendInSpeed = 1.0,
    },
    exit = {
        animDict = "amb_creature_mammal@world_coyote_howling_sitting@stand_exit",
        anim = "exit",
        duration = 500,
    },
    idles = {
        idle_a = {
            animDict = "amb_creature_mammal@world_coyote_howling_sitting@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
            transitions = {
                a_a = "h",
                a_b = "a",
                a_c = "d",
                a_d = "w",
            },
        },
    },
    animations = {
        a_a = {
            animDict = "amb_creature_mammal@world_coyote_howling_sitting@idle",
            anim = "idle_a",
            name = "Howl Up Forward",
        },
        a_b = {
            animDict = "amb_creature_mammal@world_coyote_howling_sitting@idle",
            anim = "idle_b",
            name = "Glance Left, Howl",
        },
        a_c = {
            animDict = "amb_creature_mammal@world_coyote_howling_sitting@idle",
            anim = "idle_c",
            name = "Up Slight Right",
        },
        a_d = {
            animDict = "amb_creature_mammal@world_coyote_howling_sitting@idle0",
            anim = "idle_d",
            name = "Front, Long Up Left",
        },
    },
}
