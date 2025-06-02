--[[
	how to load true secure dex (3 ways)
	first is normal way
	-- loadstring(game:HttpGet("https://raw.githubusercontent.com/FaithfulAC/universal-stuff/main/true-secure-dex.lua"))()

	second is with shortener (only for certain executors with expanded functions like macsploit)
	-- (quickLoad or quickload)("https://raw.githubusercontent.com/FaithfulAC/universal-stuff/main/true-secure-dex.lua")

	third is with run_on_actor for max security against weaktables (it is imperative you run certain tsd bypasses before running this in an actor)
	-- local f = Instance.new("Folder", game:GetService("CoreGui").RobloxGui)
	-- f.Name = "DexHost"
	-- loadstring(game:HttpGet("https://raw.githubusercontent.com/FaithfulAC/universal-stuff/main/true-secure-dex-bypasses.lua"))(nil, f, true)
	-- run_on_actor(Instance.new("Actor"), "local in_actor = true;\n\n" .. game:HttpGet("https://raw.githubusercontent.com/FaithfulAC/universal-stuff/main/true-secure-dex.lua"))

]]

local isfolder, makefolder, isfile, writefile, readfile =
	isfolder, makefolder, isfile, writefile, readfile;

local getgenv, gethui, getrenv, hookmetamethod, hookfunction, identifyexecutor =
	getgenv, gethui, getrenv, hookmetamethod, hookfunction, identifyexecutor;

--[[
-- will automatically run the script in an actor
if (not in_actor) and run_on_actor then
	return run_on_actor(Instance.new("Actor"), "local in_actor = true;\n\n" .. game:HttpGet("https://raw.githubusercontent.com/FaithfulAC/universal-stuff/main/true-secure-dex.lua"))
end
]]

-- bypasses will not load when the script is under an actor because the bypasses should have been loaded before running under an actor (otherwise hooks wont work)
local in_actor = in_actor or (inparallel and inparallel()) or false
local LoadBypasses = LoadBypasses or (...)
if LoadBypasses == nil and not in_actor then LoadBypasses = true end

local foldername = "TSDex"
local path = foldername .. "/lua-getproperties.lua"
local versionpath = foldername .. "/tsd-version.txt"

if not isfolder(foldername) then
	makefolder(foldername)
end

local newversion = game:HttpGet("https://raw.githubusercontent.com/FaithfulAC/TSD-script-storage/main/tsd-version.txt")
local notupdated = (not isfile(versionpath)) or (newversion ~= readfile(versionpath))

if notupdated then
	writefile(versionpath, newversion)
end

-- variables to send to scripts
local Api, gets;

-- create lua getproperties file to use from for dex functions next time
if not (isfile(path) and not notupdated) then
	writefile(path, game:HttpGet("https://raw.githubusercontent.com/FaithfulAC/universal-stuff/main/lua-getproperties.lua"))
end

local dexAssets = {
	"ClassImages.png",
	"arrowDown_dark.png",
	"arrowRight_dark.png",
	"blackBkg_square.png",
	"checkbox_checked_light.png",
	"checkbox_unchecked_disabled_light.png",
	"checkbox_unchecked_hover_light.png",
	"checkbox_unchecked_light.png",
	"famfamfam.png",
	"scroll-middle.png",
}

-- create asset files for getcustomasset if executor supports it
for _, dexAsset in pairs(dexAssets) do
	if not isfile("TSDex/"..dexAsset) then
		writefile("TSDex/"..dexAsset, game:HttpGet("https://raw.githubusercontent.com/FaithfulAC/TSD-script-storage/refs/heads/main/DexAssets/"..dexAsset))
	end
end

getgenv().cloneref = cloneref or function(...) return ... end

repeat task.wait() until isfile(path) and readfile(path)
Api, gets = unpack(loadstring(readfile(path))())

local DexAsset = "rbxassetid://17769765246"

 -- for GetAssetFetchStatus bypass
if typeof(getgenv().AssetList) == "table" then
	table.insert(getgenv().AssetList, DexAsset)
else
	getgenv().AssetList = {DexAsset}
end

-- global set compareinstances
local oldcompareinstances = compareinstances

getgenv().compareinstances = newcclosure(function(...)
	local a, b = ...

	if typeof(a) == "Instance" and typeof(a) == typeof(b) then
		return oldcompareinstances(a, b)
	end

	return false
end, "compareinstances")

local RobloxGui = game:GetService("CoreGui").RobloxGui
local parent;
if not RobloxGui:FindFirstChild("DexHost") then
	parent = Instance.new("Folder", RobloxGui)
	parent.Name = "DexHost"
else
	parent = RobloxGui:FindFirstChild("DexHost")
end

-- universal bypasses
if LoadBypasses and (getrenv and hookmetamethod and hookfunction) then
	task.spawn(loadstring(game:HttpGet("https://raw.githubusercontent.com/FaithfulAC/universal-stuff/main/true-secure-dex-bypasses.lua")), nil, parent, in_actor)
end

task.wait(.2) -- give bypasses time to extract normal data and spoof around those ranges

getgenv().Dex = game:GetObjects(DexAsset)[1]
Dex.Parent = parent

-- update textlabel to new version
for i, v in pairs(Dex:GetDescendants()) do
	if v:IsA("TextLabel") and v.Name == "Version" then
		v.Text = "v" .. newversion
	end
end

local function GenerateRandomString(range1, range2)
	local characters = "abcdefghijklmnopABCDEFGHIJKLMNOP" -- qrstuvwxyzQRSTUVWXYZ are excluded cuz less common lmao
	local name = ""

	for i = 1, math.random(range1, range2) do
		local randint = math.random(#characters)
		name = name .. string.sub(characters, randint, randint)
	end

	return name
end

-- semi hide dex
Dex.Name = GenerateRandomString(7, 15)

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
		startpos.X.Scale, startpos.X.Offset + delta.X,
		startpos.Y.Scale, startpos.Y.Offset + delta.Y
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

-- local orgfenv = getfenv()

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
	if notupdated or (not isfile(foldername .. list[i])) then
		data = game:HttpGet("https://raw.githubusercontent.com/FaithfulAC/TSD-script-storage/main" .. list[i])
		writefile(foldername .. list[i], data)
	else
		data = readfile(foldername .. list[i])
	end

	local func = loadstring(data, "=" .. Script.Name)
	task.spawn(func, Script, Api, gets, in_actor) -- sending data
end
