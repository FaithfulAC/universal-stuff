if getrenv and hookfunction and hookmetamethod then -- how to detect being ran on corescript plz
        loadstring(game:HttpGet("https://raw.githubusercontent.com/FaithfulAC/universal-stuff/main/true-secure-dex-bypasses.lua"))()
end

task.wait(.2)

getgenv().Dex = game:GetObjects("rbxassetid://14878398926")[1]

--getgenv().Dex = game:GetObjects("rbxassetid://9352453730")[1]
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

for i, Script in Dex:GetDescendants() do
    if Script.ClassName == "Script" or Script.ClassName == "LocalScript" then
        local func = loadstring(Script.Source, "=" .. Script:GetFullName())
        local literal = {script = Script}
        
        setfenv(func, setmetatable(literal, {
            __index = function(self, b) return rawget(literal, b) or orgfenv[b] end,
            __newindex = rawset -- yeah might as well 🙂
        }))
        
        task.spawn(func)
    end
end
