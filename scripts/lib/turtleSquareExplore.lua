loadAPI("./turtleLib")

function run(onBeforeMoveCallback)
    -- first step is to find a corner
    print("Fiding corner...")
    while not turtle.detect() do
        turtle.forward()
    end
    turtle.turnLeft()
    while not turtle.detect() do
        turtle.forward()
    end
    turtle.turnLeft()

    print("Start farm...")
    -- now we are in the corner, we can start the farm
    local side = false
    while true do
        repeat
            if onBeforeMoveCallback ~= nil then
                onBeforeMoveCallback()
            end
        until not turtle.forward()
        if not side then
            turtle.turnLeft()
        else
            turtle.turnRight()
        end

        if not turtle.forward() then -- if we are arrived to wall, reverse
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