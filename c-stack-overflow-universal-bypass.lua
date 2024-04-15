--[[
	C stack overflow bypass (plz someone pull req with check of how many c closures the function is in) by @__europa
	there are 3+ unique vulnerabilities to this bypass excluding stack overflow checks
	i challenge whoever to bypass those vectors and do a pull request, bounty is 0 robux
	thanks to these people for helping with detections:

	unlimited (@unlimited_objects)
	xnx (@xoifail)
	kar (@kaxr)
	ludi (@ludi.) -- especially ludi :)
]]

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
			local args = {pcall(WrapHook(func), ...)}
			
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
			return select(2, unpack(args))
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
