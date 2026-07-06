AnimLib.female_bucket_pick_up_empty = {
    name = "Pick Up Empty Bucket",
    tags = { root=1, },
    key = "z",
    triggerCondition = function() return Conditions.Check({ pickupBucket = true, bucketIsFull = false, }) end,
    enter = {
        animDict = "amb_work@world_human_bucket_pickup@empty@female_a@stand_enter",
        anim = "enter_back_rf",
        prop = { bucket = { anim = "enter_back_rf_bucket", }, },
        next = "trans_stand",
        blendInSpeed = 1.0,
        onStart = function(info)
            info.prop.bucket = Prop:initNearby("bucket")
            if not info.prop.bucket or not info.prop.bucket:lock() then
                info.exit = true
                return info
            end
            info.prop.bucket:moveTo(info.ped)
            info.prop.bucket:create()
            return info
        end,
        onTrigger = function(info)
            Citizen.Wait(2300)
            if info.exit then return info; end
            info.prop.bucket:attach()
            return info
        end,
    },
    exit = {
        animDict = "amb_work@world_human_bucket_putdown@full@female_a@stand_exit",
        anim = "exit_front",
        duration = 200,
        prop = { bucket = { anim = "exit_front_bucket", }, },
        onTrigger = function(info)
            Prop.Detach(info.prop.bucket, { forceWait = 2000 })
            info.prop.bucket = nil
            return info
        end,
    },
    idles = {
        idle_a = {
            animDict = "amb_work@world_human_bucket_pickup@empty@female_a@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
            prop = { bucket = { anim = "base_bucket", .loop, }, },
        },
    },
    animations = {
        trans_stand = {
            animDict = "amb_work@world_human_bucket_pickup@empty@female_a@stand_exit_withprop",
            anim = "exit_front",
            animLibName = "female_bucket_wander_empty",
            duration = 1800,
            next = "idle_a",
            prop = { bucket = { anim = "exit_front_bucket", }, },
            changeCore = { Stamina = -10 },
        }
    }
}

AnimLib.female_bucket_pick_up_water = {
    name = "Pick Up Water Bucket",
    tags = { root=1, },
    key = "z",
    triggerCondition = function() return Conditions.Check({ pickupBucket = true, bucketIsFull = true, }) end,
    enter = {
        animDict = "amb_work@world_human_bucket_pickup@full@female_a@stand_enter",
        anim = "enter_back_rf",
        prop = { bucket = { anim = "enter_back_rf_bucket", }, },
        next = "trans_stand",
        blendInSpeed = 1.0,
        onStart = function(info)
            info.prop.bucket = Prop:initNearby("bucket")
            if not info.prop.bucket or not info.prop.bucket:lock() then
                info.exit = true
                return info
            end
            info.prop.bucket:moveTo(info.ped)
            info.prop.bucket:create()
            info.prop.bucket:expression(info.prop.bucket.propData.metadata.resourceAmount)
            return info
        end,
        onTrigger = function(info)
            if info.exit then return info; end
            Citizen.Wait(2300)
            info.prop.bucket:attach()
            return info
        end,
    },
    exit = {
        animDict = "amb_work@world_human_bucket_putdown@full@female_a@stand_exit",
        anim = "exit_front",
        duration = 200,
        prop = { bucket = { anim = "exit_front_bucket", }, },
        onTrigger = function(info)
            Prop.Detach(info.prop.bucket, { forceWait = 2000 })
            info.prop.bucket = nil
            return info
        end,
    },
    idles = {
        idle_a = {
            animDict = "amb_work@world_human_bucket_pickup@full@female_a@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
            prop = { bucket = { anim = "base_bucket", .loop, }, },
        },
    },
    animations = {
        trans_stand = {
            animDict = "amb_work@world_human_bucket_pickup@full@female_a@stand_exit_withprop",
            anim = "exit_front",
            animLibName = "female_bucket_wander_full",
            duration = 1800,
            next = "idle_a",
            prop = { bucket = { anim = "exit_front_bucket", }, },
            changeCore = { Stamina = -10 },
        }
    }
}

AnimLib.female_bucket_wander_empty = {
    name = "",
    tags = {},
    key = "",
    exit = {
        animDict = "",
        anim = "",
        onTrigger = function(info)
            Citizen.Wait(200)
            Prop.Detach(info.prop.bucket, { forceWait = 3000 })
            info.prop.bucket = nil
            return info
        end,
    },
    idles = {
        idle_a = {
            animDict = "amb_wander@code_human_bucket_wander@empty@female_a@base",
            anim = "base",
            prop = { bucket = { anim = "base_bucket", }, },
            flag = AnimConfig.Flag.MoveLoop,
            transitions = {
                trans_set_down = "d",
                trans_stack_bucket = "s",
                trans_fill_bucket = "z",
            },
            idleAnimConfig = {
                speed = 0.8,
                canClimb = false,
                canCrouch = false,
                canJump = false,
                canRide = false,
            }
        },
    },
    animations = {
        trans_set_down = {
            name = "Set Bucket Down",
            condition = function() return Conditions.Check({
                interactWaterPump = false,
                interactWaterTrough = false,
            }) end,
            animDict = "amb_work@world_human_bucket_putdown@full@female_a@stand_enter_withprop",
            anim = "enter_back_lf",
            animLibName = "female_bucket_pick_up_empty",
            next = "exit",
            duration = 3000,
            prop = { bucket = { anim = "enter_back_lf_bucket", }, },
            changeCore = { Stamina = -10 },
        },
        trans_stack_bucket = {
            name = "Stack Bucket",
            condition = function() return Conditions.Check({
                pickupBucket = true,
                bucketIsFull = false,
            }) end,
            animDict = "amb_work@world_human_bucket_putdown@full@female_a@stand_enter_withprop",
            anim = "enter_back_lf",
            animLibName = "female_bucket_pick_up_empty",
            next = "exit",
            duration = 3000,
            prop = { bucket = { anim = "enter_back_lf_bucket", }, },
            changeCore = { Stamina = -10 },
            onStart = function(info)
                info.stackbucket = Prop:initNearby("bucket")
                if not info.stackbucket or not info.stackbucket:lock() then
                    info.gotoIdle = true
                    return info
                end
                info.stackbucket:moveTo(info.ped)
                return info
            end,
            onFinish = function(info)
                info.prop.bucket.propData.disablePropSpawn = true
                Prop.Detach(info.prop.bucket)
                info.prop.bucket = nil
                return info
            end,
        },
        trans_fill_bucket = {
            name = "Fill Bucket",
            condition = function() return Conditions.Check({ interactWaterPump = true, }) end,
            animDict = "amb_work@prop_human_pump_water@female_b@stand_enter_withprop",
            anim = "enter_back_lf",
            animLibName = "female_bucket_pump_water",
            next = "idle_a",
            blendInSpeed = 1.0,
            prop = {
                bucket = { anim = "enter_back_lf_bucket", },
                waterpump = { anim = "enter_back_lf_waterpump", },
            },
            onStart = function(info)
                info.prop.waterpump = Prop:initNearby("waterPump", true)
                if not info.prop.waterpump or not info.prop.waterpump:lock() then
                    info.gotoIdle = true
                    return info
                end
                if not info.permanent then info.permanent = {}; end
                info.permanent.waterpump = true
                SetEntityCollision(info.prop.waterpump.entity, false)
                info.prop.waterpump:moveTo(info.ped, nil, true)
                return info
            end,
            onTrigger = function(info)
                if info.exit then return info; end
                return info
            end,
        },
    }
}

