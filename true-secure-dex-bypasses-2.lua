--[[
	https://youtu.be/PTVHOEFqlkw
	demo of true secure dex being (properly) used on some popular anticheat-specific games
]]

-- forks from universal bypasses by babyhamsta and obviously originally inspired by secure dex by babyhamsta
-- if you find any errors or detections in the logic of any of these hooks please submit an issue (or pull request if you're that dedicated)

--[[
	big thanks to:
	kaxr for indirectly helping make true secure dex as secure as it is
	ludi for his detectable but still applicable preloadasync hook
	babyhamsta for the original secure dex
]]

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

local GetDebugId = clonefunction(game.GetDebugId)
local IsDescendantOf = clonefunction(game.IsDescendantOf)
local org = compareinstances

local compareinstances = (org and function(ins1, ins2)
	if typeof(ins1) == typeof(ins2) and typeof(ins1) == "Instance" then
		return org(ins1, ins2)
	end
	
	return false
end)
	or function(ins1, ins2)
	return typeof(ins1) == typeof(ins2) and typeof(ins1) == "Instance" and GetDebugId(ins1) == GetDebugId(ins2)
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
local DexGui = Dex or Bypassed_Dex or CoreGui:FindFirstChild("RobloxGui") -- for textbox

repeat task.wait() until game:IsLoaded()

-- gcinfo / collectgarbage spoof
task.spawn(function()
	local ret, max, mini;
	
	max = gcinfo() + math.random(math.floor(gcinfo()/6), math.floor(gcinfo()/4))
	mini = gcinfo() - math.random(math.floor(gcinfo()/6), math.floor(gcinfo()/4))
	ret = gcinfo()

	local function decrease()
		for i = 1, 4 do
			ret = max - math.floor(((max - mini*1.25)*(i/4))+math.random(-20,20))
			task.wait(math.random(25,45)/1000)
		end
	end

	local range1 = Stats.InstanceCount
	local range2 = range1 + math.random(1000, 3000)

	task.spawn(function()
		while RunService.Heartbeat:Wait() do
			if ret > max + math.random(-50,50) then decrease() end
			
			ret += math.floor(math.random(range1,range2)/10000)
			game.ItemChanged:Wait()
			
			ret += math.random(2)
			game.ItemChanged:Wait()
			
			ret += 1
		end
	end)

	local h1; h1 = hookfunction(getrenv().gcinfo, function(...)
		if not checkcaller() then
			return ret
		end
		
		return h1(...)
	end)
	
	local h2; h2 = hookfunction(getrenv().collectgarbage, function(...)
		local cnt = ...

		if not checkcaller() and typeof(cnt) == "string" and string.split(cnt, "\0")[1] == "count" then
			return ret
		end

		return h2(...)
	end)
end)

-- memory spoof
task.spawn(function()
	local ret = Stats:GetTotalMemoryUsageMb()

	task.spawn(function()
		local switchoff = false
		
		while RunService.Heartbeat:Wait() do
			switchoff = not switchoff
			ret += (math.random(-2,2)/(if switchoff then 32 else 64)) - (math.random(-1,1)/2)

			task.wait(math.random(1,3)/90)
		end
	end)

	local h1; h1 = hookmetamethod(game,"__namecall", function(...)
		local self = ...
		local method = string.gsub(getnamecallmethod(), "^%u", string.lower)

		if not checkcaller() and compareinstances(self, Stats) and method == "getTotalMemoryUsageMb" then
			return ret
		end
		
		return h1(...)
	end)
	
	local h2; h2 = hookfunction(Stats.GetTotalMemoryUsageMb, function(...)
		local self = ...

		if not checkcaller() and compareinstances(self, Stats) then
			return ret
		end

		return h2(...)
	end)
end)

-- memorytag spoof (spoofs gui in accordance to each device)
task.spawn(function()
	local enum = Enum.DeveloperMemoryTag.Gui
	
	local function isGui(item)
		return
			typeof(item) == "EnumItem" and item == enum or
			typeof(item) == "string" and string.split(item, "\0")[1] == "Gui"
	end

	local ret = Stats:GetMemoryUsageMbForTag(enum)

	task.spawn(function()
		local switchoff = false
		
		while RunService.Heartbeat:Wait() do
			if math.random(1, 10) == 1 then
				switchoff = not switchoff
				ret += math.random(-2,2)/(if switchoff then 64 else 128) + (math.random(-1,1)/20)

				task.wait(math.random(1,3)/90)
			end
		end
	end)

	local h1; h1 = hookmetamethod(game,"__namecall", function(...)
		local self, newenum = ...
		local method = string.gsub(getnamecallmethod(), "^%u", string.lower)

		if not checkcaller() and compareinstances(self, Stats) and method == "getMemoryUsageMbForTag" and isGui(newenum) then
			return ret
		end

		return h1(...)
	end)
	
	local h2; h2 = hookfunction(Stats.GetTotalMemoryUsageMb, function(...)
		local self, arg = ...

		if not checkcaller() and compareinstances(self, Stats) and isGui(arg) then
			return ret
		end

		return h2(...)
	end)
end)

-- preloadasync spoof
task.spawn(function()
	local badnews = {
		"rbxassetid://472635937", "rbxassetid://472636337",
		"rbxassetid://476354004", "rbxassetid://475456048",
		"rbxassetid://472635774", "rbxassetid://483437370",
		"rbxassetid://1513966937"
	}

	local gametbl = {}
	local coreguitbl = {}

	ContentProvider:PreloadAsync({game}, function(a)
		table.insert(gametbl,a)
	end)
	ContentProvider:PreloadAsync({CoreGui}, function(a)
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
			if v == arg and table.find(tbl, v) == i then return true end

			if compareinstances(v, arg) then
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
		for i, v in pairs(tbl) do
			if type(v) ~= "string" and typeof(v) ~= "Instance" then
				return false
			end
		end
		return true
	end

	local h1; h1 = hookmetamethod(game,"__namecall", function(...)
		local self, tbl, fnc = ...
		local method = string.gsub(getnamecallmethod(), "^%u", string.lower)

		if not checkcaller() and compareinstances(self, ContentProvider) and method == "preloadAsync" and type(tbl) == "table" and (find(tbl, game) or find(tbl,CoreGui)) and safecheck(tbl) then
			local targettbl = {}
			
			for i, v in pairs(tbl) do
				if table.find(tbl, v) == i then
					if v == game then
						for _, v2 in pairs(randomizeTable(gametbl)) do
							table.insert(targettbl,v2)
						end
					elseif v == CoreGui then
						for _, v2 in pairs(randomizeTable(coreguitbl)) do
							table.insert(targettbl,v2)
						end
					elseif (typeof(v) == "string" or typeof(v) == "Instance") then
						table.insert(targettbl, v)
					end
				else
					rawset(tbl, i, v)
				end
			end

			return h1(self, targettbl, fnc)
		end

		return h1(...)
	end)

	local h2; h2 = hookfunction(ContentProvider.PreloadAsync, function(...)
		local self, tbl, fnc = ...

		if not checkcaller() and compareinstances(self, ContentProvider) and type(tbl) == "table" and (find(tbl,game) or find(tbl,CoreGui)) and safecheck(tbl) then
			local targettbl = {}
			
			for i, v in pairs(tbl) do
				if table.find(tbl, v) == i then
					if v == game then
						for _, v2 in pairs(randomizeTable(gametbl)) do
							table.insert(targettbl,v2)
						end
					elseif v == CoreGui then
						for _, v2 in pairs(randomizeTable(coreguitbl)) do
							table.insert(targettbl,v2)
						end
					elseif (typeof(v) == "string" or typeof(v) == "Instance") then
						table.insert(targettbl, v)
					end
				end
			end

			return h2(self, targettbl, fnc)
		end

		return h2(...)
	end)
end)

-- instancecount bypass
task.spawn(function()
	local org = Stats.InstanceCount
	
	game.DescendantAdded:Connect(function(ins) -- mark those under datamodel
		if not IsDescendantOf(ins, CoreGui) then
			ins = nil
			org += 1
		end
	end)
	
	game.DescendantRemoving:Connect(function(ins)
		if not IsDescendantOf(ins, CoreGui) then
			ins = nil
			task.wait(math.random())
			org -= 1
		end
	end)

	local h1; h1 = hookmetamethod(game,"__index", function(...)
		local self, arg = ...

		if not checkcaller() and compareinstances(self, Stats) and type(arg) == "string" then
			local res = h1(...)
			
			if string.split(string.gsub(arg, "^%u", string.lower), "\0")[1] == "instanceCount" and typeof(res) == "number" then
				return org
			end
			
			return res
		end
		
		return h1(...)
	end)

	local h2; h2 = hookfunction(getrenv().Instance.new, function(...) -- mark those under nil
		local result = h2(...)
		
		if not checkcaller() and typeof(result) == "Instance" and select(2,...) == nil then
			org += 1
		end

		return result
	end)
	
	local orgclone;
	
	local markup = function(...)
		local result = orgclone(...)
		
		if not checkcaller() and typeof(result) == "Instance" and result.Parent == nil then
			org += 1
		end

		return result
	end
	
	orgclone = hookfunction(game.Clone, markup)
	hookfunction(game.clone, markup)
	
	local h3; h3 = hookmetamethod(game, "__namecall", function(...)
		local self = ...
		local method = getnamecallmethod()
		
		if not checkcaller() and typeof(self) == "Instance" and (method == "Clone" or method == "clone") then
			return markup(...)
		end
		
		return h3(...)
	end)
end)

-- forked textbox bypass
task.spawn(function()
	local h1; h1 = hookmetamethod(game, "__namecall", function(...)
		local method = string.gsub(getnamecallmethod(), "^%u", string.lower);
		local self = ...

		if not checkcaller() then
			if compareinstances(self, UserInputService) and method == "getFocusedTextBox" then
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
		local self, arg = ...

		if not checkcaller() then
			if compareinstances(self, UserInputService) and (typeof(arg) == "string" and string.split(string.gsub(arg, "^%u", string.lower), "\0")[1] == "getFocusedTextBox") then
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
	local doobityVisible = true
	
	task.spawn(function() -- randomly auto set doobityVisible to true
		while task.wait(math.random()*3) do
			doobityVisible = true
		end
	end)
	
	local h1; h1 = hookmetamethod(game, "__namecall", function(...)
		local self, arg1, arg2 = ...
		local method = string.gsub(getnamecallmethod(), "^%u", string.lower)
		
		if not checkcaller() and compareinstances(self, StarterGui) and rawequal(arg1, "DevConsoleVisible") then
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
		
		if not checkcaller() and compareinstances(self, StarterGui) and rawequal(arg, "DevConsoleVisible") then
			return doobityVisible
		end
		
		return h2(...)
	end)
	
	local h3; h3 = hookfunction(StarterGui.SetCore, function(...)
		local self, arg1, arg2 = ...
		
		if not checkcaller() and compareinstances(self, StarterGui) and rawequal(arg1, "DevConsoleVisible") and rawequal(arg2, false) then
			doobityVisible = false
		end
		
		return h3(...)
	end)
end)

-- weaktable bypass
task.spawn(function()
	local list;
	local folder = Instance.new("Folder") -- if ur doing an instance count check look above ;)
	folder.Name = tostring(math.random())

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

				task.spawn(function()
					task.wait(math.random(5,8)/10)
					
					if Mode == "kv" then
						for i, v in pairs(res) do
							if
								(type(i) == "userdata" or typeof(i) == "table")
								and
								(type(v) == "userdata" or typeof(v) == "table")
							then
								rawset(res, i, nil)
								i, v = nil, nil
							end
						end
					elseif Mode == "v" then
						for i, v in pairs(res) do
							if type(v) == "userdata" or typeof(v) == "table" then
								rawset(res, i, nil)
								i, v = nil, nil
							end
						end
					elseif Mode == "k" then
						for i, v in pairs(res) do
							if type(i) == "userdata" or typeof(i) == "table" then
								rawset(res, i, nil)
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
