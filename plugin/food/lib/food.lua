--- Copyright © 2024 Joshua Nelson

AnimLib.eat_apple = {
    name = "Eat Apple",
    tags = { ["food_&_drink"]=1, },
    key = "a",
    triggerCondition = function() return Conditions.Check({ hasApple = true, }) end,
    enter = {
        animDict = "amb_misc@world_human_eat_apple@male_a@enter",
        anim = "enter",
        flag = AnimConfig.Flag.Move,
        blendInSpeed = 1.0,
        onTrigger = function(info)
            info.prop.apple = Prop:new()
            Citizen.Wait(1300)
            da.Log.Debug("args", info.args)
            da.Fn.Consume("apple", info.args)
            info.prop.apple:attach(info.ped, Propset.apple)
            info.apple = {
                currentResource = 0.0,
                totalResource = 1.0,
                hungerPerBite = 10/5,
                resourcePerBite = 1.0/5,
            }
            return info
        end,
    },
    exit = {
        animDict = "amb_misc@world_human_eat_apple@male_a@exit",
        anim = "exit",
        flag = AnimConfig.Flag.Move,
        onTrigger = function(info)
            Citizen.Wait(650)
            Prop.Detach(info.prop.apple, { forceWait = 5000, velocity = -1.0, })
            info.prop.apple = nil
            return info
        end,
    },
    idles = {
        idle_a = {
            animDict = "amb_misc@world_human_eat_apple@male_a@base",
            anim = "base",
            prop = { id = "apple", anim = "base_apple", },
            flag = AnimConfig.Flag.MoveLoop,
            transitions = {
                a_a = "w",
                -- a_b = "2",
                a_c = "z",
                a_d = "b",
                -- a_e = "q",
                a_f = "s",
                -- a_g = "e",
                exit_throw = "t",
            },
        },
    },
    animations = {
        a_a = {
            animDict = "amb_misc@world_human_eat_apple@male_a@idle_a",
            anim = "idle_a",
            flag = AnimConfig.Flag.Move,
            prop = { id = "apple", anim = "idle_a_apple", },
            name = "Wipe on Shirt",
            onTrigger = function(info)
                Citizen.Wait(4500)
                info.apple.currentResource = info.apple.currentResource + info.apple.resourcePerBite
                info.prop.apple:expression(math.min(info.apple.currentResource, info.apple.totalResource))
                return info
            end,
            onFinish = function(info)
                if info.apple.currentResource > 1 then info.gotoExit = true; end
                return info
            end,
            changeCore = { Hunger = 10/5, },
        },
        -- a_b = {
        --     animDict = "amb_misc@world_human_eat_apple@male_a@idle_a",
        --     anim = "idle_b",
        -- },
        a_c = {
            animDict = "amb_misc@world_human_eat_apple@male_a@idle_a",
            anim = "idle_c",
            flag = AnimConfig.Flag.Move,
            prop = { id = "apple", anim = "idle_c_apple", },
            name = "Wipe on Pants, Bite",
            onTrigger = function(info)
                Citizen.Wait(4500)
                info.apple.currentResource = info.apple.currentResource + info.apple.resourcePerBite
                info.prop.apple:expression(math.min(info.apple.currentResource, info.apple.totalResource))
                return info
            end,
            onFinish = function(info)
                if info.apple.currentResource > 1 then info.gotoExit = true; end
                return info
            end,
            changeCore = { Hunger = 10/5, },
        },
        a_d = {
            animDict = "amb_misc@world_human_eat_apple@male_a@idle_b",
            anim = "idle_d",
            flag = AnimConfig.Flag.Move,
            prop = { id = "apple", anim = "idle_d_apple", },
            name = "Bite",
            duration = 6000,
            onTrigger = function(info)
                Citizen.Wait(4000)
                info.apple.currentResource = info.apple.currentResource + info.apple.resourcePerBite
                info.prop.apple:expression(math.min(info.apple.currentResource, info.apple.totalResource))
                return info
            end,
            onFinish = function(info)
                if info.apple.currentResource > 1 then info.gotoExit = true; end
                return info
            end,
            changeCore = { Hunger = 10/5, },
        },
        -- a_e = {
        --     animDict = "amb_misc@world_human_eat_apple@male_a@idle_b",
        --     anim = "idle_e",
        -- },
        a_f = {
            animDict = "amb_misc@world_human_eat_apple@male_a@idle_b",
            anim = "idle_f",
            flag = AnimConfig.Flag.Move,
            prop = { id = "apple", anim = "idle_f_apple", },
            name = "Pick Out Seed",
            onTrigger = function(info)
                Citizen.Wait(6000)
                info.apple.currentResource = info.apple.currentResource + info.apple.resourcePerBite
                info.prop.apple:expression(math.min(info.apple.currentResource, info.apple.totalResource))
                return info
            end,
            onFinish = function(info)
                if info.apple.currentResource > 1 then info.gotoExit = true; end
                return info
            end,
            changeCore = { Hunger = 10/5, },
        },
        -- a_g = {
        --     animDict = "amb_misc@world_human_eat_apple@male_a@idle_c",
        --     anim = "idle_g",
        -- },
        exit_throw = {
            animDict = "amb_camp@world_camp_jack_throws_rocks_ledge@idle_a",
            anim = "idle_c",
            flag = AnimConfig.Flag.Move,
            name = "Throw Apple",
            blendInSpeed = 0.5,
            duration = 3200,
            onTrigger = function(info)
                Citizen.Wait(500)
                info.prop.apple:attach(info.ped, Propset.apple.Throw)
                Citizen.Wait(2300)
                Prop.Detach(info.prop.apple, { forceWait = 10000, velocity = 3.0, angle = -1, distance = 20 })
                info.prop.apple = nil
                return info
            end,
        }
    },
}

