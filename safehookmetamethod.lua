-- basically a lua implementation of arg guard (which every executor should have by default rn but GUESS NOT!)

local hmm = hookmetamethod -- hmmmmmmmmmmmmmmmm
local cclosure = newcclosure or coroutine.wrap -- lol, yeah.

local KeepOriginalHookMetaMethod = getgenv().KeepHMM or getgenv().KeepOriginalHookMetaMethod or false
local LoadCStackOverflowBypass = getgenv().LoadCSOBypass or true -- recommended to keep true if the game has a very good anticheat

if LoadCStackOverflowBypass and not getgenv().IsHookingSafe then -- checking if c stack overflow bypass was already initiated
	loadstring(game:HttpGet("https://raw.githubusercontent.com/FaithfulAC/universal-stuff/main/c-stack-overflow-universal-bypass.lua"))()
	repeat task.wait() until getgenv().IsHookingSafe
end

local __namecall, __index, __newindex
__namecall, __index, __newindex = hmm(game,"__namecall", function(...) return __namecall(...) end), hmm(game,"__index", function(...) return __index(...) end), hmm(game,"__newindex", function(...) return __newindex(...) end)

hmm(game,"__namecall",__namecall)
hmm(game,"__index",__index)
hmm(game,"__newindex",__newindex)

local isSafeIndex = function(arg)
	return (type(arg) == "string" and string.len(arg) < 256) or type(arg) == "number" -- run safehookmetamethod if you want to hook index a property, not an instance!!!
end

local sNamecall, sIndex, sNewindex = 
	function(...)
		
		local args = {...}
		local self = args[1]
		
		if typeof(self) == "Instance" and select("#", ...) > 0 then return true end
		return false
		
	end, function(...)
	
	local args = {...}
	local self = args[1]
	
	if typeof(self) == "Instance" and isSafeIndex(args[2]) and select("#", ...) >= 2 then return true end
	return false
	
end, function(...)
	
	local args = {...}
	local self = args[1]
	
	if typeof(self) == "Instance" and isSafeIndex(args[2]) and select("#", ...) >= 3 then return true end
	return false
	
end

local __oldnamecall, __oldindex, __oldnewindex = __namecall, __index, __newindex;

hmm(game,"__namecall", function(...)
	local args = {...}
	if not sNamecall(...) then return __oldnamecall(...) end
	
	return __namecall(...)
end)

hmm(game,"__index", function(...)
	local args = {...}
	if not sIndex(...) then return __oldindex(...) end
	
	return __index(...)
end)

hmm(game,"__newindex", function(...)
	local args = {...}
	if not sNewindex(...) then return __oldnewindex(...) end
	
	return __newindex(...)
end)

getgenv().safehookmetamethod = function(...)
	local obj, method, fnc = ...
	if typeof(obj) ~= "Instance" then return hmm(...) end -- object is not an Instance therefore is not supported
	
	if method == "__namecall" then
		local orgnm = __namecall
		__namecall = (function(...)
			return cclosure(fnc)(...)
		end)
		
		return orgnm
		
	elseif method == "__index" then
		local orgi = __index
		__index = (function(...)
			return cclosure(fnc)(...)
		end)
		
		return orgi
		
	elseif method == "__newindex" then
		local orgni = __newindex
		__newindex = (function(...)
			return cclosure(fnc)(...)
		end)
		
		return orgni
		
	end
	
	return hmm(...)
end

if not KeepOriginalHookMetaMethod then getgenv().hookmetamethod = safehookmetamethod end
