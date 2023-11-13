loadAPI("./turtleLib")

function run(onBeforeMoveCallback, breakableBlockIds)
    -- first step is to find a corner
    print("Fiding corner...")

    repeat   
    until not turtleLib.forwardOrDigWhileCantBlockIds(breakableBlockIds)
    turtle.turnLeft()
    repeat   
    until not turtleLib.forwardOrDigWhileCantBlockIds(breakableBlockIds)
    turtle.turnLeft()

    print("Start farm...")
    -- now we are in the corner, we can start the farm
    local side = false
    while true do
        repeat
            if onBeforeMoveCallback ~= nil then
                onBeforeMoveCallback()
            end
        until not turtleLib.forwardOrDigWhileCantBlockIds(breakableBlockIds)
        if not side then
            turtle.turnLeft()
        else
            turtle.turnRight()
        end

        if not turtleLib.forwardOrDigWhileCantBlockIds(breakableBlockIds) then -- if we are arrived to wall, reverse
            turtleLib.turnAround()
            side = not side
        end
        if not side then
            turtle.turnLeft()
        else
            turtle.turnRight()
        end
        side = not side
    end
end