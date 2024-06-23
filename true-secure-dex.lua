-- v4! there are more than likely bugs, but future updates will make dex immune to rbxassetid:// style preloadasync attacks and better-looking ui

-- loadstring(game:HttpGet("https://raw.githubusercontent.com/FaithfulAC/universal-stuff/main/true-secure-dex.lua"))()
-- (quickLoad or quickload)("https://raw.githubusercontent.com/FaithfulAC/universal-stuff/main/true-secure-dex.lua")

local isfolder, makefolder, isfile, writefile, readfile =
	isfolder, makefolder, isfile, writefile, readfile;

local getgenv, gethui, getrenv, hookmetamethod, hookfunction, identifyexecutor =
	getgenv, gethui, getrenv, hookmetamethod, hookfunction, identifyexecutor;

local foldername = "TSDex"
local path = foldername .. "/lua-getproperties.lua"
local versionpath = foldername .. "/tsd-version.txt"

if not isfolder(foldername) then
	makefolder(foldername)
end

local newversion = game:HttpGet("https://raw.githubusercontent.com/FaithfulAC/TSD-script-storage/main/tsd-version.txt")
local notupdated = (newversion ~= readfile(versionpath))

-- variables to send to scripts
local Api, gets;

-- create lua getproperties file to use from for dex functions next time
if not (isfile(path) and not notupdated) then
	writefile(path, game:HttpGet("https://raw.githubusercontent.com/FaithfulAC/universal-stuff/main/lua-getproperties.lua"))
end

Api, gets = unpack(loadstring(readfile(path))())

getgenv().Dex = game:GetObjects("rbxassetid://17769765246")[1]
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

-- drag begin
local dragtarget = nil
local dragstart = nil
local startpos = nil
local uis = cloneref(game:GetService("UserInputService"))

local types = {
	Enum.UserInputType.MouseButton1,
	Enum.UserInputType.Touch
}

local types2 = {
	Enum.UserInputType.MouseMovement,
	Enum.UserInputType.Touch
}

local function updateInput(input)
	local delta = input.Position - dragstart
	local position = UDim2.new(
		dragtarget.Position.X.Scale, dragtarget.Position.X.Offset + delta.X,
		dragtarget.Position.Y.Scale, dragtarget.Position.Y.Offset + delta.Y
	)
	dragtarget.Position = position
end

for i, frame in pairs(Dex:GetChildren()) do
	if frame:IsA("Frame") and frame:FindFirstChild("Header") then
		local header = frame.Header
		if header:FindFirstChild("FrameName") then
			local label = header.FrameName 

			label.InputBegan:Connect(function(input)
				if table.find(types, input.UserInputType) and not dragtarget then
					dragtarget = frame
					dragstart = input.Position
					startpos = frame.Position
				end
			end)
			label.InputEnded:Connect(function(input)
				if table.find(types, input.UserInputType) and dragtarget == frame then
					dragtarget = nil
					dragstart, startpos = nil, nil
				end
			end)
		end
	end
end

uis.InputChanged:Connect(function(input)
	if table.find(types2, input.UserInputType) and dragtarget then
		updateInput(input)
	end
end)
-- drag end

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

	local data;
	if notupdated then
		if i == #scriptlist then
			writefile(versionpath, newversion)
		end
		data = game:HttpGet("https://raw.githubusercontent.com/FaithfulAC/TSD-script-storage/main" .. list[i])
		writefile(foldername .. list[i], data)
	else
		data = readfile(foldername .. list[i])

		if not data then
			data = game:HttpGet("https://raw.githubusercontent.com/FaithfulAC/TSD-script-storage/main" .. list[i])
			writefile(foldername .. list[i], data)
		end
	end

	local func = loadstring(data, "=" .. Script:GetFullName())
	setfenv(func, orgfenv) -- just in case

	task.spawn(func, Script, Api, gets)
end
