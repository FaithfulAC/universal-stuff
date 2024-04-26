local rbxsignal = game.Changed -- RBXScriptSignal, to be used as the example metatable whose metamethods will be hooked (will be turned to nil later)
local host = {}

local fire = function(signal, ...)
	for i, v in pairs(host) do
		if v.Identifier == tostring(signal) and v.Function then
			v.Function(...) -- calls function with args RBXScriptConnection, ConnectedFunction
		end
	end
end

local h; h = hookmetamethod(rbxsignal, "__index", newcclosure(function(...)
	local self, prop = ...
	
	if typeof(self) == "RBXScriptSignal" and typeof(prop) == "string" then
		prop = string.gsub(string.split(prop, "\0")[1], "^%u", string.lower)
		
		if not checkcaller() and prop == "connect" then
			local res = h(...)

			local temp; temp = hookfunction(res, function(...)
				local self, func = ...

				if typeof(self) == "RBXScriptSignal" and typeof(func) == "function" then
					local res2 = temp(...)
					fire(self, res2, func) -- calling ...

					return res2
				end

				return temp(...)
			end)

			return res
		elseif checkcaller() then
			if prop == "onSignalConnected" then
				local new; new = {
					Identifier = tostring(self),

					Disconnect = function(self)
						if self ~= new then return error("Expected ':' not '.' calling signal-member function Disconnect", 0) end
						new.Function = nil
						if table.find(host, new) then
							table.remove(host, table.find(host, new))
						end
					end,

					Connect = function(self, func)
						if self ~= new then return error("Expected ':' not '.' calling signal-member function Connect", 0) end
						
						new.Function = func
						if not table.find(host, new) then
							table.insert(host, new)
						end
					end,

					Function = nil
				}

				new.disconnect = new.Disconnect
				new.connect = new.Connect

				return new
			end
		end
	end

	return h(...)
end))

rbxsignal = nil;
local temphost = {}

if workspace.DistributedGameTime > 1 then -- practically means not run in autoexec
	for i, v in next, getgc() do
		if typeof(v) == "function" and iscclosure(v) then
			if getrenv().debug.info(v, "n") == "Connect" and not table.find(temphost, v) then
				local temp; temp = hookfunction(v, function(...)
					local self, func = ...

					if not checkcaller() and typeof(self) == "RBXScriptSignal" and typeof(func) == "function" then
						local res2 = temp(...)
						fire(self, res2, func)

						return res2
					end

					return temp(...)
				end)

				table.insert(temphost, v)
			end
		end
	end
end

table.clear(temphost)
temphost = nil
