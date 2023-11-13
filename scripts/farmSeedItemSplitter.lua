loadAPI("lib/itemFilter.lua")

isBlacklist = true
itemList = {
    "minecraft:wheat_seeds",
    "minecraft:beetroot_seeds"
}

function itemNotInList()

end

function itemInList()
    turtle.dropDown()
end

function onAfterFilter()
    -- first move all break to first slot
    for i = 1, 16 do
        turtle.select(i)
        item = turtle.getItemDetail()
        if item ~= nil then
            turtle.transferTo(1)
        end
    end

    while true do
        turtle.select(1)
        item = turtle.getItemDetail()
        if item ~= nil and item["count"] >= 3 then
            local amountOfItems = item["count"]
            local itemsPerSlots = math.floor(amountOfItems / 3)
            turtle.transferTo(2, itemsPerSlots)
            turtle.transferTo(3, itemsPerSlots)
            turtle.craft(itemsPerSlots)
            -- throw bread
            for i = 1, 16 do
                turtle.select(i)
                item = turtle.getItemDetail()
                if item ~= nil and item["name"] == "minecraft:bread" then
                    turtle.drop()
                end
            end
        else
            break
        end
    end

    turtle.select(1)
end


itemSplitter.run(itemList, itemInList, itemNotInList, onAfterFilter)