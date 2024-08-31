--[[
	i am planning to make this script a customizable script soon enough; this script will take in arguments such as:

	the stack limit in which to replace the wrapcount (default is 195)
	a list of functions to exclude from the hook (to avoid detections) or alternatively a list of specific functions that are the only ones to be hooked
	a boolean value for the above option of excluding/including functions
	an option to include only c functions or to also include lua functions (however lua functions could perhaps act as a wrapper for c functions watch out for that)
	2 custom errors that you can use to replace "C stack overflow" and "cannot resume dead coroutine"

	why? because nothing is detectable if you just bruteforce it enough
]]

--[[
	thanks to these people for helping with detections:

	unlimited (@unlimited_objects)
	daily (@daily3014)
	xnx (@xoifail)
	kar (@kaxr)
	ludi (@ludi.) -- especially ludi :)
]]

local pack, unpack = table.pack, unpack
local Cache = {}
local WrapHook;

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
			-- thanks almighty Daily3014 for the unpack correction
			local args = pack(pcall(WrapHook(func), ...))
			
			if not args[1] then
				local err = args[2]
				
				if err ~= "cannot resume dead coroutine" and New.WrapCount > 198 then
					task.spawn(New.Gc)
					return error("C stack overflow", 0)
				elseif err == "cannot resume dead coroutine" or select(2, pcall(WrapHook(wrapped))) == "cannot resume dead coroutine" then
					task.spawn(New.Gc)
					return error("cannot resume dead coroutine", 0)
				end
				
				task.spawn(New.Gc)
				return error(err, 0)
			end
			
			task.spawn(New.Gc)
			return unpack(args, 2, args.n)
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
			CacheTbl.WrapCount += 1
			
			if CacheTbl.WrapCount == 195 then
				local NewFunc = WrapHook(CacheTbl.ReplacementFunc)
				CacheTbl.Original, CacheTbl.ReplacementFunc = NewFunc, NewFunc
				CacheTbl.Wrapped = WrapHook(CacheTbl.Wrapped)
				
				return NewFunc
			elseif CacheTbl.WrapCount < 195 or CacheTbl.WrapCount > 198 then
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