AnimLib.female_bucket_pump_water = {
    name = "",
    tags = {},
    key = "",
    enter = {
    },
    exit = {
        animDict = "amb_work@prop_human_pump_water@female_b@stand_exit",
        anim = "exit_front",
        prop = {
            bucket = { anim = "exit_front_bucket", },
            waterpump = { anim = "exit_front_waterpump", },
        },
        onTrigger = function(info)
            SetEntityCollision(info.prop.waterpump.entity, true)
            Citizen.Wait(200)
            Prop.Detach(info.prop.bucket, { forceWait = 3000 })
            info.prop.bucket = nil
            return info
        end,
    },
    idles = {
        idle_a = {
            animDict = "amb_work@prop_human_pump_water@female_b@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
            transitions = {
                trans_pick_up_bucket = "z",
            },
            onTrigger = function(info)
                local maxWaterAmount = 1.0
                local pumpAmount = 1/8
                local waterAmount = info.prop.bucket.propData.metadata.resourceAmount or 0
                info.pumping = true
                while info.pumping and waterAmount < maxWaterAmount do
                    Citizen.Wait(1600)
                    if not info.pumping then break; end
                    waterAmount = waterAmount + pumpAmount
                    info.prop.bucket.propData.metadata.resourceAmount = math.min(maxWaterAmount, waterAmount)
                    info.prop.bucket:expression(info.prop.bucket.propData.metadata.resourceAmount)
                    if waterAmount >= maxWaterAmount then
                        API.notify("The bucket is full", "success")
                        Citizen.Wait(1300)
                        TriggerEvent("da_xanims:queueAnim", "female_bucket_pump_water", "trans_pick_up_bucket")
                    end
                end
                info.pumping = nil
                return info
            end,
            prop = {
                bucket = { anim = "base_bucket", .loop, },
                waterpump = { anim = "base_waterpump", .loop, },
            },
        },
    },
    animations = {
        trans_pick_up_bucket = {
            name = "Pick Up Bucket",
            animDict = "amb_work@prop_human_pump_water@female_b@stand_exit_withprop",
            anim = "exit_front",
            animLibName = "female_bucket_wander_full",
            next = "idle_a",
            blendInSpeed = 1.0,
            duration = 4200,
            prop = {
                bucket = { anim = "exit_front_bucket", },
                waterpump = { anim = "exit_front_waterpump", },
            },
            onStart = function(info)
                info.pumping = nil
                return info
            end,
            onTrigger = function(info)
                Citizen.CreateThread(function()
                    Citizen.Wait(5000)
                    SetEntityCollision(info.prop.waterpump.entity, true)
                    info.permanent = {}
                    info.prop.waterpump = nil
                end)
                if info.exit then return info; end
                return info
            end,
        }
    }
}

AnimLib.female_bucket_wander_full = {
    name = "",
    tags = {},
    key = "",
    exit = {
        animDict = "",
        anim = "",
        onTrigger = function(info)
            Citizen.Wait(200)
            Prop.Detach(info.prop.bucket, { forceWait = 3000 })
            info.prop.bucket = nil
        end,
    },
    idles = {
        idle_a = {
            animDict = "amb_wander@code_human_bucket_wander@full@female_a@base",
            anim = "base",
            prop = { bucket = { anim = "base_bucket", }, },
            flag = AnimConfig.Flag.MoveLoop,
            transitions = {
                trans_set_down = "d",
                trans_fill_bucket = "z",
                pour_bucket = "z",
            },
            idleAnimConfig = {
                speed = 0.8,
                canClimb = false,
                canJump = false,
                canRide = false,
                canCrouch = false,
            }
        },
    },
    animations = {
        pour_bucket = {
            name = "Pour Water In Trough",
            condition = function() return Conditions.Check({ interactWaterTrough = true, }) end,
            animDict = "amb_work@world_human_bucket_pour@low@female_a@stand_enter_withprop",
            anim = "enter_back_lf",
            next = "trans_stop_pour",
            blendInSpeed = 1.0,
            prop = {
                bucket = { anim = "enter_back_lf_bucket", },
            },
            onStart = function(info)
                info.waterTrough = Prop:initNearby("waterTrough")
                if not info.waterTrough or not info.waterTrough:lock() then
                    info.gotoIdle = true
                    return info
                end
                info.waterTrough:moveTo(info.ped)
                return info
            end,
            onTrigger = function(info)
                if info.exit then return info; end
                return info
            end,
            changeCore = { Stamina = -10 }
        },
        trans_set_down = {
            name = "Set Water Bucket Down",
            condition = function() return Conditions.Check({
                interactWaterPump = false,
                interactWaterTrough = false,
            }) end,
            animDict = "amb_work@world_human_bucket_putdown@full@female_a@stand_enter_withprop",
            anim = "enter_back_lf",
            animLibName = "female_bucket_pick_up_empty",
            next = "exit",
            duration = 3000,
            prop = { bucket = { anim = "enter_back_lf_bucket", }, },
            changeCore = { Stamina = -10 },
        },
        trans_fill_bucket = {
            name = "Fill Bucket",
            condition = function() return Conditions.Check({ interactWaterPump = true, }) end,
            animDict = "amb_work@prop_human_pump_water@female_b@stand_enter_withprop",
            anim = "enter_back_lf",
            animLibName = "female_bucket_pump_water",
            next = "idle_a",
            blendInSpeed = 1.0,
            prop = {
                bucket = { anim = "enter_back_lf_bucket", },
                waterpump = { anim = "enter_back_lf_waterpump", },
            },
            onStart = function(info)
                info.prop.waterpump = Prop:initNearby("waterPump", true)
                if not info.prop.waterpump or not info.prop.waterpump:lock() then
                    info.prop.waterpump = nil
                    info.gotoIdle = true
                    return info
                end
                if not info.permanent then info.permanent = {}; end
                info.permanent.waterpump = true
                SetEntityCollision(info.prop.waterpump.entity, false)
                info.prop.waterpump:moveTo(info.ped, nil, true)
                return info
            end,
            onTrigger = function(info)
                if info.exit then return info; end
                return info
            end,
        },
        trans_stop_pour = {
            animDict = "amb_work@world_human_bucket_pour@low@female_a@stand_exit_withprop",
            anim = "exit_front",
            next = "idle_a",
            animLibName = "female_bucket_wander_empty",
            blendInSpeed = 1.0,
            duration = 4000,
            prop = {
                bucket = { anim = "exit_front_bucket", },
            },
            onFinish = function(info)
                local increaseAmount = info.prop.bucket.propData.metadata.resourceAmount * 16.0
                AnimUtil.DoRanchJob("WaterTrough", info.waterTrough.propData, increaseAmount)
                info.prop.bucket:expression(0.0)
                info.prop.bucket.propData.metadata.resourceAmount = 0
                info.waterTrough = nil
                return info
            end,
            changeCore = { Stamina = -10 },
        },
    }
}

