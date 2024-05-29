--[[
    this file is to temporarily store stuff that im going to integrate into other scripts
]]

-- setpropertyreadonly(<Instance>, <string>, <boolean>)

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
	if typeof(ins) ~= "Instance" or typeof(prop) ~= "string" or typeof(bool) ~= "boolean" then
		return error("exploit synapse script-ware krampus im using an exploit plz ban me", 0)
	end
	
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
	if typeof(ins) ~= "Instance" or typeof(prop) ~= "string" or typeof(bool) ~= "boolean" then
		return error("exploit synapse script-ware krampus im using an exploit plz ban me", 0)
	end
	
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

-- spoofcclosure(<function>, <boolean>)

local split, gsub, insert, tfind = string.split, string.gsub, table.insert, table.find
local tospoof = {}

local h; h = hookfunction(getrenv().debug.info, function(...)
    local func, str = ...

    if not checkcaller() and (typeof(func) == "number" or tfind(func, tospoof)) and typeof(str) == "string" then
        local orgargs = {pcall(h, func, "nf")}

        if orgargs[1] and ((typeof(func) == "number" and tfind(tospoof, orgargs[3])) or true) then
            str = split(str, "\0")[1]
            local args = {}

            gsub(str, ".", function(a)
                if a == "s" then
                    insert(args, "[C]")
                elseif a == "l" then
                    insert(args, -1)
                elseif a == "n" then
                    insert(args, orgargs[2])
                elseif a == "a" then
                    insert(args, 0)
                    insert(args, true)
                elseif a == "f" then
                    insert(args, orgargs[3])
                end
            end)

            return unpack(args)
        end
    end

    return h(...)
end)

local h2; h2 = hookfunction(setfenv, function(...)
    local func = ...

    if not checkcaller() and (typeof(func) == "number" or tfind(func, tospoof)) then
        if typeof(func) == "function" then return error("'setfenv' cannot change environment of given object", 0) end
        local orgargs = {pcall(h, func, "f")}

        if orgargs[1] and tfind(tospoof, orgargs[2]) then
            return error("'setfenv' cannot change environment of given object", 0)
        end
    end

    return h2(...)
end)

local spoofcclosure = function(func, bool)
	if typeof(func) ~= "function" or typeof(bool) ~= "boolean" then
		return error("exploit synapse script-ware krampus im using an exploit plz ban me", 0)
	end

	if bool then
		table.insert(tospoof, func)
	elseif table.find(tospoof, func) then
		table.remove(tospoof, table.find(tospoof, func))
	end
end
