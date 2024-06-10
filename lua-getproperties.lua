local cloneref = cloneref or function(...) return ... end
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

getgenv().getproperties = function(class)
	local properties = {}

	if typeof(class) == "Instance" then
		class = class.ClassName
	elseif typeof(class) ~= "string" then
		return error("bad argument #1 (string or Instance expected)")
	end

	for i, otherclass in ipairs(apiData.Classes) do
		if otherclass.Name == "Instance" then
			for _, member in ipairs(otherclass.Members) do
				if member.MemberType == "Property" then
					table.insert(properties, member)
				end
			end
		elseif class == otherclass.Name then
			for _, member in ipairs(otherclass.Members) do
				if member.MemberType == "Property" then
					table.insert(properties, member)
				end
			end

			break
		end
	end

	sortAlphabetic(properties, "Name")
	return properties
end

getgenv().getfunctions = function(class)
	local functions = {}

	if typeof(class) == "Instance" then
		class = class.ClassName
	elseif typeof(class) ~= "string" then
		return error("bad argument #1 (string or Instance expected)")
	end

	for i, otherclass in ipairs(apiData.Classes) do
		if otherclass.Name == "Instance" then
			for _, member in ipairs(otherclass.Members) do
				if member.MemberType == "Function" then
					table.insert(functions, member)
				end
			end
		elseif class == otherclass.Name then
			for _, member in ipairs(otherclass.Members) do
				if member.MemberType == "Function" then
					table.insert(functions, member)
				end
			end

			break
		end
	end

	sortAlphabetic(functions, "Name")
	return functions
end

getgenv().getevents = function(class)
	local events = {}

	if typeof(class) == "Instance" then
		class = class.ClassName
	elseif typeof(class) ~= "string" then
		return error("bad argument #1 (string or Instance expected)")
	end

	for i, otherclass in ipairs(apiData.Classes) do
		if otherclass.Name == "Instance" then
			for _, member in ipairs(otherclass.Members) do
				if member.MemberType == "Event" then
					table.insert(events, member)
				end
			end
		elseif class == otherclass.Name then
			for _, member in ipairs(otherclass.Members) do
				if member.MemberType == "Event" then
					table.insert(events, member)
				end
			end

			break
		end
	end

	sortAlphabetic(events, "Name")
	return events
end

getgenv().getcallbacks = function(class)
	local callbacks = {}

	if typeof(class) == "Instance" then
		class = class.ClassName
	elseif typeof(class) ~= "string" then
		return error("bad argument #1 (string or Instance expected)")
	end

	for i, otherclass in ipairs(apiData.Classes) do
		if otherclass.Name == "Instance" then
			for _, member in ipairs(otherclass.Members) do
				if member.MemberType == "Callback" then
					table.insert(callbacks, member)
				end
			end
		elseif class == otherclass.Name then
			for _, member in ipairs(otherclass.Members) do
				if member.MemberType == "Callback" then
					table.insert(callbacks, member)
				end
			end

			break
		end
	end

	sortAlphabetic(callbacks, "Name")
	return callbacks
end

return apiData, {
	getproperties = getproperties,
	getfunctions = getfunctions,
	getevents = getevents,
	getcallbacks = getcallbacks,
}
