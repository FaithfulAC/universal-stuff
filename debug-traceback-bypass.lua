local exploitsrc = debug.info(1, "s") -- if your exploit src changes every execution you're fucked

local h; h = hookfunction(getrenv().debug.traceback, function(...)
    local res = h(...)

    if not checkcaller() and typeof(res) == "string" and string.match(res, exploitsrc) then
        if exploitsrc ~= "" then
            res = string.gsub(res, exploitsrc .. ":%d+\n", "")
            res = string.gsub(res, exploitsrc .. ":%d+", "")
        else
            res = string.gsub(res, exploitsrc .. "\n:%d+\n", "\n")
            res = string.gsub(res, exploitsrc .. "\n:%d+", "\n")
        end
    end

    return res
end)
