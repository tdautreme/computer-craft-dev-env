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