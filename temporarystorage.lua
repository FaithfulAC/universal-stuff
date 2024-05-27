--[[
    this file is to temporarily store stuff that im going to integrate into other scripts
]]

-- setpropertyreadonly(<Instance>, <string>, <bool>)

local spoofcache = {}
local preventioncache = {}
local split, format, gsub, lower, upper = string.split, string.format, string.gsub, string.lower, string.upper

local __newindex; __newindex = hookmetamethod(game, "__newindex", function(...)
	local self, prop = ...

	if not checkcaller() and typeof(self) == "Instance" and typeof(prop) == "string" then
		prop = split(prop, "\0")[1]
		local checksub = false
			
		if pcall(function() return self[gsub(prop, "^%u", lower)] end) and self[gsub(prop, "^%u", lower)] == self[prop] then
			checksub = true
		end

		for i, v in pairs(spoofcache) do
			if compareinstances(v.Instance, self) and ((checksub and gsub(prop, "^%l", upper)) or prop) == v.Property then
				local message = format("Unable to assign property %s. Property is read only", prop)

				return error(message, 0)
			end
		end

		for i, v in pairs(preventioncache) do
			if compareinstances(v.Instance, self) and ((checksub and gsub(prop, "^%l", upper)) or prop) == v.Property then
				return;
			end
		end
	end

	return __newindex(...)
end)

-- will work only on properties that are by default not read-only
local setpropertyreadonly = function(ins, prop, bool)
	if bool then
		table.insert(spoofcache, {Instance = cloneref(ins), Property = prop})
	else
		for i, v in pairs(spoofcache) do
			if compareinstances(v.Instance, ins) then
				table.remove(spoofcache, i)
				break
			end
		end
	end
end

local setpropertyunchangeable = function(ins, prop, bool)
	if bool then
		table.insert(preventioncache, {Instance = cloneref(ins), Property = prop})
	else
		for i, v in pairs(preventioncache) do
			if compareinstances(v.Instance, ins) then
				table.remove(prevevntioncache, i)
				break
			end
		end
	end
end