AnimLib.hammer_wall_standing = {
    name = "Fix Fence",
    tags = { root=1, },
    key = "z",
    triggerCondition = function() return Conditions.Check({
            .hasWeapon,
            .hasPrimaryWeapon,
            hasSecondaryWeapon = false,
            fixTallFence = true
        }) end,
    enter = {
        animDict = "amb_work@world_human_hammer@wall@male_a@stand_enter",
        anim = "enter_back_rf",
        blendInSpeed = 1.0,
        onStart = function(info)
            info.fence = Prop:initNearby("tallFence")
            if not info.fence or not info.fence:lock() then
                info.exit = true
                return info
            end
            info.fence:moveTo(info.ped)
            return info
        end,
        onTrigger = function(info)
            if info.exit then return info; end
            info.prop.hammer = Prop:new()
            API.consume("fenceRail")
            Citizen.Wait(400)
            AnimUtil.UnequipWeapon(1)
            info.prop.hammer:attach(info.ped, Propset.Hammer)
            return info
        end,
        onFinish = function(info)
            API.consume("nails")
            AnimUtil.DoRanchJob("Fence", info.fence.propData, 4)
            if not API.hasItem("nails") then
                TriggerEvent("da_xanims:cancelAnim")
                Citizen.Wait(100)
            end
            return info
        end,
        next = "hammer1",
    },
    exit = {
        animDict = "amb_work@world_human_hammer@wall@male_a@stand_exit",
        anim = "exit_front",
        duration = 3500,
        onTrigger = function(info)
            Citizen.Wait(3000)
            Prop.Detach(info.prop.hammer)
            info.fence = nil
            return info
        end,
    },
    idles = {
        idle_a = {
            animDict = "amb_work@world_human_hammer@wall@male_a@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
            transitions = {
                -- a_a = "1",
                -- a_b = "2",
                -- a_c = "3",
                -- a_d = "4",
                -- a_e = "q",
                -- a_f = "w",
                -- a_g = "e",
                -- a_h = "r",
                -- a_i = "t",
            },
        },
    },
    animations = {
        hammer1 = {
            animDict = "amb_work@world_human_hammer@wall@male_a@trans",
            anim = "base_trans_base",
            next = "trans_kneel",
            onFinish = function(info)
                API.consume("nails")
                AnimUtil.DoRanchJob("Fence", info.fence.propData, 4)
                if not API.hasItem("nails") then
                    TriggerEvent("da_xanims:cancelAnim")
                    Citizen.Wait(100)
                end
                return info
            end,
        },
        -- a_a = {
        --     animDict = "amb_work@world_human_hammer@wall@male_a@idle_a",
        --     anim = "idle_a",
        -- },
        -- a_b = {
        --     animDict = "amb_work@world_human_hammer@wall@male_a@idle_a",
        --     anim = "idle_b",
        -- },
        -- a_c = {
        --     animDict = "amb_work@world_human_hammer@wall@male_a@idle_a",
        --     anim = "idle_c",
        -- },
        -- a_d = {
        --     animDict = "amb_work@world_human_hammer@wall@male_a@idle_b",
        --     anim = "idle_d",
        -- },
        -- a_e = {
        --     animDict = "amb_work@world_human_hammer@wall@male_a@idle_b",
        --     anim = "idle_e",
        -- },
        -- a_f = {
        --     animDict = "amb_work@world_human_hammer@wall@male_a@idle_b",
        --     anim = "idle_f",
        -- },
        -- a_g = {
        --     animDict = "amb_work@world_human_hammer@wall@male_a@idle_c",
        --     anim = "idle_g",
        -- },
        -- a_h = {
        --     animDict = "amb_work@world_human_hammer@wall@male_a@idle_c",
        --     anim = "idle_h",
        -- },
        -- a_i = {
        --     animDict = "amb_work@world_human_hammer@wall@male_a@idle_c",
        --     anim = "idle_i",
        -- },
        trans_kneel = {
            animDict = "amb_work@world_human_hammer@wall@male_a@trans",
            anim = "a_trans_kneel_a",
            animLibName = "hammer_wall_kneeling",
            next = "hammer_idle",
            blendInSpeed = 1.0,
            onTrigger = function(info)
                Citizen.Wait(5500)
                API.consume("nails")
                AnimUtil.DoRanchJob("Fence", info.fence.propData, 4)
                if not API.hasItem("nails") then
                    TriggerEvent("da_xanims:cancelAnim")
                    Citizen.Wait(100)
                end
                return info
            end,
        },
    }
}

