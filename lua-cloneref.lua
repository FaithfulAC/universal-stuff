-- cloneref implemented in lua! made by @__europa
--[[
now there are most certainly limitations to this cloneref, such as...
calling functions with the cloneref'd object as an argument (like game:FindFirstChild(clonerefinstance))
using hookmetamethod... not too good but wtv

that's all i can think of soooo yeah use this at your own risk i guess ;)
]]

local _cache = {}

local clonefunction = clonefunction or function(...)
    return ...
end

local GetAttribute, GetDebugId = clonefunction(game.GetAttribute), clonefunction(game.GetDebugId);

local function InCache(Object)
    for i, v in _cache do
        if v.Object == Object then
            return v
        elseif not v.Object then
            table.remove(_cache, i)
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

    table.insert(_cache, setmetatable({Object = Placeholder, DebugId = DebugId}, {__mode = "v"}))
    return Placeholder
end

getgenv().luacompareinstances = function(ins1, ins2)
    if InCache(ins1) then return InCache(ins1).DebugId == GetDebugId(ins2) end
    if InCache(ins2) then return InCache(ins2).DebugId == GetDebugId(ins1) end

    return typeof(ins1) == "Instance" and typeof(ins2) == "Instance" and GetDebugId(ins1) == GetDebugId(ins2)
end
