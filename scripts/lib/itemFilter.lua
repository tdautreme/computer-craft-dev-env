loadAPI("./utils")

function filter(itemList, itemInListCallback, itemNotInListCallback, onAfterFilterCallback)
    oldSelectedSlot = turtle.getSelectedSlot()
    for i = 1, 16 do
        turtle.select(i)
        item = turtle.getItemDetail()
        isInList = item ~= nil and utils.tableContainElement(itemList, item["name"])
        if isInList then
            if itemInListCallback ~= nil then
                itemInListCallback()
            end
        else
            if itemNotInListCallback ~= nil then
                itemNotInListCallback()
            end
        end
    end
    turtle.select(oldSelectedSlot)
end

function run(itemList, itemInListCallback, itemNotInListCallback, onAfterFilterCallback)
    while true do
        filter(itemList, itemInListCallback, itemNotInListCallback, onAfterFilterCallback)
        if onAfterFilterCallback ~= nil then
            onAfterFilterCallback()
        end
    end
end