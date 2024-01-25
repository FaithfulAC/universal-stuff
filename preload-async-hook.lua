-- made by @__europa
-- this script is in beta and probably doesn't work, expect bugs regardless

local cloneref = cloneref or function(...)
	return ...
end

local clonefunction = clonefunction or function(...)
	return ...
end

local GetDebugId = clonefunction(game.GetDebugId)

local isrestrictedinstance = function(ins)
	local res = select(2, pcall(GetDebugId, ins))

	return type(res) == "string" and string.find(res, "The current")
end

local iscoreguipresent = false;

local iscoregui = function(ins) -- to be used in the hooks
	local res = select(2, pcall(GetDebugId, ins))

	return type(res) == "string" and string.find(res, "CoreGui") and string.find(res, "The current")
end

local compareinstances = function(a, b)
	return typeof(a) == typeof(b) and typeof(a) == "Instance" and (a == b or GetDebugId(a) == GetDebugId(b))
end

local index; -- for optimization purposes (use it as a function for pcalls)
xpcall(function() return game[nil] end, function() index = debug.info(2, "f") end)

local CoreGui = cloneref(game:GetService("CoreGui"))
local ContentProvider = cloneref(game:GetService("ContentProvider"))
local PlayerGui = cloneref(game:GetService("Players").LocalPlayer.PlayerGui)

local InstancesToCircle = getgenv().InstancesToCircle or {
    -- this is how the table should look
    [GetDebugId(game)] = game,
    [GetDebugId(CoreGui)] = CoreGui,
    [GetDebugId(PlayerGui)] = PlayerGui
}

if table.find(InstancesToCircle, CoreGui) then
	iscoreguipresent = true
end

local thing = {}

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

local haspresentinstance = function(tbl, arg)
	if type(tbl) ~= "table" then return false end

	for i, v in pairs(tbl) do
		if typeof(v) == "Instance" then
			if ((not isrestrictedinstance(v)) and thing[GetDebugId(v)]) or (iscoreguipresent and iscoregui(v)) then
				return true
			end
        end
	end

	return false
end

local GetAssetFromInstance = function(ins, parentrecursive)
	-- since we don't hook the index metamethod this is brilliant!
	if pcall(index, ins, "Image") then
		return ins.Image
	end

	if pcall(index, ins, "SoundId") then
		return ins.SoundId
	end

	if pcall(index, ins, "Texture") then
		return ins.Texture
	end

	if pcall(index, ins, "MeshId") then
		return ins.MeshId
	end

	return nil
end

for i, v in pairs(InstancesToCircle) do
	local DebugId = GetDebugId(v)
	thing[DebugId] = {}
	local tbl = thing[DebugId]

	for i2, v2 in pairs(v:GetDescendants()) do
		-- firstly check if an asset does indeed exist
		local asset = GetAssetFromInstance(v2)

		if asset then
			table.insert(tbl, {Instance = v2})
		end
	end
end

local h1; h1 = hookmetamethod(game,"__namecall", function(...)
	local self, tbl, fnc = ...
	local method = string.gsub(getnamecallmethod(), "^%u", string.lower)
	if
        not checkcaller()
        and typeof(self) == "Instance"
        and compareinstances(self, ContentProvider)
        and method == "preloadAsync"
        and haspresentinstance(tbl)
        and safecheck(tbl)
    then
		local target = {}

		for i, v in pairs(tbl) do
			if typeof(v) == "Instance" then
				local DebugId;

				if iscoreguipresent and iscoregui(v) then
					DebugId = table.find(InstancesToCircle, CoreGui)
				elseif (not isrestrictedinstance(v)) and table.find(InstancesToCircle, v) then
					DebugId = table.find(InstancesToCircle, v)
				end

				if DebugId and thing[DebugId] then
					table.insert(target, thing[DebugId].Instance)
					rawset(tbl, i, nil)
				end
			end
		end

		return h1(self, {unpack(randomizeTable(target)), unpack(tbl)}, fnc)
	end

	return h1(...)
end)

local h2; h2 = hookfunction(ContentProvider.PreloadAsync, function(...)
	local self, tbl, fnc = ...

	if
        not checkcaller()
        and typeof(self) == "Instance"
        and compareinstances(self, ContentProvider)
        and haspresentinstance(tbl)
        and safecheck(tbl)
    then
		local target = {}

		for i, v in pairs(tbl) do
			if typeof(v) == "Instance" then
				local DebugId;

				if iscoreguipresent and iscoregui(v) then
					DebugId = table.find(InstancesToCircle, CoreGui)
				elseif (not isrestrictedinstance(v)) and table.find(InstancesToCircle, v) then
					DebugId = table.find(InstancesToCircle, v)
				end

				if DebugId and thing[DebugId] then
					table.insert(target, thing[DebugId].Instance)
					rawset(tbl, i, nil)
				end
			end
		end

		return h2(self, {unpack(randomizeTable(target)), unpack(tbl)}, fnc)
	end

	return h2(...)
end)
