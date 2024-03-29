--[[
	https://youtu.be/PTVHOEFqlkw
	demo of true secure dex being (properly) used on some popular anticheat-specific games
]]

-- forks from universal bypasses by babyhamsta and obviously originally inspired by secure dex by babyhamsta
-- if you find any errors or detections in the logic of any of these hooks please submit an issue (or pull request if you're that dedicated)

--[[
	big thanks to:
	kaxr for indirectly helping make true secure dex as secure as it is
	ludi for his pretty detectable but still applicable preloadasync hook
	babyhamsta for the original secure dex
]]

-- safehookmetamethod (so stupid people don't pass invalid arguments)
-- loadstring(game:HttpGet("https://raw.githubusercontent.com/FaithfulAC/universal-stuff/main/safehookmetamethod.lua"))()

local GetDebugId = ((clonefunction and pcall(clonefunction, game.GetDebugId) and clonefunction(game.GetDebugId)) or game.GetDebugId)

local rawinsequal = compareinstances or rawinsequal or function(ins1, ins2)
	return typeof(ins1) == typeof(ins2) and typeof(ins1) == "Instance" and GetDebugId(ins1) == GetDebugId(ins2)
end

local DexOptions = ((getgenv and getgenv()) or getfenv()).DexOptions or {

	SpoofGcinfo = {
		Enabled = true,
		Waithook = false,
		Option = 1 -- can be 1 or 2 not both
	},

	SpoofMemory = {
		Enabled = true,
		Waithook = false,
		Namecall = true,
		Index = true
	},

	SpoofGuiMemory = {
		Enabled = true,
		Waithook = false,
		Namecall = true,
		Index = true
	},

	SpoofPreloadAsync = {
		Enabled = true,
		Waithook = false,
		Namecall = true,
		Index = true,
		Option = 1 -- 1 for realistic spoof 2 for function disabler
	},

	SpoofInstanceCount = {
		Enabled = true,
		Waithook = false
	},

	SpoofTextbox = {
		Enabled = true,
		Waithook = false,
		Namecall = true,
		Index = true
	},

	SpoofGuiObjects = {
		Enabled = true,
		Waithook = false,
		Namecall = true,
		Index = true,
		Option = 1 -- 1 or 2 or 3 for both
	},

	SpoofWeaktable = {
		Enabled = true,
		Waithook = false,
		Option = 3 -- 1 is engo newproxy spoof, 2 is setmetatable spoof, 3 for another setmetatable spoof
	}
}

-- smart! thank you sir babyhamsta
loadstring(game:HttpGet("https://raw.githubusercontent.com/Babyhamsta/RBLX_Scripts/main/Universal/CloneRef.lua", true))()

if not getgenv().InstanceList then
end

--[[if not getgenv().InstanceList then
	getgenv().InstanceList = setmetatable(getinstances(), {__mode = "v"})
end]]

local cloneref = cloneref
local hookmetamethod,hookfunction = hookmetamethod,hookfunction
local getrenv = getrenv or getfenv
local getgenv = getgenv or getfenv
local getnamecallmethod = getnamecallmethod
local getconnections = getconnections
local getgc = getgc
local checkcaller = checkcaller or function()
	return false
end

local plr = cloneref(game:GetService("Players").LocalPlayer or game:GetService("Players"):GetPropertyChangedSignal("LocalPlayer"):Wait())
local runs = cloneref(game:GetService("RunService"))
local stats = cloneref(game:GetService("Stats"))
local cgui = cloneref(game:GetService("CoreGui"))
local uis = cloneref(game:GetService("UserInputService"))
local guis = cloneref(game:GetService("GuiService"))
local cprovider = cloneref(game:GetService("ContentProvider"))
local pgui = cloneref(game:GetService("Players").LocalPlayer:FindFirstChildWhichIsA("PlayerGui"))
local gui = Dex or Bypassed_Dex or cgui:FindFirstChild("RobloxGui") -- for textbox

repeat task.wait() until game:IsLoaded()

-- gcinfo / collectgarbage spoof
task.spawn(function()
	local spooftbl = DexOptions.SpoofGcinfo
	if spooftbl.Enabled == false then return end
	local waithook = spooftbl.Waithook
	local chosen = spooftbl.Option

	-- option 1
	local option1 = function()
		local ret, max, mini
		if not waithook then
			max = gcinfo() + math.random(math.floor(gcinfo()/6), math.floor(gcinfo()/4))
			mini = gcinfo() - math.random(math.floor(gcinfo()/6), math.floor(gcinfo()/4))
			ret = gcinfo()

			local function decrease()
				for i = 1, 4 do
					ret = max - math.floor(((max - mini*1.25)*(i/4))+math.random(-20,20))
					task.wait(math.random(25,45)/1000)
				end
			end

			local range1 = stats.InstanceCount
			local range2 = range1 + math.random(1000, 3000)

			task.spawn(function()
				local heartbeat = runs.Heartbeat
				while heartbeat:Wait() do
					if ret > max + math.random(-50,50) then decrease() end
					ret += math.floor(math.random(range1,range2)/10000)
					game.ItemChanged:Wait()
					ret += math.random(2)
					game.ItemChanged:Wait()
					ret += 1
				end
			end)
		end

		local h1;h1=hookfunction(getrenv().gcinfo, function(...)
			if not checkcaller() then
				return if not waithook then ret else wait(9e9)
			end

			return h1(...)
		end)
		local h2;h2=hookfunction(getrenv().collectgarbage, function(...)
			local cnt = ...

			if not checkcaller() and type(cnt) == "string" and (cnt == "count" or cnt:sub(1,6) == "count\0") then
				return if not waithook then ret else wait(9e9)
			end

			cnt=nil
			return h2(...)
		end)
	end

	-- option 2
	local option2 = function()
		local mini = 800
		local max = 1200

		local num = if gcinfo() < max and gcinfo() > mini then math.random(mini - 18, mini + 24) else gcinfo()

		if gcinfo() > max then max = gcinfo(); mini = max - math.floor(math.random(3, 6)*100) end
		if gcinfo() < mini then mini = gcinfo(); max = mini + math.floor(math.random(3, 6)*100) end

		if not waithook then
			task.spawn(function()
				local rendered = runs.RenderStepped
				while rendered:Wait() do
					local int = math.random(4, 8)
					if num < max - math.random(10,30) then num = math.floor(num+int) game.ItemChanged:Wait() num += math.random(1,2) else
						num = math.floor(math.random(mini - 18, mini + 24))
						game.ItemChanged:Wait()
						num += 1
					end
				end
			end)
		end

		local h;h=hookfunction(getrenv().gcinfo, function(...)
			if not checkcaller() then
				return if not waithook then num else wait(9e9)
			end
			return h(...)
		end)
		local h2;h2=hookfunction(getrenv().collectgarbage, function(...)
			local cnt = ...

			if not checkcaller() and type(cnt) == "string" and (cnt == "count" or cnt:sub(1,6) == "count\0") then
				return if not waithook then num else wait(9e9)
			end

			cnt=nil
			return h2(...)
		end)
	end

	if chosen == 2 then
		option2()
	else
		option1() -- recommended
	end
end)

-- memory spoof
task.spawn(function()
	local spooftbl = DexOptions.SpoofMemory
	if spooftbl.Enabled == false then return end
	local waithook = spooftbl.Waithook

	if waithook then
		local h1;h1 = if not spooftbl.Namecall then nil else hookmetamethod(game,"__namecall", function(...)
			local self = ...
			local method = getnamecallmethod():gsub("^%u", string.lower)
			if not checkcaller() and rawinsequal(self, stats) and method == "getTotalMemoryUsageMb" then
				return wait(9e9)
			end
			self=nil
			return h1(...)
		end)
		local h2;h2 = if not spooftbl.Index then nil else hookfunction(stats.GetTotalMemoryUsageMb, function(...)
			local self = ...
			if not checkcaller() and rawinsequal(self, stats) then
				return wait(9e9)
			end
			self=nil
			return h2(...)
		end)
		return
	end

	local ret = stats:GetTotalMemoryUsageMb()

	task.spawn(function()
		local switchoff = false
		while game:GetService("RunService").RenderStepped:Wait() do
			switchoff = not switchoff
			ret += math.random(-2,2)/(if switchoff then 32 else 64) - (math.random(-1,1)/2)

			task.wait(math.random(1,3)/90)
		end
	end)

	local h1;h1 = if not spooftbl.Namecall then nil else hookmetamethod(game,"__namecall", function(...)
		local self = ...
		local method = getnamecallmethod():gsub("^%u", string.lower)

		if not checkcaller() and typeof(self) == "Instance" and rawinsequal(self, stats) and method == "getTotalMemoryUsageMb" then
			return ret
		end

		self=nil
		return h1(...)
	end)
	local h2;h2 = if not spooftbl.Index then nil else hookfunction(stats.GetTotalMemoryUsageMb, function(...)
		local self = ...

		if not checkcaller() and typeof(self) == "Instance" and rawinsequal(self, stats) then
			return ret
		end

		self=nil
		return h2(...)
	end)
end)

-- memorytag spoof (spoofs gui in accordance to each device)
task.spawn(function()
	local spooftbl = DexOptions.SpoofGuiMemory
	if spooftbl.Enabled == false then return end
	local waithook = spooftbl.Waithook

	local enumtag = Enum.DeveloperMemoryTag.Gui

	if waithook then
		local h1;h1 = if not spooftbl.Namecall then nil else hookmetamethod(game,"__namecall", function(...)
			local self, enum = ...
			local method = getnamecallmethod():gsub("^%u", string.lower)

			if not checkcaller() and rawinsequal(self, stats) and method == "getMemoryUsageMbForTag" and enum == enumtag then
				return wait(9e9)
			end

			self=nil
			return h1(...)
		end)
		local h2;h2 = if not spooftbl.Index then nil else hookfunction(stats.GetMemoryUsageMbForTag, function(...)
			local self, arg = ...

			if not checkcaller() and rawinsequal(self, stats) and arg == enumtag then
				return wait(9e9)
			end

			self=nil
			return h2(...)
		end)
		return
	end

	local ret = stats:GetTotalMemoryUsageMb()

	task.spawn(function()
		local switchoff = false
		while game:GetService("RunService").RenderStepped:Wait() do
			switchoff = not switchoff
			ret += math.random(-2,2)/(if switchoff then 64 else 128) + (math.random(-1,1)/20)

			task.wait(math.random(1,3)/90)
		end
	end)

	local h1;h1 = if not spooftbl.Namecall then nil else hookmetamethod(game,"__namecall", function(...)
		local self, enum = ...
		local method = getnamecallmethod():gsub("^%u", string.lower)

		if not checkcaller() and rawinsequal(self, stats) and method == "getMemoryUsageMbForTag" and enum == enumtag then
			return ret
		end

		self=nil
		return h1(...)
	end)
	local h2;h2 = if not spooftbl.Index then nil else hookfunction(stats.GetTotalMemoryUsageMb, function(...)
		local self, arg = ...

		if not checkcaller() and rawinsequal(self, stats) and arg == enumtag then
			return ret
		end

		self=nil
		return h2(...)
	end)
end)

-- preloadasync spoof
task.spawn(function()
	local spooftbl = DexOptions.SpoofPreloadAsync
	if spooftbl.Enabled == false then return end
	local waithook = spooftbl.Waithook
	local choice = spooftbl.Option

	local badnews = {
		"rbxassetid://472635937", "rbxassetid://472636337",
		"rbxassetid://476354004", "rbxassetid://475456048",
		"rbxassetid://472635774", "rbxassetid://483437370",
		"rbxassetid://1513966937"
	}

	local gametbl = {}
	local coreguitbl = {}

	cprovider:PreloadAsync({game}, function(a)
		table.insert(gametbl,a)
	end)
	cprovider:PreloadAsync({cgui}, function(a)
		table.insert(coreguitbl,a)
	end)

	for i, v in pairs(gametbl) do
		if table.find(badnews, v) then
			table.remove(gametbl, i)
		end
	end
	for i, v in pairs(coreguitbl) do
		if table.find(badnews, v) then
			table.remove(coreguitbl, i)
		end
	end

	local find = function(tbl, arg)
		if type(tbl) ~= "table" then return false end

		for i, v in pairs(tbl) do
			if v == arg then return true end

			if typeof(v) == typeof(arg) and typeof(arg) == "Instance" then
				if rawinsequal(v, arg) then
					return true
				end
			end
		end
		return false
	end

	if waithook then
		local h1;h1 = if not spooftbl.Namecall then nil else hookmetamethod(game,"__namecall", function(...)
			local self, tbl, fnc = ...
			local method = getnamecallmethod():gsub("^%u", string.lower)

			if not checkcaller() and rawinsequal(self, cprovider) and method == "preloadAsync" and type(tbl) == "table" and (find(tbl,game) or find(tbl,cgui)) then
				return wait(9e9)
			end

			self,tbl,fnc=nil,nil,nil
			return h1(...)
		end)

		local h2;h2 = if not spooftbl.Index then nil else hookfunction(cprovider.PreloadAsync, function(...)
			local self, tbl, fnc = ...
			local method = getnamecallmethod():gsub("^%u", string.lower)

			if not checkcaller() and rawinsequal(self, cprovider) and type(tbl) == "table" and (find(tbl,game) or find(tbl,cgui)) then
				return wait(9e9)
			end

			self,tbl,fnc=nil,nil,nil
			return h2(...)
		end)
		return
	end

	local randomizeTable = function(t) -- adultmouse
		local n = #t
		while n > 0 do
			local k = math.random(n)
			t[n], t[k] = t[k], t[n]
			n -= 1
		end
		return t
	end

	local safecheck = function(tbl)
		for i, v in pairs(tbl) do
			if type(v) ~= "string" and typeof(v) ~= "Instance" then
				return false
			end
		end
		return true
	end

	local option1 = function() -- probably detectable by checking assetfetchstatus but im no preloadasync pro so let's just stick with this
		local h1;h1 = if not spooftbl.Namecall then nil else hookmetamethod(game,"__namecall", function(...)
			local self, tbl, fnc = ...
			local method = getnamecallmethod():gsub("^%u", string.lower)

			if not checkcaller() and rawinsequal(self, cprovider) and method == "preloadAsync" and type(tbl) == "table" and (find(tbl, game) or find(tbl,cgui)) and safecheck(tbl) then
				local targettbl = {}
				for i, v in pairs(tbl) do
					if v == game then
						for _, v2 in pairs(randomizeTable(gametbl)) do
							table.insert(targettbl,v2)
						end
					elseif v == cgui then
						for _, v2 in pairs(randomizeTable(coreguitbl)) do
							table.insert(targettbl,v2)
						end
					elseif typeof(v) == "Instance" then -- whatever!
						h1({v}, function(a)
							table.insert(targettbl,a)
						end)
					elseif type(v) == "string" then
						table.insert(targettbl, v)
					end
				end

				return h1(self, targettbl, fnc)
			end

			self,tbl,fnc=nil,nil,nil
			return h1(...)
		end)

		local h2;h2 = if not spooftbl.Index then nil else hookfunction(cprovider.PreloadAsync, function(...)
			local self, tbl, fnc = ...

			if not checkcaller() and rawinsequal(self, cprovider) and type(tbl) == "table" and (find(tbl,game) or find(tbl,cgui)) and safecheck(tbl) then
				local targettbl = {}
				for i, v in pairs(tbl) do
					if v == game then
						for _, v2 in pairs(randomizeTable(gametbl)) do
							table.insert(targettbl,v2)
						end
					elseif v == cgui then
						for _, v2 in pairs(randomizeTable(coreguitbl)) do
							table.insert(targettbl,v2)
						end
					elseif typeof(v) == "Instance" then
						h2({v}, function(a)
							table.insert(targettbl,a)
						end)
					elseif type(v) == "string" then
						table.insert(targettbl, v)
					end
				end

				return h2(self, targettbl, fnc)
			end

			self,tbl,fnc=nil,nil,nil
			return h2(...)
		end)
	end

	local option2 = function()
		local namecall; namecall = if not spooftbl.Namecall then nil else hookmetamethod(game, "__namecall", function(...)
			local self = ...

			if not checkcaller() and rawinsequal(self, cprovider) then
				local args = {...}
				if getnamecallmethod() == "PreloadAsync" or getnamecallmethod() == "preloadAsync" then
					if typeof(args[2]) == "function" then
						hookfunction(args[2], function(asset) end)
					end
				end
			end
			return namecall(...)
		end)

		local index; index = if not spooftbl.Index then nil else hookfunction(cprovider.PreloadAsync, function(...)
			local self = ...

			if not checkcaller() and rawinsequal(self, cprovider) then
				local args = {...}

				if typeof(args[2]) == "function" then
					hookfunction(args[2], function(asset) end)
				end
			end
			return index(...)
		end)
	end
	if choice == 1 then option1() elseif choice == 2 then option2() end
end)

-- instancecount bypass
task.spawn(function()
	local spooftbl = DexOptions.SpoofInstanceCount
	if spooftbl.Enabled == false then return end
	local waithook = spooftbl.Waithook

	if waithook then
		local h1;h1=hookmetamethod(game,"__index", function(...)
			local self, arg = ...

			if not checkcaller() and rawinsequal(self, stats) and type(arg) == "string" and (arg == "InstanceCount" or string.sub(arg, 1, 14) == "InstanceCount\0" or (not stats:FindFirstChild("instanceCount") and (arg == "instanceCount" or string.sub(arg, 1, 14) == "instanceCount\0"))) then
				return wait(9e9)
			end

			self,arg=nil,nil
			return h1(...)
		end)
	end

	local org = stats.InstanceCount

	task.spawn(function()
		while task.wait() do
			org += math.random(-100, 101) -- this could use some improvement
		end
	end)

	local h1;h1 = hookmetamethod(game,"__index", function(...)
		local self, arg = ...

		if not checkcaller() and rawinsequal(self, stats) and type(arg) == "string" and (arg == "InstanceCount" or string.sub(arg, 1, 14) == "InstanceCount\0" or (not stats:FindFirstChild("instanceCount") and (arg == "instanceCount" or string.sub(arg, 1, 14) == "instanceCount\0"))) then
			return org
		end

		self,arg=nil,nil
		return h1(...)
	end)

	local h2;h2 = hookfunction(getrenv().Instance.new, function(...)
		local result = h2(...)
		if not checkcaller() and typeof(result) == "Instance" and not result:IsDescendantOf(cgui) then
			org += 1
		end

		return result
	end)
end)

-- forked textbox bypass
task.spawn(function()
	local spooftbl = DexOptions.SpoofTextbox
	if spooftbl.Enabled == false then return end
	local waithook = spooftbl.Waithook

	if waithook then
		local h1;h1 = if not spooftbl.Namecall then nil else hookmetamethod(game,"__namecall",function(...)
			local method = getnamecallmethod():gsub("^%u",string.lower);
			local self = ...

			if not checkcaller() then
				if rawinsequal(self, uis) and method == "getFocusedTextBox" then
					return wait(9e9)
				end
			end

			self=nil
			return h1(...)
		end)
		local h2;h2 = if not spooftbl.Index then nil else hookfunction(uis.GetFocusedTextBox, function(...)
			local self = ...

			if not checkcaller() and rawinsequal(self, uis) then
				return wait(9e9)
			end

			self=nil
			return h2(...)
		end)
		return
	end
	local _IsDescendantOf = (clonefunction and clonefunction(game.IsDescendantOf)) or game.IsDescendantOf

	local TextboxBypass
	TextboxBypass = if not spooftbl.Namecall then nil else hookmetamethod(game, "__namecall", function(...)
		local method = getnamecallmethod():gsub("^%u",string.lower);
		local self = ...
		local Textbox = TextboxBypass(...)

		if not checkcaller() then
			if rawinsequal(self, uis) and method == "getFocusedTextBox" then
				if Textbox and typeof(Textbox) == "Instance" then
					local _,err = pcall(_IsDescendantOf, Textbox, gui)

					if err and (type(err) == "boolean" and err == true) or (type(err) == "string" and err:lower():match("the current")) then
						return nil
					end
				end
			end
		end

		self=nil
		return Textbox
	end)

	local TextboxBypassIndex;TextboxBypassIndex = if not spooftbl.Index then nil else hookfunction(uis.GetFocusedTextBox, function(...)
		local self = ...
		local Textbox = TextboxBypassIndex(...)

		if not checkcaller() and rawinsequal(self, uis) then
			if Textbox and typeof(Textbox) == "Instance" then
				local _,err = pcall(_IsDescendantOf, Textbox, gui)

				if err and (type(err) == "boolean" and err == true) or (type(err) == "string" and err:lower():match("the current")) then
					return nil
				end
			end
		end

		self=nil
		return Textbox
	end)
end)

-- guiobjects spoof
task.spawn(function()
	local spooftbl = DexOptions.SpoofGuiObjects
	if spooftbl.Enabled == false then return end
	local waithook = spooftbl.Waithook
	local choice = spooftbl.Option -- no if waithook then section because would be too messy

	local choice1 = function()
		local stuff, stuff2

		if not pgui:FindFirstChild("TouchGui") then
			stuff = Instance.new("ScreenGui",pgui)
			stuff.Enabled = true
			stuff.Name = "TouchGui"
			stuff2 = Instance.new("Frame",stuff)
			stuff2.Name = "TouchControlFrame"
			stuff2.Size = UDim2.fromScale(1,1)
			stuff2.Visible = false
		else
			stuff = pgui:FindFirstChild("TouchGui")
			stuff.Enabled = true
			stuff2 = stuff:FindFirstChild("TouchControlFrame")
		end

		local mouse = game:GetService("Players").LocalPlayer:GetMouse()
		local max_X = mouse.ViewSizeX
		local max_Y = mouse.ViewSizeY
		mouse = nil;

		-- oh my god this looks so ugly

		local gh1;gh1 = if not spooftbl.Namecall then nil else hookmetamethod(game,"__namecall", function(...)
			local self, int, int2 = ...
			local method = getnamecallmethod():gsub("^%u", string.lower)

			if not checkcaller() and rawinsequal(self, pgui) and method == "getGuiObjectsAtPosition" then
				if type(int) == "number" and type(int2) == "number" then -- realism checks
					if int > 0 and int <= max_X and int2 <= max_Y and int2 > 0 then -- more realism checks
						return if not waithook then {stuff2, unpack(gh1(...))} else wait(9e9)
					end 
				end
			end

			self,int,int2=nil,nil,nil
			return gh1(...)
		end)
		local gh2;gh2 = if not spooftbl.Index then nil else hookfunction(pgui.GetGuiObjectsAtPosition, function(...)
			local arg,int,int2 = ...

			if not checkcaller() and arg == pgui then
				if type(int) == "number" and type(int2) == "number" then -- realism checks
					if int > 0 and int <= max_X and int2 <= max_Y and int2 > 0 then
						return if not waithook then {stuff2, unpack(gh2(...))} else wait(9e9)
					end 
				end
			end

			arg,int,int2=nil,nil,nil
			return gh2(...)
		end)
	end

	local choice2 = function()
		local guis = game:GetService("GuiService")

		for i, v in next, getconnections(guis.MenuClosed) do -- spoofconns maybe? ;)
			v:Disable()
		end

		local h;h=hookmetamethod(game,"__index", function(...)
			local self, arg = ...
			local _arg = (type(arg) == "string" and arg:gsub("^%u", string.lower)) or {sub = function() return "", 1 end}

			if not checkcaller() and rawinsequal(self, guis) and _arg == "menuIsOpen" or _arg:sub(1, 11) == "menuIsOpen\0" then
				return if not waithook then true else wait(9e9)
			end

			self,arg=nil,nil
			return h(...)
		end)
	end

	if choice == 1 then
		choice1()
	elseif choice == 2 then
		choice2()
	elseif choice == 3 then
		task.spawn(choice1)
		task.spawn(choice2)
	end
end)

-- forked weaktable detection bypass (semi improved upon)
task.spawn(function()
	local spooftbl = DexOptions.SpoofWeaktable
	if spooftbl.Enabled == false then return end
	local waithook = spooftbl.Waithook
	local choice = spooftbl.Option

	if waithook then
		local h; h = hookfunction(getrenv().newproxy, function(...)
			return if not checkcaller() then wait(9e9) else h(...)
		end)
		return
	end

	local option1 = function()
		local wktbl = {}
		local def = function()
			for i, v in pairs(wktbl) do
				if v == nil then end
			end
		end

		local SomethingOld;
		SomethingOld = hookfunction(getrenv().newproxy, function(...)
			local proxy = SomethingOld(...)
			table.insert(wktbl, proxy)

			return proxy
		end)

		runs.Stepped:Connect(def)
	end

	local option2 = function() -- this wont work if they set an empty table's metatable then assign values, which is why 3 is recommended
		local h; h = hookfunction(getrenv().setmetatable, function(...)
			local tbl1, tbl2 = ...
			if not checkcaller() and type(tbl1) == "table" and type(tbl2) == "table" and rawlen(tbl1) > 0 then
				local isMode = false

				for i, v in pairs(tbl2) do -- Member table.foreachi is deprecated :(
					if i == "__mode" and (type(v) == "string" and string.find(v, "v")) then isMode = true end
				end

				if isMode then
					local target = {}
					for i, v in pairs(tbl1) do
						if typeof(v) == "Instance" then
							v = cloneref(v)
							rawset(tbl1, i, v)
						end
					end

					return h(tbl1, tbl2)
				end
			end

			tbl1,tbl2=nil,nil
			return h(...)
		end)

		for i, v in getgc(true) do
			if type(v) == "table" and getrawmetatable(v) and type(getrawmetatable(v)) == "table" and type(rawget(getrawmetatable(v), "__mode")) == "string" and string.find(rawget(getrawmetatable(v), "__mode"), "v") then
				if table.isfrozen(v) then continue end
				task.wait()
				table.clear(v)
			end
		end
	end

	local option3 = function()
		local h; h = hookfunction(getrenv().setmetatable, function(...)
			local tbl1, tbl2 = ...

			if not checkcaller() and type(tbl1) == "table" and type(tbl2) == "table" --[[and rawlen(tbl1) > 0]] then
				local isMode = false
				local var = nil

				for i, v in pairs(tbl2) do
					if i == "__mode" and type(v) == "string" and string.find(v, "v") then var = v; isMode = true end
				end

				if isMode then
					local res = h(...)

					task.spawn(function()
						task.wait(math.random(5,8)/10)
						for i, v in pairs(res) do
							if type(v) == "userdata" or type(v) == "function" or type(v) == "table" then rawset(res, i, nil) end
						end
					end)

					return res
				end
			end

			tbl1,tbl2=nil,nil
			return h(...)
		end)

		for i, v in getgc(true) do
			if type(v) == "table" and getrawmetatable(v) and type(getrawmetatable(v)) == "table" and type(rawget(getrawmetatable(v), "__mode")) == "string" and string.find(rawget(getrawmetatable(v), "__mode"), "v") then
				if table.isfrozen(v) then continue end
				task.wait()
				table.clear(v)
			end
		end
	end

	if choice == 1 then
		option1()
	elseif choice == 2 then
		option2()
	elseif choice == 3 then
		option3()
	end
end)
