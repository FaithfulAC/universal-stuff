if getrenv and hookfunction and hookmetamethod and not identifyexecutor():lower():find("solara") then
	task.spawn(loadstring(game:HttpGet("https://raw.githubusercontent.com/FaithfulAC/universal-stuff/main/true-secure-dex-bypasses.lua")))
end

task.wait(.2)

-- hey
getgenv().Dex = game:GetObjects("rbxassetid://14878398926")[1]

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

local scriptlist = {
	[1] = Dex:FindFirstChild("SCRIPT_Selection"),
	[2] = Dex:FindFirstChild("SCRIPT_Explorer", true),
	[3] = Dex:FindFirstChild("SCRIPT_Properties", true),
	[4] = Dex:FindFirstChild("SCRIPT_Editor", true)
}

local list = {
	[1] = "Selection.lua",
	[2] = "Explorer.lua",
	[3] = "Properties.lua",
	[4] = "Editor.lua"
}

function GetScript(int)
	return scriptlist[int]
end

for i, Script in pairs(scriptlist) do
	local data = game:HttpGet("https://raw.githubusercontent.com/FaithfulAC/TSD-script-storage/main/" .. list[i])
	local func = loadstring(data, "=" .. Script:GetFullName())
	setfenv(func, getfenv(1)) -- just in case
	
	task.spawn(func, GetScript)
end
