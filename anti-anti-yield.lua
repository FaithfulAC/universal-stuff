-- ...for one variation of an anti yield. not meant to be used too universally guys wink wink
-- ofc made by @__europa make issue for any bugs/logical errors

getgenv().protectedyieldfuncs = {} -- add to this table any functions you would not like to be waithook checked
local cache = setmetatable({}, {__mode = "v"}) -- mode prob not necessary, depends on thread/function property of garbage collection

local function findincache(thr)
    for i, v in pairs(cache) do
        if v[1] == thr then
            return v
        end
    end

    return false
end

local cr; cr = hookfunction(getrenv().coroutine.create, function(...)
    local func = ...
    if not checkcaller() and typeof(func) == "function" and table.find(protectedyieldfuncs, func) then
        local res = cr(...)
        table.insert(cache, {res, func})
        return res
    end

    return cr(...)
end)

local rs; rs = hookfunction(getrenv().coroutine.resume, function(...)
    local thr = ...
    if not checkcaller() and typeof(thr) == "thread" and findincache(thr) then
        local func = findincache(thr)[2]
        return pcall(func, select(2,...))
    end

    return rs(...)
end)

return protectedyieldfuncs