AnimLib.hammer_wall_kneeling = {
    name = "Fix Fence",
    tags = { root=1, },
    key = "z",
    triggerCondition = function() return Conditions.Check({
            .hasWeapon,
            .hasPrimaryWeapon,
            hasSecondaryWeapon = false,
            .fixShortFence,
        }) end,
    enter = {
        animDict = "amb_work@world_human_hammer@kneel@male_a@stand_enter",
        anim = "enter_back_lf",
        blendInSpeed = 1.0,
        onStart = function(info)
            info.fence = Prop:initNearby("shortFence")
            if not info.fence or not info.fence:lock() then
                info.exit = true
                return info
            end
            info.fence:moveTo(info.ped)
            return info
        end,
        onTrigger = function(info)
            if info.exit then return info; end
            info.prop.hammer = Prop:new()
            API.consume("fenceRail")
            Citizen.Wait(1200)
            AnimUtil.UnequipWeapon(1)
            info.prop.hammer:attach(info.ped, Propset.Hammer)
            return info
        end,
        next = "hammer_start",
    },
    exit = {
        animDict = "amb_work@world_human_hammer@kneel@male_a@stand_exit",
        anim = "exit_front",
        duration = 5000,
        onTrigger = function(info)
            Citizen.Wait(4500)
            Prop.Detach(info.prop.hammer)
            info.fence = nil
            return info
        end,
    },
    idles = {
        idle_a = {
            animDict = "amb_work@world_human_hammer@kneel@male_a@base",
            anim = "base",
            flag = AnimConfig.Flag.Loop,
            transitions = {
            },
        },
    },
    animations = {
        hammer_start = {
            animDict = "amb_work@world_human_hammer@kneel@male_a@trans",
            anim = "base_trans_base",
            next = "hammer0",
            blendInSpeed = 1.0,
            onFinish = function(info)
                API.consume("nails")
                AnimUtil.DoRanchJob("Fence", info.fence.propData, 4)
                if not API.hasItem("nails") then
                    TriggerEvent("da_xanims:cancelAnim")
                    Citizen.Wait(100)
                end
                return info
            end,
        },
        hammer0 = {
            animDict = "amb_work@world_human_hammer@kneel@male_a@trans",
            anim = "base_trans_base",
            next = "hammer_idle",
            blendInSpeed = 1.0,
            onFinish = function(info)
                API.consume("nails")
                AnimUtil.DoRanchJob("Fence", info.fence.propData, 6)
                if not API.hasItem("nails") then
                    TriggerEvent("da_xanims:cancelAnim")
                    Citizen.Wait(100)
                end
                return info
            end,
        },
        hammer_idle = {
            animDict = "amb_work@world_human_hammer@kneel@male_a@idle_a",
            anim = "idle_c",
            next = "hammer1",
            blendInSpeed = 1.0,
        },
        hammer1 = {
            animDict = "amb_work@world_human_hammer@kneel@male_a@trans",
            anim = "base_trans_base",
            next = "hammer2",
            blendInSpeed = 1.0,
            onFinish = function(info)
                API.consume("nails")
                AnimUtil.DoRanchJob("Fence", info.fence.propData, 8)
                if not API.hasItem("nails") then
                    TriggerEvent("da_xanims:cancelAnim")
                    Citizen.Wait(100)
                end
                return info
            end,
        },
        hammer2 = {
            animDict = "amb_work@world_human_hammer@kneel@male_a@trans",
            anim = "base_trans_base",
            next = "exit",
            blendInSpeed = 1.0,
            onFinish = function(info)
                API.consume("nails")
                AnimUtil.DoRanchJob("Fence", info.fence.propData, 12)
                return info
            end,
        },
    },
}

AnimLib.pitchfork = {
    name = "Pitchfork",
    tags = {
        work = 1,
        root = {
            name = "Pickup Pitchfork", key = "z",
            condition = function() return Conditions.Check({ pickupPitchfork = true }) end,
        }},
    key = "p",
    triggerCondition = function() return Conditions.Check({ hasPitchfork = true }) end,
    enter = {
        animDict = "amb_player@world_player_chore@pitchfork_pick_up@male_a@stand_enter",
        anim = "enter_back_lf",
        blendInSpeed = 1.0,
        next = "a_enterhold",
        onTrigger = function(info)
            info.prop.pitchfork = Prop:new()
            Citizen.Wait(1200)
            info.prop.pitchfork:attach(info.ped, Propset.Pitchfork)
            return info
        end,
    },
    exit = {
        animDict = "mech_loco_m@generic@discard@pitchfork@right",
        anim = "casual_discard_right",
        blendInSpeed = 4.0,
        duration = 300,
        flag = AnimConfig.Flag.Move,
        onTrigger = function(info)
            Citizen.Wait(400)
            Prop.Detach(info.prop.pitchfork, { forceWait = 2000 })
            info.prop.pitchfork = nil
            return info
        end,
    },
    idles = {
        idle_a = {
            animDict = "amb_wander@code_human_pitch_fork_wander@male_a@base",
            anim = "base",
            blendInSpeed = 1.5,
            flag = AnimConfig.Flag.MoveLoop,
            transitions = {
                trans_scoopstraw = "s",
                trans_doublescoopstraw = "t",
                trans_scoophay = "v",
                trans_doublescoophay = "w",
                trans_poop_scoop = "z",
                trans_scoop_bedding = "y",
                put_down = "d",
                scoop_toss = "a",
            },
            idleAnimConfig = {
                speed = 0.95,
                canJump = false,
            }
        },
    },
    animations = {
        a_enterhold = {
            animDict = "amb_player@world_player_chore@pitchfork_pick_up@male_a@base",
            anim = "base",
            duration = 1000,
        },
        spread_exit = {
            animDict = "amb_work@world_human_pitch_hay@spread@male_a@stand_exit_withprop",
            anim = "exit_front",
            next = "idle_a",
            duration = 3500,
            onTrigger = function(info)
                Citizen.Wait(1800)
                Prop.Delete(info.prop.hayscoop)
                return info
            end,
            changeCore = { Stamina = -8 },
        },
        spread_cleanstall = {
            animDict = "amb_work@world_human_pitch_hay@spread@male_a@stand_exit_withprop",
            anim = "exit_front",
            next = "idle_a",
            duration = 3500,
            onTrigger = function(info)
                Citizen.Wait(1800)
                Prop.Delete(info.prop.hayscoop)
                return info
            end,
            changeCore = { Stamina = -8 },
        },
        spread_fill_trough = {
            animDict = "amb_work@world_human_pitch_hay@spread@male_a@stand_exit_withprop",
            anim = "exit_front",
            next = "idle_a",
            duration = 3500,
            onTrigger = function(info)
                Citizen.Wait(1800)
                Prop.Delete(info.prop.hayscoop)
                return info
            end,
            changeCore = { Stamina = -8 },
        },
        put_down = {
            animDict = "amb_player@world_player_chore@pitchfork_put_down@male_a@stand_enter_withprop",
            anim = "enter_back_lf",
            next = "exit_putdown",
            name = "Lean Pitchfork"
        },
        exit_putdown = {
            animDict = "amb_player@world_player_chore@pitchfork_put_down@male_a@base",
            anim = "base",
            duration = 1000,
            onTrigger = function(info)
                Citizen.Wait(200)
                Prop.Detach(info.prop.pitchfork, { forceWait = 5000 })
                info.prop.pitchfork = nil
                return info
            end,
        },
        scoop_toss = {
            name = "Scoop and Toss",
            animDict = "amb_work@world_human_gravedig@working@male_b@idle_a",
            anim = "idle_a",
            condition = function() return Conditions.Check({ inAnimalStall = false }) end,
            blendInSpeed = 2.0,
            nextBlendInSpeed = 2.0,
            duration = 3500,
            changeCore = { Stamina = -15 },
        },
        trans_scoopstraw = {
            name = "Scoop Bedding",
            condition = function() return Conditions.Check({ pickupBale = true, }) end,
            onStart = function(info)
                info.bale = Prop:initNearby("bale")
                if not info.bale or not info.bale:lock() then
                    info.gotoIdle = true
                    return info
                end
                info.bale:moveTo(info.ped, "pitchfork")
                return info
            end,
            animLibName = "pitchfork_scoopstraw",
            next = "stand_exit_withscoop",
            animDict = "amb_work@world_human_pitch_hay@scoop@male_a@stand_enter_withprop",
            anim = "enter_back_lf",
            duration = 2300,
            changeCore = { Stamina = -15 },
        },
        trans_doublescoopstraw = {
            name = "Double Scoop Bedding",
            condition = function() return Conditions.Check({ pickupBale = true, }) end,
            animLibName = "pitchfork_scoopstraw",
            next = "trans_doublescoop",
            animDict = "amb_work@world_human_pitch_hay@scoop@male_a@stand_enter_withprop",
            anim = "enter_back_lf",
            duration = 2300,
            onStart = function(info)
                info.bale = Prop:initNearby("bale")
                if not info.bale or not info.bale:lock() then
                    info.gotoIdle = true
                    return info
                end
                info.bale:moveTo(info.ped, "pitchfork")
                return info
            end,
            changeCore = { Stamina = -10 },
        },
        trans_scoophay = {
            name = "Scoop Hay",
            condition = function() return Conditions.Check({ pickupBale = true, }) end,
            onStart = function(info)
                info.bale = Prop:initNearby("bale")
                if not info.bale or not info.bale:lock() then
                    info.gotoIdle = true
                    return info
                end
                info.bale:moveTo(info.ped, "pitchfork")
                return info
            end,
            animLibName = "pitchfork_scoophay",
            next = "stand_exit_withscoop",
            animDict = "amb_work@world_human_pitch_hay@scoop@male_a@stand_enter_withprop",
            anim = "enter_back_lf",
            duration = 2300,
            changeCore = { Stamina = -15 },
        },
        trans_doublescoophay = {
            name = "Double Scoop Hay",
            condition = function() return Conditions.Check({ pickupBale = true, }) end,
            animLibName = "pitchfork_scoophay",
            next = "trans_doublescoop",
            animDict = "amb_work@world_human_pitch_hay@scoop@male_a@stand_enter_withprop",
            anim = "enter_back_lf",
            duration = 2300,
            onStart = function(info)
                info.bale = Prop:initNearby("bale")
                if not info.bale or not info.bale:lock() then
                    info.gotoIdle = true
                    return info
                end
                info.bale:moveTo(info.ped, "pitchfork")
                return info
            end,
            changeCore = { Stamina = -10 },
        },
        trans_poop_scoop = {
            name = "Scoop Poop",
            condition = function() return Conditions.Check({ inAnimalStall = true, }) end,
            onStart = function(info)
                info.stall = Prop:initNearby("stall")
                if not info.stall or not info.stall.propData then
                    info.gotoIdle = true
                    return info
                end
                if AnimUtil.GetStallQuality(info.stall.propData, "StallCleanliness") >= 100 then
                    API.notify("There is no more poop in this stall.", "success")
                    info.gotoIdle = true
                    return info
                end
                if not info.stall:lock() then
                    info.gotoIdle = true
                end
                return info
            end,
            animLibName = "pitchfork_poop_scoop",
            next = "stand_exit_withscoop",
            animDict = "amb_work@world_human_pitch_hay@scoop@male_a@stand_enter_withprop",
            anim = "enter_back_lf",
            duration = 2300,
            changeCore = { Stamina = -10 },
        },
        trans_scoop_bedding = {
            name = "Scoop Soiled Bedding",
            condition = function() return Conditions.Check({ inAnimalStall = true, }) end,
            onStart = function(info)
                info.stall = Prop:initNearby("stall")
                if not info.stall or not info.stall.propData then
                    info.gotoIdle = true
                    return info
                end
                if AnimUtil.GetStallQuality(info.stall.propData, "StallBedding", true) <= 0 then
                    API.notify("There is no more bedding in this stall", "success")
                    info.gotoIdle = true
                    return info
                end
                if not info.stall:lock() then
                    info.gotoIdle = true
                end
                return info
            end,
            animLibName = "pitchfork_bedding_scoop",
            next = "stand_exit_withscoop",
            animDict = "amb_work@world_human_pitch_hay@scoop@male_a@stand_enter_withprop",
            anim = "enter_back_lf",
            duration = 2300,
            changeCore = { Stamina = -10 },
        },
    }
}