AnimLib.eat_pear = {
    name = "Eat Pear",
    tags = { ["food_&_drink"]=1, },
    key = "p",
    triggerCondition = function() return Conditions.Check({ hasPear = true, }) end,
    enter = {
        animDict = "amb_misc@world_human_eat_apple@male_a@enter",
        anim = "enter",
        flag = AnimConfig.Flag.Move,
        blendInSpeed = 1.0,
        onTrigger = function(info)
            info.prop.pear = Prop:new()
            Citizen.Wait(1300)
            da.Log.Debug("args", info.args)
            da.Fn.Consume("pear", info.args)
            info.prop.pear:attach(info.ped, Propset.pear)
            info.pear = {
                currentResource = 0.0,
                totalResource = 1.0,
                hungerPerBite = 10/5,
                resourcePerBite = 1.0/5,
            }
            return info
        end,
    },
    exit = {
        animDict = "amb_misc@world_human_eat_apple@male_a@exit",
        anim = "exit",
        flag = AnimConfig.Flag.Move,
        onTrigger = function(info)
            Citizen.Wait(650)
            Prop.Detach(info.prop.pear, { forceWait = 5000, velocity = -1.0, })
            info.prop.pear = nil
            return info
        end,
    },
    idles = {
        idle_a = {
            animDict = "amb_misc@world_human_eat_apple@male_a@base",
            anim = "base",
            prop = { id = "pear", anim = "base_apple", },
            flag = AnimConfig.Flag.MoveLoop,
            transitions = {
                a_a = "w",
                -- a_b = "2",
                a_c = "z",
                a_d = "b",
                -- a_e = "q",
                a_f = "s",
                -- a_g = "e",
                exit_throw = "t",
            },
        },
    },
    animations = {
        a_a = {
            animDict = "amb_misc@world_human_eat_apple@male_a@idle_a",
            anim = "idle_a",
            flag = AnimConfig.Flag.Move,
            prop = { id = "pear", anim = "idle_a_apple", },
            name = "Wipe on Shirt",
            onTrigger = function(info)
                Citizen.Wait(4500)
                info.pear.currentResource = info.pear.currentResource + info.pear.resourcePerBite
                info.prop.pear:expression(math.min(info.pear.currentResource, info.pear.totalResource))
                return info
            end,
            onFinish = function(info)
                if info.pear.currentResource > 1 then info.gotoExit = true; end
                return info
            end,
            changeCore = { Hunger = 10/5, },
        },
        -- a_b = {
        --     animDict = "amb_misc@world_human_eat_apple@male_a@idle_a",
        --     anim = "idle_b",
        -- },
        a_c = {
            animDict = "amb_misc@world_human_eat_apple@male_a@idle_a",
            anim = "idle_c",
            flag = AnimConfig.Flag.Move,
            prop = { id = "pear", anim = "idle_c_apple", },
            name = "Wipe on Pants, Bite",
            onTrigger = function(info)
                Citizen.Wait(4500)
                info.pear.currentResource = info.pear.currentResource + info.pear.resourcePerBite
                info.prop.pear:expression(math.min(info.pear.currentResource, info.pear.totalResource))
                return info
            end,
            onFinish = function(info)
                if info.pear.currentResource > 1 then info.gotoExit = true; end
                return info
            end,
            changeCore = { Hunger = 10/5, },
        },
        a_d = {
            animDict = "amb_misc@world_human_eat_apple@male_a@idle_b",
            anim = "idle_d",
            flag = AnimConfig.Flag.Move,
            prop = { id = "pear", anim = "idle_d_apple", },
            name = "Bite",
            duration = 6000,
            onTrigger = function(info)
                Citizen.Wait(4000)
                info.pear.currentResource = info.pear.currentResource + info.pear.resourcePerBite
                info.prop.pear:expression(math.min(info.pear.currentResource, info.pear.totalResource))
                return info
            end,
            onFinish = function(info)
                if info.pear.currentResource > 1 then info.gotoExit = true; end
                return info
            end,
            changeCore = { Hunger = 10/5, },
        },
        -- a_e = {
        --     animDict = "amb_misc@world_human_eat_apple@male_a@idle_b",
        --     anim = "idle_e",
        -- },
        a_f = {
            animDict = "amb_misc@world_human_eat_apple@male_a@idle_b",
            anim = "idle_f",
            flag = AnimConfig.Flag.Move,
            prop = { id = "pear", anim = "idle_f_apple", },
            name = "Pick Out Seed",
            onTrigger = function(info)
                Citizen.Wait(6000)
                info.pear.currentResource = info.pear.currentResource + info.pear.resourcePerBite
                info.prop.pear:expression(math.min(info.pear.currentResource, info.pear.totalResource))
                return info
            end,
            onFinish = function(info)
                if info.pear.currentResource > 1 then info.gotoExit = true; end
                return info
            end,
            changeCore = { Hunger = 10/5, },
        },
        -- a_g = {
        --     animDict = "amb_misc@world_human_eat_apple@male_a@idle_c",
        --     anim = "idle_g",
        -- },
        exit_throw = {
            animDict = "amb_camp@world_camp_jack_throws_rocks_ledge@idle_a",
            anim = "idle_c",
            flag = AnimConfig.Flag.Move,
            name = "Throw pear",
            blendInSpeed = 0.5,
            duration = 3200,
            onTrigger = function(info)
                Citizen.Wait(500)
                info.prop.pear:attach(info.ped, Propset.pear.Throw)
                Citizen.Wait(2300)
                Prop.Detach(info.prop.pear, { forceWait = 10000, velocity = 3.0, angle = -1, distance = 20 })
                info.prop.pear = nil
                return info
            end,
        }
    },
}

