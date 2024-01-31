-- made by @__europa but i dont think there's any need for that LOLLLL

local getgenv = getgenv or getfenv
local randomstupidmodule = {}

randomstupidmodule.random = function()
    local a = tick()
    for i = 1, 5 do
        tostring(rawget({newproxy(true)}, 1))
    end

    local one, two, three = (a-tick()+(tick()-tick()))*100001%1, tick()%10, (math.pi^math.pi)%(1/7);

    local new = ((((math.abs(((one^two)^math.pi))%(math.sqrt(2)))*three*100001)%math.sqrt(2))*2000)%1

    return new
end

getgenv().random = randomstupidmodule.random
return randomstupidmodule
