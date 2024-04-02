--[[
	C stack overflow bypass by @__europa
	weaktable detections fixed, still not an impenetrable bypass
	can absolutely be used to bypass skidded hookfunction detections though ;)
	thanks to these people for helping with detections:

	unlimited (@unlimited_objects)
	xnx (@xoifail)
	kar (@kaxr)
	ludi (@ludi.) -- especially ludi :)
]]

local _cache = {}
local blacklist = getgenv().blacklist or getgenv().CStackOverflowBypassBlacklist or {}

local info, print, warn, error = getrenv().debug.info, getrenv().print, getrenv().warn, getrenv().error;
local h;

local function checkincache(func)
	for i, v in _cache do
		if v[1] == func then
			return v
        elseif not v[1] then -- gc (__mode = "v")
            _cache[i] = nil
		end
	end
	return nil
end

local function insertincache(func, ofunc)
	local thetbl; thetbl = setmetatable({
		func,
		1,
		function(...)
			local cachevalue = thetbl;

			local __args = {pcall(h(ofunc), ...)}
			local bigerr = __args[2]

			if (bigerr ~= "cannot resume dead coroutine" and cachevalue[2] > 198) then
				task.spawn(cachevalue[4])
				return error("C stack overflow", 2)
			elseif bigerr == "cannot resume dead coroutine" or select(2, pcall(h(func))) == "cannot resume dead coroutine" then
				task.spawn(cachevalue[4])
				return error("cannot resume dead coroutine", 2)
			end
			task.spawn(cachevalue[4])

			if __args[1] then return select(2, unpack(__args)) end
			error(select(2, unpack(__args)), 2)
		end,
		function()
			table.remove(_cache, table.find(_cache, thetbl))
		end
	}, {__mode = "v"})

	table.insert(_cache, thetbl)
end

-- the actual hook
h = hookfunction(getrenv().coroutine.wrap, function(...)
	local fnc1 = ...

	if not checkcaller() and typeof(fnc1) == "function" and not table.find(blacklist, fnc1) then
		local cachevalue = checkincache(fnc1)
		if cachevalue then
			if cachevalue[2] == 195 then
				local newfunc = h(cachevalue[3])
				cachevalue[1], cachevalue[3] = newfunc, newfunc
				
				cachevalue[2] += 1
				return newfunc
			end

			local res = h(...)
			cachevalue[1] = res
			cachevalue[2] += 1

			return res
		else
			local res = h(...)
			insertincache(res, fnc1)

			return res
		end
	end

	return h(...)
end)
