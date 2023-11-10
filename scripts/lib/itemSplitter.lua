loadAPI("./utils")

function itemNotInList(isBlacklist)
    if isBlacklist then
        itemAllowed()
    else
        itemForbidden()
    end
end

function itemInList(isBlacklist)
    if isBlacklist then
        itemForbidden()
    else
        itemAllowed()
    end
end

function itemForbidden()
    turtle.dropDown()
end

function itemAllowed()
    turtle.drop()
end

function run(isBlacklist, itemList)
    while true do
        if turtle.suckUp() then
            -- foreach slot check if it's in the list
            for i = 1, 16 do
                turtle.select(i)
                item = turtle.getItemDetail()
                isInList = item ~= nil and utils.tableContainElement(itemList, item["name"])
                if isInList then
                    itemInList(isBlacklist)
                else
                    itemNotInList(isBlacklist)
                end
            end
        end
    end
end