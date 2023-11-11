loadAPI("lib/turtleLib")
loadAPI("lib/utils")

function onMove(onMoveCallback, iteration)
    if onMoveCallback ~= nil then
        onMoveCallback(iteration)
    end
end

function main(width, height, length, onMoveCallback)
    width = width - 1
    local ctrY = 0
    local ctrX = 0
    for z = 1, length do
        for y = 1 , height do
            -- turn
            if ctrY % 2 == 0 then
                turtle.turnLeft()
            else
                turtle.turnRight()
            end

            for x = 1, width do
                -- dig forward
                turtleLib.forwardOrDigWhileCant()
                onMove(onMoveCallback, ctrX)
                ctrX = ctrX + 1
            end

            -- turn reverse
            if ctrY % 2 == 0 then
                turtle.turnRight()
            else
                turtle.turnLeft()
            end

            -- dig down or up
            if y <= height - 1 then
                if z % 2 == 0 then
                    turtleLib.downOrDigWhileCant()
                    onMove(onMoveCallback, ctrX)
                else
                    turtleLib.upOrDigWhileCant()
                    onMove(onMoveCallback, ctrX)
                end  
            end
            ctrY = ctrY + 1
        end
        if z <= length - 1 then
            turtleLib.forwardOrDigWhileCant()
            onMove(onMoveCallback, ctrX)
        end
    end

    -- go to start position with good rotation too
    turtleLib.turnAround()
    -- reverse z
    for z = 1, length - 1 do
        turtleLib.forwardOrDigWhileCant()
        onMove(onMoveCallback, ctrX)
    end

    local heightXLength = height * length

    -- reverse y if needed
    if length % 2 ~= 0 then
        for y = 1, height - 1 do
            turtleLib.downOrDigWhileCant()
            onMove(onMoveCallback, ctrX)
        end
    end

    -- reverse X if needed
    if heightXLength % 2 ~= 0 then
        turtle.turnLeft()
        for x = 1, width do
            turtleLib.forwardOrDigWhileCant()
        end
        turtle.turnRight()
    end
    turtleLib.turnAround()
end

itemBlacklist = {
    "minecraft:cobblestone",
    "minecraft:dirt",
    "minecraft:gravel",
    "minecraft:granite",
    "minecraft:andesite",
    "minecraft:diorite",
    "minecraft:stone",
    "minecraft:flint",
    "minecraft:gravel",
    "minecraft:sand",
    "minecraft:sandstone",
    "minecraft:torch",
    "minecraft:bedrock",
    "minecraft:stone",
    "minecraft:cobbled_deepslate",
    "minecraft:tuff"
}

function onMoveHandler(iteration)
    if iteration % 10 == 0 then
        cleanInventory()
    end
end

function cleanInventory()
    for i = 1, 16 do
        turtle.select(i)
        item = turtle.getItemDetail()
        isInList = item ~= nil and utils.tableContainElement(itemBlacklist, item["name"])
        if isInList then
            turtle.dropDown()
        end
    end
    turtle.select(1)
end


local args = { ... }
main(args[1], args[2], args[3], onMoveHandler)