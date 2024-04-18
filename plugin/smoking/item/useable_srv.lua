da.API.CreateUseableItem("cigarette", function(source, item)
    local animLibName = da.Fn.IsMale(source) and "smoke_masc_c" or "smoke_fem_a"
    TriggerClientEvent("da_xanims:queueAnim", source, animLibName, "enter", item)
end)

da.API.CreateUseableItem("cigar", function(source, item)
    local animLibName = da.Fn.IsMale(source) and "smoke_cigar_masc" or "smoke_cigar_fem"
    TriggerClientEvent("da_xanims:queueAnim", source, animLibName, "enter", item)
end)

da.API.CreateUseableItem("rolledcigarette", function(source, item)
    TriggerClientEvent("da_xanims:queueAnim", source, "smoke_masc_d", "enter", item)
end)

da.API.CreateUseableItem("cannabis", function(source, item)
    TriggerClientEvent("da_xanims:queueAnim", source, "smoke_masc_d", "enter", item)
end)
