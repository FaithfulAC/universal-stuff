-- difference is, these functions will only return the names and not the entire member structure

local cloneref = cloneref or function(...) return ... end
local HttpService = cloneref(game:GetService("HttpService"))
local url = "https://raw.githubusercontent.com/MaximumADHD/Roblox-Client-Tracker/roblox/API-Dump.json"

local function fetchData(url)
    local response = game:HttpGet(url)
    local data = HttpService:JSONDecode(response)
    return data
end

local apiData = fetchData(url)

getgenv().getpropertiesbyname = function(class)
    local properties = {
        "Archivable",
        "ClassName", "DataCost",
        "Name", "Parent",
        "RobloxLocked",
        "UniqueId",
    }

    if typeof(class) == "Instance" then
        class = class.ClassName
    elseif typeof(class) ~= "string" then
        return error("bad argument #1 to 'getpropertiesbyname' (string or Instance expected)")
    end
    
    for i, otherclass in ipairs(apiData.Classes) do
        if class == otherclass.Name then
            for _, member in ipairs(otherclass.Members) do
                if member.MemberType == "Property" then
                    table.insert(properties, member.Name)
                end
            end
            break
        end
    end
    
    return properties
end

getgenv().getfunctionsbyname = function(class)
    local functions = {
        "AddTag", "ClearAllChildren",
        "Clone", "Destroy",
        "FindFirstAncestor", "FindFirstAncestorOfClass",
        "FindFirstAncestorWhichIsA", "FindFirstChild",
        "FindFirstChildOfClass", "FindFirstChildWhichIsA",
        "FindFirstDescendant", "GetActor",
        "GetAttribute", "GetAttributeChangedSignal",
        "GetAttributes", "GetChildren",
        "GetDebugId", "GetDescendants",
        "GetFullName", "GetPropertyChangedSignal",
        "GetTags", "HasTag",
        "IsA", "IsAncestorOf",
        "IsDescendantOf", "IsPropertyModified",
        "Remove", "RemoveTag",
        "ResetPropertyToDefault", "SetAttribute",
        "WaitForChild", "children",
    }

    if typeof(class) == "Instance" then
        class = class.ClassName
    elseif typeof(class) ~= "string" then
        return error("bad argument #1 to 'getfunctionsbyname' (string or Instance expected)")
    end
    
    for i, otherclass in ipairs(apiData.Classes) do
        if class == otherclass.Name then
            for _, member in ipairs(otherclass.Members) do
                if member.MemberType == "Function" then
                    table.insert(functions, member.Name)
                end
            end
            break
        end
    end
    
    return functions
end

getgenv().geteventsbyname = function(class)
    local events = {
        "AncestryChanged", "AttributeChanged",
        "Changed", "ChildAdded",
        "ChildRemoved", "DescendantAdded",
        "DescendantRemoving", "Destroying",
    }

    if typeof(class) == "Instance" then
        class = class.ClassName
    elseif typeof(class) ~= "string" then
        return error("bad argument #1 to 'geteventsbyname' (string or Instance expected)")
    end
    
    for i, otherclass in ipairs(apiData.Classes) do
        if class == otherclass.Name then
            for _, member in ipairs(otherclass.Members) do
                if member.MemberType == "Event" then
                    table.insert(events, member.Name)
                end
            end
            break
        end
    end
    
    return events
end

getgenv().getcallbacksbyname = function(class)
    local callbacks = {}

    if typeof(class) == "Instance" then
        class = class.ClassName
    elseif typeof(class) ~= "string" then
        return error("bad argument #1 to 'getcallbacksbyname' (string or Instance expected)")
    end
    
    for i, otherclass in ipairs(apiData.Classes) do
        if class == otherclass.Name then
            for _, member in ipairs(otherclass.Members) do
                if member.MemberType == "Callback" then
                    table.insert(callbacks, member.Name)
                end
            end
            break
        end
    end
    
    return callbacks
end

return apiData -- no table list of the functions for this because the other one only has them for tsdex
