API.createUseableItem("cigarette", function(source, item)
    local animLibName = API.isCharMale(source) and "smoke_masc_c" or "smoke_fem_a"
    TriggerClientEvent("da_xanims:queueAnim", source, animLibName, "enter", item)
end)

API.createUseableItem("cigar", function(source, item)
    local animLibName = API.isCharMale(source) and "smoke_cigar_masc" or "smoke_cigar_fem"
    TriggerClientEvent("da_xanims:queueAnim", source, animLibName, "enter", item)
end)

API.createUseableItem("rolledcigarette", function(source, item)
    TriggerClientEvent("da_xanims:queueAnim", source, "smoke_masc_d", "enter", item)
end)

API.createUseableItem("cannabis", function(source, item)
    TriggerClientEvent("da_xanims:queueAnim", source, "smoke_masc_d", "enter", item)
end)

API.createUseableItem("pipe", function(source, item)
    TriggerClientEvent("da_xanims:queueAnim", source, "smoke_pipe", "enter")
end)

API.createUseableItem("pipetobacco", function(source, item)
    TriggerClientEvent("da_xanims:queueAnim", source, "smoke_pipe", "enter", item)
end)

API.createUseableItem("finetobacco", function(source, item)
    TriggerClientEvent("da_xanims:queueAnim", source, "smoke_pipe", "enter", item)
end)
