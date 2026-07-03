AnimLib.vault_crack = {
    name = "",
    tags = {},
    key = "",
    triggerCondition = function() return Conditions.Check({ hasWeapon = "allow", hasPrimaryWeapon = "allow", hasSecondaryWeapon = "allow", }) end,
    enter = {
        animDict = "mini_games@safecrack@base",
        anim = "enter_rf",
        duration = 2000,
        blendInSpeed = 1.0,
        onStart = function(info)
            info.final = function(info) TriggerEvent("da_bankrob:stopVaultCrack", info.args) end
            if not info.args then
                info.gotoExit = true
                return info
            end
            da_weapon.holster()
            TaskPedSlideToCoord(info.ped, info.args.location.xyzw, -1)
            Citizen.Wait(2000)
            return info
        end,
        next = "stage0",
    },
    exit = {
        animDict = "",
        anim = "",
        onStart = function(info)
            if info.args and info.finished and info.args.success then
                log.debug("Vault crack exit success: ", info.args)
                info.next = "exit_success"
            end
            return info
        end,
        next = "exit_fail",
    },
    animations = {
        stage0 = {
            animDict = "mini_games@safecrack@base",
            anim = "base_stage_00",
            flag = AnimConfig.Flag.Loop,
            duration = 2000,
            next = "stage1",
        },
        stage1 = {
            animDict = "mini_games@safecrack@base",
            anim = "dial_turn_left_stage_00",
            flag = AnimConfig.Flag.Loop,
            duration = 8000,
            onStart = function(info)
                if info.args and not info.args.success then
                    if info.args.stageFail == 1 then
                        info.gotoExit = true
                    end
                end
                return info
            end,
            next = "stage2",
        },
        stage2 = {
            animDict = "mini_games@safecrack@base",
            anim = "base_stage_00",
            flag = AnimConfig.Flag.Loop,
            duration = 1500,
            next = "stage3",
        },
        stage3 = {
            animDict = "mini_games@safecrack@base",
            anim = "dial_turn_right_stage_00",
            flag = AnimConfig.Flag.Loop,
            duration = 12000,
            onStart = function(info)
                if info.args and not info.args.success then
                    if info.args.stageFail == 2 then
                        info.gotoExit = true
                    end
                end
                return info
            end,
            next = "stage4",
        },
        stage4 = {
            animDict = "mini_games@safecrack@base",
            anim = "base_stage_00",
            flag = AnimConfig.Flag.Loop,
            duration = 1500,
            next = "stage5",
        },
        stage5 = {
            animDict = "mini_games@safecrack@base",
            anim = "dial_turn_left_stage_00",
            flag = AnimConfig.Flag.Loop,
            duration = 15000,
            next = "exit",
            onFinish = function(info)
                info.finished = true
                return info
            end,
        },
        exit_success = {
            animDict = "mini_games@safecrack@base",
            anim = "open_lt",
            duration = 2500,
            onFinish = function(info)
                TriggerEvent("da_bankrob:finishVaultCrack", info.args)
                return info
            end,
        },
        exit_fail = {
            animDict = "mini_games@safecrack@base",
            anim = "exit_fail",
            duration = 2500,
        }
    },
}

AnimLib.vault_crack_med = {
    name = "",
    tags = {},
    key = "",
    triggerCondition = function() return Conditions.Check({ hasWeapon = "allow", hasPrimaryWeapon = "allow", hasSecondaryWeapon = "allow", }) end,
    enter = {
        animDict = "mini_games@safecrack@med",
        anim = "enter_rf",
        duration = 2000,
        blendInSpeed = 1.0,
        onStart = function(info)
            info.final = function(i) TriggerEvent("da_bankrob:stopVaultCrack", i.args) end
            if not info.args then
                info.gotoExit = true
                return info
            end
            da_weapon.holster()
            TaskPedSlideToCoord(info.ped, info.args.location.xyzw, -1)
            Citizen.Wait(2000)
            return info
        end,
        next = "stage0",
    },
    exit = {
        animDict = "",
        anim = "",
        onStart = function(info)
            if info.args and info.finished and info.args.success then
                log.debug("Vault crack exit success: ", info.args)
                info.next = "exit_success"
                -- TODO: possibly not setting the right exit?
            end
            return info
        end,
        next = "exit_fail",
    },
    animations = {
        stage0 = {
            animDict = "mini_games@safecrack@med",
            anim = "base_stage_00",
            flag = AnimConfig.Flag.Loop,
            duration = 2000,
            next = "stage1",
        },
        stage1 = {
            animDict = "mini_games@safecrack@med",
            anim = "dial_turn_left_stage_00",
            flag = AnimConfig.Flag.Loop,
            duration = 8000,
            onStart = function(info)
                if info.args and not info.args.success then
                    if info.args.stageFail == 1 then
                        info.gotoExit = true
                    end
                end
                return info
            end,
            next = "stage2",
        },
        stage2 = {
            animDict = "mini_games@safecrack@med",
            anim = "base_stage_00",
            flag = AnimConfig.Flag.Loop,
            duration = 1500,
            next = "stage3",
        },
        stage3 = {
            animDict = "mini_games@safecrack@med",
            anim = "dial_turn_right_stage_00",
            flag = AnimConfig.Flag.Loop,
            duration = 12000,
            onStart = function(info)
                if info.args and not info.args.success then
                    if info.args.stageFail == 2 then
                        info.gotoExit = true
                    end
                end
                return info
            end,
            next = "stage4",
        },
        stage4 = {
            animDict = "mini_games@safecrack@med",
            anim = "base_stage_00",
            flag = AnimConfig.Flag.Loop,
            duration = 1500,
            next = "stage5",
        },
        stage5 = {
            animDict = "mini_games@safecrack@med",
            anim = "dial_turn_left_stage_00",
            flag = AnimConfig.Flag.Loop,
            duration = 15000,
            next = "exit",
            onFinish = function(info)
                info.finished = true
                return info
            end,
        },
        exit_success = {
            animDict = "mini_games@safecrack@med",
            anim = "open_lt",
            duration = 2500,
            onFinish = function(info)
                TriggerEvent("da_bankrob:finishVaultCrack", info.args)
                return info
            end,
        },
        exit_fail = {
            animDict = "mini_games@safecrack@med",
            anim = "exit_fail",
            duration = 2500,
        }
    },
}

