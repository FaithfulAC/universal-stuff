-- basically a lua implementation of arg guard (which every executor should have by default rn but GUESS NOT!)

local options = shmmoptions or safehookmetamethodoptions or {
	Namecall = true,
	Index = true,
	Newindex = true
}

local hmm = hookmetamethod -- hmmmmmmmmmmmmmmmm
local cclosure = newcclosure

local KeepOriginalHookMetaMethod = getgenv().KeepHMM or getgenv().KeepHookmetamethod or false

--[[local LoadCStackOverflowBypass = false

if LoadCStackOverflowBypass then -- checking if c stack overflow bypass was already initiated
	loadstring(game:HttpGet("https://raw.githubusercontent.com/FaithfulAC/universal-stuff/main/c-stack-overflow-universal-bypass.lua"))()
end]]

local __namecall, __index, __newindex =
	clonefunction(getrawmetatable(game).__namecall),
	clonefunction(getrawmetatable(game).__index),
	clonefunction(getrawmetatable(game).__newindex)

local isSafeIndex = function(arg)
	return (typeof(arg) == "string" and #arg < 256) -- run safehookmetamethod if you want to hook index a property, not an instance!!!
end

local sNamecall, sIndex, sNewindex = 
	function(...)
		
		local args = {...}
		local self = args[1]
		
		if typeof(self) == "Instance" and select("#", ...) > 0 and select("#", ...) < 8000 then return true end
		return false
		
	end, function(...)
	
	local args = {...}
	local self = args[1]
	
	if typeof(self) == "Instance" and (isSafeIndex(args[2]) or typeof(args[2]) == "number") and select("#", ...) >= 2 and select("#", ...) < 8000 then return true end
	return false
	
end, function(...)
	
	local args = {...}
	local self = args[1]
	
	if typeof(self) == "Instance" and isSafeIndex(args[2]) and select("#", ...) >= 3 and select("#", ...) < 8000 then return true end
	return false
	
end

local __oldnamecall, __oldindex, __oldnewindex = __namecall, __index, __newindex;

if options.Namecall then
	hmm(game,"__namecall", function(...)
		local args = {...}
		if not sNamecall(...) then return __oldnamecall(...) end
	
		return __namecall(...)
	end)
end

if options.Index then
	hmm(game,"__index", function(...)
		local args = {...}
		if not sIndex(...) then return __oldindex(...) end
	
		return __index(...)
	end)
end

if options.Newindex then
	hmm(game,"__newindex", function(...)
		local args = {...}
		if not sNewindex(...) then return __oldnewindex(...) end
	
		return __newindex(...)
	end)
end
	
getgenv().safehookmetamethod = newcclosure(function(...)
	local obj, method, fnc = ...
	if typeof(obj) ~= "Instance" then return hmm(...) end -- object is not an Instance therefore is not supported
	
	if method == "__namecall" then
		local orgnm = __namecall
		__namecall = cclosure(fnc)
		
		return orgnm
		
	elseif method == "__index" then
		local orgi = __index
		__index = cclosure(fnc)
		
		return orgi
		
	elseif method == "__newindex" then
		local orgni = __newindex
		__newindex = cclosure(fnc)
		
		return orgni
		
	end
	
	return hmm(...)
end)

if not KeepOriginalHookMetaMethod then getgenv().hookmetamethod = safehookmetamethod end
