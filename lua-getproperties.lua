-- it actually works now yay
local cloneref = cloneref or function(...) return ... end
local HttpService = cloneref(game:GetService("HttpService"))
local url = "https://raw.githubusercontent.com/MaximumADHD/Roblox-Client-Tracker/roblox/API-Dump.json"

local function fetchData(url)
    local response = game:HttpGet(url)
    local data = HttpService:JSONDecode(response)
    return data
end

local apiData = fetchData(url)

local function CreateFakeIndexInstance(class)
    local fake = {
        Destroy = function()end
    }

    function fake:IsA(otherclass)
        return otherclass == class
    end

    return fake
end

getgenv().getproperties = function(instance)
    local properties = {}

    if typeof(instance) == "string" then
        if not pcall(Instance.new, instance) then
            instance = CreateFakeIndexInstance(instance)
        else
            instance = Instance.new(instance)
        end
    elseif typeof(instance) ~= "Instance" then
        return error("bad argument #1 (string or Instance expected)")
    end
    
    for i, class in ipairs(apiData.Classes) do
        if instance:IsA(class.Name) then
            for _, member in ipairs(class.Members) do
                if member.MemberType == "Property" then
                    table.insert(properties, member.Name)
                end
            end
            break
        end
    end
    
    instance:Destroy(); instance = nil;
    return properties
end

getgenv().getfunctions = function(instance)
    local functions = {}

    if typeof(instance) == "string" then
        if not pcall(Instance.new, instance) then
            instance = CreateFakeIndexInstance(instance)
        else
            instance = Instance.new(instance)
        end
    elseif typeof(instance) ~= "Instance" then
        return error("bad argument #1 (string or Instance expected)")
    end
    
    for _, class in ipairs(apiData.Classes) do
        if instance:IsA(class.Name) then
            for _, member in ipairs(class.Members) do
                if member.MemberType == "Function" then
                    table.insert(functions, member.Name)
                end
            end
            break
        end
    end
    
    instance:Destroy(); instance = nil;
    return functions
end