AnimLib.pitchfork_scoopstraw = {
    name = "Pitchfork Work",
    tags = {},
    key = "",
    enter = {
        animDict = "",
        anim = "",
    },
    exit = {
        animDict = "mech_loco_m@generic@discard@pitchfork@right",
        anim = "casual_discard_right",
        blendInSpeed = 4.0,
        duration = 2000,
        flag = AnimConfig.Flag.Move,
        onTrigger = function(info)
            Citizen.Wait(400)
            Prop.Detach(info.prop.pitchfork, { forceWait = 2000 })
            info.prop.pitchfork = nil
            return info
        end,
    },
    idles = {
        idle_scoop = {
            animDict = "amb_wander@code_human_pitch_fork_wander@male_a@base",
            anim = "base",
            blendInSpeed = 1.5,
            flag = AnimConfig.Flag.MoveLoop,
            transitions = {
                trans_spread = "s",
                trans_spread_stall = "z",
                trans_scoop2 = "w",
            },
            idleAnimConfig = {
                speed = 0.95,
                canJump = false,
            }
        },
    },
    animations = {
        stand_exit_withscoop = {
            animDict = "amb_work@world_human_pitch_hay@scoop@male_a@stand_exit_withprop",
            anim = "exit_front",
            next = "idle_scoop",
            duration = 2200,
            onTrigger = function(info)
                info.prop.hayscoop = Prop:new()
                Citizen.Wait(500)
                info.prop.hayscoop:attach(info.prop.pitchfork, Propset.ScoopStraw.OneScoop)
                AnimUtil.ChangeResourceQuantity(info.bale, AnimConfig.PitchforkScoopAmount)
                return info
            end,
            changeCore = { Stamina = -6 },
        },
        spread2_exit = {
            animDict = "amb_work@world_human_pitch_hay@spread@male_a@stand_exit_withprop",
            anim = "exit_front",
            next = "idle_scoop",
            duration = 3500,
            onTrigger = function(info)
                Citizen.Wait(1800)
                Prop.Delete(info.prop.hayscoop2)
                return info
            end,
            changeCore = { Stamina = -6 },
        },
        spread2_exit_stall = {
            animDict = "amb_work@world_human_pitch_hay@spread@male_a@stand_exit_withprop",
            anim = "exit_front",
            next = "idle_scoop",
            duration = 3500,
            onTrigger = function(info)
                Citizen.Wait(1800)
                Prop.Delete(info.prop.hayscoop2)
                API.notify("You added new bedding in this stall.", "success")
                return info
            end,
            changeCore = { Stamina = -6 },
        },
        trans_spread = {
            name = "Spread",
            animDict = "amb_work@world_human_pitch_hay@spread@male_a@stand_enter_withprop",
            anim = "enter_back_lf",
            animLibName = "pitchfork",
            next = "spread_exit",
            condition = function() return Conditions.Check({ inAnimalStall = false, interactTrough = false }) end,
            duration = 2500,
            changeCore = { Stamina = -6 },
        },
        trans_spread_stall = {
            name = "Spread in Stall",
            condition = function() return Conditions.Check({ inAnimalStall = true, }, true) end,
            animLibName = "pitchfork",
            next = "spread_cleanstall",
            animDict = "amb_work@world_human_pitch_hay@spread@male_a@stand_enter_withprop",
            anim = "enter_back_lf",
            onStart = function(info)
                info.stall = Prop:initNearby("stall")
                if not info.stall or not info.stall.propData then
                    info.gotoIdle = true
                    return info
                end
                return info
            end,
            onFinish = function(info)
                AnimUtil.DoRanchJob("StallBedding", info.stall.propData, 8)
                return info
            end,
            duration = 2500,
            changeCore = { Stamina = -6 },
        },
        trans_scoop2 = {
            name = "Scoop Bedding",
            animLibName = "pitchfork_doublescoopstraw",
            animDict = "amb_work@world_human_pitch_hay@scoop@male_a@stand_enter_withprop",
            anim = "enter_back_lf",
            next = "stand_exit_with2scoop",
            condition = function() return Conditions.Check({ pickupBale = true, }) end,
            onStart = function(info)
                info.bale = Prop:initNearby("bale")
                if not info.bale or not info.bale:lock() then
                    info.gotoIdle = true
                    return info
                end
                info.bale:moveTo(info.ped, "pitchfork")
                return info
            end,
            duration = 2300,
            changeCore = { Stamina = -6 },
        },
        trans_doublescoop = {
            name = "Double Scoop Straw",
            animLibName = "pitchfork_doublescoopstraw",
            animDict = "amb_work@world_human_pitch_hay@scoop@male_a@stand_exit_withprop",
            anim = "exit_front",
            next = "stand_exit_withdoublescoop",
            duration = 500,
            onTrigger = function(info)
                info.prop.hayscoop = Prop:new()
                Citizen.Wait(400)
                info.prop.hayscoop:attach(info.prop.pitchfork, Propset.ScoopStraw.OneScoop)
                AnimUtil.ChangeResourceQuantity(info.bale, AnimConfig.PitchforkScoopAmount)
                return info
            end,
        },
    },
}

