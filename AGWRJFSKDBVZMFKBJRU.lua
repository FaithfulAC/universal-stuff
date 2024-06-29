--[[
TODO:
version string in introframe and about will be set to readfile tsdversion txt file
getcustomasset to be used for iconmap for even less detectability
]]

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
	task.spawn(loadstring(game:HttpGet("https://raw.githubusercontent.com/FaithfulAC/universal-stuff/main/true-secure-dex-bypasses.lua")), Dex)
end

local function GenerateRandomString(range1, range2)
    local characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
	local name = ""

	for i = 1, math.random(range1, range2) do
		local randint = math.random(#characters)
		name = name .. string.sub(characters, randint, randint)
	end
end

Dex.Name = GenerateRandomString(10, 15)

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

-- icon begin (check if device is on pc then do getcustomasset)
local Icon, Icon2;
local IconFolderPath = "TSDex/Icons/"
if not isfolder("TSDex/Icons") then makefolder("TSDex/Icons") end

local FileName;
if isfile(IconFolderPath .. "IconNames.txt") then
    FileName = readfile(IconFolderPath .. "IconNames.txt")
else
    writefile(IconFolderPath .. "IconNames.txt", GenerateRandomString(5, 20) .. ":" .. GenerateRandomString(5, 20))
    FileName = readfile(IconFolderPath .. "IconNames.txt")
end

--[[

---- IconMap ----
-- Image size: 2352px x 16px
-- Icon size: 16px x 16px
-- Padding between each icon: 0px
-- Padding around image edge: 0px
-- Total icons: 147 x 1 (147)

local Icon do
	local iconMap = "rbxasset://textures/ClassImages.png"
	local floor = math.floor

	function Icon(IconFrame,index)
		index = floor(index)
		local mapSize = Vector2.new(2352,16)
		local iconSize = 16

		local class = 'Frame'
		if type(IconFrame) == 'string' then
			class = IconFrame
			IconFrame = nil
		end

		if not IconFrame then
			IconFrame = Create(class,{
				Name = "Icon";
				BackgroundTransparency = 1;
				ClipsDescendants = true;
				Create('ImageLabel',{
					Name = "IconMap";
					Active = false;
					BackgroundTransparency = 1;
					Image = iconMap;
					Size = UDim2.new(mapSize.x/iconSize,0,mapSize.y/iconSize,0);
				});
			})
		end

		IconFrame.IconMap.Position = UDim2.new(-index,0,0,0)
		return IconFrame
	end
end

---- IconMap2 ----
-- Image size: 512px x 512px
-- Icon size: 16px x 16px
-- Padding between each icon: 0px
-- Padding around image edge: 0px
-- Total icons: 1000

local Icon2 do
	local iconMap2 = "rbxasset://textures/TagEditor/famfamfam.png"
	local floor = math.floor

	local iconDehash do
		-- 14 x 14, 0-based input, 0-based output
		local f=math.floor
		function iconDehash(h)
			return f(h/32%32),f(h%32)
		end
	end

	function Icon2(IconFrame,index)
		local row, col = iconDehash(index)
		local mapSize = Vector2.new(512,512)
		local iconSize = 16

		local class = 'Frame'
		if type(IconFrame) == 'string' then
			class = IconFrame
			IconFrame = nil
		end

		if not IconFrame then
			IconFrame = Create(class,{
				Name = "Icon";
				BackgroundTransparency = 1;
				ClipsDescendants = true;
				Create('ImageLabel',{
					Name = "IconMap2";
					Active = false;
					BackgroundTransparency = 1;
					Image = iconMap2;
					Size = UDim2.new(mapSize.x/iconSize,0,mapSize.y/iconSize,0);
				});
			})
		end

		IconFrame.IconMap2.Position = UDim2.new(-col,0,-row,0)
		return IconFrame
	end
end


]]

-- icon end

--local orgfenv = getfenv()

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
	--setfenv(func, orgfenv) -- just in case

	task.spawn(func, Script, Api, gets, Icon, Icon2)
end
