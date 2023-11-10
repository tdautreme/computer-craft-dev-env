loadAPI("./utils")

function digWhileCan()
    while (turtle.dig()) do end
end

function digUpWhileCan()
    while (turtle.digUp()) do end
end

function digDownWhileCan()
    while (turtle.digDown()) do end
end

function forwardOrDigWhileCant()
    while (not turtle.forward()) do
        digWhileCan()
    end
end

function upOrDigWhileCant()
    while (not turtle.up()) do
        digUpWhileCan()
    end
end

function downOrDigWhileCant()
    while (not turtle.down()) do
        digDownWhileCan()
    end
end

function turnAround()
    turtle.turnRight()
    turtle.turnRight()
end

function getFuelMissing()
    local fuelLevel = turtle.getFuelLevel()
    if fuelLevel == "unlimited" then
        return 0
    end
    local fuelLimit = turtle.getFuelLimit()
    local fuelMissing = fuelLimit - fuelLevel
    return fuelMissing
end

function getItemSlotIndex(itemId)
    oldSlotId = turtle.getSelectedSlot()
    result = nil
    for i = 1, 16 do
        turtle.select(i)
        item = turtle.getItemDetail()
        if item ~= nil and item["name"] == itemId then
            turtle.select(oldSlotId)
            result = i
            break
        end
    end
    turtle.select(oldSlotId)
    return result
end


function getItemsSlotIndex(itemIdsList)
    oldSlotId = turtle.getSelectedSlot()
    result = nil
    for i = 1, 16 do
        turtle.select(i)
        item = turtle.getItemDetail()
        if item ~= nil then
            if utils.tableContainElement(itemIdsList, item["name"]) then
                turtle.select(oldSlotId)
                result = i
                break
            end
        end
        if result ~= nil then
            break
        end
    end
    turtle.select(oldSlotId)
    return result
end

function getEmptySlotCount()
    local result = 0
    for i = 1, 16 do
        turtle.select(i)
        if turtle.getItemDetail() == nil then
            result = result + 1
        end
    end
    return result
end

function haveEmptySlot()
    for i = 1, 16 do
        turtle.select(i)
        if turtle.getItemDetail() == nil then
            return true
        end
    end
    return false
end