AnimLib.pitchfork_doublescoopstraw = {
    name = "Pitchfork Work",
    tags = {},
    key = "",
    enter = {
        animDict = "",
        anim = "",
    },
    exit = {
        animDict = "mech_loco_m@generic@discard@pitchfork@right",
        anim = "casual_discard_right",
        blendInSpeed = 4.0,
        duration = 2000,
        flag = AnimConfig.Flag.Move,
        onTrigger = function(info)
            Citizen.Wait(400)
            Prop.Detach(info.prop.pitchfork, { forceWait = 2000 })
            info.prop.pitchfork = nil
            return info
        end,
    },
    idles = {
        idle_scoop = {
            animDict = "amb_wander@code_human_pitch_fork_wander@male_a@base",
            anim = "base",
            blendInSpeed = 1.5,
            flag = AnimConfig.Flag.MoveLoop,
            transitions = {
                trans_spread = "s",
                trans_spread_stall = "z",
            },
            idleAnimConfig = {
                speed = 0.95,
                canJump = false,
            }
        },
    },
    animations = {
        stand_exit_with2scoop = {
            animDict = "amb_work@world_human_pitch_hay@scoop@male_a@stand_exit_withprop",
            anim = "exit_front",
            next = "idle_scoop",
            duration = 2200,
            onTrigger = function(info)
                info.prop.hayscoop2 = Prop:new()
                Citizen.Wait(500)
                info.prop.hayscoop2:attach(info.prop.pitchfork, Propset.ScoopStraw.TwoScoops)
                AnimUtil.ChangeResourceQuantity(info.bale, AnimConfig.PitchforkScoopAmount)
                return info
            end,
            changeCore = { Stamina = -15 },
        },
        stand_exit_withdoublescoop = {
            animDict = "amb_work@world_human_pitch_hay@scoop@male_a@stand_exit_withprop",
            anim = "exit_front",
            next = "idle_scoop",
            duration = 2500,
            onTrigger = function(info)
                info.prop.hayscoop2 = Prop:new()
                Citizen.Wait(500)
                info.prop.hayscoop2:attach(info.prop.pitchfork, Propset.ScoopStraw.TwoScoops)
                AnimUtil.ChangeResourceQuantity(info.bale, AnimConfig.PitchforkScoopAmount)
                return info
            end,
            changeCore = { Stamina = -15 },
        },
        trans_spread = {
            name = "Spread",
            animDict = "amb_work@world_human_pitch_hay@spread@male_a@stand_enter_withprop",
            anim = "enter_back_lf",
            animLibName = "pitchfork_scoopstraw",
            next = "spread2_exit",
            condition = function() return Conditions.Check({ inAnimalStall = false, interactTrough = false, }) end,
            duration = 2500,
            changeCore = { Stamina = -12 },
        },
        trans_spread_stall = {
            name = "Spread in Stall",
            condition = function() return Conditions.Check({ inAnimalStall = true, }) end,
            animDict = "amb_work@world_human_pitch_hay@spread@male_a@stand_enter_withprop",
            anim = "enter_back_lf",
            animLibName = "pitchfork_scoopstraw",
            next = "spread2_exit_stall",
            onStart = function(info)
                info.stall = Prop:initNearby("stall")
                if not info.stall or not info.stall.propData then
                    info.gotoIdle = true
                    return info
                end
                return info
            end,
            onFinish = function(info)
                AnimUtil.DoRanchJob("StallBedding", info.stall.propData, 10)
                return info
            end,
            duration = 2500,
            changeCore = { Stamina = -12 },
        },
    },
}

