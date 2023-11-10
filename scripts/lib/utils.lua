function tableToString(tbl)
    local function serialize(tbl, level)
        local result = "{\n"
        local indent = string.rep("  ", level)

        for key, value in pairs(tbl) do
            result = result .. indent

            if type(key) == "string" then
                result = result .. '["' .. key .. '"]'
            else
                result = result .. "[" .. tostring(key) .. "]"
            end

            result = result .. " = "

            if type(value) == "table" then
                result = result .. serialize(value, level + 1)
            elseif type(value) == "string" then
                result = result .. '"' .. value .. '"'
            else
                result = result .. tostring(value)
            end

            result = result .. ",\n"
        end

        result = result .. string.rep("  ", level - 1) .. "}"
        return result
    end

    return serialize(tbl, 1)
end

function tableContainElement(liste, element)
    for _, valeur in ipairs(liste) do
        if valeur == element then
            return true
        end
    end
    return false
end