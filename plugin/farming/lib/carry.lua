AnimLib.pickup_bale = {
    name = "Pickup Bale",
    tags = {
        work = 1,
        root = { name = "Pickup Bale", key = "z", }
    },
    key = "b",
    triggerCondition = function() return Conditions.Check({ pickupBale=true, }) end,
    enter = {
        animDict = "amb_player@world_player_chore@bale_pick_up@male_a@stand_enter",
        anim = "enter_back_lf",
        blendInSpeed = 1.0,
        onStart = function(info)
            info.prop.bale = Prop:initNearby("bale")
            if not info.prop.bale or not info.prop.bale:lock() then
                info.exit = true
                return info
            end
            info.prop.bale:moveTo(info.ped)
            return info
        end,
        onTrigger = function(info)
            Citizen.Wait(1200)
            info.prop.bale:attach()
            return info
        end,
        changeCore = { Stamina = -20 },
        next = "pickup",
    },
    exit = {
        animDict = "amb_player@world_player_chore@bale_put_down@male_a@stand_enter_withprop",
        anim = "enter_back_rf",
        next = "exit_2",
    },
    idles = {
        idle_a = {
            animDict = "amb_wander@code_human_hay_bale_wander@male_a@base",
            anim = "base",
            flag = AnimConfig.Flag.MoveLoop,
            transitions = {
                drop = "x",
                paddock_feed = "z",
                dropTurnIn = "z",
                wagonTurnIn = "z",
            },
            idleAnimConfig = {
                speed = 0.7,
                canClimb = false,
                canJump = false,
                canRide = false,
            }
        },
    },
    animations = {
        pickup = {
            animDict = "amb_player@world_player_chore@bale_pick_up@male_a@stand_exit_withprop",
            anim = "exit_front",
            duration = 1000,
        },
        exit_2 = {
            animDict = "amb_player@world_player_chore@bale_put_down@male_a@stand_exit",
            anim = "exit_front",
            duration = 500,
            onTrigger = function(info)
                local zoneData = AnimUtil.GetInteractiveZone("zone")
                if not info.prop.bale.propData.metadata.resourceAmount or info.prop.bale.propData.metadata.resourceAmount <= 0 and (not zoneData or zoneData.type ~= "paddock") then
                    API.notify("There is nothing left in this bale, it falls apart.", "info")
                    info.prop.bale.propData.disablePropSpawn = true
                end
                Prop.Detach(info.prop.bale, { forceWait = 2000 })
                info.prop.bale = nil
                return info
            end,
        },
        wagonTurnIn = {
            animDict = "amb_work@prop_vehicle_wagon@bale_load@1@male_a@stand_enter_withprop",
            anim = "enter_back_lf",
            name = "Load onto Wagon",
            condition = function() return Conditions.Check({ .wagonTurnIn, }) end,
            onStart = function(info)
                local zoneData = AnimUtil.GetInteractiveZone("wagonTurnIn")
                info.turnInFarm = zoneData.farmName
                local coords = zoneData.coords
                local coords = vec4(coords.x, coords.y, coords.z, coords.w or zoneData.heading or 0)
                da_move.to(info.ped, coords, 2500)
                return info
            end,
            next = "exit_wagon",
        },
        dropTurnIn = {
            animDict = "amb_player@world_player_chore@bale_put_down@male_a@stand_enter_withprop",
            anim = "enter_back_rf",
            name = "Turn In Bale",
            condition = function() return Conditions.Check({ turnIn = true }) end,
            next = "exit_dropturnin",
        },
        exit_dropturnin = {
            animDict = "amb_player@world_player_chore@bale_put_down@male_a@stand_exit",
            anim = "exit_front",
            duration = 500,
            onTrigger = function(info)
                info.prop.bale.propData.disablePropSpawn = true
                local zoneData = AnimUtil.GetInteractiveZone("turnIn")
                info.turnInFarm = zoneData.farmName
                Prop.Detach(info.prop.bale, { forceWait = 7000 })
                AnimUtil.TurnInInteractTask(info.prop.bale.propData, info.turnInFarm)
                info.prop.bale = nil
                return info
            end,
        },
        exit_wagon = {
            animDict = "amb_work@prop_vehicle_wagon@bale_load@1@male_a@stand_exit",
            anim = "exit_front",
            duration = 3400,
            flag = AnimConfig.Flag.Move,
            onTrigger = function(info)
                info.prop.bale.propData.disablePropSpawn = true
                SetEntityCollision(info.prop.bale.entity, false, false)
                FreezeEntityPosition(info.prop.bale.entity, true)
                Prop.Detach(info.prop.bale, { forceWait = 7000 })
                AnimUtil.TurnInInteractTask(info.prop.bale.propData, info.turnInFarm)
                info.prop.bale = nil
                return info
            end,
        },
        drop = {
            name = "Place on Ground",
            next = "exit",
        },
        paddock_feed = {
            animDict = "amb_player@world_player_chore@bale_put_down@male_a@stand_enter_withprop",
            anim = "enter_back_rf",
            name = "Use As Paddock Feed",
            condition = function() return Conditions.Check({ inPaddock = true }) end,
            next = "exit_paddock_feed",
        },
        exit_paddock_feed = {
            animDict = "amb_player@world_player_chore@bale_put_down@male_a@stand_exit",
            anim = "exit_front",
            duration = 500,
            onTrigger = function(info)
                local zoneData = AnimUtil.GetInteractiveZone("zone")
                local increaseAmount = 0
                if info.prop.bale.propData.metadata.resourceAmount > 0 then
                    increaseAmount = info.prop.bale.propData.metadata.resourceAmount * 16
                    info.prop.bale.propData.metadata.resourceAmount = 0
                end
                Prop.Detach(info.prop.bale, { forceWait = 2500 })
                info.prop.bale = nil
                -- TODO fix errant ranching ref in farming pkg
                AnimUtil.DoRanchJob("Paddock", zoneData, increaseAmount)
                return info
            end,
        },
    },
}