AnimLib.pitchfork_scoophay = {
    name = "Pitchfork Work",
    tags = {},
    key = "",
    enter = {
        animDict = "",
        anim = "",
    },
    exit = {
        animDict = "mech_loco_m@generic@discard@pitchfork@right",
        anim = "casual_discard_right",
        blendInSpeed = 4.0,
        duration = 2000,
        flag = AnimConfig.Flag.Move,
        onTrigger = function(info)
            Citizen.Wait(400)
            Prop.Detach(info.prop.pitchfork, { forceWait = 2000 })
            info.prop.pitchfork = nil
            return info
        end,
    },
    idles = {
        idle_scoop = {
            animDict = "amb_wander@code_human_pitch_fork_wander@male_a@base",
            anim = "base",
            blendInSpeed = 1.5,
            flag = AnimConfig.Flag.MoveLoop,
            transitions = {
                trans_spread = "s",
                trans_spread_trough = "z",
                trans_scoop2 = "w",
            },
            idleAnimConfig = {
                speed = 0.95,
                canJump = false,
            }
        },
    },
    animations = {
        stand_exit_withscoop = {
            animDict = "amb_work@world_human_pitch_hay@scoop@male_a@stand_exit_withprop",
            anim = "exit_front",
            next = "idle_scoop",
            duration = 2200,
            onTrigger = function(info)
                info.prop.hayscoop = Prop:new()
                Citizen.Wait(500)
                info.prop.hayscoop:attach(info.prop.pitchfork, Propset.ScoopStraw.OneScoop)
                AnimUtil.ChangeResourceQuantity(info.bale, AnimConfig.PitchforkScoopAmount)
                return info
            end,
            changeCore = { Stamina = -15 },
        },
        spread2_exit = {
            animDict = "amb_work@world_human_pitch_hay@spread@male_a@stand_exit_withprop",
            anim = "exit_front",
            next = "idle_scoop",
            duration = 3500,
            onTrigger = function(info)
                Citizen.Wait(1800)
                Prop.Delete(info.prop.hayscoop2)
                return info
            end,
            changeCore = { Stamina = -12 },
        },
        spread2_exit_trough = {
            animDict = "amb_work@world_human_pitch_hay@spread@male_a@stand_exit_withprop",
            anim = "exit_front",
            next = "idle_scoop",
            duration = 3500,
            onTrigger = function(info)
                Citizen.Wait(1800)
                Prop.Delete(info.prop.hayscoop2)
                API.notify("You added new feed to this trough.", "success")
                return info
            end,
            changeCore = { Stamina = -12 },
        },
        trans_spread = {
            name = "Spread",
            animDict = "amb_work@world_human_pitch_hay@spread@male_a@stand_enter_withprop",
            anim = "enter_back_lf",
            animLibName = "pitchfork",
            next = "spread_exit",
            condition = function() return Conditions.Check({ inAnimalStall = false, interactTrough = false }) end,
            duration = 2500,
            changeCore = { Stamina = -12 },
        },
        trans_spread_trough = {
            name = "Spread in Trough",
            animDict = "amb_work@world_human_pitch_hay@spread@male_a@stand_enter_withprop",
            anim = "enter_back_lf",
            animLibName = "pitchfork",
            next = "spread_fill_trough",
            condition = function() return Conditions.Check({ interactTrough = true, }) end,
            duration = 2500,
            onStart = function(info)
                info.feedTrough = Prop:initNearby("feedTrough")
                if not info.feedTrough or not info.feedTrough:lock() then
                    info.gotoIdle = true
                    return info
                end
                info.feedTrough:moveTo(info.ped)
                return info
            end,
            onFinish = function(info)
                AnimUtil.DoRanchJob("FeedTrough", info.feedTrough.propData, 25)
                return info
            end,
            changeCore = { Stamina = -12 },
        },
        trans_scoop2 = {
            name = "Scoop Hay",
            animLibName = "pitchfork_doublescoophay",
            animDict = "amb_work@world_human_pitch_hay@scoop@male_a@stand_enter_withprop",
            anim = "enter_back_lf",
            next = "stand_exit_with2scoop",
            condition = function() return Conditions.Check({ pickupBale = true, }) end,
            onStart = function(info)
                info.bale = Prop:initNearby("bale")
                if not info.bale or not info.bale:lock() then
                    info.gotoIdle = true
                    return info
                end
                info.bale:moveTo(info.ped, "pitchfork")
                return info
            end,
            duration = 2300,
            changeCore = { Stamina = -15 },
        },
        trans_doublescoop = {
            name = "Double Scoop Hay",
            animLibName = "pitchfork_doublescoophay",
            animDict = "amb_work@world_human_pitch_hay@scoop@male_a@stand_exit_withprop",
            anim = "exit_front",
            next = "stand_exit_withdoublescoop",
            duration = 500,
            onTrigger = function(info)
                info.prop.hayscoop = Prop:new()
                Citizen.Wait(400)
                info.prop.hayscoop:attach(info.prop.pitchfork, Propset.ScoopStraw.OneScoop)
                AnimUtil.ChangeResourceQuantity(info.bale, AnimConfig.PitchforkScoopAmount)
                return info
            end,
            changeCore = { Stamina = -10 },
        },
    },
}

AnimLib.pitchfork_doublescoophay = {
    name = "Pitchfork Work",
    tags = {},
    key = "",
    enter = {
        animDict = "",
        anim = "",
    },
    exit = {
        animDict = "mech_loco_m@generic@discard@pitchfork@right",
        anim = "casual_discard_right",
        blendInSpeed = 4.0,
        duration = 2000,
        flag = AnimConfig.Flag.Move,
        onTrigger = function(info)
            Citizen.Wait(400)
            Prop.Detach(info.prop.pitchfork, { forceWait = 2000 })
            info.prop.pitchfork = nil
            return info
        end,
    },
    idles = {
        idle_scoop = {
            animDict = "amb_wander@code_human_pitch_fork_wander@male_a@base",
            anim = "base",
            blendInSpeed = 1.5,
            flag = AnimConfig.Flag.MoveLoop,
            transitions = {
                trans_spread = "s",
                trans_spread_trough = "z",
            },
            idleAnimConfig = {
                speed = 0.95,
                canJump = false,
            }
        },
    },
    animations = {
        stand_exit_with2scoop = {
            animDict = "amb_work@world_human_pitch_hay@scoop@male_a@stand_exit_withprop",
            anim = "exit_front",
            next = "idle_scoop",
            duration = 2200,
            onTrigger = function(info)
                info.prop.hayscoop2 = Prop:new()
                Citizen.Wait(500)
                info.prop.hayscoop2:attach(info.prop.pitchfork, Propset.ScoopStraw.TwoScoops)
                AnimUtil.ChangeResourceQuantity(info.bale, AnimConfig.PitchforkScoopAmount)
                return info
            end,
            changeCore = { Stamina = -15 },
        },
        stand_exit_withdoublescoop = {
            animDict = "amb_work@world_human_pitch_hay@scoop@male_a@stand_exit_withprop",
            anim = "exit_front",
            next = "idle_scoop",
            duration = 2500,
            onTrigger = function(info)
                info.prop.hayscoop2 = Prop:new()
                Citizen.Wait(500)
                info.prop.hayscoop2:attach(info.prop.pitchfork, Propset.ScoopStraw.TwoScoops)
                AnimUtil.ChangeResourceQuantity(info.bale, AnimConfig.PitchforkScoopAmount)
                return info
            end,
            changeCore = { Stamina = -15 },
        },
        trans_spread = {
            name = "Spread",
            animDict = "amb_work@world_human_pitch_hay@spread@male_a@stand_enter_withprop",
            anim = "enter_back_lf",
            animLibName = "pitchfork_scoophay",
            next = "spread2_exit",
            condition = function() return Conditions.Check({ inAnimalStall = false, interactTrough = false, }) end,
            duration = 2500,
            changeCore = { Stamina = -12 },
        },
        trans_spread_trough = {
            name = "Spread in Trough",
            animDict = "amb_work@world_human_pitch_hay@spread@male_a@stand_enter_withprop",
            anim = "enter_back_lf",
            animLibName = "pitchfork_scoophay",
            next = "spread2_exit_trough",
            condition = function() return Conditions.Check({ interactTrough = true, }) end,
            onStart = function(info)
                info.feedTrough = Prop:initNearby("feedTrough")
                if not info.feedTrough or not info.feedTrough:lock() then
                    info.gotoIdle = true
                    return info
                end
                info.feedTrough:moveTo(info.ped)
                return info
            end,
            onFinish = function(info)
                AnimUtil.DoRanchJob("FeedTrough", info.feedTrough.propData, 20)
                return info
            end,
            duration = 2500,
            changeCore = { Stamina = -12 },
        },
    },
}

