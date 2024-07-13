-- ...for one variation of an anti yield
--[[
add to the protectedyieldfuncs table any functions you would not like to be waithook checked
you could also additionally do a check for hookfunction before returning a yield by checking coroutine.isyieldable()
also mode is prob not necessary, depends on thread/function property of garbage collection
]]

getgenv().protectedyieldfuncs = {}
local cache = {}

local function findincache(thr)
    for i, v in pairs(cache) do
        if v.thread == thr then
            return v
        end
    end

    return false
end

local cr; cr = hookfunction(getrenv().coroutine.create, function(...)
    local func = ...
    if not checkcaller() and typeof(func) == "function" and table.find(protectedyieldfuncs, func) then
        local res = cr(...)
        table.insert(cache, setmetatable({thread = res, func = func}, {__mode = "v"})) -- wtf was i thinking
        return res
    end

    return cr(...)
end)

local rs; rs = hookfunction(getrenv().coroutine.resume, function(...)
    local thr = ...
    if not checkcaller() and typeof(thr) == "thread" and findincache(thr) then
        local func = findincache(thr).func
        return pcall(func, select(2,...))
    end

    return rs(...)
end)

return protectedyieldfuncs
