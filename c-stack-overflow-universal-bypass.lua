--[[
	btw i never actually tested if the customization options work i literally coded this in like 10 or 15 minutes so plz notify me if it no work
	how to customize the script:

	local args = { -- args should be a table
		StackThreshold = 195,
		StackThresholdMax = 198,
		error1 = "C stack overflow",
		error2 = "cannot resume dead coroutine",
		ExcludedFunctions = {},
		IncludedFunctions = {}, -- if there are any functions in this table then ExcludedFunctions will simply be disregarded
		IncludeLuaFunctions = true -- if there are any functions in IncludedFunctions then this will automatically be false
	}

	-- send in the args!
	loadstring(game:HttpGet("https://raw.githubusercontent.com/FaithfulAC/universal-stuff/main/c-stack-overflow-universal-bypass.lua"))(args)
]]

--[[
	thanks to these people for helping with detections:

	unlimited (@unlimited_objects)
	daily (@daily3014) -- fixing unpack() logic (and indirectly detections)
	xnx (@xoifail) -- detections
	kar (@kaxr) -- detections
	ludi (@ludi.) -- especially ludi for detections :)
]]

local args = (...) or { -- args should be a table
	StackThreshold = 195,
	StackThresholdMax = 198,
	error1 = "C stack overflow",
	error2 = "cannot resume dead coroutine",
	ExcludedFunctions = {},
	IncludedFunctions = {}, -- if there are any functions in this table then ExcludedFunctions will simply be disregarded
	IncludeLuaFunctions = true -- if there are any functions in IncludedFunctions then this will automatically be false
}

local stackThreshold = args.StackThreshold or 195
local stackThresholdMax = args.StackThresholdMax or 198
local firstError = args.error1 or "C stack overflow"
local secondError = args.error2 or "cannot resume dead coroutine"
local excludedFunctions = args.ExcludedFunctions or {}
local includedFunctions = args.IncludedFunctions or {}
local includeLuaFunctions = true; -- bool values can really screw things up

if (args.includeLuaFunctions ~= nil) then
	includeLuaFunctions = args.includeLuaFunctions;
end

local luaCacheFunctions = --[[setmetatable(]]{}--[[, {__mode = "v"}) -- while a weaktable is not completely reliable it helps mitigate most of the cor.wrap detections]]

if #includedFunctions > 0 then
	includeLuaFunctions = false
	table.clear(excludedFunctions)
end

local pack, unpack, info, find, error = table.pack, unpack, debug.info, table.find, getrenv().error;
local Cache = {}
local WrapHook;

local function CheckValidity(func)
	if (not includeLuaFunctions) and (info(func, "s") ~= "[C]" or table.find(luaCacheFunctions, func)) then
		return false
	elseif #includedFunctions > 0 and not find(includedFunctions, func) then
		return false
	elseif table.find(excludedFunctions, func) then
		return false
	end
	return true
end

local function IsInCache(func)
	for i, tbl in Cache do
		if tbl.Wrapped == func or tbl.ReplacementFunc == func then
			return tbl
		end
	end
	return nil
end

local function InsertInCache(func, wrapped)
	if typeof(func) ~= "function" or typeof(wrapped) ~= "function" then return end
	
	local New; New = {
		WrapCount = 1,
		Original = func,
		ReplacementFunc = function(...)
			local args = pack(pcall(WrapHook(func), ...))
			
			if not args[1] then
				local err = args[2]
				
				if err ~= "cannot resume dead coroutine" and New.WrapCount > stackThresholdMax then
					task.spawn(New.Gc)
					return error(firstError, 0)
				elseif err == "cannot resume dead coroutine" or select(2, pcall(WrapHook(wrapped))) == "cannot resume dead coroutine" then
					task.spawn(New.Gc)
					return error(secondError, 0)
				end
				
				task.spawn(New.Gc)
				return error(err, 0)
			end
			
			task.spawn(New.Gc)
			if #args <= 8000 then
				return unpack(args, 2, args.n)
			else
				return unpack(args, 2, 8000) -- this wont prevent select "#" detections but atleast it wont error
			end
		end,
		Wrapped = wrapped,
		Gc = function()
			table.remove(Cache, table.find(Cache, New))
		end,
	}
	
	table.insert(Cache, New)
end

WrapHook = hookfunction(getrenv().coroutine.wrap, function(...)
	local Target = ...
	
	if not checkcaller() and typeof(Target) == "function" then
		local CacheTbl = IsInCache(Target)
		
		if CacheTbl then
			local Validity = CheckValidity(Target)
			if not Validity then
				local res = h(...)
				
				if table.find(luaCacheFunctions, Target) then
					luaCacheFunctions[table.find(luaCacheFunctions, Target)] = res
				else
					table.insert(luaCacheFunctions, res)
				end
				
				return res;
			end
			CacheTbl.WrapCount += 1
			
			if CacheTbl.WrapCount == stackThreshold then
				local NewFunc = WrapHook(CacheTbl.ReplacementFunc)
				CacheTbl.Original, CacheTbl.ReplacementFunc = NewFunc, NewFunc
				CacheTbl.Wrapped = WrapHook(CacheTbl.Wrapped)
				
				return NewFunc
			elseif CacheTbl.WrapCount < stackThreshold or CacheTbl.WrapCount > stackThresholdMax then
				local NewFunc = WrapHook(CacheTbl.Wrapped)
				CacheTbl.Wrapped = NewFunc
				
				return NewFunc
			end
			
			local NewFunc = WrapHook(CacheTbl.ReplacementFunc)
			CacheTbl.Original, CacheTbl.ReplacementFunc = NewFunc, NewFunc
			CacheTbl.Wrapped = WrapHook(WrapHook(CacheTbl.Wrapped))
			
			return NewFunc
		else
			local arg = WrapHook(...)
			InsertInCache(Target, arg)
			
			return arg
		end
	end
	
	return WrapHook(...)
end)
