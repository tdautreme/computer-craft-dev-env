loadAPI("lib/turtleLib")

function onMove(onMoveCallback)
    if onMoveCallback ~= nil then
        onMoveCallback()
    end
end

function main(width, height, length, onMoveCallback)
    width = width - 1
    local ctrY = 0
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
                onMove(onMoveCallback)
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
                    onMove(onMoveCallback)
                else
                    turtleLib.upOrDigWhileCant()
                    onMove(onMoveCallback)
                end  
            end
            ctrY = ctrY + 1
        end
        if z <= length - 1 then
            turtleLib.forwardOrDigWhileCant()
            onMove(onMoveCallback)
        end
    end

    -- go to start position with good rotation too
    turtleLib.turnAround()
    -- reverse z
    for z = 1, length - 1 do
        turtleLib.forwardOrDigWhileCant()
        onMove(onMoveCallback)
    end

    local heightXLength = height * length

    -- reverse y if needed
    if length % 2 ~= 0 then
        for y = 1, height - 1 do
            turtleLib.downOrDigWhileCant()
            onMove(onMoveCallback)
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

local args = { ... }
main(args[1], args[2], args[3])