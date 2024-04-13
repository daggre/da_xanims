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
