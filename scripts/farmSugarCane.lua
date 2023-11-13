loadAPI("lib/turtleLib")
loadAPI("lib/turtleSquareExplore")

function process()
    if turtle.detectUp() then
        print("Release items")
        -- release all items
        for i = 1, 16 do
            turtle.select(i)
            turtle.dropDown()
        end
        turtle.select(1)
    end

    -- place sugar can
    turtle.select(1)
    turtle.placeDown()
end

function main()
    local breakableBlocksIds = {
        "minecraft:sugar_cane"
    }
    turtleSquareExplore.run(process, breakableBlocksIds)
end

main()