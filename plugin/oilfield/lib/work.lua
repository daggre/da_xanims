AnimLib.oilfield_hammer_nail = {
    enter = {
        animDict = "amb_work@world_human_hammer@wall@male_a@stand_enter",
        anim = "enter_back_rf",
        onTrigger = function(info)
            log.debug("Repair starting at", info.args.repairValue)
            info.prop.hammer = Prop:new(Propset.Hammer)
            Citizen.Wait(400)
            Prop.attach(info.prop.hammer, info.ped)
            return info
        end,
        next = "hammer_nail",
    },
    exit = {
        animDict = "amb_work@world_human_hammer@wall@male_a@stand_exit",
        anim = "exit_front",
        blendInSpeed = 2.2,
        onTrigger = function(info)
            Citizen.Wait(3000)
            Prop.Detach(info.prop.hammer)
            return info
        end,
    },
    animations = {
        hammer_nail = {
            animDict = "amb_work@world_human_hammer@wall@male_a@trans",
            anim = "base_trans_base",
            onTrigger = function(info)
                Citizen.Wait(6900)
                info.args.repairValue = math.min(100, info.args.repairValue + 20)
                log.debug("Repair at", info.args.repairValue)
                if info.args.repairValue >= 100 then
                    TriggerEvent("da_xanims:cancelAnim")
                end
                return info
            end,
            next = "hammer_nail",
        }
    }
}
