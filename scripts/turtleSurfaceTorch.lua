
loadAPI("./lib/turtleLib")

function multiForward(step, breakableBlockdsIds)
    for i = 1, step do
        while turtleLib.forwardOrDigWhileCantBlockIds(breakableBlockdsIds) == false do
            turtleLib.upOrDigWhileCantBlockIds(breakableBlockdsIds)
        end
        repeat
        until turtleLib.downOrDigWhileCantBlockIds(breakableBlockdsIds) == false
    end
end

function putTorch(breakableBlockdsIds)
    -- place torch
    repeat    
    until turtleLib.downOrDigWhileCantBlockIds(breakableBlockdsIds) == false
    turtleLib.upOrDigWhileCantBlockIds(breakableBlockdsIds)
    -- select torch
    local torchSlotIndex = turtleLib.getItemsSlotIndex({"minecraft:torch"})
    if torchSlotIndex == nil then
        os.exit()
    end
    turtle.select(torchSlotIndex)
    turtle.placeDown()
end


function run(x_size, y_size, step, breakableBlocksIds)
    x_size = x_size / step
    y_size = y_size / step
    print("x_size: " .. x_size)
    print("y_size: " .. y_size)
    for y = 1, y_size do
        putTorch(breakableBlocksIds)
        for x = 1, x_size do
            multiForward(step, breakableBlocksIds)
            putTorch(breakableBlocksIds)
        end

        if y % 2 == 0 then
            turtle.turnRight()
            multiForward(step, breakableBlocksIds)
            turtle.turnRight()
        else
            turtle.turnLeft()
            multiForward(step, breakableBlocksIds)
            turtle.turnLeft()
        end
    end
end

local breakableBlocksIds = {
    "biomesoplenty:wildflower",
    "biomesoplenty:desert_grass",
    "minecraft:grass",
    "minecraft:tall_grass",
    "minecraft:oak_leaves",
}

run(128, 24, 6, breakableBlocksIds)