if getrenv and hookfunction and hookmetamethod then -- how to detect being ran on corescript plz
        loadstring(game:HttpGet("https://raw.githubusercontent.com/FaithfulAC/universal-stuff/main/true-secure-dex-bypasses.lua"))()
end

task.wait(.2)

-- it's broken, fuck! revert to babyhamsta's model i guess 😦
--getgenv().Dex = game:GetObjects("rbxassetid://14878398926")[1]

getgenv().Dex = game:GetObjects("rbxassetid://9352453730")[1]
Dex.Parent = (gethui and gethui() ~= game:GetService("CoreGui") and gethui()) or game:GetService("CoreGui").RobloxGui

do
    local characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    local name = ""

    for i = 1, math.random(10, 19) do
        local randint = math.random(#characters)
        name = name .. string.sub(characters, randint, randint)
    end

    Dex.Name = name
end
local orgfenv = getfenv()
orgfenv.script = nil

for i, Script in Dex:GetDescendants() do
    if Script.ClassName == "Script" or Script.ClassName == "LocalScript" then
        local func = loadstring(Script.Source) -- no source will be defined for detection/security purposes
        local literal = {script = Script}
        
        setfenv(func, setmetatable(literal, {
            __index = function(_, b) return orgfenv[b] or rawget(literal, b) end,
            __newindex = rawset -- yeah might as well 🙂
        }))
        
        task.spawn(func)
    end
end
