RegisterNetEvent("da_lib:anmlfx")
AddEventHandler("da_lib:anmlfx", function(target, entity)
    TriggerClientEvent("da_lib:anmlfx", target, source, entity)
end)
