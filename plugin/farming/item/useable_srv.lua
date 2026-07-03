API.createUseableItem("rake", function(source, item)
    TriggerClientEvent("da_xanims:queueAnim", source, "rake", "enter", item)
end)

API.createUseableItem("shovel", function(source, item)
    TriggerClientEvent("da_xanims:queueAnim", source, "shovel", "enter", item)
end)

API.createUseableItem("handShovel", function(source, item)
    TriggerClientEvent("da_xanims:queueAnim", source, "handshovel", "enter", item)
end)

API.createUseableItem("oyster", function(source, item)
    TriggerClientEvent("da_xanims:queueAnim", source, "open_oyster", "enter", item)
end)

API.createUseableItem("clam", function(source, item)
    TriggerClientEvent("da_xanims:queueAnim", source, "open_clam", "enter", item)
end)

local Food = {
    artichoke = { amount = 10 },
    banana = { amount = 10 },
    broccoli = { amount = 5 },
    carrot = { amount = 5 },
    clammeat = { amount = 10 },
    corn = { amount = 5 },
    crawdad = { amount = 25 },
    lemon = { amount = 5 },
    orange = { amount = 5 },
    oystermeat = { amount = 10 },
    peach = { amount = 10 },
    potato = { amount = 5 },
    strawberry = { amount = 5 },
    tomato = { amount = 5 },
    pear = { amount = 5 },
}

for itemName, foodData in pairs(Food) do
    API.createUseableItem(itemName, function(source, item)
        item.increaseAmount = foodData.amount
        TriggerClientEvent("da_xanims:queueAnim", source, foodData.animLibName or "eat_generic", "enter", item)
    end)
end
