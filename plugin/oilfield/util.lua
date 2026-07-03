RegisterCommand("oilfield_hammer", function(source, args, rawCommand)
    local repairValue = args[1] and tonumber(args[1]) or 10
    repairValue = math.max(1, math.min(100, repairValue))

    TriggerEvent("da_xanims:queueAnim",
        "oilfield_hammer_nail", "enter",
        { repairValue = repairValue }
    )
end)
