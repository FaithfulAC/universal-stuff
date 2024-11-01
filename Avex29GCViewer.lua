-- all the credit goes directly to airzy i did not make this script

--Settings
local GuiTransparency = 0.4
local BackgroundColors = Color3.new(0.2,0.2,0.2)

local EspNpcs = true         -- Esp Npcs
local EspMyChar = false      -- Puts Esp on your player

--Prevent MemChecks
local EspLoopSpeed = 1000 -- Esp Load Speed
local InstantEsp = true     -- Instant Load Time
local SafeEsp = false        -- Removes Box / Minimize Esp



--Globals
local CoreEsp_Enabled = false
local EspIsFullyLoaded = false
local IsLoadingESP = false
local EspBoxTable = {}
local EspHumFounds = {}

local ScriptIsDead = false
local cloneref = cloneref or function(...) return ... end
local function GServ(n)
	return cloneref(game:GetService(n))
end

local ReplicateStore    = GServ("ReplicatedStorage")
local ReplicateFirst    = GServ("ReplicatedFirst")
local RService          = GServ("RunService")
local GuiService        = GServ("GuiService")
local StarterGui        = GServ("StarterGui")
local Players           = GServ("Players")
local CoreGui           = GServ("CoreGui")
local Debris            = GServ("Debris")
local StatsService      = GServ("Stats")
local Cam               = cloneref(workspace.CurrentCamera)
local Lplr              = Players.LocalPlayer
local Mouse             = Lplr:GetMouse()

local FGINFO = debug.getinfo

local AllFunctions = {} -- Removed when Avex closes

local num_Abbreviations = {
	"K", -- 4 digits
	"M", -- 7 digits
	"B", -- 10 digits
	"T", -- 13 digits
	"QD", -- 16 digits
	"QT", -- 19 digits
	"SXT", -- 22 digits
	"SEPT", -- 25 digits
	"OCT", -- 28 digits
	"NON", -- 31 digits
	"DEC", -- 34 digits
	"UDEC", -- 37 digits
	"DDEC", -- 40 digits
}

