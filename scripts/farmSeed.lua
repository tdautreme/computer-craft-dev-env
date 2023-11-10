loadAPI("lib/turtleLib")
loadAPI("lib/turtleSquareExplore")

local seedIds = {
    "minecraft:wheat_seeds",
    "minecraft:carrot",
    "minecraft:potato",
    "minecraft:beetroot_seeds"
}

function process()
    -- Check if we have to release all items
    if turtle.detectUp() then
        print("Release items")
        -- release all items
        for i = 1, 16 do
            turtle.select(i)
            turtle.dropDown()
        end
        turtle.select(1)
    end
    -- Harvest
    if turtle.detectDown() then
        success, data = turtle.inspectDown()
        if success and data["state"]["age"] == 7 then
            -- check if we are full
            if not turtleLib.haveEmptySlot() then
                print("No empty slot, release items")
                seedSlotIndex = turtleLib.getItemsSlotIndex(seedIds)
                if seedSlotIndex ~= nil then
                    turtle.select(seedSlotIndex)
                else
                    turtle.select(16)
                end
                turtle.dropDown()
                turtle.select(1)
            end
            -- Harvest
            turtle.digDown()
        end
    end
    -- Plant
    if not turtle.detectDown() then
        turtle.digDown()

        -- Select seed
        seedSlotIndex = turtleLib.getItemsSlotIndex(seedIds)
        if seedSlotIndex ~= nil then
            turtle.select(seedSlotIndex)
            turtle.placeDown()
            turtle.select(1)
        end
    end
end

function main()
    -- print seed list
    print("Seed list:")
    for i = 1, #seedIds do
        print(seedIds[i])
    end
    turtleSquareExplore.run(process)
end

main()