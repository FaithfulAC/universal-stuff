-- loadstring(game:HttpGet("https://raw.githubusercontent.com/FaithfulAC/universal-stuff/main/true-secure-dex.lua"))()

if not getgenv().TSDBypassesOff then
	loadstring(game:HttpGet("https://raw.githubusercontent.com/FaithfulAC/universal-stuff/main/true-secure-dex-bypasses.lua"))()
end

task.wait(.2)

getgenv().Dex = game:GetObjects("rbxassetid://14878398926")[1]

Dex.Parent = (gethui and gethui() ~= game:GetService("CoreGui") and gethui()) or (pcall(function()
		game:GetService("CoreGui"):GetFullName()
	end) and game:GetService("CoreGui").RobloxGui) or game:GetService("Players").LocalPlayer and Instance.new("ScreenGui", game:GetService("Players").LocalPlayer.PlayerGui)

-- lol silly forking
local charset = {}
for i = 48,  57 do table.insert(charset, string.char(i)) end
for i = 65,  90 do table.insert(charset, string.char(i)) end
for i = 97, 122 do table.insert(charset, string.char(i)) end
function RandomCharacters(length)
	if length > 0 then
		return RandomCharacters(length - 1) .. charset[math.random(1, #charset)]
	else
		return ""
	end
end
Dex.Name = RandomCharacters(math.random(7,13))

local function Load(Obj, Url)
	local function GiveOwnGlobals(Func, Script)
		local Fenv = {}
		local RealFenv = {script = Script}
		local FenvMt = {}
		function FenvMt:__index(b)
			if RealFenv[b] == nil then
				return getfenv()[b]
			else
				return RealFenv[b]
			end
		end
		function FenvMt:__newindex(b, c)
			if RealFenv[b] == nil then
				getfenv()[b] = c
			else
				RealFenv[b] = c
			end
		end
		setmetatable(Fenv, FenvMt)
		setfenv(Func, Fenv)
		return Func
	end

	local function LoadScripts(Script)
		if Script.ClassName == "Script" or Script.ClassName == "LocalScript" then
			task.spawn(GiveOwnGlobals(loadstring(Script.Source, "=" .. Script:GetFullName()), Script))
		end
		for _,v in ipairs(Script:GetChildren()) do
			LoadScripts(v)
		end
	end

	LoadScripts(Obj)
end

Load(Dex)
