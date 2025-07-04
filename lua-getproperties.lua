local cloneref = cloneref or function(...) return ... end
local gsub = string.gsub
local HttpService = cloneref(game:GetService("HttpService"))
local url = "https://raw.githubusercontent.com/MaximumADHD/Roblox-Client-Tracker/roblox/API-Dump.json"

local function fetchData(url)
	local response = game:HttpGet(url)
	local data = HttpService:JSONDecode(response)
	return data
end

local apiData = fetchData(url)

local function sortAlphabetic(t, property)
	table.sort(t, function(x,y)
		return x[property] < y[property]
	end)
end

local propertiescache, functionscache, eventscache, callbackscache = {}, {}, {}, {}

-- only used for getproperties as of now
local function recursivesuperclassproperties(superclass, membertype, tbl)
	for _, evenmoreclass in ipairs(apiData.Classes) do
		if evenmoreclass.Name == superclass then
			for _, member in ipairs(evenmoreclass.Members) do
				if member.MemberType == membertype then
					table.insert(tbl, member)
				end
			end
			if superclass ~= "Instance" then
				recursivesuperclassproperties(evenmoreclass.Superclass, membertype, tbl)
			end
		end
	end
end

getgenv().getproperties = function(class)
	local properties = {}

	if typeof(class) == "Instance" then
		class = class.ClassName
	elseif typeof(class) ~= "string" then
		return error("bad argument #1 to 'getproperties' (string or Instance expected)")
	end
	if propertiescache[class] then return propertiescache[class] end

	for i, otherclass in ipairs(apiData.Classes) do
		if otherclass.Name == "Instance" or otherclass.Name == "Object" then
			for _, member in ipairs(otherclass.Members) do
				if member.MemberType == "Property" and select(2, gsub(member.Name, "^%l", string.upper)) == 0 then
					table.insert(properties, member)
				end
			end
		elseif class == otherclass.Name then
			for _, member in ipairs(otherclass.Members) do
				if member.MemberType == "Property" and select(2, gsub(member.Name, "^%l", string.upper)) == 0 then
					table.insert(properties, member)
				end
			end
			
			recursivesuperclassproperties(otherclass.Superclass, "Property", properties)
			break
		end
	end

	sortAlphabetic(properties, "Name")
	propertiescache[class] = properties
	return properties
end

getgenv().getfunctions = function(class)
	local functions = {}

	if typeof(class) == "Instance" then
		class = class.ClassName
	elseif typeof(class) ~= "string" then
		return error("bad argument #1 to 'getfunctions' (string or Instance expected)")
	end
	if functionscache[class] then return functionscache[class] end

	for i, otherclass in ipairs(apiData.Classes) do
		if otherclass.Name == "Instance" or otherclass.Name == "Object" then
			for _, member in ipairs(otherclass.Members) do
				if member.MemberType == "Function" and select(2, gsub(member.Name, "^%l", string.upper)) == 0 then
					table.insert(functions, member)
				end
			end
		elseif class == otherclass.Name then
			for _, member in ipairs(otherclass.Members) do
				if member.MemberType == "Function" and select(2, gsub(member.Name, "^%l", string.upper)) == 0 then
					table.insert(functions, member)
				end
			end

			break
		end
	end

	sortAlphabetic(functions, "Name")
	functionscache[class] = functions
	return functions
end

getgenv().getevents = function(class)
	local events = {}
	if eventscache[class] then return eventscache[class] end

	if typeof(class) == "Instance" then
		class = class.ClassName
	elseif typeof(class) ~= "string" then
		return error("bad argument #1 to 'getevents' (string or Instance expected)")
	end

	for i, otherclass in ipairs(apiData.Classes) do
		if otherclass.Name == "Instance" or otherclass.Name == "Object" then
			for _, member in ipairs(otherclass.Members) do
				if member.MemberType == "Event" and select(2, gsub(member.Name, "^%l", string.upper)) == 0 then
					table.insert(events, member)
				end
			end
		elseif class == otherclass.Name then
			for _, member in ipairs(otherclass.Members) do
				if member.MemberType == "Event" and select(2, gsub(member.Name, "^%l", string.upper)) == 0 then
					table.insert(events, member)
				end
			end

			break
		end
	end

	sortAlphabetic(events, "Name")
	eventscache[class] = events
	return events
end

getgenv().getcallbacks = function(class)
	local callbacks = {}

	if typeof(class) == "Instance" then
		class = class.ClassName
	elseif typeof(class) ~= "string" then
		return error("bad argument #1 to 'getcallbacks' (string or Instance expected)")
	end
	if callbackscache[class] then return callbackscache[class] end

	for i, otherclass in ipairs(apiData.Classes) do
		if otherclass.Name == "Instance" --[[or otherclass.Name == "Object"]] then
			for _, member in ipairs(otherclass.Members) do
				if member.MemberType == "Callback" and select(2, gsub(member.Name, "^%l", string.upper)) == 0 then
					table.insert(callbacks, member)
				end
			end
		elseif class == otherclass.Name then
			for _, member in ipairs(otherclass.Members) do
				if member.MemberType == "Callback" and select(2, gsub(member.Name, "^%l", string.upper)) == 0 then
					table.insert(callbacks, member)
				end
			end

			break
		end
	end

	sortAlphabetic(callbacks, "Name")
	callbackscache[class] = callbacks
	return callbacks
end

return { -- for certain executors sending numerous arguments wont work (which is probably intentional) so lets make a whole damn table for the two things
	apiData, {
		getproperties = getproperties,
		getfunctions = getfunctions,
		getevents = getevents,
		getcallbacks = getcallbacks,
	}
}
