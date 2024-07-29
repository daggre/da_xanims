--- Copyright © 2024 Joshua Nelson

allow = "allow"

AnimMenu = {}
AnimMenu.root = {
    submenu = {
        dance = {
            key = "1"
        },
        gesture = {
            key = "a",
            condition = function() return Conditions.Check({
                onMount = allow,
                hasWeapon = allow,
                hasPrimaryWeapon = allow,
                hasSecondaryWeapon = allow,
            }) end,
            submenu = {
                rock_paper_scissors = { key = "m", conditions = function() return Conditions.Check({ onMount = allow, }) end, },
                react = { key = "r", condition = function() return Conditions.Check({ onMount = allow, }) end, },
                talk_negative = { key = "d", condition = function() return Conditions.Check({ onMount = allow, }) end, },
                talk_positive = { key = "a", condition = function() return Conditions.Check({ onMount = allow, }) end, },
                greet = { key = "g", condition = function() return Conditions.Check({ onMount = allow, }) end, },
                wave = { key = "w", condition = function() return Conditions.Check({ onMount = allow, }) end, },
                salute = { key = "s", condition = function() return Conditions.Check({ onMount = allow, }) end, },
                signal_left = { key = "z", condition = function() return Conditions.Check({ onMount = allow, }) end, },
                signal_right = {
                    key = "x",
                    condition = function() return Conditions.Check({
                        onMount = allow,
                        hasWeapon = allow,
                        hasPrimaryWeapon = allow,
                        hasSecondaryWeapon = allow,
                    }) end,
                },
            },
        },
        lean = {
            key = "q",
            submenu = {
                lean_right = { key = "d", },
                lean_left = { key = "a", },
                lean_front = { key = "w", },
                lean_back = { key = "s", },
            },
        },
        medical = {
            key = "m",
            submenu = {
                injured = { key = "i", }
            }
        },
        smoke = {
            key = "p",
            condition = function() return Conditions.Check({ hasSmoke = true, }) end,
            submenu = {
                cigarette = {
                    key = "s",
                    condition = function() return Conditions.Check({ hasAnyCig = true, }) end,
                },
                cigar = {
                    key = "g",
                    condition = function() return Conditions.Check({ hasCigar = true, }) end,
                },
                pipe = { --pipe
                    key = "p",
                    condition = function() return Conditions.Check({ hasPipe = true, hasPipeTobacco = true, }) end,
                },
            },
        },
        squat = {
            key = "e",
            condition = function() return Conditions.Check({
                hasWeapon = allow,
                hasPrimaryWeapon = allow,
                hasSecondaryWeapon = allow,
            }) end
        },
        music = {
            key = "g",
            condition = function() return Conditions.Check({
                onMount = allow,
                isRunning = false,
            }) end,
        },
        stand = {
            key = "s",
            submenu = {
            },
        },
        sit =   {
            key = "t",
        },
        work = {
            key = "w",
            submenu = {
                fire = { key = "f", },
            },
        },
        hostage = {
            key = "h",
            condition = function() return Conditions.Check({
                onMount = allow,
            }) end,
        },
        horseback = {
            key = "b",
            condition = function() return Conditions.Check({
                onMount = true,
            }) end,
        },
        ["food_&_drink"] = {
            key = "f",
            condition = function() return Conditions.Check({
                onMount = allow,
                isRunning = false,
            }) end,
        },
        weapon = {
            key = "w",
            condition = function() return Conditions.Check({
                hasWeapon = true,
                hasPrimaryWeapon = true,
                hasSecondaryWeapon = false,
            }) end
        },
        -- Animals
        consume = {
            key = "f",
            condition = function() return Conditions.Check({ isAnimal = true, isSwimming = allow, }) end,
        },
        rest = {
            key = "s",
            condition = function() return Conditions.Check({ isAnimal = true, isSwimming = allow, }) end,
        },
        environment = {
            key = "e",
            condition = function() return Conditions.Check({ isAnimal = true, isSwimming = allow, }) end,
        },
        play = {
            key = "a",
            condition = function() return Conditions.Check({ isAnimal = true, isSwimming = allow, }) end,
        },
        vocalize = {
            key = "v",
            condition = function() return Conditions.Check({ isAnimal = true, isSwimming = allow, }) end,
        },
    },
    condition = function() return Conditions.Check({
        isDead = false,
        isAnimal = allow,
        onMount = allow,
        hasWeapon = allow,
        hasSecondaryWeapon = allow,
    }) end
}