AnimLib.eat_breadroll = {
    name = "Eat Bread",
    tags = { ["food_&_drink"]=1, },
    key = "b",
    triggerCondition = function() return Conditions.Check({ hasBread = true, }) end,
    enter = {
        animDict = "amb_misc@world_human_eat_apple@male_a@enter",
        anim = "enter",
        flag = AnimConfig.Flag.Move,
        blendInSpeed = 1.0,
        onTrigger = function(info)
            info.prop.bread = Prop:new()
            Citizen.Wait(1300)
            da.Fn.Consume("bread", info.args)
            info.prop.bread:attach(info.ped, Propset.breadroll)
            info.bread = {
                currentResource = 0.0,
                totalResource = 1.0,
                hungerPerBite = 15/5,
                resourcePerBite = 1.0/5,
            }
            return info
        end,
    },
    exit = {
        animDict = "amb_misc@world_human_eat_apple@male_a@exit",
        anim = "exit",
        flag = AnimConfig.Flag.Move,
        onTrigger = function(info)
            local bread = info.prop.bread
            Citizen.Wait(650)
            Prop.Detach(info.prop.bread, { forceWait = 5000, velocity = -1.0, })
            info.prop.bread = nil
            return info
        end,
    },
    idles = {
        idle_a = {
            animDict = "amb_misc@world_human_eat_apple@male_a@base",
            anim = "base",
            flag = AnimConfig.Flag.MoveLoop,
            prop = { id = "bread", anim = "base_apple", },
            transitions = {
                a_d = "b",
                a_f = "s",
                exit_throw = "t",
            },
        },
    },
    animations = {
        a_d = {
            animDict = "amb_misc@world_human_eat_apple@male_a@idle_b",
            anim = "idle_d",
            flag = AnimConfig.Flag.Move,
            prop = { id = "bread", anim = "idle_d_apple", },
            name = "Bite",
            duration = 6000,
            onTrigger = function(info)
                Citizen.Wait(4000)
                info.bread.currentResource = info.bread.currentResource + info.bread.resourcePerBite
                info.prop.bread:expression(math.min(info.bread.currentResource, info.bread.totalResource))
                return info
            end,
            onFinish = function(info)
                if info.bread.currentResource >= 1 then info.gotoExit = true; end
                return info
            end,
            changeCore = { Hunger = 15/5, },
        },
        a_f = {
            animDict = "amb_misc@world_human_eat_apple@male_a@idle_b",
            anim = "idle_f",
            flag = AnimConfig.Flag.Move,
            prop = { id = "bread", anim = "idle_f_apple", },
            name = "Pick off dirt",
            onTrigger = function(info)
                Citizen.Wait(6000)
                info.bread.currentResource = info.bread.currentResource + info.bread.resourcePerBite
                info.prop.bread:expression(math.min(info.bread.currentResource, info.bread.totalResource))
                return info
            end,
            onFinish = function(info)
                if info.bread.currentResource >= 1 then info.gotoExit = true; end
                return info
            end,
            changeCore = { Hunger = 15/5, },
        },
        exit_throw = {
            animDict = "amb_camp@world_camp_jack_throws_rocks_ledge@idle_a",
            anim = "idle_c",
            flag = AnimConfig.Flag.Move,
            name = "Throw Bread",
            blendInSpeed = 0.5,
            duration = 3200,
            onTrigger = function(info)
                Citizen.Wait(500)
                info.prop.bread:attach(info.ped, Propset.breadroll.Throw)
                Citizen.Wait(2200)
                Prop.Detach(info.prop.bread, { forceWait = 10000, velocity = 3.0, angle = -1, distance = 15 })
                info.prop.bread = nil
                return info
            end,
        }
    },
}

