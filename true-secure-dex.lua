--[[
hey a rewrite of dex v4 (the model not the bypasses) is coming soon isnt that great guys
loadstring(game:HttpGet("https://raw.githubusercontent.com/FaithfulAC/universal-stuff/main/true-secure-dex.lua"))()
]]

local isfolder, makefolder, isfile, writefile, readfile =
	isfolder, makefolder, isfile, writefile, readfile;

local getgenv, gethui, getrenv, hookmetamethod, hookfunction, identifyexecutor =
	getgenv, gethui, getrenv, hookmetamethod, hookfunction, identifyexecutor;

-- will automatically run the script in an actor (commented because people can detect a random ass actor being inserted in replicatedfirst)

--[[
if (not (inparallel and inparallel())) and run_on_actor then
	local actor = Instance.new("Actor", game:GetService("ReplicatedFirst")) -- SOME executors require an actor be initialized before running. Wonder who that could be
	Instance.new("LocalScript", actor)
	task.wait()
	actor:FindFirstChildOfClass("LocalScript"):Destroy() -- absolutely undetected
	return run_on_actor(actor, game:HttpGet("https://raw.githubusercontent.com/FaithfulAC/universal-stuff/main/true-secure-dex.lua"))
end


-- alternatively if your executor does not require the actor be intialized before running, you can simply do

if (not (inparallel and inparallel())) and run_on_actor then
	return run_on_actor(Instance.new("Actor"), game:HttpGet("https://raw.githubusercontent.com/FaithfulAC/universal-stuff/main/true-secure-dex.lua"))
end
]]

-- bypasses will not load when the script is under an actor because the bypasses should have been loaded before running under an actor (otherwise hooks wont work)
local inActor = inparallel and inparallel()
local LoadBypasses = LoadBypasses or (...)
if LoadBypasses == nil and not inActor then LoadBypasses = true end

local folderName = "TSDex"
local path = folderName .. "/lua-getproperties.lua"
local versionPath = folderName .. "/tsd-version.txt"

if not isfolder(folderName) then
	makefolder(folderName)
end

local newVersion = game:HttpGet("https://raw.githubusercontent.com/FaithfulAC/TSD-script-storage/main/tsd-version.txt")
local notUpdated = (not isfile(versionPath)) or (newVersion ~= readfile(versionPath))

if notUpdated then
	writefile(versionPath, newVersion)
end

-- variables to send to scripts
local API, getPropertiesPayload;

-- create lua getproperties file to use from for dex functions next time
if not (isfile(path) and not notUpdated) then
	writefile(path, game:HttpGet("https://raw.githubusercontent.com/FaithfulAC/universal-stuff/main/lua-getproperties.lua"))
end

local imageAssets = {
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
for _, imageAsset in pairs(imageAssets) do
	if not isfile("TSDex/" .. imageAsset) then
		writefile("TSDex/" .. imageAsset, game:HttpGet("https://raw.githubusercontent.com/FaithfulAC/TSD-script-storage/refs/heads/main/DexAssets/" .. imageAsset))
	end
end

getgenv().cloneref = cloneref or function(...) return ... end

repeat task.wait() until isfile(path) and readfile(path)
API, getPropertiesPayload = unpack(loadstring(readfile(path))())

local DEX_ASSET = "rbxassetid://17769765246"

 -- for GetAssetFetchStatus bypass
if typeof(getgenv().AssetList) == "table" then
	table.insert(getgenv().AssetList, DEX_ASSET)
else
	getgenv().AssetList = {DEX_ASSET}
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
	task.spawn(loadstring(game:HttpGet("https://raw.githubusercontent.com/FaithfulAC/universal-stuff/main/true-secure-dex-bypasses.lua")), nil, parent, inActor)
end

task.wait(.2) -- give bypasses time to extract normal data and spoof around those ranges

if getcustomasset then
	local fileName = folderName .. "/DexV4.rbxm"
	
	if not isfile(fileName) then
		writefile(fileName, game:HttpGet("https://github.com/FaithfulAC/universal-stuff/raw/refs/heads/main/DexV4.rbxm"))
		repeat task.wait() until isfile(fileName)
	end
	
	getgenv().Dex = game:GetObjects(getcustomasset(fileName))[1]
else
	getgenv().Dex = game:GetObjects(DEX_ASSET)[1]
end

Dex.Parent = parent

-- update textlabel to new version
for i, v in pairs(Dex:GetDescendants()) do
	if v:IsA("TextLabel") and v.Name == "Version" then
		v.Text = "v" .. newVersion
	end
end

local function GenerateRandomString(range1, range2)
	local characters = "abcdefghijklmnopABCDEFGHIJKLMNOP" -- qrstuvwxyzQRSTUVWXYZ are excluded cuz less common lmao
	local name = ""

	for i = 1, math.random(range1, range2) do
		local randInt = math.random(#characters)
		name = name .. string.sub(characters, randInt, randInt)
	end

	return name
end

-- semi hide dex
Dex.Name = GenerateRandomString(7, 15)

-- drag begin
local dragTarget = nil
local dragStart = nil
local startPos = nil
local UserInputService = cloneref(game:GetService("UserInputService"))

local userInputTypes1 = {
	Enum.UserInputType.MouseButton1,
	Enum.UserInputType.Touch
}

local userInputTypes2 = {
	Enum.UserInputType.MouseMovement,
	Enum.UserInputType.Touch
}

local function updateInput(input)
	local delta = input.Position - dragStart
	local position = UDim2.new(
		startPos.X.Scale, startPos.X.Offset + delta.X,
		startPos.Y.Scale, startPos.Y.Offset + delta.Y
	)
	dragTarget.Position = position
end

for _, frame in pairs(Dex:GetChildren()) do
	if frame:IsA("Frame") and frame:FindFirstChild("Header") then
		local header = frame.Header
		if header:FindFirstChild("FrameName") then
			local label = header.FrameName 

			label.InputBegan:Connect(function(input)
				if table.find(userInputTypes1, input.UserInputType) and not dragTarget then
					dragTarget = frame
					dragStart = input.Position
					startPos = frame.Position
				end
			end)
			label.InputEnded:Connect(function(input)
				if table.find(userInputTypes1, input.UserInputType) and dragTarget == frame then
					dragTarget = nil
					dragStart, startPos = nil, nil
				end
			end)
		end
	end
end

UserInputService.InputChanged:Connect(function(input)
	if table.find(userInputTypes2, input.UserInputType) and dragTarget then
		updateInput(input)
	end
end)
-- drag end

-- local orgfenv = getfenv()

local scriptList = {
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

for i, storedScript in pairs(scriptList) do
	-- set the scripts found in github to files in TSDex folder, so the script runs faster next time
	local data;
	if notUpdated or (not isfile(folderName .. list[i])) then
		data = game:HttpGet("https://raw.githubusercontent.com/FaithfulAC/TSD-script-storage/main" .. list[i])
		writefile(folderName .. list[i], data)
	else
		data = readfile(folderName .. list[i])
	end

	local SCRIPT_FUNCTION = loadstring(data, "=" .. storedScript.Name)
	task.spawn(SCRIPT_FUNCTION, storedScript, API, getPropertiesPayload, inActor) -- sending data
end