local function Abbreviate(x)
	if x < 1000 then 
		return tostring(x)
	end

	local digits = math.floor(math.log10(x)) + 1
	local index = math.min(#num_Abbreviations, math.floor((digits - 1) / 3))
	local front = x / math.pow(10, index * 3)

	return string.format("%i%s+", front, num_Abbreviations[index])
end

local function CreateFrame(Pos,Size,FrameColor,FrameTransparency)
	local NewFrame = Instance.new("Frame")
	NewFrame.Size = Size
	NewFrame.Position = Pos
	NewFrame.BackgroundColor3 = FrameColor
	NewFrame.BackgroundTransparency = FrameTransparency
	NewFrame.BorderSizePixel = 0
	return NewFrame
end

local function CreateTextLabel(Pos,Size,BackColor,BackTransparency,TextColor)
	local NewTBox = Instance.new("TextLabel")
	NewTBox.Size = Size
	NewTBox.Position = Pos
	NewTBox.TextColor3 = TextColor
	NewTBox.TextScaled = true
	NewTBox.Active = false
	NewTBox.Selectable = false
	NewTBox.BackgroundColor3 = BackColor
	NewTBox.BackgroundTransparency = BackTransparency
	NewTBox.BorderSizePixel = 0
	return NewTBox
end

local PrimeGui = Instance.new("ScreenGui")
PrimeGui.ResetOnSpawn = false
PrimeGui.DisplayOrder = 100
PrimeGui.Enabled = true
PrimeGui.Parent = CoreGui

local MainCanvas = CreateFrame(
	UDim2.new(0.31, 0, 0, -GuiService:GetGuiInset().Y),
	UDim2.new(0.2, 0, 0.15, 0),
	BackgroundColors, GuiTransparency) -- Transparency
MainCanvas.Parent = PrimeGui

local ExitButton = CreateTextLabel(
	UDim2.new(0.01, 0, 0.025, 0),
	UDim2.new(0.2, 0, 0.15, 0),
	Color3.new(0,0,0), 0.6,
	Color3.new(1,1,1) --TextColor
)
ExitButton.Text = "×"
ExitButton.InputBegan:Connect(function(obj)
	if obj.UserInputType == Enum.UserInputType.MouseButton1 then
		IsLoadingESP = false
		for _,v in pairs(AllFunctions) do
			pcall(function()
				v:Disconnect()
			end)
		end
		Debris:AddItem(PrimeGui, 0)
        ScriptIsDead = true
	elseif obj.UserInputType == Enum.UserInputType.MouseMovement then
		ExitButton.Text = "•"
	end
end)
ExitButton.InputEnded:Connect(function(obj)
	if obj.UserInputType == Enum.UserInputType.MouseMovement then
		ExitButton.Text = "×"
	end
end)
ExitButton.Parent = MainCanvas

local MainLabel = CreateTextLabel(
	UDim2.new(0.22, 0, 0.025, 0),
	UDim2.new(0.76, 0, 0.15, 0),
	Color3.new(0,0,0), 0.6,
	Color3.new(1,1,1) --TextColor
)
MainLabel.Text = "«  Avex-Secure  »"
MainLabel.Parent = MainCanvas

local DetailFrame = CreateFrame(
	UDim2.new(0, 0, 0, 0),
	UDim2.new(1, 0, 0.205, 0),
	Color3.new(0,0,0), 0.7)
DetailFrame.ZIndex = 0
DetailFrame.Parent = MainCanvas

--EspTemplate
local MainEspTemplate = Instance.new("BillboardGui")
MainEspTemplate.Adornee = nil 
MainEspTemplate.AlwaysOnTop = true
MainEspTemplate.Enabled = false
MainEspTemplate.ResetOnSpawn = false
MainEspTemplate.LightInfluence = 0
MainEspTemplate.Size = UDim2.new(1,0,1,0)
MainEspTemplate.MaxDistance = 10000000000000000
MainEspTemplate.ClipsDescendants = false
MainEspTemplate.Parent = PrimeGui

local BGPDisplay = Instance.new("Frame")
BGPDisplay.Name = "Display"
BGPDisplay.BackgroundColor3 = Color3.new(1, 0, 0.984314)
BGPDisplay.Size = UDim2.new(0.6,0,1,0)
BGPDisplay.Position = UDim2.new(0.2,0,0,0)
BGPDisplay.Transparency = 1
BGPDisplay.BorderSizePixel = 0
BGPDisplay.ZIndex = 2

if SafeEsp == false then
	local bgpLeft = BGPDisplay:Clone()
	bgpLeft.Size = UDim2.new(0.02,1,1,0)
	bgpLeft.Position = UDim2.new(0,0,0,0)
	bgpLeft.Transparency = 0
	local bgpRight = BGPDisplay:Clone()
	bgpRight.Size = UDim2.new(0.02,1,1,0)
	bgpRight.Position = UDim2.new(0.98,-1,0,0)
	bgpRight.Transparency = 0
	local bgpDown = BGPDisplay:Clone()
	bgpDown.Size = UDim2.new(1,0,0.013,1)
	bgpDown.Position = UDim2.new(0,0,0.987,0)
	bgpDown.Transparency = 0
	local bgpUp = BGPDisplay:Clone()
	bgpUp.Size = UDim2.new(1,0,0.013,1)
	bgpUp.Position = UDim2.new(0,0,0,0)
	bgpUp.Transparency = 0
	bgpRight.Parent = BGPDisplay
	bgpDown.Parent = BGPDisplay
	bgpUp.Parent = BGPDisplay
	bgpLeft.Parent = BGPDisplay
end
BGPDisplay.Parent = MainEspTemplate

local BGPFrame = Instance.new("Frame")
BGPFrame.Name = "Frame"
BGPFrame.BackgroundColor3 = Color3.new(0.690196, 0.164706, 0.164706) --BackSide of Hp
BGPFrame.Size = UDim2.new(0.6,0,0.03,0)
BGPFrame.Position = UDim2.new(0.2,0,0,0)
BGPFrame.Transparency = 0
BGPFrame.BorderSizePixel = 0
BGPFrame.ZIndex = 4
BGPFrame.Parent = MainEspTemplate
local BGPFrameCore = Instance.new("Frame")
BGPFrameCore.Name = "Frame"
BGPFrameCore.BackgroundColor3 = Color3.new(0.0470588, 1, 0) -- GreenSide of Hp
BGPFrameCore.Size = UDim2.new(1,0,1,0)
BGPFrameCore.Transparency = 0
BGPFrameCore.BorderSizePixel = 0
BGPFrameCore.ZIndex = 10
BGPFrameCore.Parent = BGPFrame

local BTextButton = Instance.new("TextLabel") -- Username Display
BTextButton.Name = "TextButton"
BTextButton.TextScaled = true
BTextButton.TextColor3 = Color3.new(1, 1, 1)
BTextButton.Size = UDim2.new(0.6,0,0.05,0)
BTextButton.Position = UDim2.new(0.2,0,0.93,0)
BTextButton.BackgroundTransparency = 1
BTextButton.BorderSizePixel = 0
BTextButton.ZIndex = 12
BTextButton.Parent = MainEspTemplate
local BHpText = Instance.new("TextLabel") -- MaxHp Display
BHpText.Name = "BHpText"
BHpText.Text = "-Unloaded-"
BHpText.TextScaled = true
BHpText.TextColor3 = Color3.new(0,0,0)
BHpText.Size = UDim2.new(0.5,0,0.05,0)
BHpText.Position = UDim2.new(0.6,0,-0.01,0)
BHpText.BackgroundTransparency = 1
BHpText.BorderSizePixel = 0
BHpText.ZIndex = 11
BHpText.Parent = MainEspTemplate
local BParText = Instance.new("TextLabel") -- Parent Name Display
BParText.Name = "BParText"
BParText.Text = "-Unloaded-"
BParText.TextScaled = true
BParText.TextColor3 = Color3.new(0,0,0)
BParText.Size = UDim2.new(0.5,0,0.03,0)
BParText.Position = UDim2.new(0.6,0,0.05,0)
BParText.BackgroundTransparency = 1
BParText.BorderSizePixel = 0
BParText.ZIndex = 11
BParText.Parent = MainEspTemplate

function CreateEspBox(vprime,vhum)
	if vprime and vhum and not table.find(EspHumFounds,vhum) and vhum.Parent then
		if EspMyChar == false and Lplr.Character then
			if vhum.Parent.Name == Lplr.Character.Name then
				return
			end
		end
		table.insert(EspHumFounds,vhum)
		if vprime and vprime.Parent then
			local changeFunc = nil
			local HPBILL = MainEspTemplate:Clone()
			HPBILL.Adornee = vprime
			HPBILL.Size = UDim2.new(math.abs(vprime.Size.X+vprime.Size.Z)*2 + 1,0,vprime.Size.Y*3,0)
			HPBILL.Enabled = CoreEsp_Enabled
			HPBILL.Active = true
			HPBILL.Frame.Frame.Size = UDim2.new(vhum.Health/vhum.MaxHealth,0,1,0)
			HPBILL.TextButton.Text = tostring(vprime.Parent)
			HPBILL.BHpText.Text = tostring(Abbreviate(vhum.MaxHealth))
			HPBILL.BParText.Text = tostring(Abbreviate(vhum.Health))
			local fCOL = BrickColor.new(1)
			if HPBILL:FindFirstChild("Display") then
				for _,hpv in pairs(HPBILL.Display:GetChildren()) do
					hpv.BackgroundColor3 = Color3.new(1, 1, 1)
					if Players:FindFirstChild(tostring(vprime.Parent)) then
						local chosenplr = Players:FindFirstChild(tostring(vprime.Parent))
						hpv.BackgroundColor3 = Color3.new(1, 0, 0.984314)
						if chosenplr.Team then
							hpv.BackgroundColor = chosenplr.Team.TeamColor
						end
					end
					fCOL = hpv.BackgroundColor
				end
			end
			HPBILL.TextButton.TextColor = fCOL
			HPBILL.BHpText.TextColor = fCOL
			HPBILL.BParText.TextColor = fCOL
			HPBILL.Parent = PrimeGui

			table.insert(EspBoxTable,HPBILL)

			changeFunc = vhum.HealthChanged:Connect(function()
				pcall(function()
					HPBILL.BParText.Text = tostring(Abbreviate(math.floor(vhum.Health)))
					HPBILL.Frame.Frame.Size = UDim2.new(vhum.Health/vhum.MaxHealth,0,1,0)
					HPBILL.BHpText.Text = tostring(Abbreviate(math.floor(vhum.MaxHealth)))
				end)
			end)
			table.insert(AllFunctions,changeFunc)
		end
	end
end

local LoadIC = 0
function LoadAllEsp(fromRefresh)
    pcall(function()
        IsLoadingESP = true
        if EspNpcs == true then
            for _,v in pairs(workspace:GetDescendants()) do
                if v and v:FindFirstChildOfClass("Humanoid") then
                    local FoundHum = v:FindFirstChildOfClass("Humanoid")
                    local FRoot = FoundHum.RootPart
                    CreateEspBox(FRoot, FoundHum)
                    if InstantEsp == false then
                        task.wait()
                    end
                end
                if IsLoadingESP == false and InstantEsp == false then
                    break
                end
                LoadIC = LoadIC + 1
                if LoadIC%EspLoopSpeed == 0 then
                    task.wait()
                end
            end
        else
            for _,r in pairs(Players:GetChildren()) do
                pcall(function()
                    local v = r.Character
                    if v and v:FindFirstChildOfClass("Humanoid") then
                        local FoundHum = v:FindFirstChildOfClass("Humanoid")
                        local FRoot = FoundHum.RootPart
                        CreateEspBox(FRoot, FoundHum)
                    end
                end)
                if IsLoadingESP == false then
                    break
                end
                LoadIC = LoadIC + 1
                if LoadIC%EspLoopSpeed == 0 and InstantEsp == false then
                    task.wait()
                end
            end
        end
        IsLoadingESP = false
        EspIsFullyLoaded = true       IsLoadingESP = true
        if EspNpcs == true then
            for _,v in pairs(workspace:GetDescendants()) do
                if v and v:FindFirstChildOfClass("Humanoid") then
                    local FoundHum = v:FindFirstChildOfClass("Humanoid")
                    local FRoot = FoundHum.RootPart
                    CreateEspBox(FRoot, FoundHum)
                    if InstantEsp == false then
                        task.wait()
                    end
                end
                if IsLoadingESP == false and InstantEsp == false then
                    break
                end
                LoadIC = LoadIC + 1
                if LoadIC%EspLoopSpeed == 0 then
                    task.wait()
                end
            end
        else
            for _,r in pairs(Players:GetChildren()) do
                pcall(function()
                    local v = r.Character
                    if v and v:FindFirstChildOfClass("Humanoid") then
                        local FoundHum = v:FindFirstChildOfClass("Humanoid")
                        local FRoot = FoundHum.RootPart
                        CreateEspBox(FRoot, FoundHum)
                    end
                end)
                if IsLoadingESP == false then
                    break
                end
                LoadIC = LoadIC + 1
                if LoadIC%EspLoopSpeed == 0 and InstantEsp == false then
                    task.wait()
                end
            end
        end
        IsLoadingESP = false
        EspIsFullyLoaded = true
    end)
end

local MainEspToggle = CreateTextLabel(
	UDim2.new(0.01, 0, 0.24, 0),
	UDim2.new(0.3, 0, 0.15, 0),
	Color3.new(0,0,0), 0.6,
	Color3.new(1,1,1) --TextColor
)
MainEspToggle.Text = "      Core Esp ×      "
MainEspToggle.InputBegan:Connect(function(obj)
	if obj.UserInputType == Enum.UserInputType.MouseButton1 and IsLoadingESP == false then
		IsLoadingESP = true
		if CoreEsp_Enabled == false then
			MainEspToggle.Text = "      Core Esp ~      "
			CoreEsp_Enabled = true
			if EspIsFullyLoaded == false then
				LoadAllEsp()
			else
				for _,espV in pairs(EspBoxTable) do
					espV.Enabled = CoreEsp_Enabled
					LoadIC = LoadIC + 1
					if LoadIC%4 == 0 and InstantEsp == false then
						task.wait()
					end
				end
			end
			MainEspToggle.Text = "      Core Esp ★      "
		else
			MainEspToggle.Text = "      Core Esp ~      "
			CoreEsp_Enabled = false
			for _,espV in pairs(EspBoxTable) do
				espV.Enabled = CoreEsp_Enabled
				LoadIC = LoadIC + 1
				if LoadIC%4 == 0 and InstantEsp == false then
					task.wait()
				end
			end
			MainEspToggle.Text = "      Core Esp ×      "
		end
		IsLoadingESP = false
	end
end)
MainEspToggle.Parent = MainCanvas

local EspRefresh = CreateTextLabel(
	UDim2.new(0.01, 0, 0.4, 0),
	UDim2.new(0.3, 0, 0.15, 0),
	Color3.new(0,0,0), 0.6,
	Color3.new(1,1,1) --TextColor
)
EspRefresh.Text = "         Refresh ↑          "
EspRefresh.InputBegan:Connect(function(obj)
	if obj.UserInputType == Enum.UserInputType.MouseButton1 and IsLoadingESP == false and EspIsFullyLoaded == true then
		IsLoadingESP = true
		EspRefresh.Text = "         Refresh ↓          "
		for _,espV in pairs(EspBoxTable) do
			espV:Destroy()
			LoadIC = LoadIC + 1
			if LoadIC%2 == 0 and InstantEsp == false then
				task.wait()
			end
		end
		LoadIC = 0
		EspHumFounds = {}
		EspBoxTable = {}
		LoadAllEsp(true)
		EspRefresh.Text = "         Refresh ↑          "
		IsLoadingESP = false
	end
end)
EspRefresh.Parent = MainCanvas


local FoundGCScripts = {}
local SelectedItemFrame = nil
local SelectedFunctionInFrame = nil
local SelectedConstrantUValue = nil
local SelectedConstrantUIndex = nil

local function ClearFrame(Frame)
    for _,v in pairs(Frame:GetChildren()) do
        if v then
            local r,err = pcall(function()
                v.TextColor = (v.TextColor)
            end)
            if err == nil then
                v:Destroy()
            end
        end
    end
end

local GCMainFrame = CreateFrame(
	UDim2.new(0.205, 0, 0, -GuiService:GetGuiInset().Y),
	UDim2.new(0.1, 0, 0.4, 0),
	Color3.new(0,0,0), 1) -- Transparency
GCMainFrame.ClipsDescendants = true
GCMainFrame.ZIndex = 0
GCMainFrame.Parent = PrimeGui
local GCViewCanvas = CreateFrame(
	UDim2.new(0,0,0,0),
	UDim2.new(1, 0, 10, 0),
	BackgroundColors, GuiTransparency) -- Transparency
GCViewCanvas.ClipsDescendants = false
GCViewCanvas.ZIndex = 100
GCViewCanvas.Visible = false
GCViewCanvas.Parent = GCMainFrame
local CGViewGrid = Instance.new("UIGridLayout")
CGViewGrid.SortOrder = Enum.SortOrder.Name
CGViewGrid.CellSize = UDim2.new(1,0,0.004,0)
CGViewGrid.CellPadding = UDim2.new(0,0,0.0005,0)
CGViewGrid.Parent = GCViewCanvas

local MainTextFrame = CreateTextLabel(
	UDim2.new(0.515, 0, 0, -GuiService:GetGuiInset().Y),
	UDim2.new(0.15, 0, 0.4, 0),
	BackgroundColors, GuiTransparency,
	Color3.new(1,1,1) --TextColor
)
MainTextFrame.Text = ""
MainTextFrame.Visible = false
MainTextFrame.TextXAlignment = Enum.TextXAlignment.Left
MainTextFrame.TextYAlignment = Enum.TextYAlignment.Top
MainTextFrame.TextScaled = false
MainTextFrame.RichText = true
MainTextFrame.TextWrapped = true
MainTextFrame.TextSize = 9
MainTextFrame.ClipsDescendants = true
MainTextFrame.Parent = PrimeGui
local MTextGrid = Instance.new("UIGridLayout")
MTextGrid.SortOrder = Enum.SortOrder.Name
MTextGrid.CellSize = UDim2.new(1,0,0.04,0)
MTextGrid.CellPadding = UDim2.new(0,0,0,1)
MTextGrid.Parent = MainTextFrame

local OriginalMTXFSize = MainTextFrame.Size
local OriginalMTXGSize = UDim2.new(1,0,0.04,0)

local FuncViewFrame = CreateFrame(
	UDim2.new(0.31, 0, 0.16, -GuiService:GetGuiInset().Y),
	UDim2.new(0.1, 0, 0.24, 0),
	BackgroundColors, GuiTransparency) -- Transparency
FuncViewFrame.ClipsDescendants = true
FuncViewFrame.ZIndex = 0
FuncViewFrame.Visible = false
FuncViewFrame.Parent = PrimeGui
local FuncViewGrid = Instance.new("UIGridLayout")
FuncViewGrid.SortOrder = Enum.SortOrder.Name
FuncViewGrid.CellSize = UDim2.new(1,0,0.07,0)
FuncViewGrid.CellPadding = UDim2.new(0,0,0.01,0)
FuncViewGrid.Parent = FuncViewFrame

local ExtraFuncFrame = CreateFrame(
	UDim2.new(0.41, 0, 0.16, -GuiService:GetGuiInset().Y),
	UDim2.new(0.1, 0, 0.24, 0),
	BackgroundColors, GuiTransparency) -- Transparency
ExtraFuncFrame.ClipsDescendants = true
ExtraFuncFrame.ZIndex = 0
ExtraFuncFrame.Visible = false
ExtraFuncFrame.Parent = PrimeGui

local EFFText = CreateTextLabel(
	UDim2.new(0.05, 0, 0, 0),
	UDim2.new(0.95, 0, 0.8, 0),
	Color3.new(0,0,0), 0.8,
	Color3.new(1,1,1) --TextColor
)
EFFText.Text = ""
EFFText.TextXAlignment = Enum.TextXAlignment.Left
EFFText.TextYAlignment = Enum.TextYAlignment.Top
EFFText.TextScaled = false
EFFText.RichText = true
EFFText.TextWrapped = true
EFFText.TextSize = 9
EFFText.Parent = ExtraFuncFrame

local EFFButton1 = CreateTextLabel(
	UDim2.new(0.05, 0, 0.85, 0),
	UDim2.new(0.3, 0, 0.1, 0),
	Color3.new(0,0,0), 0.8,
	Color3.new(1,1,1) --TextColor
)
EFFButton1.Text = "  Ignore  "
EFFButton1.TextXAlignment = 2
EFFButton1.TextYAlignment = 2
EFFButton1.TextScaled = true
EFFButton1.TextWrapped = true
EFFButton1.Parent = ExtraFuncFrame
EFFButton1.InputBegan:Connect(function(obj)
    local _,ignoreSelectErr = pcall(function()
        if obj.UserInputType == Enum.UserInputType.MouseButton1 then
            if SelectedItemFrame then
                SelectedItemFrame:Destroy()
            else
                ClearFrame(MainTextFrame)
                MainTextFrame.Visible = true
                MainTextFrame.Text = "\n  select a frame(function) to ignore"
            end
        end
    end)
    if ignoreSelectErr then
        ClearFrame(MainTextFrame)
        MainTextFrame.Visible = true
        MainTextFrame.Text = "Ignore Item Error: \n  "..tostring(constItemErr)
    end
end)

local EFFButton2 = CreateTextLabel(
	UDim2.new(0.375, 0, 0.85, 0),
	UDim2.new(0.3, 0, 0.1, 0),
	Color3.new(0,0,0), 0.8,
	Color3.new(1,1,1) --TextColor
)
EFFButton2.Text = "  Clear-F  "
EFFButton2.TextXAlignment = 2
EFFButton2.TextYAlignment = 2
EFFButton2.TextScaled = true
EFFButton2.TextWrapped = true
EFFButton2.Parent = ExtraFuncFrame
EFFButton2.InputBegan:Connect(function(obj)
    local _,clearFuncErr = pcall(function()
        if obj.UserInputType == Enum.UserInputType.MouseButton1 then
            if SelectedFunctionInFrame then
                hookfunction(SelectedFunctionInFrame, function()
                    return nil
                end)
                if SelectedItemFrame then
                    SelectedItemFrame:Destroy()
                end
                MainTextFrame.Visible = true
                MainTextFrame.Text = "\n  Succesfully Cleared The Function"
                ClearFrame(MainTextFrame)
            else
                ClearFrame(MainTextFrame)
                MainTextFrame.Visible = true
                MainTextFrame.Text = "\n  select a function to clear"
            end
        end
    end)
    if clearFuncErr then
        ClearFrame(MainTextFrame)
        MainTextFrame.Visible = true
        MainTextFrame.Text = "Clear Func Error: \n  "..tostring(clearFuncErr)
    end
end)

local EFFButton3 = CreateTextLabel(
	UDim2.new(0.7, 0, 0.85, 0),
	UDim2.new(0.25, 0, 0.1, 0),
	Color3.new(0,0,0), 0.8,
	Color3.new(1,1,1) --TextColor
)
EFFButton3.Text = "  Fire-F  "
EFFButton3.TextXAlignment = 2
EFFButton3.TextYAlignment = 2
EFFButton3.TextScaled = true
EFFButton3.TextWrapped = true
EFFButton3.Parent = ExtraFuncFrame
EFFButton3.InputBegan:Connect(function(obj)
    local _,clearFuncErr = pcall(function()
        if obj.UserInputType == Enum.UserInputType.MouseButton1 then
            if SelectedFunctionInFrame then
                local whatReturned = nil
                local _,returnedErr = pcall(function()
                    whatReturned = SelectedFunctionInFrame()
                end)
                ClearFrame(MainTextFrame)
                MainTextFrame.Visible = true
                MainTextFrame.Text = "\n  Function fire SUCCESS\n\n  Returned Err: "..tostring(returnedErr)
                MainTextFrame.Text = MainTextFrame.Text.."\n\n  Returned: "..tostring(whatReturned)..";\n  Type{"..tostring(type(whatReturned)).."};"
            else
                ClearFrame(MainTextFrame)
                MainTextFrame.Visible = true
                MainTextFrame.Text = "\n  select a function to fire"
            end
        end
    end)
    if clearFuncErr then
        ClearFrame(MainTextFrame)
        MainTextFrame.Visible = true
        MainTextFrame.Text = "Clear Func Error: \n  "..tostring(clearFuncErr)
    end
end)

local MTXButton2 = CreateTextLabel(
	UDim2.new(0.565, 0, 0.335, 0),
	UDim2.new(0.04, 0, 0.02, 0),
	Color3.new(0,0,0), 0.8,
	Color3.new(1,1,1) --TextColor
)
local MTXButton = CreateTextLabel(
	UDim2.new(0.61, 0, 0.335, 0),
	UDim2.new(0.05, 0, 0.02, 0),
	Color3.new(0,0,0), 0.8,
	Color3.new(1,1,1) --TextColor
)

local function ShowConstants(VItem)
    MainTextFrame.Text = ""
    MainTextFrame.Size = OriginalMTXFSize
    MTextGrid.CellSize = OriginalMTXGSize
    SelectedConstrantUValue = nil
    SelectedConstrantUIndex = 0
    local r,upValErr = pcall(function()
        ClearFrame(MainTextFrame)
        local TotalAddup = 0
        local uVals = debug.getupvalues(VItem)
        local cVals = debug.getconstants(VItem)
        for upValIndex,RealUpValue in pairs(uVals) do
            TotalAddup = TotalAddup + 1
            local constItem = CreateTextLabel(
				UDim2.new(0.35, 0, 0.24, 0),
				UDim2.new(0.3, 0, 0.15, 0),
				Color3.new(0,0,0), 0.6,
				Color3.new(1,1,1) --TextColor
			)
            constItem.Name = "y"
            constItem.Text = "  ["..tostring(upValIndex).."] "..tostring(RealUpValue)
            if tostring(type(RealUpValue)) == "userdata" then
                local _, IsInvaliderr = pcall(function()
                    if RealUpValue.ClassName == "RemoteEvent" then
                        constItem.TextColor3 = Color3.new(1,0.6,0)
                    elseif RealUpValue.ClassName == "RemoteFunction" then
                        constItem.TextColor3 = Color3.new(0.8,0,1)
                    else
                        constItem.TextColor3 = Color3.new(0.8,0.8,0.9)
                    end
                end)
                if IsInvaliderr then
                    constItem.TextColor3 = Color3.new(1,0,0)
                    if tostring(RealUpValue) == "" or tostring(RealUpValue) == " " then
                        constItem.Text = "  ["..tostring(upValIndex).."] ".." null Name, Type: "..tostring(type(RealUpValue))
                    end
                end
            elseif tostring(type(RealUpValue)) == "vector" then
                constItem.TextColor3 = Color3.new(0.8,1,0.7)
            elseif tostring(type(RealUpValue)) == "string" then
                constItem.TextColor3 = Color3.new(0.2,0.9,0.2)
                constItem.Name = constItem.Name.."z"
            elseif tostring(type(RealUpValue)) == "number" then
                constItem.TextColor3 = Color3.new(0.9,0.6,1)
            elseif tostring(type(RealUpValue)) == "table" then
                constItem.TextColor3 = Color3.new(1,0.8,0.4)
            elseif tostring(type(RealUpValue)) == "boolean" then
                constItem.TextColor3 = Color3.new(0.6,0,1)
            elseif tostring(type(RealUpValue)) == "function" then
                constItem.TextColor3 = Color3.new(0.2,0.5,1)
                local FInfo = FGINFO(RealUpValue)
                constItem.Text = "  ["..tostring(upValIndex).."] "..tostring(rawget(FInfo,"name"))
            end
            if string.sub(constItem.Text,#constItem.Text,#constItem.Text) == " " then
                constItem.Text = "  ["..tostring(upValIndex).."] ".." null Name, Type: "..tostring(type(RealUpValue))
            end
            constItem.Name = constItem.Name..tostring(upValIndex)
			constItem.TextXAlignment = Enum.TextXAlignment.Left
			constItem.TextYAlignment = Enum.TextYAlignment.Top
            constItem.Parent = MainTextFrame
            constItem.InputBegan:Connect(function(obj2)
				local _,constItemErr = pcall(function()
                    local LocalSelectedItemFrame = SelectedItemFrame
                    if obj2.UserInputType == Enum.UserInputType.MouseButton1 then
                        ClearFrame(MainTextFrame)
                        SelectedConstrantUValue = RealUpValue
                        SelectedConstrantUIndex = upValIndex
                        if tostring(type(RealUpValue)) == "table" then
                            MTXButton.Visible = true
                            MainTextFrame.Text = MainTextFrame.Text.."\n  TableView: {"
                            for tabRUVIndex,RealUpValue2 in pairs(RealUpValue) do
                                MainTextFrame.Text = MainTextFrame.Text.."\n    "..tostring(tabRUVIndex).." = "
                                if tostring(type(RealUpValue2)) ~= "string" then
                                    MainTextFrame.Text = MainTextFrame.Text..""..tostring(RealUpValue2)..";"
                                else
                                    MainTextFrame.Text = MainTextFrame.Text.."\""..tostring(RealUpValue2).."\";"
                                end
                                if SelectedItemFrame == LocalSelectedItemFrame then
                                    task.wait()
                                else
                                    MainTextFrame.Text = ""
                                    break
                                end
                            end
                            if SelectedItemFrame == LocalSelectedItemFrame then
                                MainTextFrame.Text = MainTextFrame.Text.."\n  }"
                            end
                        else
                            MTXButton2.Visible = true
                            MTXButton.Visible = true
                            MainTextFrame.Text = MainTextFrame.Text.."\n  Item: "..tostring(RealUpValue)
                            MainTextFrame.Text = MainTextFrame.Text.."\n  Type: "..tostring(type(RealUpValue))
                            pcall(function()
                                local CLName = RealUpValue.ClassName
                                MainTextFrame.Text = MainTextFrame.Text.."\n  ClassName: "..tostring(RealUpValue.ClassName)
                            end)
                            if tostring(type(RealUpValue)) == "function" then
                                MainTextFrame.Text = MainTextFrame.Text.."\n"
                                for l,r in pairs(FGINFO(RealUpValue)) do
                                    MainTextFrame.Text = MainTextFrame.Text.."\n  "..tostring(l).." {"..tostring(r).."}"
                                end
                            end
                        end
                    end
                end)
                if constItemErr then
                    MainTextFrame.Visible = true
                    MainTextFrame.Text = "Const Item Error: \n  "..tostring(constItemErr)
                end
            end)
            task.wait()
            if TotalAddup > 20 then
                MainTextFrame.Size = UDim2.new(0.15, 0, 0.4*(1+(TotalAddup-20)/24), 0)
                MTextGrid.CellSize = UDim2.new(1,0,0.04/(1+(TotalAddup-20)/24),0)
            else
                MainTextFrame.Size = OriginalMTXFSize
                MTextGrid.CellSize = OriginalMTXGSize
            end
        end
        for upValIndex,RealConstVal in pairs(cVals) do
            TotalAddup = TotalAddup + 1
            local constItem2 = CreateTextLabel(
				UDim2.new(0.35, 0, 0.24, 0),
				UDim2.new(0.3, 0, 0.15, 0),
				Color3.new(0.3,0.1,0.1), 0.2,
				Color3.new(1,1,1) --TextColor
			)
            constItem2.Name = "z"
            constItem2.Text = "  ["..tostring(upValIndex).."] "..tostring(RealConstVal)
            if tostring(type(RealConstVal)) == "userdata" then
                local _, IsInvaliderr = pcall(function()
                    if RealConstVal.ClassName == "RemoteEvent" then
                        constItem2.TextColor3 = Color3.new(1,0.6,0)
                    elseif RealConstVal.ClassName == "RemoteFunction" then
                        constItem.TextColor3 = Color3.new(0.8,0,1)
                    else
                        constItem2.TextColor3 = Color3.new(0.8,0.8,0.9)
                    end
                end)
                if IsInvaliderr then
                    constItem2.TextColor3 = Color3.new(1,0,0)
                    if tostring(RealConstVal) == "" or tostring(RealConstVal) == " " then
                        constItem2.Text = "  ["..tostring(upValIndex).."] ".." null Name, Type: "..tostring(type(RealConstVal))
                    end
                end
            elseif tostring(type(RealConstVal)) == "vector" then
                constItem2.TextColor3 = Color3.new(0.8,1,0.7)
            elseif tostring(type(RealConstVal)) == "string" then
                constItem2.TextColor3 = Color3.new(0.2,0.9,0.2)
                constItem2.Name = constItem2.Name.."z"
            elseif tostring(type(RealConstVal)) == "number" then
                constItem2.TextColor3 = Color3.new(0.9,0.6,1)
            elseif tostring(type(RealConstVal)) == "table" then
                constItem2.TextColor3 = Color3.new(1,0.8,0.4)
            elseif tostring(type(RealConstVal)) == "boolean" then
                constItem2.TextColor3 = Color3.new(0.6,0,1)
            elseif tostring(type(RealConstVal)) == "function" then
                constItem2.TextColor3 = Color3.new(0.2,0.5,1)
                local FInfo = FGINFO(RealConstVal)
                constItem2.Text = "  ["..tostring(upValIndex).."] "..tostring(rawget(FInfo,"name"))
            end
            if string.sub(constItem2.Text,#constItem2.Text,#constItem2.Text) == " " then
                constItem2.Text = "  ["..tostring(upValIndex).."] ".." null Name, Type: "..tostring(type(RealConstVal))
            end
            constItem2.Name = constItem2.Name..tostring(upValIndex)
			constItem2.TextXAlignment = Enum.TextXAlignment.Left
			constItem2.TextYAlignment = Enum.TextYAlignment.Top
            constItem2.Parent = MainTextFrame
            constItem2.InputBegan:Connect(function(obj2)
				local _,constItemErr = pcall(function()
                    local LocalSelectedItemFrame = SelectedItemFrame
                    if obj2.UserInputType == Enum.UserInputType.MouseButton1 then
                        ClearFrame(MainTextFrame)
                        SelectedConstrantUValue = RealConstVal
                        SelectedConstrantUIndex = upValIndex
                        if tostring(type(RealConstVal)) == "table" then
                            MTXButton.Visible = true
                            MainTextFrame.Text = MainTextFrame.Text.."\n  TableView: {"
                            for tabRUVIndex,RealConstVal2 in pairs(RealConstVal) do
                                MainTextFrame.Text = MainTextFrame.Text.."\n    "..tostring(tabRUVIndex).." = "
                                if tostring(type(RealConstVal2)) ~= "string" then
                                    MainTextFrame.Text = MainTextFrame.Text..""..tostring(RealConstVal2)..";"
                                else
                                    MainTextFrame.Text = MainTextFrame.Text.."\""..tostring(RealConstVal2).."\";"
                                end
                                if SelectedItemFrame == LocalSelectedItemFrame then
                                    task.wait()
                                else
                                    MainTextFrame.Text = ""
                                    break
                                end
                            end
                            if SelectedItemFrame == LocalSelectedItemFrame then
                                MainTextFrame.Text = MainTextFrame.Text.."\n  }"
                            end
                        else
                            MTXButton2.Visible = true
                            MTXButton.Visible = true
                            MainTextFrame.Text = MainTextFrame.Text.."\n  Item: "..tostring(RealConstVal)
                            MainTextFrame.Text = MainTextFrame.Text.."\n  Type: "..tostring(type(RealConstVal))
                            pcall(function()
                                local CLName = RealConstVal.ClassName
                                MainTextFrame.Text = MainTextFrame.Text.."\n  ClassName: "..tostring(RealConstVal.ClassName)
                            end)
                            if tostring(type(RealConstVal)) == "function" then
                                MainTextFrame.Text = MainTextFrame.Text.."\n"
                                for l,r in pairs(FGINFO(RealConstVal)) do
                                    MainTextFrame.Text = MainTextFrame.Text.."\n  "..tostring(l).." {"..tostring(r).."}"
                                end
                            end
                        end
                    end
                end)
                if constItemErr then
                    MainTextFrame.Visible = true
                    MainTextFrame.Text = "Const Item Error: \n  "..tostring(constItemErr)
                end
            end)
            if TotalAddup > 20 then
                MainTextFrame.Size = UDim2.new(0.15, 0, 0.4*(1+(TotalAddup-20)/24), 0)
                MTextGrid.CellSize = UDim2.new(1,0,0.04/(1+(TotalAddup-20)/24),0)
            else
                MainTextFrame.Size = OriginalMTXFSize
                MTextGrid.CellSize = OriginalMTXGSize
            end
            task.wait()
        end
    end)
    if upValErr then
        MainTextFrame.Text = "Const Value Error: \n  "..tostring(upValErr)
    end
end

MTXButton.Text = "  Clear Value  "
MTXButton.TextXAlignment = 2
MTXButton.TextYAlignment = 2
MTXButton.ZIndex = 101
MTXButton.TextScaled = true
MTXButton.TextWrapped = true
MTXButton.Visible = false
MTXButton.Parent = PrimeGui
MTXButton.InputBegan:Connect(function(obj)
    local _,clearValErr = pcall(function()
        if obj.UserInputType == Enum.UserInputType.MouseButton1 then
            if SelectedConstrantUIndex then
                local theUpValue = debug.getupvalue(SelectedFunctionInFrame,SelectedConstrantUIndex)
                if type(SelectedConstrantUValue) == "number" then
                    debug.setupvalue(SelectedFunctionInFrame,SelectedConstrantUIndex,0)
                elseif type(SelectedConstrantUValue) == "table" then
                    debug.setupvalue(SelectedFunctionInFrame,SelectedConstrantUIndex,{})
                elseif type(SelectedConstrantUValue) == "userdata" then
                    debug.setupvalue(SelectedFunctionInFrame,SelectedConstrantUIndex,nil)
                elseif type(SelectedConstrantUValue) == "boolean" then
                    debug.setupvalue(SelectedFunctionInFrame,SelectedConstrantUIndex,false)
                elseif type(SelectedConstrantUValue) == "string" then
                    debug.setupvalue(SelectedFunctionInFrame,SelectedConstrantUIndex,"")
                end
                ShowConstants(SelectedFunctionInFrame)
            else
                MainTextFrame.Visible = true
                MainTextFrame.Text = "\n  select a value to clear"
            end
        end
    end)
    if clearValErr and string.find(clearValErr,"debug.getupvalue") then
        _,clearValErr = pcall(function()
            if obj.UserInputType == Enum.UserInputType.MouseButton1 then
                if SelectedConstrantUIndex then
                    local theUpValue = debug.getconstant(SelectedFunctionInFrame,SelectedConstrantUIndex)
                    if type(SelectedConstrantUValue) == "number" then
                        debug.setconstant(SelectedFunctionInFrame,SelectedConstrantUIndex,0)
                    elseif type(SelectedConstrantUValue) == "table" then
                        debug.setconstant(SelectedFunctionInFrame,SelectedConstrantUIndex,{})
                    elseif type(SelectedConstrantUValue) == "userdata" then
                        debug.setconstant(SelectedFunctionInFrame,SelectedConstrantUIndex,nil)
                    elseif type(SelectedConstrantUValue) == "boolean" then
                        debug.setconstant(SelectedFunctionInFrame,SelectedConstrantUIndex,false)
                    elseif type(SelectedConstrantUValue) == "string" then
                        debug.setconstant(SelectedFunctionInFrame,SelectedConstrantUIndex,"")
                    end
                    ShowConstants(SelectedFunctionInFrame)
                else
                    MainTextFrame.Visible = true
                    MainTextFrame.Text = "\n  select a value to clear"
                end
            end
        end)
    end
    if clearValErr then
        MainTextFrame.Visible = true
        MainTextFrame.Text = "Clear Value Error: \n  "..tostring(clearValErr)
    end
end)

MTXButton2.Text = "   Spoof   "
MTXButton2.TextXAlignment = 2
MTXButton2.TextYAlignment = 2
MTXButton2.ZIndex = 101
MTXButton2.TextScaled = true
MTXButton2.TextWrapped = true
MTXButton2.Visible = false
MTXButton2.Parent = PrimeGui
MTXButton2.InputBegan:Connect(function(obj)
    local _,SpoofValErr = pcall(function()
        if obj.UserInputType == Enum.UserInputType.MouseButton1 then
            if SelectedConstrantUIndex then
                if type(SelectedConstrantUValue) == "userdata" then
                    local theUpValue = debug.getupvalue(SelectedFunctionInFrame,SelectedConstrantUIndex)
                    local SpoofClone = SelectedConstrantUValue:Clone()
                    debug.setupvalue(SelectedFunctionInFrame,SelectedConstrantUIndex,SpoofClone)
                    ShowConstants(SelectedFunctionInFrame)
                else
                    local LastSelected = SelectedFunctionInFrame
                    local LastSelected2 = SelectedConstrantUIndex
                    local theUpValue = debug.getupvalue(LastSelected,LastSelected2)
                    spawn(function()
                        pcall(function()
                            while true do
                                spawn(function()
                                    pcall(function()
                                        debug.setupvalue(LastSelected,LastSelected2,theUpValue)
                                    end)
                                end)
                                if ScriptIsDead == true then
                                    break
                                end
                                task.wait()
                            end
                        end)
                    end)
                    ShowConstants(SelectedFunctionInFrame)
                end
            else
                MainTextFrame.Visible = true
                MainTextFrame.Text = "\n  select a value to spoof\n  must be a userdata"
            end
        end
    end)
    if SpoofValErr then
        MainTextFrame.Visible = true
        MainTextFrame.Text = "Spoof Value Error: \n  "..tostring(SpoofValErr).."\n\n SelectedFunc: "..tostring(SelectedFunctionInFrame)
    end
end)

local funcViewI = 0
local function DisplayGarbageCollection(gotGC)
	local scriptIndex = 1
    local nilOnlyTable = {}
    local nilIsFound = false
	for constIndex, constFigure in ipairs(gotGC) do
        local _,ggcERR2 = pcall(function()
            if type(constFigure) == "function" and islclosure(constFigure) and not (is_synapse_function or isexecutorclosure)(constFigure) then
                local FenvConst = getfenv(constFigure)
                local CheckVEK = nil
                local fnvCscript = rawget(FenvConst,"script")
                local _,rCheclErr = pcall(function()
                    CheckVEK = fnvCscript.Parent
                    local r = fnvCscript:GetFullName()
                    if type(fnvCscript) == "nil" or type(fnvCscript) == "userdata" then
                    else
                        error(constIndex)
                    end
                end)

                local PinFound = false
                local PinILocation = 0
                if rCheclErr == nil then
                    for iP,f in pairs(FoundGCScripts) do
                        if f[1] and f[1] == fnvCscript then
                            PinFound = f
                            PinILocation = iP
                            break
                        end
                    end
                else
                    if nilIsFound == true then
                        PinILocation = 0
                        PinFound = nilOnlyTable
                    else
                        PinFound = false
                        nilIsFound = true
                    end
                end

                if PinFound == false then
                    scriptIndex = scriptIndex + 1
                    local selectedSIndex = scriptIndex
                    if rCheclErr then
                        selectedSIndex = 0
                        nilOnlyTable = {constFigure}
                    else
                        FoundGCScripts[scriptIndex] = {fnvCscript,{constFigure}}
                    end
                    local gcViewItem = CreateTextLabel(
                        UDim2.new(0.35, 0, 0.24, 0),
                        UDim2.new(0.3, 0, 0.15, 0),
                        Color3.new(0,0,0), 0.8,
                        Color3.new(1,1,1) --TextColor
                    )

                    local _,TextNameErr = pcall(function()
                        gcViewItem.Text = "  "..tostring(fnvCscript).. " <"..string.sub(tostring(fnvCscript.Parent),1,8)..">"
                    end)
                    if TextNameErr then
                        gcViewItem.Text = "null name {"..tostring(constIndex).."}"
                    end
                    gcViewItem.TextXAlignment = Enum.TextXAlignment.Left
                    gcViewItem.TextYAlignment = Enum.TextYAlignment.Top

                    pcall(function()
                        if rCheclErr then
                            gcViewItem.Name = "!"
                            gcViewItem.TextColor3 = Color3.new(1,0,0.7)
                            gcViewItem.Name = gcViewItem.Name..string.sub(tostring(CheckVEK),100)
                        else
                            if fnvCscript == nil or (fnvCscript and not fnvCscript.Parent) then
                                gcViewItem.Name = "a"
                                gcViewItem.TextColor3 = Color3.new(1,0,0)
                            elseif fnvCscript:IsDescendantOf(ReplicateFirst) then
                                gcViewItem.Name = "b"
                                gcViewItem.TextColor3 = Color3.new(1,0.4,0.2)
                            elseif fnvCscript:IsDescendantOf(Lplr) then
                                gcViewItem.Name = "d"
                                gcViewItem.TextColor3 = Color3.new(0.9,0.7,0.3)
                                local FullNameFenv = tostring(fnvCscript:GetFullName())
                                if string.find(FullNameFenv,".PlayerScripts.PlayerModule.") or string.find(FullNameFenv,".PlayerScripts.ChatScript.") or string.find(FullNameFenv,".PlayerScripts.BubbleChat") or string.find(FullNameFenv,".PlayerScripts.ChatScript") or string.find(FullNameFenv,".PlayerScripts.RbxCharacterSounds.") then
                                    gcViewItem.Name = "y"
                                    gcViewItem.TextColor3 = Color3.new(0.4,0,0.6)
                                end
                            else
                                gcViewItem.Name = "zzz"
                                pcall(function()
                                    if fnvCscript:IsDescendantOf(Lplr.Character) or fnvCscript:IsDescendantOf(Lplr.Backpack) then
                                        gcViewItem.Name = "c"
                                        gcViewItem.TextColor3 = Color3.new(0.2,0.9,0.2)
                                    end
                                end)
                            end
                            gcViewItem.Name = gcViewItem.Name..string.sub(tostring(fnvCscript),100)
                        end
                    end)

                    gcViewItem.InputBegan:Connect(function(obj2)
                        if obj2.UserInputType == Enum.UserInputType.MouseButton1 then
                            local suc,nerr = pcall(function()
                                ClearFrame(FuncViewFrame)
                                ClearFrame(MainTextFrame)
                                ExtraFuncFrame.Visible = false
                                MTXButton.Visible = false
                                MTXButton2.Visible = false
                                MainTextFrame.Size = OriginalMTXFSize
                                MTextGrid.CellSize = OriginalMTXGSize

                                EFFText.Text = "\n  Script FullName:\n"
                                pcall(function()
                                    --EFFText.Text = EFFText.Text..tostring(fnvCscript:GetFullName())
                                    for _,r in pairs(tostring(fnvCscript:GetFullName()):split('.')) do
                                        EFFText.Text = EFFText.Text.."\n  "..tostring(r).."."
                                        task.wait()
                                    end
                                end)
                                pcall(function()
                                    if rCheclErr then
                                        EFFText.Text = EFFText.Text.."\n  class/type:   "..tostring(type(fnvCscript))
                                        EFFText.Text = EFFText.Text.."\n  script value: "..tostring(fnvCscript)
                                    end
                                end)
                                EFFText.Text = EFFText.Text.."\n\n  getGC_Index: "..tostring(constIndex)

                                local tableIValues = nil
                                if rCheclErr then
                                    tableIValues = nilOnlyTable
                                else
                                    tableIValues = FoundGCScripts[selectedSIndex][2]
                                end
                                for fI,VItem in pairs(tableIValues) do
                                    local funcInfo
                                    ExtraFuncFrame.Visible = true
                                    FuncViewFrame.Visible = true
                                    local FViewItem = CreateTextLabel(
                                        UDim2.new(0.35, 0, 0.24, 0),
                                        UDim2.new(0.3, 0, 0.15, 0),
                                        Color3.new(0,0,0), 0.8,
                                        Color3.new(1,1,1) --TextColor
                                    )
                                    FViewItem.Name = "zzz"
                                    FViewItem.Text = "  "..tostring(VItem).." <"..tostring(type(VItem))..">"
                                    if tostring(type(VItem)) == "function" then
                                        funcInfo = FGINFO(VItem)
                                        local fINAME = tostring(rawget(funcInfo,"name"))
                                        local fINUPS = rawget(funcInfo,"nups")
                                        FViewItem.Text = "  "..fINAME
                                        FViewItem.Name = "aaa"..tostring(10-fINUPS)
                                        if fINAME == "" or fINAME == " " then
                                            FViewItem.Name = "aab"..tostring(10-fINUPS)
                                            if fINUPS == 0 and rawget(funcInfo,"numparams") == 0 and rawget(funcInfo,"currentline") == 1 and rawget(funcInfo,"is_vararg") == 1 then
                                                FViewItem.Text = "  ["..tostring(fI).."] {while () do}"
                                            else
                                                FViewItem.Text = "  ["..tostring(fI).."] "..tostring(fINUPS)..","..tostring(rawget(funcInfo,"numparams"))
                                            end 
                                        end
                                        if tostring(fINUPS) == "0" then
                                            FViewItem.Name = "abb"
                                        end
                                    else
                                        FViewItem.Name = "!"
                                    end
                                    FViewItem.Name = FViewItem.Name..tostring(fI)
                                    FViewItem.TextXAlignment = Enum.TextXAlignment.Left
                                    FViewItem.TextYAlignment = Enum.TextYAlignment.Top
                                    FViewItem.InputBegan:Connect(function(obj3)
                                        local _,FVERR = pcall(function()
                                            if obj3.UserInputType == Enum.UserInputType.MouseButton1 then
                                                if SelectedItemFrame then
                                                    SelectedItemFrame.BackgroundColor3 = Color3.new(0,0,0)
                                                end

                                                MTXButton.Visible = false
                                                MTXButton2.Visible = false

                                                FViewItem.BackgroundColor3 = Color3.new(1,0.6,0)
                                                SelectedItemFrame = FViewItem
                                                SelectedFunctionInFrame = VItem
                                                MainTextFrame.Visible = true
                                                EFFText.Text = "\n  Function Overview:\n"
                                                EFFText.Text = EFFText.Text.."\n  Name: "..tostring(rawget(funcInfo,"name"))
                                                EFFText.Text = EFFText.Text.."\n  Line: "..tostring(rawget(funcInfo,"currentline"))
                                                EFFText.Text = EFFText.Text.."\n  Npar: "..tostring(rawget(funcInfo,"numparams"))
                                                EFFText.Text = EFFText.Text.."\n  Nups: "..tostring(rawget(funcInfo,"nups"))
                                                EFFText.Text = EFFText.Text.."\n  What: "..tostring(rawget(funcInfo,"what"))
                                                EFFText.Text = EFFText.Text.."\n  Varg: "..tostring(rawget(funcInfo,"is_vararg"))
                                                EFFText.Text = EFFText.Text.."\n\n  ID: "..tostring(fI)
                                                ShowConstants(VItem)
                                            end
                                        end)
                                        if FVERR then
                                            MainTextFrame.Visible = true
                                            MainTextFrame.Text = "Function View Error: \n  "..tostring(FVERR)
                                        end
                                    end)
                                    FViewItem.Parent = FuncViewFrame

                                    funcViewI = funcViewI + 1
                                    if funcViewI%100 == 0 then
                                        task.wait()
                                    end
                                end
                            end)
                            if nerr then
                                MainTextFrame.Visible = true
                                MainTextFrame.Text = "Garbage Collect View Error: \n  "..tostring(nerr)
                            end
                            local RSize = gcViewItem.AbsolutePosition.Y/Cam.ViewportSize.Y
                            if RSize > 0.2 then
                                for i = 1,20 do
                                    if GCViewCanvas.Position.Y.Scale <= 0 then
                                        GCViewCanvas.Position = UDim2.new(0,0,GCViewCanvas.Position.Y.Scale-(0.1/i),0)
                                        task.wait()
                                    else
                                        GCViewCanvas.Position = UDim2.new(0,0,0,0)
                                        break
                                    end
                                end
                            elseif RSize < 0.05 then
                                for i = 1,20 do 
                                    if GCViewCanvas.Position.Y.Scale <= 0 then
                                        GCViewCanvas.Position = UDim2.new(0,0,GCViewCanvas.Position.Y.Scale+(0.1/i),0)
                                        task.wait()
                                    else
                                        GCViewCanvas.Position = UDim2.new(0,0,0,0)
                                        break
                                    end
                                end
                            end
                        end
                    end)
                    gcViewItem.ZIndex = 100
                    gcViewItem.Parent = GCViewCanvas
                else
                    if rCheclErr then
                        table.insert(nilOnlyTable, constFigure)
                    else
                        table.insert(PinFound[2], constFigure)
                    end
                end
            end
        end)
        if ggcERR2 then
            MainTextFrame.Visible = true
            MainTextFrame.Text = "GetGC() Error: \n  "..ggcERR2
        end
	end
end

local GarbageViewing = false
local GarbageCViewToggle = CreateTextLabel(
	UDim2.new(0.35, 0, 0.24, 0),
	UDim2.new(0.3, 0, 0.15, 0),
	Color3.new(0,0,0), 0.6,
	Color3.new(1,1,1) --TextColor
)
GarbageCViewToggle.Text = "       GC View ×        "
GarbageCViewToggle.InputBegan:Connect(function(obj)
	if obj.UserInputType == Enum.UserInputType.MouseButton1 then
		if GarbageViewing == false then GarbageViewing = true
			GarbageCViewToggle.Text = "       GC View ★        "
            GCViewCanvas.Visible = true
			local _,GetGCErr = pcall(function()
				local gotGC = getgc()
				if gotGC then
                    ClearFrame(GCViewCanvas)
					DisplayGarbageCollection(gotGC)
				end
			end)
            if GetGCErr then
                MainTextFrame.Visible = true
                 MainTextFrame.Text = "GetGC() Error: \n  "..GetGCErr
            end
		else
			for key in pairs(FoundGCScripts) do
				FoundGCScripts[key] = nil
			end
			FoundGCScripts = {}
            GCViewCanvas.Visible = false
            MainTextFrame.Visible = false
            ExtraFuncFrame.Visible = false
            FuncViewFrame.Visible = false
            MTXButton2.Visible = false
            MTXButton.Visible = false
			GarbageViewing = false
            SelectedFunctionInFrame = nil
			GarbageCViewToggle.Text = "       GC View ×        "
		end
	end
end)
GarbageCViewToggle.Parent = MainCanvas
