-- C stack overflow bypass by @__europa
-- (should now no longer be detected in any capacity [except for (C) stack overflow checks which can be fixed by converting this code into the C side], please submit an issue if a detection is found)
-- thanks to unlimited, xnx, ka(x)r and ESPECIALLY ludi for helping with detections

-- Under maintenance to fix detection vector(s), hence https://github.com/FaithfulAC/universal-stuff/edit/main/c-stack-overflow-universal-bypass-EXPERIMENTIAL.lua

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
        func, -- for comparison
        1, -- for intervals of being wrapped
        (function(...) -- replacement function (to be wrapped)
            local cachevalue = thetbl;

            local __args = {pcall((h or coroutine.wrap)(ofunc), ...)}
            local bigerr = __args[2]

            -- safe check (end all be all)
            if (bigerr ~= "cannot resume dead coroutine" and cachevalue[2] > 198) then
                task.spawn(cachevalue[4])
                return error("C stack overflow", 2)
            elseif bigerr == "cannot resume dead coroutine" or select(2, pcall((h or coroutine.wrap)(func))) == "cannot resume dead coroutine" then
                task.spawn(cachevalue[4])
                return error("cannot resume dead coroutine", 2)
            end
            task.spawn(cachevalue[4])

            if __args[1] then return select(2, unpack(__args)) end
            error(select(2, unpack(__args)), 2)
        end),
        function() -- when wrapped function is called, this gc's the table... hopefully
            table.remove(_cache, table.find(_cache, thetbl))
        end
    }

    table.insert(_cache, thetbl)
end

-- the actual hook
h = hookfunction(getrenv().coroutine.wrap, function(...)
    local fnc1 = ...

    if not checkcaller() and type(fnc1) == "function" then
        local cachevalue = checkincache(fnc1)
        if cachevalue then
            if (cachevalue[2] > 194 and cachevalue[2] < 199) then
                local newfunc = h(cachevalue[3]) -- wrap the other function !!!

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
task.wait(2)
getgenv().IsHookingSafe = true

--[[
    local hook1; hook1 = hookmetamethod(game,"__namecall", function(...)
    return hook1(...)
end)
local hook2; hook2 = hookmetamethod(game,"__index", function(...)
    return hook2(...)
end)
local hook3; hook3 = hookmetamethod(game,"__newindex", function(...)
    return hook3(...)
end)
warn("Hooks loaded")
]]
