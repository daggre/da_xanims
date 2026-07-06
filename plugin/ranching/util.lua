AnimUtil.DoRanchJob = function(job, data, amount)
    TriggerServerEvent("ranching:server:attemptJob", job, data.ranchName, data.index, amount)
end

AnimUtil.InspectRanch = function(job, data)
    TriggerServerEvent("ranching:server:inspectChore", job, data.ranchName, data.index)
end

AnimUtil.ChangeResourceQuantity = function(prop, amount)
    TriggerServerEvent("intprop:server:updateAmount", prop.propData, amount)
end
