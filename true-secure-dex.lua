if getrenv and hookfunction and hookmetamethod and not identifyexecutor():lower():find("solara") then
	task.spawn(loadstring(game:HttpGet("https://raw.githubusercontent.com/FaithfulAC/universal-stuff/main/true-secure-dex-bypasses.lua")))
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
	if Script:IsA("BaseScript") then
		local func = loadstring(Script.Source, "=" .. Script:GetFullName())
		local RealFenv = {script = Script}

		local Fenv = setmetatable({}, {
			__index = function(_, key)
				return RealFenv[key] or getfenv()[key]
			end,
			__newindex = function(_, key, value)
				if RealFenv[key] == nil then
					getfenv()[key] = value
				else
					RealFenv[key] = value
				end
			end
		})

		setfenv(func, Fenv)
		task.spawn(func)
	end
end