AnimLib.eat_generic = {
    name = "",
    tags = {},
    key = "",
    condition = function() return Conditions.Check({ onMount = allow, }) end,
    enter = {
        animDict = "mech_inventory@item@_templates@book@w15-8_h20-6@unarmed@base",
        anim = "unholster",
        blendInSpeed = 1.0,
        duration = 1000,
        next = "exit",
        flag = AnimConfig.Flag.Move,
        onTrigger = function(info)
            Citizen.Wait(600)
            da.Fn.Consume(info.args.name, info.args)
            return info
        end,
    },
    exit = {
        animDict = "mech_inventory@eating@multi_bite@wedge_a4-2_b0-75_w8_h9-4_eat_cheese",
        anim = "quick_right_hand",
        blendInSpeed = 1.0,
        flag = AnimConfig.Flag.Move,
        duration = 1500,
        onTrigger = function(info)
            da.Fn.Eat(info.args.increaseAmount)
            return info
        end,
    },
}

AnimLib.eat_generic_can = {
    name = "",
    tags = {},
    key = "",
    condition = function() return Conditions.Check({ onMount = allow, }) end,
    enter = {
        animDict = "mech_inventory@item@_templates@cylinder@d12_h6-7_inspecty@offhand@base",
        anim = "unholster",
        blendInSpeed = 1.0,
        next = "exit",
        flag = AnimConfig.Flag.Move,
        onTrigger = function(info)
            Citizen.Wait(600)
            da.Fn.Consume(info.args.name, info.args)
            info.prop.can = Prop:new()
            info.prop.can:attach(info.ped, Propset.canned_goods.Hold)
            return info
        end,
    },
    exit = {
        animDict = "mech_inventory@eating@canned_food@cylinder@d8-2_h10-5",
        anim = "right_hand",
        prop = { id = "can", anim = "right_hand_can" },
        blendInSpeed = 1.0,
        duration = 2700,
        flag = AnimConfig.Flag.Move,
        onTrigger = function(info)
            da.Fn.Eat(info.args.increaseAmount)
            Citizen.Wait(1000)
            info.prop.can:attach(info.ped, Propset.canned_goods)
            Citizen.Wait(1650)
            Prop.Detach(info.prop.can, { forceWait = 10000, velocity = -1.0, angle = 105, distance = 3.0 })
            info.prop.can = nil
            return info
        end,
    },
}

