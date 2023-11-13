loadAPI("./lib/itemFilter")

function itemInList()
    turtle.drop()
end

function itemNotInList()
    turtle.dropDown()
end

function run(itemsID, dropFront, onAfterFilter)
    if dropFront then
        itemFilter.run(itemsID, itemInList, itemNotInList, onAfterFilter)
    else
        itemFilter.run(itemsID, itemNotInList, itemInList, onAfterFilter)
    end
end