AnimLib.pitchfork_poop_scoop = {
    name = "Pitchfork Clean Poop",
    tags = {},
    key = "",
    enter = {
        animDict = "",
        anim = "",
    },
    exit = {
        animDict = "mech_loco_m@generic@discard@pitchfork@right",
        anim = "casual_discard_right",
        blendInSpeed = 4.0,
        duration = 2000,
        flag = AnimConfig.Flag.Move,
        onTrigger = function(info)
            Citizen.Wait(400)
            Prop.Detach(info.prop.pitchfork, { forceWait = 2000 })
            info.prop.pitchfork = nil
            return info
        end,
    },
    idles = {
        idle_scoop = {
            animDict = "amb_wander@code_human_pitch_fork_wander@male_a@base",
            anim = "base",
            blendInSpeed = 1.5,
            flag = AnimConfig.Flag.MoveLoop,
            transitions = {
                wheelbarrow = "z",
            },
            idleAnimConfig = {
                speed = 0.95,
                canJump = false,
            }
        },
    },
    animations = {
        wheelbarrow = {
            name = "Put in Wheelbarrow",
            condition = function() return Conditions.Check({ interactWheelbarrow = true, }) end,
            animDict = "mini_games@story@mar5@clean_stalls@john",
            anim = "idle",
            next = "trans_wheelbarrow",
            duration = 500,
            onStart = function(info)
                info.wheelbarrow = Prop:initNearby("wheelbarrow")
                if not info.wheelbarrow then
                    info.gotoIdle = true
                    return info
                end
                info.wheelbarrow:moveTo(info.ped)
                return info
            end,
            onFinish = function(info)
                AnimUtil.DoRanchJob("StallCleanliness", info.stall.propData, 10)
                return info
            end,
            changeCore = { Stamina = -10 },

        },
        stand_exit_withscoop = {
            animDict = "amb_work@world_human_pitch_hay@scoop@male_a@stand_exit_withprop",
            anim = "exit_front",
            next = "idle_scoop",
            duration = 2200,
            onTrigger = function(info)
                info.prop.poop = Prop:new()
                Citizen.Wait(500)
                info.prop.poop:attach(info.prop.pitchfork, Propset.PoopScoop)
                return info
            end,
            changeCore = { Stamina = -15 },
        },
        trans_wheelbarrow = {
            animDict = "mini_games@story@mar5@clean_stalls@john",
            anim = "put_in_wheelbarrow",
            animLibName = "pitchfork",
            next = "idle_a",
            onTrigger = function(info)
                Citizen.Wait(800)
                Prop.Delete(info.prop.poop)
                return info
            end,
            changeCore = { Stamina = -10 },
        },
    },
}

AnimLib.pitchfork_bedding_scoop = {
    name = "Pitchfork Clean Bedding",
    tags = {},
    key = "",
    enter = {
        animDict = "",
        anim = "",
    },
    exit = {
        animDict = "mech_loco_m@generic@discard@pitchfork@right",
        anim = "casual_discard_right",
        blendInSpeed = 4.0,
        duration = 2000,
        flag = AnimConfig.Flag.Move,
        onTrigger = function(info)
            Citizen.Wait(400)
            Prop.Detach(info.prop.pitchfork, { forceWait = 2000 })
            info.prop.pitchfork = nil
            return info
        end,
    },
    idles = {
        idle_scoop = {
            animDict = "amb_wander@code_human_pitch_fork_wander@male_a@base",
            anim = "base",
            blendInSpeed = 1.5,
            flag = AnimConfig.Flag.MoveLoop,
            transitions = {
                wheelbarrow = "z",
            },
            idleAnimConfig = {
                speed = 0.95,
                canJump = false,
            }
        },
    },
    animations = {
        wheelbarrow = {
            name = "Put in Wheelbarrow",
            condition = function() return Conditions.Check({ interactWheelbarrow = true, }) end,
            animDict = "mini_games@story@mar5@clean_stalls@john",
            anim = "idle",
            next = "trans_wheelbarrow",
            duration = 500,
            onStart = function(info)
                info.wheelbarrow = Prop:initNearby("wheelbarrow")
                if not info.wheelbarrow then
                    info.gotoIdle = true
                    return info
                end
                info.wheelbarrow:moveTo(info.ped)
                return info
            end,
            onFinish = function(info)
                AnimUtil.DoRanchJob("StallCleanliness", info.stall.propData, 15)
                AnimUtil.DoRanchJob("StallBedding", info.stall.propData, -5)
                return info
            end,
        },
        stand_exit_withscoop = {
            animDict = "amb_work@world_human_pitch_hay@scoop@male_a@stand_exit_withprop",
            anim = "exit_front",
            next = "idle_scoop",
            duration = 2200,
            onTrigger = function(info)
                info.prop.bedding = Prop:new()
                Citizen.Wait(500)
                info.prop.bedding:attach(info.prop.pitchfork, Propset.ScoopStraw.OneScoop)
                return info
            end,
            changeCore = { Stamina = -15 },
        },
        trans_wheelbarrow = {
            animDict = "mini_games@story@mar5@clean_stalls@john",
            anim = "put_in_wheelbarrow",
            animLibName = "pitchfork",
            next = "idle_a",
            onTrigger = function(info)
                Citizen.Wait(800)
                Prop.Delete(info.prop.bedding)
                return info
            end,
            changeCore = { Stamina = -10 },
        },
    },
}
