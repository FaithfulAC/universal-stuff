--[[
why? because i want to visualize function outputs and make it compact and portable
max amount of graphs you can have is 10, any more and they will simply not be created (unless you do some of your own tweaking)
the graphs increase trianglecount by ALOT; it is recommended you have a trianglecount spoof just to be safe
but close to no games have trianglecount detections you should be fine without a spoof
]]

--[[
loadstring(game:HttpGet("https://raw.githubusercontent.com/FaithfulAC/universal-stuff/refs/heads/main/FunctionGrapher.lua"))({
	-- required parameters
	
	Function = yourFunction,
	Name = desiredNameForGraph,
	
	-- optional parameters; if not included, will use default values
	
	forLoopInterval = 0.1,
	delayBetweenEachFrame = 1e-3,
	xRange = 50,
	yRange = 5000,
	intervalUntilDelay = 1,
	numOfXLines = 10,
	numOfYLines = 10,
})
]]

local params = (...) or {
	Function = gcinfo, -- only an example
	Name = "gcinfo",
}

if typeof(params) ~= "table" then
	warn("Not a table")
	return
end

if not (params.Function and params.Name) then
	warn("No Function/Name key values")
	return
end

-- typecheck
if typeof(params.Function) ~= "function" or typeof(params.Name) ~= "string" then
	warn("Invalid Function/Name types")
	return
end

-- passed function must return a number
if typeof(params.Function()) ~= "number" then
	warn("Function param must return a number")
	return
end

local getgenv = getgenv or getfenv

local screengui = Instance.new("ScreenGui")

