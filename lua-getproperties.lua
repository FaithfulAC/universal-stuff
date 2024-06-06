-- doesnt work. Help!

--local jsonstring = game:HttpGet("http://anaminus.github.io/rbx/json/api/latest.json")
local jsonstring = game:HttpGet("https://raw.githubusercontent.com/MaximumADHD/Roblox-Client-Tracker/roblox/API-Dump.json")
local maxChunkSize = 100 * 1000

local apiChunks = {}

for i = 1, math.ceil(string.len(jsonstring)/maxChunkSize) do
	local str = string.sub(jsonstring, (i - 1) * maxChunkSize + 1, i * maxChunkSize)
	table.insert(apiChunks, str)
end

local function ConvertToClassName(a, callingfuncname)
    local _type = typeof(a)
    if _type ~= "Instance" or _type ~= "string" then
        return error("Bad argument #1 to get[p/f/e] (Instance or string expected)")
    end

    if _type == "string" then return a end
    return a.ClassName
end

local function GetApiRemoteFunction(index)
	if (apiChunks[index]) then 
		return apiChunks[index], #apiChunks
	else
		return nil
	end
end

local json do
	local apiTable = {}
	local firstPage, pageCount = GetApiRemoteFunction(1)
	table.insert(apiTable, firstPage)

	for i = 2, pageCount do
		local result = GetApiRemoteFunction(i)
		table.insert(apiTable, result)
	end

	json = table.concat(apiTable)
end

local dump = ((cloneref and cloneref(game:GetService("HttpService"))) or game:GetService("HttpService")):JSONDecode(json)

local Classes = {}
local Enums = {}

local function sortAlphabetic(t, property)
    table.sort(t, function(x,y)
        return x[property] < y[property]
    end)
end

for _,item in pairs(dump) do
	local itemType = item.type
-- Classes --
	if (itemType == 'Class') then
		Classes[item.Name] = item
		item.Properties = {}
		item.Functions = {}
		item.YieldFunctions = {}
		item.Events = {}
		item.Callbacks = {}
-- Members --
	elseif (itemType == 'Property') then
		table.insert(Classes[item.Class].Properties, item)
	elseif (itemType == 'Function') then
		table.insert(Classes[item.Class].Functions, item)
	elseif (itemType == 'YieldFunction') then
		table.insert(Classes[item.Class].YieldFunctions, item)
	elseif (itemType == 'Event') then
		table.insert(Classes[item.Class].Events, item)
	elseif (itemType == 'Callback') then
		table.insert(Classes[item.Class].Callbacks, item)
-- Enums --
	elseif (itemType == 'Enum') then
		Enums[item.Name] = item
		item.EnumItems = {}
	elseif (itemType == 'EnumItem') then
		Enums[item.Enum].EnumItems[item.Name] = item
	end
end

getgenv().getclassnamefunctions = function(className)
    className = ConvertToClassName(className)

	local class = Classes[className]
	local functions = {}
	
	if not class then return functions end
	
	while class do
		for _,property in pairs(class.Functions) do
			table.insert(functions, property)
		end
		class = Classes[class.Superclass]
	end
	
	sortAlphabetic(functions, "Name")

	return functions
end

getgenv().getevents = function(className)
    className = ConvertToClassName(className)

	local class = Classes[className]
	local events = {}
	
	if not class then return events end
	
	while class do
		for _,property in pairs(class.Events) do
			table.insert(events, property)
		end
		class = Classes[class.Superclass]
	end
	
	sortAlphabetic(events, "Name")

	return events
end

if getgenv().getproperties then
    local gp = getgenv().getproperties
    getgenv().getproperties = function(a)
        a = ConvertToClassName(a)
        return gp(a)
    end
    return
end

getgenv().getproperties = function(className)
    className = ConvertToClassName(className)

	local class = Classes[className]
	local properties = {}
	
	if not class then return properties end
	
	while class do
		for _,property in pairs(class.Properties) do
			table.insert(properties, property)
		end
		class = Classes[class.Superclass]
	end
	
	sortAlphabetic(properties, "Name")

	return properties
end
