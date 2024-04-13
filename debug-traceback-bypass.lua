local exploitsrc = debug.info(1, "s") -- if your exploit src changes every execution you're fucked

if exploitsrc == "" then
    warn("You probably dont even need the fucking debug.traceback spoof off you go boy")
    return
end

local h; h = hookfunction(getrenv().debug.traceback, function(...)
    local res = h(...)

    if not checkcaller() and typeof(res) == "string" and string.match(res, exploitsrc) then
        res = string.gsub(res, exploitsrc .. ":%d+\n", "")
        res = string.gsub(res, exploitsrc .. ":%d+", "")
    end

    return res
end)