AnimLib.pickup_sack = {
    name = "Carry Sack",
    tags = {
        work = 1,
        root = { name = "Pickup Sack", key = "z", }
    },
    key = "s",
    triggerCondition = function() return Conditions.Check({ pickupSack=true, }) end,
    enter = {
        animDict = "amb_work@world_human_sack_pickup@1@male_a@stand_enter",
        anim = "enter_back_lf",
        blendInSpeed = 1.0,
        prop = { sack = { anim = "enter_back_lf_sack", }, },
        onStart = function(info)
            info.prop.sack = Prop:initNearby("sack")
            if not info.prop.sack or not info.prop.sack:lock() then
                info.exit = true
                return info
            end
            info.prop.sack:moveTo(info.ped)
            -- Create the prop here since we are using an anim
            info.prop.sack:create()
            return info
        end,
        onTrigger = function(info)
            if info.exit then return info; end
            Citizen.Wait(2300)
            info.prop.sack:attach()
            return info
        end,
        next = "onto_shoulder",
    },
    exit = {
        animDict = "amb_work@world_human_sack_put_down@1@male_a@stand_enter_withprop",
        anim = "enter_back_lf",
        next = "exit_2",
        prop = { sack = { anim = "enter_back_lf_sack", }, },
        duration = 2000,
        onTrigger = function(info)
            Citizen.Wait(1600)
            Prop.Detach(info.prop.sack, { forceWait = 2000 })
            info.prop.sack = nil
            return info
        end,
    },
    idles = {
        idle_a = {
            animDict = "amb_wander@code_human_sack_wander@male_a@static",
            anim = "base",
            prop = {
                sack = {
                    anim = "static_sack",
                    .loop,
                },
            },
            flag = AnimConfig.Flag.MoveLoop,
            transitions = {
                drop = "x",
                dropTurnIn = "z",
                wagonTurnIn = "z",
            },
            idleAnimConfig = {
                speed = 0.85,
                canClimb = false,
                canJump = false,
                canRide = false,
            }
        },
    },
    animations = {
        drop = {
            name = "Place on Ground",
            next = "exit",
        },
        onto_shoulder = {
            animDict = "amb_work@world_human_sack_pickup@1@male_a@stand_exit_withprop",
            anim = "exit_front",
            prop = { sack = { anim = "exit_front_sack", }, },
            duration = 4000,
            changeCore = { Stamina = -40 },
        },
        exit_2 = {
            animDict = "amb_work@world_human_sack_put_down@1@male_a@stand_exit",
            anim = "exit_front",
            prop = { sack = { anim = "exit_front_sack", }, },
            duration = 1000,
        },
        dropTurnIn = {
            animDict = "amb_work@world_human_sack_put_down@1@male_a@stand_enter_withprop",
            anim = "enter_back_lf",
            next = "exit_2",
            name = "Turn In Sack",
            condition = function() return Conditions.Check({ .turnIn, }) end,
            prop = { sack = { anim = "enter_back_lf_sack", }, },
            duration = 2000,
            onTrigger = function(info)
                info.prop.sack.propData.disablePropSpawn = true
                local zoneData = AnimUtil.GetInteractiveZone("turnIn")
                info.turnInFarm = zoneData.farmName
                Citizen.Wait(1600)
                Prop.Detach(info.prop.sack, { forceWait = 7000 })
                AnimUtil.TurnInInteractTask(info.prop.sack.propData, info.turnInFarm)
                info.prop.sack = nil
                return info
            end,
            changeCore = { Stamina = -20 },
        },
        wagonTurnIn = {
            animDict = "amb_work@prop_vehicle_wagon@sack_load@1@male_a@stand_enter_withprop",
            anim = "enter_back_lf",
            prop = { sack = { anim = "enter_back_lf_sack", }, },
            name = "Load onto Wagon",
            condition = function() return Conditions.Check({ .wagonTurnIn, }) end,
            onStart = function(info)
                local zoneData = AnimUtil.GetInteractiveZone("wagonTurnIn")
                info.turnInFarm = zoneData.farmName
                local coords = zoneData.coords
                local coords = vec4(coords.x, coords.y, coords.z, coords.w or zoneData.heading or 0)
                da_move.to(info.ped, coords, 2500)
                return info
            end,
            next = "exit_wagon",
            changeCore = { Stamina = -20 },
        },
        exit_wagon = {
            animDict = "amb_work@prop_vehicle_wagon@sack_load@1@male_a@stand_exit",
            anim = "exit_front",
            prop = { sack = { anim = "exit_front_sack", }, },
            duration = 3400,
            flag = AnimConfig.Flag.Move,
            onTrigger = function(info)
                info.prop.sack.propData.disablePropSpawn = true
                SetEntityCollision(info.prop.sack.entity, false, false)
                FreezeEntityPosition(info.prop.sack.entity, true)
                Prop.Detach(info.prop.sack, { forceWait = 7000 })
                AnimUtil.TurnInInteractTask(info.prop.sack.propData, info.turnInFarm)
                info.prop.sack = nil
                return info
            end,
        },
    }
}