AnimLib.eat_generic_stew = {
    name = "",
    tags = {},
    key = "",
    condition = function() return Conditions.Check({ onMount = allow, }) end,
    enter = {
        animDict = "mech_inventory@item@_templates@cylinder@d12_h6-7_inspecty@offhand@base",
        anim = "unholster",
        blendInSpeed = 1.0,
        duration = 660,
        next = "eat_1",
        flag = AnimConfig.Flag.Move,
        onFinish = function(info)
            da.Fn.Consume(info.args.name, info.args)
            return info
        end,
    },
    exit = {
        animDict = "mech_inventory@eating@stew",
        anim = "eat_finish_discard",
        blendInSpeed = 1.0,
        flag = AnimConfig.Flag.Move,
        duration = 6000,
        onTrigger = function(info)
            local stewAmount = 0.7
            Citizen.Wait(600)
            info.prop.bowl:expression(stewAmount)
            Citizen.Wait(500)
            local oldSpoon = info.prop.spoon
            info.prop.spoon = Prop:new()
            info.prop.spoon:attach(info.ped, Propset.spoon.EmptySpoon)
            Prop.Delete(oldSpoon)
            Citizen.Wait(1000)
            while stewAmount > 0 do
                stewAmount = stewAmount - 0.15
                info.prop.bowl:expression(stewAmount)
                Citizen.Wait(500)
            end
            da.Fn.Eat(info.args.increaseAmount/2)
            -- Workaround for certain bowls not having physics, swap empty bowl back to stew bowl
            local foodBowl = info.prop.bowl
            info.prop.bowl = Prop:new()
            info.prop.bowl:attach(info.ped, Propset.bowl.EmptyNoFade)
            Prop.Delete(foodBowl)
            -- End of workaround
            Citizen.Wait(400)
            Prop.Detach(info.prop.bowl, { forceWait = 10000, velocity = -0.3, angle = 105, distance = 2.5 })
            info.prop.bowl = nil
            Citizen.Wait(500)
            Prop.Detach(info.prop.spoon, { forceWait = 10000, velocity = -1.0, angle = 115, distance = 3.0 })
            info.prop.spoon = nil
            return info
        end,
    },
    animations = {
        eat_1 = {
            animDict = "mech_inventory@eating@stew",
            anim = "intro",
            blendInSpeed = 2.0,
            flag = AnimConfig.Flag.Move,
            next = "exit",
            onTrigger = function(info)
                local propset = info.args.propset or "Stew"
                Citizen.Wait(300)
                info.prop.bowl = Prop:new()
                info.prop.bowl:attach(info.ped, Propset.bowl[propset])
                info.prop.bowl:expression(1.0)
                Citizen.Wait(300)
                info.prop.spoon = Prop:new()
                info.prop.spoon:attach(info.ped, Propset.spoon[propset])
                Citizen.Wait(500)
                info.prop.bowl:expression(0.9)
                return info
            end,
            onFinish = function(info)
                -- Change hunger on finish prior to exit to prevent player from skipping anim
                da.Fn.Eat(info.args.increaseAmount/2)
                return info
            end,
        },
    }
}
