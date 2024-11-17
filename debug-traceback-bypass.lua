local exploitsrc = debug.info(1, "s") -- if your exploit src changes every execution you're fucked
local split, match, gsub = string.split, string.match, string.gsub

local h; h = hookfunction(getrenv().debug.traceback, function(...)
    local res = h(...)

    if not checkcaller() and typeof(res) == "string" and string.match(res, exploitsrc) then
        res = split(res, "\n")
        res[1] = nil -- remove this hookfunction func trace
        res = table.concat(res, "\n") .. "\n"
        if exploitsrc ~= "" then
            res = gsub(res, exploitsrc .. ":%d+\n", "")
            res = gsub(res, exploitsrc .. ":%d+", "")
        else
            res = gsub(res, exploitsrc .. "\n:%d+\n", "\n")
            res = gsub(res, exploitsrc .. "\n:%d+", "\n")
        end
    end

    return res
end)
