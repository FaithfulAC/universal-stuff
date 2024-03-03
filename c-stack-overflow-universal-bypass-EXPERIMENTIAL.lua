-- testing testing testing !!!

local _cache = {}

local info, print, warn, error = getrenv().debug.info, getrenv().print, getrenv().warn, getrenv().error;
local h;

local function checkincache(func)
    for i, v in pairs(_cache) do
        if v[1] == func then
            return v
        end
    end
    return nil
end



local function insertincache(func, ofunc)
    local thetbl; thetbl = {
        func,
        1,
        (function(...)
            local cachevalue = thetbl;

            local __args = {pcall((h or coroutine.wrap)(ofunc), ...)}
            local bigerr = __args[2]

            if bigerr ~= "cannot resume dead coroutine" and cachevalue[2] > 198 then
                task.spawn(cachevalue[4])
                return error("C stack overflow", 2)
            --[[elseif bigerr == "cannot resume dead coroutine" and select(2, pcall((h or coroutine.wrap)(func))) == "cannot resume dead coroutine" then
                task.spawn(cachevalue[4])
                return error("cannot resume dead coroutine", 2)]]
            end
            task.spawn(cachevalue[4])

            if __args[1] then return select(2, unpack(__args)) end
            error(select(2, unpack(__args)), 2)
        end),
        function()
            table.remove(_cache, table.find(_cache, thetbl))
        end
    }

    table.insert(_cache, thetbl)
end

h = hookfunction(getrenv().coroutine.wrap, function(...)
    local fnc1 = ...

    if not checkcaller() and type(fnc1) == "function" then
        local cachevalue = checkincache(fnc1)
        if cachevalue then
            if (cachevalue[2] > 194 and cachevalue[2] < 199) then
                local newfunc = h(cachevalue[3])

                cachevalue[1] = newfunc
                cachevalue[2] += 1
                cachevalue[3] = newfunc
                
                return newfunc
            end

            local res = h(...)
            cachevalue[1] = res
            cachevalue[2] += 1

            return res
        else
            local res = h(...)
            insertincache(res, fnc1)
            
            return res
        end
    end

    return h(...)
end)
