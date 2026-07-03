AnimLib.lockbreak = {
    name = "",
    tags = {},
    key = "",
    triggerCondition = function() return Conditions.Check({ hasWeapon = "allow", hasPrimaryWeapon = "allow", hasSecondaryWeapon = "allow", }) end,
    enter = {
        animDict = "script_proc@rustling@olar@player_picklock",
        anim = "base",
        blendInSpeed = 1.0,
        blendOutSpeed = 0.5,
        duration = 2800,
        onStart = function(info)
            if not info.args then
                info.gotoExit = true
                return info
            end
            da_weapon.holster()
            da_move.face(info.ped, info.args.midPoint, 1000)
            return info
        end,
        next = "e1",
    },
    exit = {},
    animations = {
        e1 = {
            animDict = "script_proc@rustling@olar@player_picklock",
            anim = "base",
            blendInSpeed = 0.5,
            duration = 3400,
            onFinish = function(info)
                if info.args.alertTamper then
                    TriggerServerEvent("da_bankrob:tellerAlert", info.args.group)
                end
                log.debug("Lockbreak finish", info.args.group)
                API.setDoorStatus(info.args, "damaged", true)
                return info
            end,
            next = "exit",
        }
    }
}

AnimLib.lockbreak_fail = {
    name = "",
    tags = {},
    key = "",
    triggerCondition = function() return Conditions.Check({ hasWeapon = "allow", hasPrimaryWeapon = "allow", hasSecondaryWeapon = "allow", }) end,
    enter = {
        animDict = "script_proc@rustling@olar@player_picklock",
        anim = "base",
        blendInSpeed = 1.0,
        duration = 3500,
        onStart = function(info)
            if not info.args then
                info.gotoExit = true
                return info
            end
            da_weapon.holster()
            da_move.face(info.ped, info.args.midPoint, 1000)
            return info
        end,
        next = "e1",
    },
    exit = {},
    animations = {
        e1 = {
            animDict = "mech_ransack@chest@front_lid@h100cm@pistol_open@a",
            anim = "base",
            duration = 1400,
            blendInSpeed = 1.5,
            onTrigger = function(info)
                if info.args.alertTamper and da_util.dependsOn("da_bankrob") then
                    exports.da_bankrob:StartleTellers(info.args.group)
                end
                return info
            end,
            onFinish = function(info)
                return info
            end,
            next = "exit",
        }
    }
}

AnimLib.lockrepair = {
    tags = {},
    key = "",
    triggerCondition = function() return Conditions.Check({ hasWeapon = "allow", hasPrimaryWeapon = "allow", hasSecondaryWeapon = "allow", }) end,
    enter = {
        animDict = "amb_work@world_human_repair@med@oilcan@male_a@idle_b",
        anim = "idle_d",
        blendInSpeed = 1.0,
        onStart = function(info)
            if not info.args then
                info.gotoExit = true
                return info
            end
            da_weapon.holster()
            da_move.face(info.ped, info.args.midPoint, 1000)
            return info
        end,
        onFinish = function(info)
            API.setDoorStatus(info.args, "damaged", false)
            return info
        end,
    },
    exit = {},
}

AnimLib.vaultdrill = {
    name = "",
    tags = {},
    key = "",
    triggerCondition = function() return Conditions.Check({ hasWeapon = "allow", hasPrimaryWeapon = "allow", hasSecondaryWeapon = "allow", }) end,
    enter = {
        animDict = "amb_work@prop_human_grindstone@male_a@idle_c",
        anim = "idle_h",
        blendInSpeed = 0.7,
        blendOutSpeed = 0.5,
        duration = 6*60*1000, -- 6 mins
        flag = AnimConfig.Flag.Loop,
        onStart = function(info)
            if not info.args then
                info.gotoExit = true
                return info
            end
            da_weapon.holster()
            da_move.face(info.ped, info.args.midPoint, 1000)
            return info
        end,
        next = "e1",
    },
    exit = {},
    animations = {
        e1 = {
            onFinish = function(info)
                TriggerServerEvent("da_bankrob:vaultAlert", info.args.group)
                API.setDoorStatus(info.args, "drilled", true)
                return info
            end,
            next = "exit",
        }
    }
}

AnimLib.vaultblow = {
    name = "",
    tags = {},
    key = "",
    triggerCondition = function() return Conditions.Check({ hasWeapon = "allow", hasPrimaryWeapon = "allow", hasSecondaryWeapon = "allow", }) end,
    enter = {
        animDict = "mech_weapons_special@placed_dynamite",
        anim = "plant_vertical",
        blendInSpeed = 1.0,
        duration = 1800,
        onStart = function(info)
            if not info.args then
                info.gotoExit = true
                return info
            end
            da_weapon.holster()
            da_move.face(info.ped, info.args.midPoint, 1000)
            return info
        end,
        next = "e1",
    },
    exit = {},
    animations = {
        e1 = {
            animDict = "script_story@mud5@ig@ig_5_plant_dynamite",
            anim = "ig5_light_side02_arthur",
            blendInSpeed = 1.0,
            duration = 2000,
            onFinish = function(info)
                Citizen.CreateThread(function()
                    API.consume("vaultcharge")
                    local fuseTiming = info.args.fuse
                    API.notify("Fuse is lit...", "info", fuseTiming)
                    Citizen.Wait(fuseTiming)
                    Citizen.InvokeNative(0xD84A917A64D4D016, -- https://github.com/femga/rdr3_discoveries/tree/master/graphics/explosions
                        info.ped,
                        info.args.midPoint.xyz,
                        27,  -- explosionTagId: 27:EXP_TAG_DYNAMITE_VOLATILE
                        1.0, -- damageScale
                        true, -- isAudible
                        false, -- isInvisible
                        true -- cameraShake
                        )
                    API.setDoorStatus(info.args, "damaged", true)
                    TriggerServerEvent("da_bankrob:explodeAlert", info.args.group)
                    TriggerServerEvent("da_bankrob:blowVault", info.args.group)
                end)
                return info
            end,
            next = "exit",
        },
    }
}