AnimLib.vault_secure = {
    name = "",
    tags = {},
    key = "",
    triggerCondition = function() return Conditions.Check({ hasWeapon = "allow", hasPrimaryWeapon = "allow", hasSecondaryWeapon = "allow", }) end,
    enter = {
        animDict = "mini_games@safecrack@base",
        anim = "enter_rf",
        duration = 2000,
        blendInSpeed = 1.0,
        onStart = function(info)
            info.final = function(info) TriggerEvent("da_bankrob:stopVaultCrack", info.args) end
            da_weapon.holster()
            TaskPedSlideToCoord(info.ped, info.args.location.xyzw, -1)
            Citizen.Wait(2000)
            return info
        end,
        next = "stage0",
    },
    exit = {
        animDict = "",
        anim = "",
        next = "exit_secure",
    },
    animations = {
        stage0 = {
            animDict = "mini_games@safecrack@base",
            anim = "base_stage_00",
            flag = AnimConfig.Flag.Loop,
            duration = 2000,
            next = "stage1",
        },
        stage1 = {
            animDict = "mini_games@safecrack@base",
            anim = "dial_turn_left_stage_00",
            flag = AnimConfig.Flag.Loop,
            duration = 8000,
            next = "stage2",
        },
        stage2 = {
            animDict = "mini_games@safecrack@base",
            anim = "base_stage_00",
            flag = AnimConfig.Flag.Loop,
            duration = 1500,
            next = "stage3",
        },
        stage3 = {
            animDict = "mini_games@safecrack@base",
            anim = "dial_turn_right_stage_00",
            flag = AnimConfig.Flag.Loop,
            duration = 12000,
            next = "stage4",
        },
        stage4 = {
            animDict = "mini_games@safecrack@base",
            anim = "base_stage_00",
            flag = AnimConfig.Flag.Loop,
            duration = 1500,
            next = "stage5",
        },
        stage5 = {
            animDict = "mini_games@safecrack@base",
            anim = "dial_turn_left_stage_00",
            flag = AnimConfig.Flag.Loop,
            duration = 15000,
            next = "exit",
            onFinish = function(info)
                info.finished = true
                return info
            end,
        },
        exit_secure = {
            animDict = "mini_games@safecrack@base",
            anim = "open_lt",
            duration = 2500,
            onFinish = function(info)
                TriggerEvent("da_bankrob:finishVaultSecure", info.args)
                return info
            end,
        },
    },
}


AnimLib.vault_secure_med = {
    name = "",
    tags = {},
    key = "",
    triggerCondition = function() return Conditions.Check({ hasWeapon = "allow", hasPrimaryWeapon = "allow", hasSecondaryWeapon = "allow", }) end,
    enter = {
        animDict = "mini_games@safecrack@med",
        anim = "enter_rf",
        duration = 2000,
        blendInSpeed = 1.0,
        onStart = function(info)
            info.final = function(i) TriggerEvent("da_bankrob:stopVaultCrack", i.args) end
            da_weapon.holster()
            TaskPedSlideToCoord(info.ped, info.args.location.xyzw, -1)
            Citizen.Wait(2000)
            return info
        end,
        next = "stage0",
    },
    exit = {
        animDict = "",
        anim = "",
        next = "exit_secure",
    },
    animations = {
        stage0 = {
            animDict = "mini_games@safecrack@med",
            anim = "base_stage_00",
            flag = AnimConfig.Flag.Loop,
            duration = 2000,
            next = "stage1",
        },
        stage1 = {
            animDict = "mini_games@safecrack@med",
            anim = "dial_turn_left_stage_00",
            flag = AnimConfig.Flag.Loop,
            duration = 8000,
            next = "stage2",
        },
        stage2 = {
            animDict = "mini_games@safecrack@med",
            anim = "base_stage_00",
            flag = AnimConfig.Flag.Loop,
            duration = 1500,
            next = "stage3",
        },
        stage3 = {
            animDict = "mini_games@safecrack@med",
            anim = "dial_turn_right_stage_00",
            flag = AnimConfig.Flag.Loop,
            duration = 12000,
            next = "stage4",
        },
        stage4 = {
            animDict = "mini_games@safecrack@med",
            anim = "base_stage_00",
            flag = AnimConfig.Flag.Loop,
            duration = 1500,
            next = "stage5",
        },
        stage5 = {
            animDict = "mini_games@safecrack@med",
            anim = "dial_turn_left_stage_00",
            flag = AnimConfig.Flag.Loop,
            duration = 15000,
            next = "exit",
            onFinish = function(info)
                info.finished = true
                return info
            end,
        },
        exit_secure = {
            animDict = "mini_games@safecrack@med",
            anim = "open_lt",
            duration = 2500,
            onFinish = function(info)
                TriggerEvent("da_bankrob:finishVaultSecure", info.args)
                return info
            end,
        },
        exit_fail = {
            animDict = "mini_games@safecrack@med",
            anim = "exit_fail",
            duration = 2500,
        }
    },
}