-- this is so ugly
if ((not game:GetService("CoreGui")) and not game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui", 1 + 1e-3):FindFirstChild("GraphHost")) then
	task.delay(1, coroutine.resume, coroutine.running())
	screengui.Parent = game:GetService("Players").LocalPlayer.PlayerGui or nil
elseif game:GetService("CoreGui") then
	if game:GetService("CoreGui"):FindFirstChild("GraphHost") then
		screengui = game:GetService("CoreGui"):FindFirstChild("GraphHost")
	else
		screengui.Parent = game:GetService("CoreGui")
	end
elseif game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui", 1 + 1e-3):FindFirstChild("GraphHost") then
	screengui = game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("GraphHost")
end

screengui.Name = "GraphHost"
getgenv().__GraphHost = screengui

task.delay(0, function()
	if getgenv().GraphHostLoaded then
		return
	end

	getgenv().GraphHostLoaded = true

	local dragtarget = nil
	local dragstart = nil
	local startpos = nil
	local uis = game:GetService("UserInputService")

	local types = {
		Enum.UserInputType.MouseButton1,
		Enum.UserInputType.Touch
	}

	local types2 = {
		Enum.UserInputType.MouseMovement,
		Enum.UserInputType.Touch
	}

	local function updateInput(input)
		local delta = input.Position - dragstart
		local position = UDim2.new(
			startpos.X.Scale, startpos.X.Offset + delta.X,
			startpos.Y.Scale, startpos.Y.Offset + delta.Y
		)
		dragtarget.Position = position
	end

	local originalPositions = {}

	for i, frame in pairs((getgenv().__GraphHost or screengui):GetChildren()) do
		print("asdfassdfd")
		if frame:IsA("Frame") and frame:FindFirstChild("Header") then
			originalPositions[frame] = frame.Position

			local header = frame.Header
			header.InputBegan:Connect(function(input)
				if table.find(types, input.UserInputType) and not dragtarget then
					dragtarget = frame
					dragstart = input.Position
					startpos = frame.Position
				end
			end)
			header.InputEnded:Connect(function(input)
				if table.find(types, input.UserInputType) and dragtarget == frame then
					dragtarget = nil
					dragstart, startpos = nil, nil
				end
			end)
		end
	end

	getgenv().__GraphHost.ChildAdded:Connect(function()
		for i, frame in pairs(getgenv().__GraphHost:GetChildren()) do
			if frame:IsA("Frame") and frame:FindFirstChild("Header") and not originalPositions[frame] then
				originalPositions[frame] = frame.Position
				print("hiii")
				local header = frame.Header

				header.InputBegan:Connect(function(input)
					if table.find(types, input.UserInputType) and not dragtarget then
						dragtarget = frame
						dragstart = input.Position
						startpos = frame.Position
					end
				end)
				header.InputEnded:Connect(function(input)
					if table.find(types, input.UserInputType) and dragtarget == frame then
						dragtarget = nil
						dragstart, startpos = nil, nil
					end
				end)
			end
		end
	end)

	uis.InputChanged:Connect(function(input)
		if table.find(types2, input.UserInputType) and dragtarget then
			updateInput(input)
		end
	end)

	if not getgenv().__GraphHost:FindFirstChild("Buttons") then
		local Buttons = Instance.new("Folder")
		local Revert = Instance.new("TextButton")
		local Switch = Instance.new("TextButton")

		Buttons.Name = "Buttons"
		Buttons.Parent = getgenv().__GraphHost

		Revert.Name = "Revert"
		Revert.Parent = Buttons
		Revert.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Revert.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Revert.BorderSizePixel = 0
		Revert.Position = UDim2.new(0.9, 0, 0.119, 0)
		Revert.Size = UDim2.new(0.1, 0, 0.1, 0)
		Revert.Font = Enum.Font.SourceSans
		Revert.Text = "revert to original positions"
		Revert.TextColor3 = Color3.fromRGB(0, 0, 0)
		Revert.TextScaled = true
		Revert.TextSize = 14.000
		Revert.TextWrapped = true

		Switch.Name = "Switch"
		Switch.Parent = Buttons
		Switch.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Switch.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Switch.BorderSizePixel = 0
		Switch.Position = UDim2.new(0.9, 0, 0.219, 0)
		Switch.Size = UDim2.new(0.1, 0, 0.1, 0)
		Switch.Font = Enum.Font.SourceSans
		Switch.Text = "switch visibility of graphs"
		Switch.TextColor3 = Color3.fromRGB(0, 0, 0)
		Switch.TextScaled = true
		Switch.TextSize = 14.000
		Switch.TextWrapped = true
	end

	getgenv().__GraphHost.Buttons.Revert.MouseButton1Click:Connect(function()
		for frame, pos in pairs(originalPositions) do
			frame.Position = pos
		end
	end)

	getgenv().__GraphHost.Buttons.Switch.MouseButton1Click:Connect(function()
		for _, frame in getgenv().__GraphHost:GetChildren() do
			if frame:IsA("Frame") then
				frame.Visible = not frame.Visible
			end
		end
	end)
end);

if not getgenv().GraphFrameCount then
	getgenv().GraphFrameCount = 0
end

if getgenv().GraphFrameCount >= 10 then
	return -- too many frames
end

local HostFrame = Instance.new("Frame")
local X_Axis = Instance.new("Frame")
local Y_Axis = Instance.new("Frame")
local XLines = Instance.new("Folder")
local YLines = Instance.new("Folder")
local Header = Instance.new("TextLabel")
local VisibilityToggle = Instance.new("TextButton")

HostFrame.Name = "HostFrame"
HostFrame.Parent = getgenv().__GraphHost

HostFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HostFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
HostFrame.BorderSizePixel = 0
HostFrame.Position = UDim2.new((getgenv().GraphFrameCount%5)*0.2, 0, getgenv().GraphFrameCount < 5 and 0.6 or 0.1, 0)
HostFrame.Size = UDim2.new(0.2, 0, 0.4, 0)

X_Axis.Name = "X_Axis"
X_Axis.Parent = HostFrame
X_Axis.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
X_Axis.BorderColor3 = Color3.fromRGB(0, 0, 0)
X_Axis.BorderSizePixel = 0
X_Axis.Position = UDim2.new(0, 0, 0.5, -3)
X_Axis.Size = UDim2.new(1, 0, 0, 3)

Y_Axis.Name = "Y_Axis"
Y_Axis.Parent = HostFrame
Y_Axis.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Y_Axis.BorderColor3 = Color3.fromRGB(0, 0, 0)
Y_Axis.BorderSizePixel = 0
Y_Axis.Position = UDim2.new(0.5, -3, 0, 0)
Y_Axis.Size = UDim2.new(0, 6, 1, 0)

XLines.Name = "XLines"
XLines.Parent = HostFrame

YLines.Name = "YLines"
YLines.Parent = HostFrame

Header.Name = "Header"
Header.Parent = HostFrame
Header.BackgroundColor3 = Color3.fromRGB(214, 214, 214)
Header.BorderColor3 = Color3.fromRGB(0, 0, 0)
Header.BorderSizePixel = 0
Header.Position = UDim2.new(0, 0, -0.1, 0)
Header.Size = UDim2.new(1, 0, 0.1, 0)
Header.Font = Enum.Font.SourceSansBold
Header.TextColor3 = Color3.fromRGB(0, 0, 0)
Header.TextScaled = true
Header.TextSize = 14.000
Header.TextWrapped = true

VisibilityToggle.Name = "VisibilityToggle"
VisibilityToggle.Parent = Header
VisibilityToggle.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
VisibilityToggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
VisibilityToggle.BorderSizePixel = 0
VisibilityToggle.Position = UDim2.new(0.9, 0, 0, 0)
VisibilityToggle.Size = UDim2.new(0.1, 0, 1, 0)
VisibilityToggle.Font = Enum.Font.SourceSansBold
VisibilityToggle.Text = "v"
VisibilityToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
VisibilityToggle.TextScaled = true
VisibilityToggle.TextSize = 14.000
VisibilityToggle.TextWrapped = true

getgenv().GraphFrameCount += 1

coroutine.wrap(function()
	local script = Instance.new("Script", HostFrame)
	script.Name = "Handler"

	local hint = script.Parent.Header

	local hostFrame = script.Parent

	local maxX, maxY = hostFrame.Size.X.Scale, hostFrame.Size.Y.Scale
	local mainSize = hostFrame.Size

	local XLines = hostFrame.XLines
	local YLines = hostFrame.YLines

	local X_Axis = hostFrame.X_Axis
	local Y_Axis = hostFrame.Y_Axis

	local VisibilityToggle = hostFrame.Header.VisibilityToggle

	local KeepAdding = true

	local invisible = {}

	VisibilityToggle.MouseButton1Click:Connect(function()
		KeepAdding = not KeepAdding
		if not KeepAdding then
			VisibilityToggle.Text = "^"

			for _, element in hostFrame:GetDescendants() do
				if element:IsA("GuiBase2d") and element ~= VisibilityToggle and element ~= VisibilityToggle.Parent then
					element.Visible = false
					table.insert(invisible, element)
				end
			end

			hostFrame.BackgroundTransparency = 1
			VisibilityToggle.Parent.Position += UDim2.fromScale(0, 1)
		else
			VisibilityToggle.Text = "v"

			for _, element in invisible do
				element.Visible = true
			end

			table.clear(invisible)
			hostFrame.BackgroundTransparency = 0
			VisibilityToggle.Parent.Position -= UDim2.fromScale(0, 1)
		end
	end)

	local function makeLines(xRange, yRange, xNum, yNum)
		for i = 0, xRange, xRange/xNum do
			if i - xRange/2 == 0 then continue end

			local frame = Instance.new("Frame", XLines)
			frame.BackgroundColor3 = Color3.new(0,0,0)
			frame.Size = UDim2.new(0, 2, 0, 10)
			frame.Position = UDim2.new(i/xRange, -1, X_Axis.Position.Y.Scale, X_Axis.Position.Y.Offset-3)

			local textLabel = Instance.new("TextLabel", XLines)
			textLabel.BackgroundTransparency = 1
			textLabel.Text = (math.round((i - xRange/2)*1000))/1000
			textLabel.Size = UDim2.new(0, 20, 0, 20)
			textLabel.Position = frame.Position + UDim2.fromOffset(-9, 10)
			textLabel.TextXAlignment = Enum.TextXAlignment.Center
			textLabel.TextYAlignment = Enum.TextYAlignment.Top
			textLabel.TextColor3 = Color3.new(0,0,0)
			textLabel.TextStrokeTransparency = 1

			if i == 0 then
				textLabel.Position += UDim2.fromOffset(10, 0)
			elseif i == xRange then
				textLabel.Position -= UDim2.fromOffset(10, 0)
			end
		end

		for i = 0, yRange, yRange/yNum do
			if i - yRange/2 == 0 then continue end

			local frame = Instance.new("Frame", YLines)
			frame.BackgroundColor3 = Color3.new(0,0,0)
			frame.Size = UDim2.new(0, 10, 0, 2)
			frame.Position = UDim2.new(Y_Axis.Position.X.Scale, Y_Axis.Position.X.Offset-2, i/yRange, -1)

			local textLabel = Instance.new("TextLabel", YLines)
			textLabel.BackgroundTransparency = 1
			textLabel.Text = -(math.round((i - yRange/2)*1000))/1000
			textLabel.Size = UDim2.new(0, 20, 0, 20)
			textLabel.Position = frame.Position + UDim2.fromOffset(13, -10)
			textLabel.TextXAlignment = Enum.TextXAlignment.Left
			textLabel.TextYAlignment = Enum.TextYAlignment.Center
			textLabel.TextColor3 = Color3.new(0,0,0)
			textLabel.TextStrokeTransparency = 1

			if i == 0 then
				textLabel.Position += UDim2.fromOffset(0, 7)
			elseif i == yRange then
				textLabel.Position -= UDim2.fromOffset(0, 7)
			end
		end
	end

	local function Cleanup(folder)
		folder:Destroy()
		XLines:ClearAllChildren()
		YLines:ClearAllChildren()
	end

	local function create(targetFunc, interval, delay, xSize, ySize, intervalUntilDelay, numXLines, numYLines)
		interval = interval or 0.01
		intervalUntilDelay = intervalUntilDelay or 1
		delay = delay or 0.01

		xSize = xSize and xSize >= 2 and xSize or 10
		ySize = ySize and ySize >= 2 and ySize or 10

		if xSize%2 ~= 0 then
			xSize += 1
		end

		if ySize%2 ~= 0 then
			ySize += 1
		end

		local min = -xSize/2
		local max = xSize/2

		numXLines = numXLines or 10
		numYLines = numYLines or 10

		makeLines(xSize, ySize, numXLines, numYLines)

		local folder = Instance.new("Folder", hostFrame)
		folder.Name = debug.info(targetFunc, "n")

		local delayInterval = 0

		for i = min, max, interval do
			i = math.round(i/interval)*interval
			local VALUES = {targetFunc(i)} -- support for multiple outputs

			local justInserted = {}

			if not KeepAdding then VisibilityToggle.MouseButton1Click:Wait() end
			if not hostFrame.Visible then hostFrame:GetPropertyChangedSignal("Visible"):Wait() end

			for valueInd, VALUE in VALUES do
				--if VALUE ~= VALUE then continue end -- NaN
				VALUE = -VALUE

				if (math.abs(VALUE) < 1e-9 or VALUE ~= VALUE) and VALUE ~= 0 and justInserted[#justInserted] ~= valueInd then
					local furtherTest1, furtherTest2
						= (targetFunc(i+interval)), (targetFunc(i-interval))
					if furtherTest1 ~= furtherTest1 or furtherTest2 ~= furtherTest2 then
						continue
					end

					table.insert(VALUES, targetFunc((math.round(i*1e8)/1e8)))
					table.insert(justInserted, valueInd+1)
					continue
				end

				local frame = Instance.new("Frame", folder)
				frame.Size = UDim2.fromOffset(2, 2)

				-- (VALUE > maxY*1e9 or VALUE < -maxY*1e9) used to be a valid condition but values are more exact now and this falses for things like e^x for example
				if VALUE == 1/0 or VALUE == -1/0 or (VALUE ~= VALUE and justInserted[#justInserted] == valueInd) then -- close to, or infinity (red line)
					frame.Position = UDim2.new(i/xSize + 0.5, -3, 0, 0)
					frame.Size = UDim2.new(0, 6, 1, 0)
					frame.BackgroundColor3 = Color3.fromRGB(255,0,0)
					frame.BorderSizePixel = 0
					frame.Transparency = 0.5
					hint.Text ..= " (VA/hole @ x = " .. i .. ")"
				else -- default
					frame.Position = UDim2.new(i/xSize + 0.5, -1, VALUE/ySize + 0.5, -1)
					frame.BackgroundColor3 = Color3.fromRGB(0,0,0)

					if frame.Position.Y.Scale > 1 or frame.Position.Y.Scale < 0 then
						frame:Destroy()
					end
				end
			end

			delayInterval += 1
			if (delay and delay ~= 0) and delayInterval % intervalUntilDelay == 0 then
				task.wait(delay)
			end
		end

		Cleanup(folder)
	end

	local __FUNCTION = params.Function
	hint.Text = params.Name

	-- create(func, forLoopInterval, delayBetweenEachFrame, xRange, yRange, intervalUntilDelay, numOfXLines, numOfYLines)

	while true do
		create(
			__FUNCTION,
			params.forLoopInterval or 0.1,
			params.delayBetweenEachFrame or 1e-3,
			params.xRange or 50,
			params.yRange or math.round(__FUNCTION())*10,
			params.intervalUntilDelay or 1,
			params.numOfXLines or nil,
			params.numOfYLines or nil
		)
	end
end)()
