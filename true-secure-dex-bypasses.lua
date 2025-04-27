-- inspiration from universal bypasses by babyhamsta and obviously originally inspired by secure dex by babyhamsta
-- if you find any errors or detections in the logic of any of these hooks please submit an issue (or pull request if you're that dedicated)

--[[
	made by @__europa
	big thanks to kaxr and babyhamsta
]]

-- so no invalid arguments for stuff like InstanceCount (not needed anymore i already check the string length)
--[[if not safehookmetamethod then
	loadstring(game:HttpGet("https://raw.githubusercontent.com/FaithfulAC/universal-stuff/main/safehookmetamethod.lua"))()
end]]

local clonefunction = clonefunc or clonefunction or function(...) return ... end
local cloneref = cloneref or function(...) return ... end
local hookmetamethod, hookfunction = hookmetamethod, hookfunction
local getrenv = getrenv or getfenv
local getgenv = getgenv or getfenv
local getnamecallmethod = getnamecallmethod
local getconnections = getconnections
local getgc = getgc
local getreg = getreg
local checkcaller = checkcaller or function() return false end
local iscclosure = iscclosure or function(func) return debug.info(func, "s") == "[C]" end
local isourclosure = isourclosure or isexecutorclosure or function(func) return rawequal(getfenv(func), getfenv()) end

local GetDebugId = clonefunction(game.GetDebugId)
local IsDescendantOf = clonefunction(game.IsDescendantOf)

local options = (...) or getgenv().DexOptions or getgenv().options or {
	gcinfo = true,
	GetTotalMemoryUsageMb = true,
	GetMemoryUsageMbForTag = true,
	PreloadAsync = true,
	InstanceCount = true,
	UI2DDrawcallCount = true,
	UI2DTriangleCount = true,
	GetFocusedTextBox = true,
	GuiObjects = true,
	Weaktable = true
}

local compareinstances = compareinstances or function(ins1, ins2)
	local identity;
	if getthreadidentity then identity = getthreadidentity() else identity = 2 end
	if setthreadidentity then setthreadidentity(8) end
	
	local bool = typeof(ins1) == typeof(ins2) and typeof(ins1) == "Instance" and GetDebugId(ins1) == GetDebugId(ins2)
	
	if setthreadidentity then setthreadidentity(identity) end
	return bool;
end

local Player = cloneref(game:GetService("Players").LocalPlayer or game:GetService("Players"):GetPropertyChangedSignal("LocalPlayer"):Wait())
local RunService = cloneref(game:GetService("RunService"))
local Stats = cloneref(game:GetService("Stats"))
local CoreGui = cloneref(game:GetService("CoreGui"))
local UserInputService = cloneref(game:GetService("UserInputService"))
local GuiService = cloneref(game:GetService("GuiService"))
local ContentProvider = cloneref(game:GetService("ContentProvider"))
local StarterGui = cloneref(game:GetService("StarterGui"))
local PlayerGui = cloneref(game:GetService("Players").LocalPlayer:FindFirstChildWhichIsA("PlayerGui"))
local DexGui = Dex or Bypassed_Dex or select(2, ...) or CoreGui:FindFirstChild("RobloxGui") -- for textbox and mem/inscount increase
repeat task.wait() until game:IsLoaded()

-- make DexGui be set to the folder parent so any more guis added under the folder will also have certain protections
if DexGui.Parent.Name == "DexHost" then
	DexGui = DexGui.Parent
end

if select(3, ...) == true and cloneref(game) ~= game then -- means script is under an actor and cloneref works as intended
	options.Weaktable = false -- it is under an actor, therefore it is under a different lua state; no weaktable spoofs are necessary
end

-- for realism of gcinfo, inscount, and memory spoofs
local gcinfo_ret, inscount_ret, memtag_ret, totalmem_ret, drawcall_ret, triangle_ret
	= gcinfo(), Stats.InstanceCount, Stats:GetMemoryUsageMbForTag("Gui"), Stats:GetTotalMemoryUsageMb(), Stats.UI2DDrawcallCount, Stats.UI2DTriangleCount;

local GetRandomMemoryIncrease = function()
	return ((math.random(1e7, 1e9)*1005)+.5)/1e14
end

local GuiClasses = { -- instances that can increase memory for gui
	TextLabel = GetRandomMemoryIncrease(),
	TextButton = GetRandomMemoryIncrease(),
	Frame = GetRandomMemoryIncrease(),
	VideoFrame = GetRandomMemoryIncrease(),
	ViewportFrame = GetRandomMemoryIncrease(),
	ScrollingFrame = GetRandomMemoryIncrease(),
	ImageLabel = GetRandomMemoryIncrease(),
	ImageButton = GetRandomMemoryIncrease()
}

if options.GetMemoryUsageMbForTag or options.InstanceCount then
	local GetDescendants = clonefunction(game.GetDescendants)
	
	game.DescendantAdded:Connect(function(ins) -- mark those under datamodel
		if not IsDescendantOf(ins, DexGui) then
			if GuiClasses[ins.ClassName] then
				memtag_ret += GuiClasses[ins.ClassName]
			end
			ins = nil
			inscount_ret += 1
		end
	end)

	game.DescendantRemoving:Connect(function(ins)
		if not IsDescendantOf(ins, DexGui) then
			local GuiReturn = GuiClasses[ins.ClassName]
			ins = nil
			task.wait(math.random())

			if GuiReturn then
				memtag_ret -= GuiReturn
			end
			inscount_ret -= 1
		
			if math.random(2) == 2 then -- for fun
				task.wait(math.random())
				inscount_ret -= 1
			end
		end
	end)

	local OrgClone;

	local markup = newcclosure(function(...)
		local result = OrgClone(...)

		if not checkcaller() and typeof(result) == "Instance" and result.Parent == nil then
			if GuiClasses[result.ClassName] then
				memtag_ret += GuiClasses[result.ClassName]
			end

			inscount_ret += #GetDescendants(result) + 1
		end

		return result
	end)

	OrgClone = hookfunction(game.Clone, markup)
	hookfunction(game.clone, markup)

	local CloneHook; CloneHook = hookmetamethod(game, "__namecall", function(...)
		local self = ...
		local method = getnamecallmethod()

		if not checkcaller() and typeof(self) == "Instance" and (method == "Clone" or method == "clone") then
			return markup(...)
		end

		return CloneHook(...)
	end)

	local InsCountHook, InsCountHook2;

	InsCountHook = hookfunction(getrenv().Instance.new, function(...)
		local result = InsCountHook(...)

		if not checkcaller() and typeof(result) == "Instance" then
			if GuiClasses[result.ClassName] then
				memtag_ret += GuiClasses[result.ClassName]
			end

			inscount_ret += 1
		end

		return result
	end)

	InsCountHook2 = hookfunction(getrenv().Instance.fromExisting, function(...)
		local result = InsCountHook2(...)

		if not checkcaller() and typeof(result) == "Instance" then
			if GuiClasses[result.ClassName] then
				memtag_ret += GuiClasses[result.ClassName]
			end

			inscount_ret += 1
		end

		return result
	end)
end

if options.UI2DDrawcallCount or options.UI2DTriangleCount then
	task.delay(math.random()*1.5, function() -- wait a little bit after dex loads in
		local OldDrawcall, OldTriangle = drawcall_ret, triangle_ret
		while task.wait(math.random()*1.5) do -- change it periodically
			drawcall_ret += math.random(-4, 4)
			triangle_ret += math.random(-4, 4)

			if math.random(10) == 10 then -- change it back to somewhere around the default
				drawcall_ret = math.abs(OldDrawcall + math.random(-8, 8))
				triangle_ret = math.abs(OldTriangle + math.random(-8, 8))
			end
		end
	end)
end

if options.gcinfo then
	local TableCreateHook;
	TableCreateHook = hookfunction(getrenv().table.create, function(...)
		local int, var = ...

		if not checkcaller() and typeof(int) == "number" and int > 0 and int <= 2^26 and var then
			gcinfo_ret += math.ceil(int/1000)
		end

		return TableCreateHook(...)
	end)
end

-- gcinfo / collectgarbage spoof
task.spawn(function()
	if not options.gcinfo then return end
	local max, mini;

	max = gcinfo() + math.random(math.floor(gcinfo()/5), math.floor(gcinfo()/2))
	mini = gcinfo() - math.random(math.floor(gcinfo()/5), math.floor(gcinfo()/2))
	gcinfo_ret = gcinfo()

	local function decrease()
		local maxfor = math.random(5, 9)
			
		for i = 1, maxfor do
			gcinfo_ret = max - math.floor(((max - mini*1.25)*(i/maxfor))+math.random(-30,30))
			task.wait(math.random(25,45)/1000)
		end
	end

	local range1 = Stats.InstanceCount
	local range2 = range1 + math.random(1000, 5000)

	task.spawn(function()
		while true do
			local delta = task.wait()
			local prev = tick()
			if gcinfo_ret > max + math.random(-50,50) then decrease() end

			gcinfo_ret += math.floor(math.random(range1,range2)/15000)
			repeat until tick()-prev > delta/2 -- wont freeze if the delta wait time is based on ur fps

			gcinfo_ret += math.random(0, math.floor(math.random(range1,range2)/15000))
			task.wait()

			gcinfo_ret += math.floor(math.random(range1,range2)/20000)
		end
	end)

	local h1; h1 = hookfunction(getrenv().gcinfo, function(...)
		if not checkcaller() then
			return gcinfo_ret
		end

		return h1(...)
	end)

	local h2; h2 = hookfunction(getrenv().collectgarbage, function(...)
		local cnt = ...

		if not checkcaller() and typeof(cnt) == "string" and string.split(cnt, "\0")[1] == "count" then
			return gcinfo_ret
		end

		return h2(...)
	end)
end)

-- memory spoof
task.spawn(function()
	if not options.GetTotalMemoryUsageMb then return end
	task.spawn(function()
		local switchoff = false

		while RunService.Heartbeat:Wait() do
			switchoff = not switchoff
			totalmem_ret += (math.random(-2,2)/(if switchoff then 32 else 64)) - (math.random(-1,1)/2)

			task.wait(math.random(1,3)/90)
		end
	end)

	local h1; h1 = hookmetamethod(game,"__namecall", function(...)
		local self = ...
		local method = string.gsub(getnamecallmethod(), "^%u", string.lower)

		if not checkcaller() and typeof(self) == "Instance" and compareinstances(self, Stats) and method == "getTotalMemoryUsageMb" then
			return totalmem_ret
		end

		return h1(...)
	end)

	local h2; h2 = hookfunction(Stats.GetTotalMemoryUsageMb, function(...)
		local self = ...

		if not checkcaller() and typeof(self) == "Instance" and compareinstances(self, Stats) then
			return totalmem_ret
		end

		return h2(...)
	end)
end)

-- memorytag spoof (spoofs gui in accordance to each device)
task.spawn(function()
	if not options.GetMemoryUsageMbForTag then return end
	local enum = Enum.DeveloperMemoryTag.Gui

	local function isGui(item)
		return
			(typeof(item) == "EnumItem" and item == enum) or
			(typeof(item) == "string" and string.split(item, "\0")[1] == "Gui")
	end

	task.spawn(function()
		local switchoff = false

		while RunService.Heartbeat:Wait() do
			if math.random(1, 10) < 3 then
				switchoff = not switchoff
				memtag_ret += math.random(-2,2)/(if switchoff then 64 else 128) + (math.random(-1,1)/20)

				task.wait(math.random(1,3)/90)
			end
		end
	end)

	local h1; h1 = hookmetamethod(game,"__namecall", function(...)
		local self, newenum = ...
		local method = string.gsub(getnamecallmethod(), "^%u", string.lower)

		if not checkcaller() and typeof(self) == "Instance" and compareinstances(self, Stats) and method == "getMemoryUsageMbForTag" and isGui(newenum) then
			return memtag_ret
		end

		return h1(...)
	end)

	local h2; h2 = hookfunction(Stats.GetMemoryUsageMbForTag, function(...)
		local self, arg = ...

		if not checkcaller() and typeof(self) == "Instance" and compareinstances(self, Stats) and isGui(arg) then
			return memtag_ret
		end

		return h2(...)
	end)
end)

-- preloadasync spoof
task.spawn(function()
	if not options.PreloadAsync then return end

	local gametbl = {}
	local coreguitbl = {}
	local dextbl = {}

	-- prevent GetAssetFetchStatus detection vectors on the dex model
	-- in order to have fully-undetected status you MUST do AssetList[#AssetList + 1] = ContentIdYouWantToHide
	local AssetList = AssetList or {"rbxassetid://17769765246"}
	local AssetReturns = {}

	for i, v in pairs(AssetList) do
		AssetReturns[v] = ContentProvider:GetAssetFetchStatus(v)
	end

	setmetatable(AssetList, {__newindex = function(a, b, c) rawset(AssetList, b, c) rawset(AssetReturns, c, ContentProvider:GetAssetFetchStatus(c)) end})

	ContentProvider:PreloadAsync({game}, function(a)
		table.insert(gametbl,a)
	end)
	ContentProvider:PreloadAsync({CoreGui}, function(a)
		table.insert(coreguitbl,a)
	end)
	ContentProvider:PreloadAsync({DexGui}, function(a)
		table.insert(dextbl,a)
	end)

	--[[
	-- commented out because preloadasyncing dexgui and directly comparing each assetid is probably more of a viable solution
	-- it also does not matter if every dex image id is loaded in, well, the reason why is obvious
	-- planning to make game.DescendantAdded checks soon

	for i, v in pairs(gametbl) do
		if table.find(badnews, v) and table.find(coreguitbl, v) then
			table.remove(gametbl, i)
		end
	end
	for i, v in pairs(coreguitbl) do
		if table.find(badnews, v) then
			table.remove(coreguitbl, i)
		end
	end

	--]]

	for i, v in pairs(dextbl) do
		local find1, find2 = table.find(gametbl, v), table.find(coreguitbl, v);
		if find1 then
			table.remove(gametbl, find1)
		end
		if find2 then
			table.remove(coreguitbl, find2)
		end
	end

	table.clear(dextbl);
	dextbl = nil;

	local find = function(tbl, arg)
		if type(tbl) ~= "table" then return false end

		for _, v in ipairs(tbl) do
			if rawequal(v, arg) then
				return true
			end

			if typeof(v) == "Instance" and compareinstances(v, arg) then
				return true
			end
		end

		return false
	end

	local randomizeTable = function(t)
		local n = #t
		while n > 0 do
			local k = math.random(n)
			t[n], t[k] = t[k], t[n]
			n -= 1
		end
		return t
	end

	local safecheck = function(tbl)
		for i, v in ipairs(tbl) do
			if type(v) ~= "string" and typeof(v) ~= "Instance" then
				return false
			end
		end
		return true
	end

	local h1; h1 = hookmetamethod(game,"__namecall", function(...)
		local self, tbl, fnc = ...
		local method = string.gsub(getnamecallmethod(), "^%u", string.lower)

		if not checkcaller() and typeof(self) == "Instance" and compareinstances(self, ContentProvider) then
			if method == "preloadAsync" and type(tbl) == "table" and (find(tbl, game) or find(tbl,CoreGui)) and safecheck(tbl) then
				local targettbl = {}

				for _, v in ipairs(tbl) do
					if typeof(v) == "Instance" then
						if compareinstances(v, game) then
							for _, v2 in pairs(randomizeTable(gametbl)) do
								table.insert(targettbl,v2)
							end
						elseif compareinstances(v, CoreGui) then
							for _, v2 in pairs(randomizeTable(coreguitbl)) do
								table.insert(targettbl,v2)
							end
						else
							table.insert(targettbl, v)
						end
					elseif typeof(v) == "string" then
						table.insert(targettbl, v)
					end
				end

				return h1(self, targettbl, fnc)
			elseif method == "getAssetFetchStatus" and type(tbl) == "string" then
				local str = string.split(tbl, "\0")[1] -- lol
				if tonumber(str) then
					str = "rbxassetid://" .. str
				end

				if table.find(AssetList, str) then
					return AssetReturns[str] or Enum.AssetFetchStatus.None
				end
			end
		end

		return h1(...)
	end)

	local h2; h2 = hookfunction(ContentProvider.PreloadAsync, function(...)
		local self, tbl, fnc = ...

		if not checkcaller() and typeof(self) == "Instance" and compareinstances(self, ContentProvider) and type(tbl) == "table" and (find(tbl,game) or find(tbl,CoreGui)) and safecheck(tbl) then
			local targettbl = {}

			for _, v in ipairs(tbl) do
				if typeof(v) == "Instance" then
					if compareinstances(v, game) then
						for _, v2 in pairs(randomizeTable(gametbl)) do
							table.insert(targettbl,v2)
						end
					elseif compareinstances(v, CoreGui) then
						for _, v2 in pairs(randomizeTable(coreguitbl)) do
							table.insert(targettbl,v2)
						end
					else
						table.insert(targettbl, v)
					end
				elseif typeof(v) == "string" then
					table.insert(targettbl, v)
				end
			end

			return h2(self, targettbl, fnc)
		end

		return h2(...)
	end)

	local h3; h3 = hookfunction(ContentProvider.GetAssetFetchStatus, function(...)
		local self, str = ...

		if not checkcaller() and typeof(self) == "Instance" and compareinstances(self, ContentProvider) and type(str) == "string" then
			str = string.split(str, "\0")[1]
			if tonumber(str) then
				str = "rbxassetid://" .. str
			end

			if table.find(AssetList, str) then
				return Enum.AssetFetchStatus.None
			end
		end

		return h3(...)
	end)

	--[[local templist = {} -- commented out cuz it SUCKS!!!

	for _, asset in pairs(AssetList) do
		for i, v in next, getconnections(ContentProvider:GetAssetFetchStatusChangedSignal(asset)) do
			v:Disable() -- if your executor is competent then a .Connected check should not detect this
			-- but we're still going to check for your executor's competency anyways :)
						
			if select(2, pcall(function() return v.Connected end)) == false then
				v:Enable() -- since .Connected checks do detect this we will re-enable it
				-- now we will resort to hooking the function connected to the signal

				-- lotta hacky checks here but we should never have to come to this if statement in the first place so whatever
				if (not table.find(templist, v.Function)) and not (iscclosure(v.Function) or isourclosure(v.Function)) then
					table.insert(templist, v.Function)
					-- yeah go ahead and detect this
					hookfunction(v.Function, function()end)
				end
			end
		end
	end

	table.clear(templist)]]
end)

-- instancecount bypass
task.spawn(function()
	if not (options.InstanceCount or options.UI2DDrawcallCount or options.UI2DTriangleCount) then return end
	local h1; h1 = hookmetamethod(game,"__index", function(...)
		local self, arg = ...

		if not checkcaller() and typeof(self) == "Instance" and compareinstances(self, Stats) and type(arg) == "string" and #arg < 256 then
			arg = --[[string.split(]]string.gsub(arg, "^%l", string.upper)--, "\0")[1]
			local res = h1(...)

			if typeof(res) == "number" then -- double check just in case
				if options.InstanceCount and arg == "InstanceCount" then return inscount_ret end
				if options.UI2DDrawcallCount and arg == "UI2DDrawcallCount" then return drawcall_ret end
				if options.UI2DTriangleCount and arg == "UI2DTriangleCount" then return triangle_ret end
			end

			return res
		end

		return h1(...)
	end)
end)

-- forked textbox bypass
task.spawn(function()
	if not options.GetFocusedTextBox then return end
	local h1; h1 = hookmetamethod(game, "__namecall", function(...)
		local method = string.gsub(getnamecallmethod(), "^%u", string.lower);
		local self = ...

		if not checkcaller() then
			if typeof(self) == "Instance" and compareinstances(self, UserInputService) and method == "getFocusedTextBox" then
				local Textbox = h1(...)

				if typeof(Textbox) == "Instance" then
					local _,err = pcall(IsDescendantOf, Textbox, DexGui)

					if err and (type(err) == "boolean" and err == true) or (type(err) == "string" and err:lower():match("the current")) then
						return nil
					end
				end

				return Textbox
			end
		end


		return h1(...)
	end)

	local h2; h2 = hookfunction(UserInputService.GetFocusedTextBox, function(...)
		local self = ...

		if not checkcaller() then
			if typeof(self) == "Instance" and compareinstances(self, UserInputService) then
				local Textbox = h2(...)

				if typeof(Textbox) == "Instance" then
					local _,err = pcall(IsDescendantOf, Textbox, DexGui)

					if err and (type(err) == "boolean" and err == true) or (type(err) == "string" and err:lower():match("the current")) then
						return nil
					end
				end

				return Textbox
			end
		end


		return h2(...)
	end)
end)

-- guiobjects circumnav. (you do a setcore to detect this and i kill you)
task.spawn(function()
	if not options.GuiObjects then return end
	local doobityVisible = true

	task.spawn(function() -- randomly auto set doobityVisible to true
		while task.wait(math.random()*3) do
			doobityVisible = true
		end
	end)

	local h1; h1 = hookmetamethod(game, "__namecall", function(...)
		local self, arg1, arg2 = ...
		local method = string.gsub(getnamecallmethod(), "^%u", string.lower)

		if not checkcaller() and typeof(self) == "Instance" and compareinstances(self, StarterGui) and rawequal(arg1, "DevConsoleVisible") then
			if method == "getCore" then
				return doobityVisible
			elseif method == "setCore" and rawequal(arg2, false) then
				doobityVisible = false
			end
		end

		return h1(...)
	end)

	local h2; h2 = hookfunction(StarterGui.GetCore, function(...)
		local self, arg = ...

		if not checkcaller() and typeof(self) == "Instance" and compareinstances(self, StarterGui) and rawequal(arg, "DevConsoleVisible") then
			return doobityVisible
		end

		return h2(...)
	end)

	local h3; h3 = hookfunction(StarterGui.SetCore, function(...)
		local self, arg1, arg2 = ...

		if not checkcaller() and typeof(self) == "Instance" and compareinstances(self, StarterGui) and rawequal(arg1, "DevConsoleVisible") and rawequal(arg2, false) then
			doobityVisible = false
		end

		return h3(...)
	end)
end)

-- weaktable bypass
task.spawn(function()
	if not options.Weaktable then return end
	local wrap = coroutine.wrap
	local remove = table.remove
	local isreadonly = isreadonly or table.isfrozen

	-- this exists so pcalling (ouch) c functions will not actually succeed (for the most part, stuff like gcinfo will succeed but will realistically not have a datamodel effect)
	local ReassuranceFunction = function() error("", 0) end
	local ReassuranceTable = setmetatable({}, {
		__eq = ReassuranceFunction,
		__tostring = ReassuranceFunction,
		__iter = ReassuranceFunction,
		__index = ReassuranceFunction,
		__newindex = ReassuranceFunction,
		__metatable = "The metatable is locked" -- for fun
	})
				
	--[[
	local list;
	local folder = Instance.new("Folder")
	folder.Name = tostring(math.random())

	-- this was intended to check an actual cache list but because i dont really have a proper executor at my disposal i cant properly test this smh
	for firstkey, host in pairs(getreg()) do
		if typeof(firstkey) == "userdata" and typeof(host) == "table" then
			for key, ins in pairs(host) do
				if (typeof(key) == "userdata" and typeof(ins) == "Instance") or ins == folder then
					list = host
				end
			end
		end
	end

	folder:Destroy()
	]]

	local CanBeCollected = function(obj)
		if (typeof(obj) == "function" and iscclosure(obj)) then
			local FuncName = debug.info(obj, "n")
			local HasName = (FuncName ~= "")

			-- we can deal with people ACTUALLY referencing instance function members when the commented code above works ;)
			return (HasName and select(2, pcall(wrap(obj))) == "Expected ':' not '.' calling member function " .. FuncName) or true;
		end
		return (typeof(obj) == "table" or type(obj) == "userdata")
	end

	local h; h = hookfunction(getrenv().setmetatable, function(...)
		local tbl1, tbl2 = ...

		if not checkcaller() and typeof(tbl1) == "table" and typeof(tbl2) == "table" then
			local Mode;
			if typeof(rawget(tbl2, "__mode")) == "string" then
				local temp = string.split(rawget(tbl2, "__mode"), "\0")[1]

				if string.find(temp, "v") and string.find(temp, "k") then
					Mode = "kv"
				elseif string.find(temp, "v") then
					Mode = "v"
				elseif string.find(temp, "k") then
					Mode = "k"
				end
			end

			if Mode then
				local res = h(...)
				local waitAmount = 30/gcinfo()

				if gcinfo() > 30000 then -- screw it
					waitAmount = 0
				end

				task.spawn(function()
					if waitAmount ~= 0 then task.wait(waitAmount) end
					
					if Mode == "kv" then
						for i, v in pairs(res) do
							if
								CanBeCollected(i)
								or -- i previously had this as (and) which was not accurate smh
								CanBeCollected(v)
							then
								local wasfrozen = isreadonly(res)
								if wasfrozen and setreadonly then
									setreadonly(res, false)
								end

								rawset(res, i, nil)

								if wasfrozen and setreadonly then
									setreadonly(res, true)
								end
								i, v = nil, nil
							end
						end
					elseif Mode == "v" then
						for i, v in pairs(res) do
							if CanBeCollected(v) then
								local wasfrozen = isreadonly(res)
								if wasfrozen and setreadonly then
									setreadonly(res, false)
								end

								rawset(res, i, nil)

								if wasfrozen and setreadonly then
									setreadonly(res, true)
								end
								i, v = nil, nil
							end
						end
					elseif Mode == "k" then
						for i, v in pairs(res) do
							if CanBeCollected(i) then
								local wasfrozen = isreadonly(res)
								if wasfrozen and setreadonly then
									setreadonly(res, false)
								end

								rawset(res, i, nil)

								if wasfrozen and setreadonly then
									setreadonly(res, true)
								end
								i, v = nil, nil
							end
						end
					end
				end)

				return res
			end
		end

		return h(...)
	end)
end)
