-- cloneref implemented in lua! made by @__europa
-- THIS IS NOT MEANT TO BE USED IN A SERIOUS MANNER! A PROPER CLONEREF SHOULD BE MADE IN C(++) NOT LUA

local _cache = {}

local clonefunction = clonefunction or function(...)
    return ...
end

local GetAttribute, GetDebugId = clonefunction(game.GetAttribute), clonefunction(game.GetDebugId);

local function InCache(Object)
    for i, v in pairs(_cache) do
        if v.Object == Object then
            return v
        end
    end

    return false
end

local function GetInstanceFromDebugId(Id)
    for i, v in pairs(getinstances()) do
        -- shouldnt have to do typeof check but some executors can be so incompetent
        if typeof(v) == "Instance" and GetDebugId(v) == Id then
            return v
        end
    end

    return nil
end

local __namecall, __index, __newindex;

__namecall = hookmetamethod(game,"__namecall", function(...)
    local self = ...
    local method = getnamecallmethod()

    local Item = InCache(self)
    if Item and GetInstanceFromDebugId(Item.DebugId) then
        return __namecall(GetInstanceFromDebugId(Item.DebugId), select(2,...))
    end

    return __namecall(...)
end)

__index = hookmetamethod(game,"__index", function(...)
    local self, arg = ...

    local Item = InCache(self)
    if Item and GetInstanceFromDebugId(Item.DebugId) then
        return __index(GetInstanceFromDebugId(Item.DebugId), arg)
    end

    return __index(...)
end)

__newindex = hookmetamethod(game,"__newindex", function(...)
    local self, arg, arg2 = ...

    local Item = InCache(self)
    if Item and GetInstanceFromDebugId(Item.DebugId) then
        return __newindex(GetInstanceFromDebugId(Item.DebugId), arg, arg2)
    end

    return __newindex(...)
end)

getgenv().luacloneref = function(ins)
    if typeof(ins) ~= "Instance" then
        return error("Bad argument #1 to lua-cloneref (Instance expected)")
    end

    local Placeholder, DebugId;
    Placeholder = Instance.new("Part")
    DebugId = GetDebugId(ins)

    table.insert(_cache, {Object = Placeholder, DebugId = DebugId})
    return Placeholder
end
