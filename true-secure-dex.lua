-- hey
local isfolder, makefolder, isfile, writefile, readfile =
	isfolder, makefolder, isfile, writefile, readfile;

local getgenv, gethui, getrenv, hookmetamethod, hookfunction, identifyexecutor =
	getgenv, gethui, getrenv, hookmetamethod, hookfunction, identifyexecutor;

local foldername = "TSDex"
local path = foldername .. "/lua-getproperties.lua"

if not isfolder(foldername) then
	makefolder(foldername)
end

-- variables to send to scripts
local Api, gets;

-- create lua getproperties file to use from for dex functions next time
if not isfile(path) then
	writefile(path, game:HttpGet("https://raw.githubusercontent.com/FaithfulAC/universal-stuff/main/lua-getproperties.lua"))
end

Api, gets = unpack(loadstring(readfile(path))())

getgenv().Dex = game:GetObjects("rbxassetid://14878398926")[1]
Dex.Parent = (gethui and gethui() ~= game:GetService("CoreGui") and gethui()) or game:GetService("CoreGui").RobloxGui

-- prevent solara from making the damn script error
if getrenv and hookmetamethod and hookfunction and not identifyexecutor():lower():find("solara") then
	task.spawn(loadstring(game:HttpGet("https://raw.githubusercontent.com/FaithfulAC/universal-stuff/main/true-secure-dex-bypasses.lua")))
end

do
	local characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
	local name = ""

	for i = 1, math.random(10, 19) do
		local randint = math.random(#characters)
		name = name .. string.sub(characters, randint, randint)
	end

	-- hide dex from plain sight
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
	[1] = "/Selection.lua",
	[2] = "/Explorer.lua",
	[3] = "/Properties.lua",
	[4] = "/Editor.lua"
}

for i, Script in pairs(scriptlist) do
	-- set the scripts found in github to files in TSDex folder, so the script runs faster next time
	local data = readfile(foldername .. list[i])

	if not data then
		data = game:HttpGet("https://raw.githubusercontent.com/FaithfulAC/TSD-script-storage/main" .. list[i])
		writefile(foldername .. list[i], data)
	end

	local func = loadstring(data, "=" .. Script:GetFullName())
	setfenv(func, orgfenv) -- just in case

	task.spawn(func, Script, Api, gets)
end