AnimLib.pickup_crate = {
    name = "Carry Crate",
    tags = { work=1, root={ key="z", name = "Pickup Crate" }},
    key = "b",
    triggerCondition = function() return Conditions.Check({ pickupCrate = true, }) end,
    enter = {
        animDict = "amb_work@world_human_box_pickup@1@male_a@stand_enter",
        anim = "enter_back_rf",
        blendInSpeed = 1.0,
        onStart = function(info)
            info.prop.crate = Prop:initNearby("crate")
            if not info.prop.crate or not info.prop.crate:lock() then
                info.exit = true
                return info
            end
            info.prop.crate:moveTo(info.ped)
            info.prop.crate:create()
            return info
        end,
        onTrigger = function(info)
            Citizen.Wait(2300)
            info.prop.crate:attach()
            return info
        end,
        changeCore = { Stamina = -40 },
        next = "stand_up",
    },
    exit = {
        animDict = "amb_work@world_human_box_put_down@1@male_a@stand_enter_withprop",
        anim = "enter_back_rf",
        next = "exit_2",
        onTrigger = function(info)
            Citizen.Wait(3800)
            Prop.Detach(info.prop.crate)
            info.prop.crate = nil
            return info
        end,
    },
    idles = {
        idle_a = {
            animDict = "amb_wander@code_human_box_wander@male_a@base",
            anim = "base",
            flag = AnimConfig.Flag.MoveLoop,
            transitions = {
                put_down = "x",
                dropTurnIn = "z",
                wagonTurnIn = "z",
            },
            idleAnimConfig = {
                speed = 0.7,
                canClimb = false,
                canJump = false,
                canRide = false,
            }
        },
    },
    animations = {
        put_down = {
            name = "Put Down Crate",
            next = "exit",
        },
        stand_up = {
            animDict = "amb_work@world_human_box_pickup@1@male_a@stand_exit_withprop",
            anim = "exit_front",
            duration = 4500,
        },
        exit_2 = {
            animDict = "amb_work@world_human_box_put_down@1@male_a@stand_exit",
            anim = "exit_front",
            duration = 1300,
        },
        dropTurnIn = {
            animDict = "amb_work@world_human_box_put_down@1@male_a@stand_enter_withprop",
            anim = "enter_back_rf",
            name = "Turn In Crate",
            condition = function() return Conditions.Check({ .turnIn, }) end,
            onTrigger = function(info)
                info.prop.crate.propData.disablePropSpawn = true
                local zoneData = AnimUtil.GetInteractiveZone("turnIn")
                info.turnInFarm = zoneData.farmName
                Prop.Detach(info.prop.crate, { forceWait = 7000 }, function() Citizen.Wait(3800) end)
                AnimUtil.TurnInInteractTask(info.prop.crate.propData, info.turnInFarm)
                info.prop.crate = nil
                return info
            end,
            changeCore = { Stamina = -20 },
            next = "exit_2",
        },
        wagonTurnIn = {
            animDict = "amb_work@prop_vehicle_wagon@box_load@1@male_a@stand_enter_withprop",
            anim = "enter_back_lf",
            name = "Load onto Wagon",
            condition = function() return Conditions.Check({ .wagonTurnIn, }) end,
            onStart = function(info)
                local zoneData = AnimUtil.GetInteractiveZone("wagonTurnIn")
                info.turnInFarm = zoneData.farmName
                local coords = zoneData.coords
                local coords = vec4(coords.x, coords.y, coords.z, coords.w or zoneData.heading or 0)
                da_move.to(info.ped, coords, 2500)
                return info
            end,
            changeCore = { Stamina = -20 },
            next = "exit_wagon",
        },
        exit_wagon = {
            animDict = "amb_work@prop_vehicle_wagon@box_load@1@male_a@stand_exit",
            anim = "exit_front",
            duration = 1400,
            flag = AnimConfig.Flag.Move,
            onTrigger = function(info)
                info.prop.crate.propData.disablePropSpawn = true
                SetEntityCollision(info.prop.crate.entity, false, false)
                FreezeEntityPosition(info.prop.crate.entity, true)
                Prop.Detach(info.prop.crate, { forceWait = 7000 })
                AnimUtil.TurnInInteractTask(info.prop.crate.propData, info.turnInFarm)
                info.prop.crate = nil
                return info
            end,
        },
    }
}
