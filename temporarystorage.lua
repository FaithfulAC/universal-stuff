--[[
    this file is to temporarily store stuff that im going to integrate into other scripts
]]

-- setpropertyreadonly(<Instance>, <string>, <bool>)

local spoofcache = {}
local split, format = string.split, string.format

local __newindex; __newindex = hookmetamethod(game, "__newindex", function(...)
	local self, prop = ...

	if not checkcaller() and typeof(self) == "Instance" and typeof(prop) == "string" then
		prop = split(prop, "\0")[1]

		for i, v in pairs(spoofcache) do
			if compareinstances(v.Instance, self) and prop == v.Property and pcall(__newindex, ...) then
				local message = format("Unable to assign property %s. Property is read only", prop)

				return error(message, 0)
			end
		end
	end

	return __newindex(...)
end)

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
