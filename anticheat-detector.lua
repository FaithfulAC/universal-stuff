--[[
        detects whether a roblox game likely has an anticheat based off a couple of factors
        only really meant for advanced anticheats not the ones you see that are like .WalkSpeed ~= 16 or something like that
]]

if not (
                getgc
                and
                getupvalues
                and
                getconstants
                and
                getscripts
                and
                islclosure
                and
                getrawmetatable
                and
                isourclosure
                and
                getrenv
        ) then
        return warn("executor does not have necessary functions")
end

local Percentage = 0; -- max is 100, obviously

-- check 1: is there a function with a script global in nil or not equivalent to an instance
for i, v in getgc() do
        if typeof(v) == "function" and islclosure(v) and not isourclosure(v) then
                local fenv = getfenv(v)
                local src = debug.info(v, "s")
                
                if typeof(rawget(fenv, "script")) ~= "Instance" or rawget(fenv, "script").Parent == nil then
                        Percentage += 30
                        break
                end
                if src:find("ReplicatedFirst.") or src:find("Core") then
                        local found = false
                        for i, v in getscripts() do
                                if v:GetFullName() == src then
                                        found = true
                                        break
                                end
                        end

                        if not found then
                                Percentage += 15
                                break
                        end
                end
        end
end

-- check 2: is there a function with a game metamethod as an upvalue
local __namecall = getrawmetatable(game).__namecall
local __index = getrawmetatable(game).__index
local __newindex = getrawmetatable(game).__newindex

for i, v in getgc() do
        if typeof(v) == "function" and islclosure(v) and not isourclosure(v) then
                local upperbreak = false
                for _, v2 in getupvalues(v) do
                        if typeof(v2) == "function" and (v2 == __namecall or v2 == __index or v2 == __newindex) then
                                Percentage += 25
                                upperbreak = true
                                break
                        end
                end
                if upperbreak then
                        break
                end
        end
end

-- check 3: is there a function that appears to be in an obfuscated script/has a potential handshake involving bit32
for i, v in getgc() do
        if typeof(v) == "function" and islclosure(v) and not isourclosure(v) then
                if table.find(getupvalues(v), bit32.bxor) and #getconstants(v) > 30 then
                        local notnumber = false
                        for _, v2 in getconstants(v) do
                                if typeof(v2) ~= "number" then
                                        notnumber = true
                                        break
                                end
                        end
                        if not notnumber then
                                Percentage += 10
                                break
                        end
                end
        end
end

-- check 4: is there a function with getfenv as an upvalue or its function env as an upvalue
for i, v in getgc() do
        if typeof(v) == "function" and islclosure(v) and not isourclosure(v) then
                local upperbreak = false
                for i2, v2 in getupvalues(v) do
                        if (typeof(v2) == "table" and rawequal(v2, getfenv(v))) or (typeof(v2) == "function" and v2 == getfenv) then
                                Percentage += 20
                                upperbreak = true
                                break
                        end
                end
                if upperbreak then
                        break
                end
        end
end

-- check 5: is there a function that has itself as an upvalue (recursive function, typically used for stack overflow checks)
for i, v in getgc() do
        if typeof(v) == "function" and islclosure(v) and not isourclosure(v) and not debug.info(v, "s"):find("PlayerScripts.") then
                if table.find(getupvalues(v), v) then
                        Percentage += 7.5
                        break
                end
        end
end

-- check 6: is there a function that has constants restricted to higher security level scripts
local someconstants = { -- just to name a few
        "OpenScreenshotsFolder",
        "OpenVideosFolder",
        "LoadLocalAsset",
        "HttpGet",
        "OpenBrowserWindow",
}

for i, v in getgc() do
        if typeof(v) == "function" and islclosure(v) and not isourclosure(v) then
                local upperbreak = false
                for _, v2 in pairs(someconstants) do
                        if table.find(getconstants(v), v2) then
                                Percentage += 7.5
                                upperbreak = true
                                break
                        end
                end
                if upperbreak then
                        break
                end
        end
end

-- check 7: really stupid check that sifts thru scripts to see if any of them either have "anticheat" in the name or have special characters
local things = {"anticheat", "anti-cheat", "antiexploit", "anti-exploit", "detect"}
for i, v in getscripts() do
        local upperbreak = false
        for _, v2 in pairs(things) do
                if v.Name:lower():find(v2) then
                        Percentage += 15
                        upperbreak = true
                        break
                end
        end
        if upperbreak then
                break
        end
        if string.gsub(v.Name, "[%a%d%.()_ ]", "") ~= "" then -- special character detection (does not necessarily equate to an anticheat)
                warn(v)
                Percentage += 5
                break
        end
end

-- check 8: table with restricted metatable exists
for i, v in getgc(true) do
        if (typeof(v) == "table" or typeof(v) == "userdata") and getmetatable(v) and typeof(getmetatable(v)) ~= "table" and rawget(getrawmetatable(v), "__tostring") then
                Percentage += 10
                break
        end
end

-- check 9: game has adonis
for i, v in getgc() do
        if typeof(v) == "function" and islclosure(v) and not isourclosure(v) then
                local upperbreak = false
                for _, v2 in getconstants(v) do
                        if typeof(v2) == "string" and v2:find("Adonis_") then
                                Percentage += 15
                                upperbreak = true
                                break
                        end
                end
                if upperbreak then
                        break
                end
        end
end

if Percentage >= 100 then
        Percentage -= Percentage % 100
end

Percentage = tostring(Percentage) .. "%"
game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "anticheat likelihood",
        Text = "chance the game has an anticheat: " .. Percentage,
        Duration = 4
})
