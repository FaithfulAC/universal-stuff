-- Gui to Lua
-- Version: 3.2

-- Instances:

local Exec = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local SemiTop = Instance.new("Frame")
local Name = Instance.new("TextLabel")
local Buttons = Instance.new("Folder")
local Exit = Instance.new("TextButton")
local Minimize = Instance.new("TextButton")
local CodeHolder = Instance.new("Frame")
local Scroller = Instance.new("ScrollingFrame")
local Assignments = Instance.new("Folder")
local Assigner = Instance.new("TextLabel")
local Code = Instance.new("TextBox")
local Side = Instance.new("Frame")
local Execute = Instance.new("TextButton")
local Clear = Instance.new("TextButton")
local Copy = Instance.new("TextButton")
local Pcall = Instance.new("TextButton")
local Print = Instance.new("TextButton")
local Frame = Instance.new("Frame")
local Bottom = Instance.new("Frame")
local ScriptHub = Instance.new("TextButton")
local Hooks = Instance.new("TextButton")
local Console = Instance.new("TextButton")
local Options = Instance.new("TextButton")
local Script = Instance.new("Folder")
local Button = Instance.new("TextButton")
local Round = Instance.new("UICorner")
local Console_2 = Instance.new("Frame")
local Name_2 = Instance.new("TextLabel")
local Scroller_2 = Instance.new("ScrollingFrame")
local _Line_ = Instance.new("TextLabel")
local Buttons_2 = Instance.new("Folder")
local Modes = Instance.new("Folder")
local Warn = Instance.new("TextButton")
local Print_2 = Instance.new("TextButton")
local Error = Instance.new("TextButton")
local Info = Instance.new("TextButton")
local BottomConsole = Instance.new("Folder")
local Clear_2 = Instance.new("TextButton")
local Copy_2 = Instance.new("TextButton")
local Save = Instance.new("TextButton")
local Hide = Instance.new("TextButton")
local Options_2 = Instance.new("Frame")
local Name_3 = Instance.new("TextLabel")
local Buttons_3 = Instance.new("ScrollingFrame")
local DisableIndexHooks = Instance.new("TextButton")
local DisableNamecallHooks = Instance.new("TextButton")
local DisableNewIndexHooks = Instance.new("TextButton")
local DumpScripts = Instance.new("TextButton")
local SaveIns = Instance.new("TextButton")
local DumpGC = Instance.new("TextButton")
local ViewScripts = Instance.new("TextButton")
local DisableCodeSaving = Instance.new("TextButton")
local DeterredPrintYields = Instance.new("TextButton")
local UIListLayout = Instance.new("UIListLayout")
local SaveCode = Instance.new("TextButton")
local LoadCode = Instance.new("TextButton")
local SaveEuropatechChanges = Instance.new("TextButton")
local DuoViewer = Instance.new("Frame")
local Name_4 = Instance.new("TextLabel")
local Holder = Instance.new("ScrollingFrame")
local OptionsStorage = Instance.new("Folder")
local OptionsS = Instance.new("Frame")
local CopySource = Instance.new("TextButton")
local Enable = Instance.new("TextButton")
local Disable = Instance.new("TextButton")
local Destroy = Instance.new("TextButton")
local CopyPath = Instance.new("TextButton")
local ScriptHub_2 = Instance.new("Frame")
local Name_5 = Instance.new("TextLabel")
local Holder_2 = Instance.new("ScrollingFrame")
local InfY = Instance.new("TextButton")
local TSDex = Instance.new("TextButton")
local Dex = Instance.new("TextButton")
local CmdX = Instance.new("TextButton")
local SSpy = Instance.new("TextButton")
local VV4 = Instance.new("TextButton")
local GCView = Instance.new("TextButton")
local LeftSide = Instance.new("Frame")
local AntiKick = Instance.new("TextButton")
local Descriptor = Instance.new("Folder")
local Holder_3 = Instance.new("Frame")
local Run = Instance.new("TextButton")
local Desc = Instance.new("TextLabel")
local Name_6 = Instance.new("TextLabel")
local Bypasses = Instance.new("Frame")
local Name_7 = Instance.new("TextLabel")
local Holder_4 = Instance.new("ScrollingFrame")
local gcinfo = Instance.new("TextButton")
local GetTotalMemoryUsageMb = Instance.new("TextButton")
local GetMemoryUsageMbForTag = Instance.new("TextButton")
local PreloadAsync = Instance.new("TextButton")
local GetFocusedTextBox = Instance.new("TextButton")
local InstanceCount = Instance.new("TextButton")
local GuiObjects = Instance.new("TextButton")
local Weaktable = Instance.new("TextButton")
local AllBypasses = Instance.new("TextButton")
local UIListLayout_2 = Instance.new("UIListLayout")
local UI2DDrawcallCount = Instance.new("TextButton")
local UI2DTriangleCount = Instance.new("TextButton")

--Properties:

Exec.Name = "Exec"
Exec.Parent = game:GetService("CoreGui").RobloxGui
Exec.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Main.Name = "Main"
Main.Parent = Exec
Main.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
Main.BackgroundTransparency = 0.300
Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
Main.BorderSizePixel = 0
Main.Position = UDim2.new(0.142721444, 0, 0.49200514, 0)
Main.Size = UDim2.new(0.349999994, 0, 0.400000006, 0)

SemiTop.Name = "SemiTop"
SemiTop.Parent = Main
SemiTop.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
SemiTop.BackgroundTransparency = 1.000
SemiTop.BorderColor3 = Color3.fromRGB(0, 0, 0)
SemiTop.BorderSizePixel = 0
SemiTop.Position = UDim2.new(-8.3326718e-08, 0, 9.51770787e-08, 0)
SemiTop.Size = UDim2.new(1, 0, 0.174999997, 0)

Name.Name = "Name"
Name.Parent = SemiTop
Name.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Name.BorderColor3 = Color3.fromRGB(0, 0, 0)
Name.BorderSizePixel = 0
Name.Position = UDim2.new(2.83073351e-08, 0, 0, 0)
Name.Size = UDim2.new(0.800000012, 0, 1, 0)
Name.Font = Enum.Font.JosefinSans
Name.Text = "europatech"
Name.TextColor3 = Color3.fromRGB(255, 255, 255)
Name.TextScaled = true
Name.TextSize = 14.000
Name.TextWrapped = true

Buttons.Name = "Buttons"
Buttons.Parent = SemiTop

Exit.Name = "Exit"
Exit.Parent = Buttons
Exit.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Exit.BorderColor3 = Color3.fromRGB(0, 0, 0)
Exit.BorderSizePixel = 0
Exit.Position = UDim2.new(0.899999976, 0, 0, 0)
Exit.Size = UDim2.new(0.100000001, 0, 1, 0)
Exit.Font = Enum.Font.Unknown
Exit.Text = "X"
Exit.TextColor3 = Color3.fromRGB(255, 255, 255)
Exit.TextScaled = true
Exit.TextSize = 14.000
Exit.TextWrapped = true

Minimize.Name = "Minimize"
Minimize.Parent = Buttons
Minimize.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Minimize.BorderColor3 = Color3.fromRGB(0, 0, 0)
Minimize.BorderSizePixel = 0
Minimize.Position = UDim2.new(0.800000012, 0, 0, 0)
Minimize.Size = UDim2.new(0.100000001, 0, 1, 0)
Minimize.Font = Enum.Font.Unknown
Minimize.Text = "-"
Minimize.TextColor3 = Color3.fromRGB(255, 255, 255)
Minimize.TextScaled = true
Minimize.TextSize = 14.000
Minimize.TextWrapped = true

CodeHolder.Name = "CodeHolder"
CodeHolder.Parent = Main
CodeHolder.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
CodeHolder.BackgroundTransparency = 0.700
CodeHolder.BorderColor3 = Color3.fromRGB(0, 0, 0)
CodeHolder.BorderSizePixel = 0
CodeHolder.Position = UDim2.new(-4.76777551e-08, 0, 0.174999967, 0)
CodeHolder.Size = UDim2.new(0.999975085, 0, 0.649999976, 0)

Scroller.Name = "Scroller"
Scroller.Parent = CodeHolder
Scroller.Active = true
Scroller.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Scroller.BackgroundTransparency = 1.000
Scroller.BorderColor3 = Color3.fromRGB(0, 0, 0)
Scroller.BorderSizePixel = 0
Scroller.Size = UDim2.new(1, 0, 1, 0)
Scroller.CanvasSize = UDim2.new(0, 0, 0, 0)
Scroller.ScrollBarThickness = 10

Assignments.Name = "Assignments"
Assignments.Parent = Scroller

Assigner.Name = "Assigner"
Assigner.Parent = Assignments
Assigner.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Assigner.BackgroundTransparency = 1.000
Assigner.BorderColor3 = Color3.fromRGB(0, 0, 0)
Assigner.BorderSizePixel = 0
Assigner.Size = UDim2.new(0.075000003, 0, 0.150000006, 0)
Assigner.Font = Enum.Font.Arial
Assigner.Text = "1."
Assigner.TextColor3 = Color3.fromRGB(255, 255, 255)
Assigner.TextScaled = true
Assigner.TextSize = 14.000
Assigner.TextWrapped = true

Code.Name = "Code"
Code.Parent = Scroller
Code.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Code.BackgroundTransparency = 1.000
Code.BorderColor3 = Color3.fromRGB(0, 0, 0)
Code.BorderSizePixel = 0
Code.Position = UDim2.new(0.100000001, 0, 0, 0)
Code.Size = UDim2.new(0.899999976, 0, 0.150000006, 0)
Code.ClearTextOnFocus = false
Code.Font = Enum.Font.Sarpanch
Code.MultiLine = true
Code.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
Code.PlaceholderText = "print(\"Hello, world!\")"
Code.Text = ""
Code.TextColor3 = Color3.fromRGB(255, 255, 255)
Code.TextSize = 18.000
Code.TextXAlignment = Enum.TextXAlignment.Left
Code.TextYAlignment = Enum.TextYAlignment.Top

Side.Name = "Side"
Side.Parent = Main
Side.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
Side.BorderColor3 = Color3.fromRGB(0, 0, 0)
Side.BorderSizePixel = 0
Side.Position = UDim2.new(-0.213000014, 0, 1.83398896e-07, 0)
Side.Size = UDim2.new(0.213000014, 0, 0.824999869, 0)

Execute.Name = "Execute"
Execute.Parent = Side
Execute.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Execute.BackgroundTransparency = 1.000
Execute.BorderColor3 = Color3.fromRGB(0, 0, 0)
Execute.BorderSizePixel = 0
Execute.Position = UDim2.new(0, 0, 0.211559445, 0)
Execute.Size = UDim2.new(1, 0, 0.162499994, 0)
Execute.Font = Enum.Font.Unknown
Execute.Text = "exec"
Execute.TextColor3 = Color3.fromRGB(255, 255, 255)
Execute.TextScaled = true
Execute.TextSize = 14.000
Execute.TextWrapped = true

Clear.Name = "Clear"
Clear.Parent = Side
Clear.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Clear.BackgroundTransparency = 1.000
Clear.BorderColor3 = Color3.fromRGB(0, 0, 0)
Clear.BorderSizePixel = 0
Clear.Position = UDim2.new(0, 0, 0.371559441, 0)
Clear.Size = UDim2.new(1, 0, 0.162, 0)
Clear.Font = Enum.Font.Unknown
Clear.Text = "clear"
Clear.TextColor3 = Color3.fromRGB(255, 255, 255)
Clear.TextScaled = true
Clear.TextSize = 14.000
Clear.TextWrapped = true

Copy.Name = "Copy"
Copy.Parent = Side
Copy.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Copy.BackgroundTransparency = 1.000
Copy.BorderColor3 = Color3.fromRGB(0, 0, 0)
Copy.BorderSizePixel = 0
Copy.Position = UDim2.new(0, 0, 0.510715604, 0)
Copy.Size = UDim2.new(1, 0, 0.162, 0)
Copy.Font = Enum.Font.Unknown
Copy.Text = "copy"
Copy.TextColor3 = Color3.fromRGB(255, 255, 255)
Copy.TextScaled = true
Copy.TextSize = 14.000
Copy.TextWrapped = true

Pcall.Name = "Pcall"
Pcall.Parent = Side
Pcall.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Pcall.BackgroundTransparency = 1.000
Pcall.BorderColor3 = Color3.fromRGB(0, 0, 0)
Pcall.BorderSizePixel = 0
Pcall.Position = UDim2.new(0, 0, 0.669706285, 0)
Pcall.Size = UDim2.new(1, 0, 0.162, 0)
Pcall.Font = Enum.Font.Unknown
Pcall.Text = "pcall: off"
Pcall.TextColor3 = Color3.fromRGB(255, 255, 255)
Pcall.TextScaled = true
Pcall.TextSize = 14.000
Pcall.TextWrapped = true

Print.Name = "Print"
Print.Parent = Side
Print.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Print.BackgroundTransparency = 1.000
Print.BorderColor3 = Color3.fromRGB(0, 0, 0)
Print.BorderSizePixel = 0
Print.Position = UDim2.new(0, 0, 0.82996273, 0)
Print.Size = UDim2.new(1, 0, 0.162, 0)
Print.Font = Enum.Font.Unknown
Print.Text = "deterred print: on"
Print.TextColor3 = Color3.fromRGB(255, 255, 255)
Print.TextScaled = true
Print.TextSize = 14.000
Print.TextWrapped = true

Frame.Parent = Side
Frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(5.73650745e-08, 0, 0, 0)
Frame.Size = UDim2.new(0.999999881, 0, 0.21212104, 0)

Bottom.Name = "Bottom"
Bottom.Parent = Main
Bottom.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Bottom.BorderColor3 = Color3.fromRGB(0, 0, 0)
Bottom.BorderSizePixel = 0
Bottom.Position = UDim2.new(-0.212999985, 0, 0.823317051, 0)
Bottom.Size = UDim2.new(1.21297503, 0, 0.176682487, 0)

ScriptHub.Name = "ScriptHub"
ScriptHub.Parent = Bottom
ScriptHub.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
ScriptHub.BackgroundTransparency = 1.000
ScriptHub.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScriptHub.BorderSizePixel = 0
ScriptHub.Position = UDim2.new(0.0231173486, 0, 0, 0)
ScriptHub.Size = UDim2.new(0.201949134, 0, 1, 0)
ScriptHub.Font = Enum.Font.Unknown
ScriptHub.Text = "script hub"
ScriptHub.TextColor3 = Color3.fromRGB(255, 255, 255)
ScriptHub.TextScaled = true
ScriptHub.TextSize = 14.000
ScriptHub.TextWrapped = true

Hooks.Name = "Hooks"
Hooks.Parent = Bottom
Hooks.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Hooks.BackgroundTransparency = 1.000
Hooks.BorderColor3 = Color3.fromRGB(0, 0, 0)
Hooks.BorderSizePixel = 0
Hooks.Position = UDim2.new(0.273183882, 0, 0, 0)
Hooks.Size = UDim2.new(0.200000003, 0, 1, 0)
Hooks.Font = Enum.Font.Unknown
Hooks.Text = "hookinfo"
Hooks.TextColor3 = Color3.fromRGB(255, 255, 255)
Hooks.TextScaled = true
Hooks.TextSize = 14.000
Hooks.TextWrapped = true

Console.Name = "Console"
Console.Parent = Bottom
Console.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Console.BackgroundTransparency = 1.000
Console.BorderColor3 = Color3.fromRGB(0, 0, 0)
Console.BorderSizePixel = 0
Console.Position = UDim2.new(0.523183882, 0, 0, 0)
Console.Size = UDim2.new(0.200000003, 0, 1, 0)
Console.Font = Enum.Font.Unknown
Console.Text = "console"
Console.TextColor3 = Color3.fromRGB(255, 255, 255)
Console.TextScaled = true
Console.TextSize = 14.000
Console.TextWrapped = true

Options.Name = "Options"
Options.Parent = Bottom
Options.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Options.BackgroundTransparency = 1.000
Options.BorderColor3 = Color3.fromRGB(0, 0, 0)
Options.BorderSizePixel = 0
Options.Position = UDim2.new(0.773183882, 0, 0, 0)
Options.Size = UDim2.new(0.200000003, 0, 1, 0)
Options.Font = Enum.Font.Unknown
Options.Text = "options"
Options.TextColor3 = Color3.fromRGB(255, 255, 255)
Options.TextScaled = true
Options.TextSize = 14.000
Options.TextWrapped = true

Script.Name = "Script"
Script.Parent = Exec

Button.Name = "Button"
Button.Parent = Exec
Button.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Button.BackgroundTransparency = 0.700
Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
Button.BorderSizePixel = 0
Button.Position = UDim2.new(0.0111308992, 0, 0.0274451096, 0)
Button.Size = UDim2.new(0, 50, 0, 50)
Button.Font = Enum.Font.JosefinSans
Button.Text = "e"
Button.TextColor3 = Color3.fromRGB(255, 255, 255)
Button.TextScaled = true
Button.TextSize = 14.000
Button.TextWrapped = true

Round.CornerRadius = UDim.new(0, 40)
Round.Name = "Round"
Round.Parent = Button

Console_2.Name = "Console"
Console_2.Parent = Exec
Console_2.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
Console_2.BackgroundTransparency = 1.000
Console_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Console_2.BorderSizePixel = 0
Console_2.Position = UDim2.new(0.610565364, 0, 0, 0)
Console_2.Size = UDim2.new(0.389353335, 0, 0.472495705, 0)
Console_2.Visible = false

Name_2.Name = "Name"
Name_2.Parent = Console_2
Name_2.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Name_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Name_2.BorderSizePixel = 0
Name_2.Size = UDim2.new(1, 0, 0.155290961, 0)
Name_2.Font = Enum.Font.JosefinSans
Name_2.Text = "euroconsole"
Name_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Name_2.TextScaled = true
Name_2.TextSize = 14.000
Name_2.TextWrapped = true

Scroller_2.Name = "Scroller"
Scroller_2.Parent = Console_2
Scroller_2.Active = true
Scroller_2.BackgroundColor3 = Color3.fromRGB(56, 56, 56)
Scroller_2.BackgroundTransparency = 0.200
Scroller_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Scroller_2.BorderSizePixel = 0
Scroller_2.Position = UDim2.new(0, 0, 0.155290976, 0)
Scroller_2.Size = UDim2.new(1, 0, 0.700478256, 0)
Scroller_2.CanvasSize = UDim2.new(0, 0, 0, 0)
Scroller_2.ScrollBarThickness = 10

_Line_.Name = "_Line_"
_Line_.Parent = Scroller_2
_Line_.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
_Line_.BackgroundTransparency = 1.000
_Line_.BorderColor3 = Color3.fromRGB(0, 0, 0)
_Line_.BorderSizePixel = 0
_Line_.Size = UDim2.new(1, 0, 0.075000003, 0)
_Line_.Font = Enum.Font.Arial
_Line_.Text = "  --  yo guys i think this is the console"
_Line_.TextColor3 = Color3.fromRGB(255, 255, 255)
_Line_.TextScaled = true
_Line_.TextSize = 14.000
_Line_.TextWrapped = true
_Line_.TextXAlignment = Enum.TextXAlignment.Left

Buttons_2.Name = "Buttons"
Buttons_2.Parent = Console_2

Modes.Name = "Modes"
Modes.Parent = Buttons_2

Warn.Name = "Warn"
Warn.Parent = Modes
Warn.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
Warn.BorderColor3 = Color3.fromRGB(0, 0, 0)
Warn.BorderSizePixel = 0
Warn.Position = UDim2.new(-0.210223794, 0, 0.443687171, 0)
Warn.Size = UDim2.new(0.20991075, 0, 0.144000009, 0)
Warn.Font = Enum.Font.Unknown
Warn.Text = "warn: on"
Warn.TextColor3 = Color3.fromRGB(255, 255, 255)
Warn.TextScaled = true
Warn.TextSize = 14.000
Warn.TextWrapped = true

Print_2.Name = "Print"
Print_2.Parent = Modes
Print_2.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
Print_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Print_2.BorderSizePixel = 0
Print_2.Position = UDim2.new(-0.210223794, 0, 0.299456358, 0)
Print_2.Size = UDim2.new(0.20991075, 0, 0.144000009, 0)
Print_2.Font = Enum.Font.Unknown
Print_2.Text = "print: on"
Print_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Print_2.TextScaled = true
Print_2.TextSize = 14.000
Print_2.TextWrapped = true

Error.Name = "Error"
Error.Parent = Modes
Error.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
Error.BorderColor3 = Color3.fromRGB(0, 0, 0)
Error.BorderSizePixel = 0
Error.Position = UDim2.new(-0.210223794, 0, 0.582164586, 0)
Error.Size = UDim2.new(0.20991075, 0, 0.143999994, 0)
Error.Font = Enum.Font.Unknown
Error.Text = "error: on"
Error.TextColor3 = Color3.fromRGB(255, 255, 255)
Error.TextScaled = true
Error.TextSize = 14.000
Error.TextWrapped = true

Info.Name = "Info"
Info.Parent = Modes
Info.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
Info.BorderColor3 = Color3.fromRGB(0, 0, 0)
Info.BorderSizePixel = 0
Info.Position = UDim2.new(-0.210223794, 0, 0.155225605, 0)
Info.Size = UDim2.new(0.20991075, 0, 0.144000009, 0)
Info.Font = Enum.Font.Unknown
Info.Text = "info: on"
Info.TextColor3 = Color3.fromRGB(255, 255, 255)
Info.TextScaled = true
Info.TextSize = 14.000
Info.TextWrapped = true

BottomConsole.Name = "BottomConsole"
BottomConsole.Parent = Buttons_2

Clear_2.Name = "Clear"
Clear_2.Parent = BottomConsole
Clear_2.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
Clear_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Clear_2.BorderSizePixel = 0
Clear_2.Position = UDim2.new(0, 0, 0.856000006, 0)
Clear_2.Size = UDim2.new(0.333000004, 0, 0.143999994, 0)
Clear_2.Font = Enum.Font.Unknown
Clear_2.Text = "clear"
Clear_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Clear_2.TextScaled = true
Clear_2.TextSize = 14.000
Clear_2.TextWrapped = true

Copy_2.Name = "Copy"
Copy_2.Parent = BottomConsole
Copy_2.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
Copy_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Copy_2.BorderSizePixel = 0
Copy_2.Position = UDim2.new(0.332868904, 0, 0.855769157, 0)
Copy_2.Size = UDim2.new(0.333000004, 0, 0.143999994, 0)
Copy_2.Font = Enum.Font.Unknown
Copy_2.Text = "copy"
Copy_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Copy_2.TextScaled = true
Copy_2.TextSize = 14.000
Copy_2.TextWrapped = true

Save.Name = "Save"
Save.Parent = BottomConsole
Save.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
Save.BorderColor3 = Color3.fromRGB(0, 0, 0)
Save.BorderSizePixel = 0
Save.Position = UDim2.new(0.666000009, 0, 0.856000006, 0)
Save.Size = UDim2.new(0.333999991, 0, 0.143999994, 0)
Save.Font = Enum.Font.Unknown
Save.Text = "save"
Save.TextColor3 = Color3.fromRGB(255, 255, 255)
Save.TextScaled = true
Save.TextSize = 14.000
Save.TextWrapped = true

Hide.Name = "Hide"
Hide.Parent = Console_2
Hide.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Hide.BorderColor3 = Color3.fromRGB(0, 0, 0)
Hide.BorderSizePixel = 0
Hide.Position = UDim2.new(-0.210223734, 0, 0, 0)
Hide.Size = UDim2.new(0.210174829, 0, 0.155225605, 0)
Hide.Font = Enum.Font.Unknown
Hide.Text = "hide"
Hide.TextColor3 = Color3.fromRGB(255, 255, 255)
Hide.TextScaled = true
Hide.TextSize = 14.000
Hide.TextWrapped = true

Options_2.Name = "Options"
Options_2.Parent = Exec
Options_2.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
Options_2.BackgroundTransparency = 0.300
Options_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Options_2.BorderSizePixel = 0
Options_2.Position = UDim2.new(0.800000012, 0, 0.600000024, 0)
Options_2.Size = UDim2.new(0.200000003, 0, 0.400000006, 0)
Options_2.Visible = false

Name_3.Name = "Name"
Name_3.Parent = Options_2
Name_3.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Name_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
Name_3.BorderSizePixel = 0
Name_3.Position = UDim2.new(0, 0, 9.19554068e-08, 0)
Name_3.Size = UDim2.new(1, 0, 0.174999997, 0)
Name_3.Font = Enum.Font.JosefinSans
Name_3.Text = "europtions"
Name_3.TextColor3 = Color3.fromRGB(255, 255, 255)
Name_3.TextScaled = true
Name_3.TextSize = 14.000
Name_3.TextWrapped = true

Buttons_3.Name = "Buttons"
Buttons_3.Parent = Options_2
Buttons_3.Active = true
Buttons_3.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Buttons_3.BackgroundTransparency = 1.000
Buttons_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
Buttons_3.BorderSizePixel = 0
Buttons_3.Position = UDim2.new(0, 0, 0.17535007, 0)
Buttons_3.Size = UDim2.new(1, 0, 0.824999988, 0)
Buttons_3.CanvasSize = UDim2.new(0, 0, 0, 0)

DisableIndexHooks.Name = "DisableIndexHooks"
DisableIndexHooks.Parent = Buttons_3
DisableIndexHooks.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
DisableIndexHooks.BackgroundTransparency = 0.500
DisableIndexHooks.BorderColor3 = Color3.fromRGB(0, 0, 0)
DisableIndexHooks.BorderSizePixel = 0
DisableIndexHooks.Position = UDim2.new(0, 0, 0.624734759, 0)
DisableIndexHooks.Size = UDim2.new(0.99999994, 0, 0.124947034, 0)
DisableIndexHooks.Font = Enum.Font.Unknown
DisableIndexHooks.Text = "disable index hooks: OFF"
DisableIndexHooks.TextColor3 = Color3.fromRGB(255, 255, 255)
DisableIndexHooks.TextScaled = true
DisableIndexHooks.TextSize = 14.000
DisableIndexHooks.TextWrapped = true

DisableNamecallHooks.Name = "DisableNamecallHooks"
DisableNamecallHooks.Parent = Buttons_3
DisableNamecallHooks.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
DisableNamecallHooks.BackgroundTransparency = 0.500
DisableNamecallHooks.BorderColor3 = Color3.fromRGB(0, 0, 0)
DisableNamecallHooks.BorderSizePixel = 0
DisableNamecallHooks.Position = UDim2.new(0, 0, 0.49978748, 0)
DisableNamecallHooks.Size = UDim2.new(0.99999994, 0, 0.124946922, 0)
DisableNamecallHooks.Font = Enum.Font.Unknown
DisableNamecallHooks.Text = "disable namecall hooks: OFF"
DisableNamecallHooks.TextColor3 = Color3.fromRGB(255, 255, 255)
DisableNamecallHooks.TextScaled = true
DisableNamecallHooks.TextSize = 14.000
DisableNamecallHooks.TextWrapped = true

DisableNewIndexHooks.Name = "DisableNewIndexHooks"
DisableNewIndexHooks.Parent = Buttons_3
DisableNewIndexHooks.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
DisableNewIndexHooks.BackgroundTransparency = 0.500
DisableNewIndexHooks.BorderColor3 = Color3.fromRGB(0, 0, 0)
DisableNewIndexHooks.BorderSizePixel = 0
DisableNewIndexHooks.Position = UDim2.new(0, 0, 0.749681532, 0)
DisableNewIndexHooks.Size = UDim2.new(0.99999994, 0, 0.124946922, 0)
DisableNewIndexHooks.Font = Enum.Font.Unknown
DisableNewIndexHooks.Text = "disable newindex hooks: OFF"
DisableNewIndexHooks.TextColor3 = Color3.fromRGB(255, 255, 255)
DisableNewIndexHooks.TextScaled = true
DisableNewIndexHooks.TextSize = 14.000
DisableNewIndexHooks.TextWrapped = true

DumpScripts.Name = "DumpScripts"
DumpScripts.Parent = Buttons_3
DumpScripts.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
DumpScripts.BackgroundTransparency = 0.500
DumpScripts.BorderColor3 = Color3.fromRGB(0, 0, 0)
DumpScripts.BorderSizePixel = 0
DumpScripts.Position = UDim2.new(0, 0, 0.374840438, 0)
DumpScripts.Size = UDim2.new(0.99999994, 0, 0.124947034, 0)
DumpScripts.Font = Enum.Font.Unknown
DumpScripts.Text = "dump scripts"
DumpScripts.TextColor3 = Color3.fromRGB(255, 255, 255)
DumpScripts.TextScaled = true
DumpScripts.TextSize = 14.000
DumpScripts.TextWrapped = true

SaveIns.Name = "SaveIns"
SaveIns.Parent = Buttons_3
SaveIns.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
SaveIns.BackgroundTransparency = 0.500
SaveIns.BorderColor3 = Color3.fromRGB(0, 0, 0)
SaveIns.BorderSizePixel = 0
SaveIns.Size = UDim2.new(0.99999994, 0, 0.124946892, 0)
SaveIns.Font = Enum.Font.Unknown
SaveIns.Text = "saveinstance"
SaveIns.TextColor3 = Color3.fromRGB(255, 255, 255)
SaveIns.TextScaled = true
SaveIns.TextSize = 14.000
SaveIns.TextWrapped = true

DumpGC.Name = "DumpGC"
DumpGC.Parent = Buttons_3
DumpGC.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
DumpGC.BackgroundTransparency = 0.500
DumpGC.BorderColor3 = Color3.fromRGB(0, 0, 0)
DumpGC.BorderSizePixel = 0
DumpGC.Position = UDim2.new(0, 0, 0.249893844, 0)
DumpGC.Size = UDim2.new(0.99999994, 0, 0.124946922, 0)
DumpGC.Font = Enum.Font.Unknown
DumpGC.Text = "dump gc"
DumpGC.TextColor3 = Color3.fromRGB(255, 255, 255)
DumpGC.TextScaled = true
DumpGC.TextSize = 14.000
DumpGC.TextWrapped = true

ViewScripts.Name = "ViewScripts"
ViewScripts.Parent = Buttons_3
ViewScripts.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
ViewScripts.BackgroundTransparency = 0.500
ViewScripts.BorderColor3 = Color3.fromRGB(0, 0, 0)
ViewScripts.BorderSizePixel = 0
ViewScripts.Position = UDim2.new(0, 0, 0.12494681, 0)
ViewScripts.Size = UDim2.new(0.99999994, 0, 0.124946892, 0)
ViewScripts.Font = Enum.Font.Unknown
ViewScripts.Text = "view scripts"
ViewScripts.TextColor3 = Color3.fromRGB(255, 255, 255)
ViewScripts.TextScaled = true
ViewScripts.TextSize = 14.000
ViewScripts.TextWrapped = true

DisableCodeSaving.Name = "DisableCodeSaving"
DisableCodeSaving.Parent = Buttons_3
DisableCodeSaving.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
DisableCodeSaving.BackgroundTransparency = 0.500
DisableCodeSaving.BorderColor3 = Color3.fromRGB(0, 0, 0)
DisableCodeSaving.BorderSizePixel = 0
DisableCodeSaving.Position = UDim2.new(0, 0, 0.874628365, 0)
DisableCodeSaving.Size = UDim2.new(0.99999994, 0, 0.124947034, 0)
DisableCodeSaving.Font = Enum.Font.Unknown
DisableCodeSaving.Text = "disable code saving: OFF"
DisableCodeSaving.TextColor3 = Color3.fromRGB(255, 255, 255)
DisableCodeSaving.TextScaled = true
DisableCodeSaving.TextSize = 14.000
DisableCodeSaving.TextWrapped = true

DeterredPrintYields.Name = "DeterredPrintYields"
DeterredPrintYields.Parent = Buttons_3
DeterredPrintYields.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
DeterredPrintYields.BackgroundTransparency = 0.500
DeterredPrintYields.BorderColor3 = Color3.fromRGB(0, 0, 0)
DeterredPrintYields.BorderSizePixel = 0
DeterredPrintYields.Position = UDim2.new(0, 0, 1, 0)
DeterredPrintYields.Size = UDim2.new(0.99999994, 0, 0.124947034, 0)
DeterredPrintYields.Font = Enum.Font.Unknown
DeterredPrintYields.Text = "deterred print yields: OFF"
DeterredPrintYields.TextColor3 = Color3.fromRGB(255, 255, 255)
DeterredPrintYields.TextScaled = true
DeterredPrintYields.TextSize = 14.000
DeterredPrintYields.TextWrapped = true

UIListLayout.Parent = Buttons_3
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

SaveCode.Name = "SaveCode"
SaveCode.Parent = Buttons_3
SaveCode.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
SaveCode.BackgroundTransparency = 0.500
SaveCode.BorderColor3 = Color3.fromRGB(0, 0, 0)
SaveCode.BorderSizePixel = 0
SaveCode.Position = UDim2.new(0, 0, 1, 0)
SaveCode.Size = UDim2.new(0.99999994, 0, 0.124947034, 0)
SaveCode.Font = Enum.Font.Unknown
SaveCode.Text = "save code to file"
SaveCode.TextColor3 = Color3.fromRGB(255, 255, 255)
SaveCode.TextScaled = true
SaveCode.TextSize = 14.000
SaveCode.TextWrapped = true

LoadCode.Name = "LoadCode"
LoadCode.Parent = Buttons_3
LoadCode.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
LoadCode.BackgroundTransparency = 0.500
LoadCode.BorderColor3 = Color3.fromRGB(0, 0, 0)
LoadCode.BorderSizePixel = 0
LoadCode.Position = UDim2.new(0, 0, 1, 0)
LoadCode.Size = UDim2.new(0.99999994, 0, 0.124947034, 0)
LoadCode.Font = Enum.Font.Unknown
LoadCode.Text = "load file to code"
LoadCode.TextColor3 = Color3.fromRGB(255, 255, 255)
LoadCode.TextScaled = true
LoadCode.TextSize = 14.000
LoadCode.TextWrapped = true

SaveEuropatechChanges.Name = "SaveEuropatechChanges"
SaveEuropatechChanges.Parent = Buttons_3
SaveEuropatechChanges.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
SaveEuropatechChanges.BackgroundTransparency = 0.500
SaveEuropatechChanges.BorderColor3 = Color3.fromRGB(0, 0, 0)
SaveEuropatechChanges.BorderSizePixel = 0
SaveEuropatechChanges.Position = UDim2.new(0, 0, 1, 0)
SaveEuropatechChanges.Size = UDim2.new(0.99999994, 0, 0.124947034, 0)
SaveEuropatechChanges.Font = Enum.Font.Unknown
SaveEuropatechChanges.Text = "save europatech changes: ON"
SaveEuropatechChanges.TextColor3 = Color3.fromRGB(255, 255, 255)
SaveEuropatechChanges.TextScaled = true
SaveEuropatechChanges.TextSize = 14.000
SaveEuropatechChanges.TextWrapped = true

DuoViewer.Name = "DuoViewer"
DuoViewer.Parent = Exec
DuoViewer.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
DuoViewer.BackgroundTransparency = 0.300
DuoViewer.BorderColor3 = Color3.fromRGB(0, 0, 0)
DuoViewer.BorderSizePixel = 0
DuoViewer.Position = UDim2.new(0.574999988, 0, 0.600000024, 0)
DuoViewer.Size = UDim2.new(0.224999994, 0, 0.400000006, 0)
DuoViewer.Visible = false

Name_4.Name = "Name"
Name_4.Parent = DuoViewer
Name_4.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Name_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
Name_4.BorderSizePixel = 0
Name_4.Position = UDim2.new(0, 0, 9.19554068e-08, 0)
Name_4.Size = UDim2.new(1, 0, 0.172697663, 0)
Name_4.Font = Enum.Font.JosefinSans
Name_4.Text = "euroviewer"
Name_4.TextColor3 = Color3.fromRGB(255, 255, 255)
Name_4.TextScaled = true
Name_4.TextSize = 14.000
Name_4.TextWrapped = true

Holder.Name = "Holder"
Holder.Parent = DuoViewer
Holder.Active = true
Holder.BackgroundColor3 = Color3.fromRGB(54, 54, 54)
Holder.BackgroundTransparency = 0.700
Holder.BorderColor3 = Color3.fromRGB(0, 0, 0)
Holder.BorderSizePixel = 0
Holder.Position = UDim2.new(0, 0, 0.17535007, 0)
Holder.Size = UDim2.new(1, 0, 0.824999988, 0)
Holder.CanvasSize = UDim2.new(0, 0, 0, 0)

OptionsStorage.Name = "OptionsStorage"
OptionsStorage.Parent = DuoViewer

OptionsS.Name = "OptionsS"
OptionsS.Parent = OptionsStorage
OptionsS.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
OptionsS.BorderColor3 = Color3.fromRGB(0, 0, 0)
OptionsS.BorderSizePixel = 0
OptionsS.Position = UDim2.new(-0.34694621, 0, 0, 0)
OptionsS.Size = UDim2.new(0.34694618, 0, 1, 0)
OptionsS.Visible = false

CopySource.Name = "CopySource"
CopySource.Parent = OptionsS
CopySource.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
CopySource.BackgroundTransparency = 1.000
CopySource.BorderColor3 = Color3.fromRGB(0, 0, 0)
CopySource.BorderSizePixel = 0
CopySource.Position = UDim2.new(0, 0, 3.73989792e-07, 0)
CopySource.Size = UDim2.new(1, 0, 0.204567552, 0)
CopySource.Font = Enum.Font.Unknown
CopySource.Text = "copy src"
CopySource.TextColor3 = Color3.fromRGB(255, 255, 255)
CopySource.TextScaled = true
CopySource.TextSize = 14.000
CopySource.TextWrapped = true

Enable.Name = "Enable"
Enable.Parent = OptionsS
Enable.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Enable.BackgroundTransparency = 1.000
Enable.BorderColor3 = Color3.fromRGB(0, 0, 0)
Enable.BorderSizePixel = 0
Enable.Position = UDim2.new(0, 0, 0.197657347, 0)
Enable.Size = UDim2.new(1, 0, 0.204567656, 0)
Enable.Font = Enum.Font.Unknown
Enable.Text = "enable"
Enable.TextColor3 = Color3.fromRGB(255, 255, 255)
Enable.TextScaled = true
Enable.TextSize = 14.000
Enable.TextWrapped = true

Disable.Name = "Disable"
Disable.Parent = OptionsS
Disable.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Disable.BackgroundTransparency = 1.000
Disable.BorderColor3 = Color3.fromRGB(0, 0, 0)
Disable.BorderSizePixel = 0
Disable.Position = UDim2.new(0, 0, 0.395314127, 0)
Disable.Size = UDim2.new(1, 0, 0.204567656, 0)
Disable.Font = Enum.Font.Unknown
Disable.Text = "disable"
Disable.TextColor3 = Color3.fromRGB(255, 255, 255)
Disable.TextScaled = true
Disable.TextSize = 14.000
Disable.TextWrapped = true

Destroy.Name = "Destroy"
Destroy.Parent = OptionsS
Destroy.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Destroy.BackgroundTransparency = 1.000
Destroy.BorderColor3 = Color3.fromRGB(0, 0, 0)
Destroy.BorderSizePixel = 0
Destroy.Position = UDim2.new(0, 0, 0.592971087, 0)
Destroy.Size = UDim2.new(1, 0, 0.204567552, 0)
Destroy.Font = Enum.Font.Unknown
Destroy.Text = "destroy"
Destroy.TextColor3 = Color3.fromRGB(255, 255, 255)
Destroy.TextScaled = true
Destroy.TextSize = 14.000
Destroy.TextWrapped = true

CopyPath.Name = "CopyPath"
CopyPath.Parent = OptionsS
CopyPath.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
CopyPath.BackgroundTransparency = 1.000
CopyPath.BorderColor3 = Color3.fromRGB(0, 0, 0)
CopyPath.BorderSizePixel = 0
CopyPath.Position = UDim2.new(0, 0, 0.790627897, 0)
CopyPath.Size = UDim2.new(1, 0, 0.204567596, 0)
CopyPath.Font = Enum.Font.Unknown
CopyPath.Text = "copy path"
CopyPath.TextColor3 = Color3.fromRGB(255, 255, 255)
CopyPath.TextScaled = true
CopyPath.TextSize = 14.000
CopyPath.TextWrapped = true

ScriptHub_2.Name = "ScriptHub"
ScriptHub_2.Parent = Exec
ScriptHub_2.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
ScriptHub_2.BackgroundTransparency = 0.300
ScriptHub_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScriptHub_2.BorderSizePixel = 0
ScriptHub_2.Position = UDim2.new(0.0677455887, 0, 0.0928866118, 0)
ScriptHub_2.Size = UDim2.new(0.222853288, 0, 0.400000125, 0)
ScriptHub_2.Visible = false

Name_5.Name = "Name"
Name_5.Parent = ScriptHub_2
Name_5.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Name_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
Name_5.BorderSizePixel = 0
Name_5.Position = UDim2.new(-5.59396298e-08, 0, 9.25897155e-08, 0)
Name_5.Size = UDim2.new(1.00000012, 0, 0.175349951, 0)
Name_5.Font = Enum.Font.JosefinSans
Name_5.Text = "eurohub"
Name_5.TextColor3 = Color3.fromRGB(255, 255, 255)
Name_5.TextScaled = true
Name_5.TextSize = 14.000
Name_5.TextWrapped = true

Holder_2.Name = "Holder"
Holder_2.Parent = ScriptHub_2
Holder_2.Active = true
Holder_2.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Holder_2.BackgroundTransparency = 0.500
Holder_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Holder_2.BorderSizePixel = 0
Holder_2.Position = UDim2.new(0, 0, 0.17535007, 0)
Holder_2.Size = UDim2.new(1, 0, 0.824999988, 0)
Holder_2.CanvasSize = UDim2.new(0, 0, 0, 0)

InfY.Name = "InfY"
InfY.Parent = Holder_2
InfY.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
InfY.BackgroundTransparency = 0.500
InfY.BorderColor3 = Color3.fromRGB(0, 0, 0)
InfY.BorderSizePixel = 0
InfY.Size = UDim2.new(1, 0, 0.125, 0)
InfY.Font = Enum.Font.Unknown
InfY.Text = "Infinite Yield"
InfY.TextColor3 = Color3.fromRGB(255, 255, 255)
InfY.TextScaled = true
InfY.TextSize = 14.000
InfY.TextWrapped = true

TSDex.Name = "TSDex"
TSDex.Parent = Holder_2
TSDex.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
TSDex.BackgroundTransparency = 0.500
TSDex.BorderColor3 = Color3.fromRGB(0, 0, 0)
TSDex.BorderSizePixel = 0
TSDex.Position = UDim2.new(0, 0, 0.125, 0)
TSDex.Size = UDim2.new(1, 0, 0.125, 0)
TSDex.Font = Enum.Font.Unknown
TSDex.Text = "True Secure Dex"
TSDex.TextColor3 = Color3.fromRGB(255, 255, 255)
TSDex.TextScaled = true
TSDex.TextSize = 14.000
TSDex.TextWrapped = true

Dex.Name = "Dex"
Dex.Parent = Holder_2
Dex.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Dex.BackgroundTransparency = 0.500
Dex.BorderColor3 = Color3.fromRGB(0, 0, 0)
Dex.BorderSizePixel = 0
Dex.Position = UDim2.new(0, 0, 0.25, 0)
Dex.Size = UDim2.new(1, 0, 0.125, 0)
Dex.Font = Enum.Font.Unknown
Dex.Text = "Dex"
Dex.TextColor3 = Color3.fromRGB(255, 255, 255)
Dex.TextScaled = true
Dex.TextSize = 14.000
Dex.TextWrapped = true

CmdX.Name = "CmdX"
CmdX.Parent = Holder_2
CmdX.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
CmdX.BackgroundTransparency = 0.500
CmdX.BorderColor3 = Color3.fromRGB(0, 0, 0)
CmdX.BorderSizePixel = 0
CmdX.Position = UDim2.new(0, 0, 0.375, 0)
CmdX.Size = UDim2.new(1, 0, 0.125, 0)
CmdX.Font = Enum.Font.Unknown
CmdX.Text = "CMD-X"
CmdX.TextColor3 = Color3.fromRGB(255, 255, 255)
CmdX.TextScaled = true
CmdX.TextSize = 14.000
CmdX.TextWrapped = true

SSpy.Name = "SSpy"
SSpy.Parent = Holder_2
SSpy.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
SSpy.BackgroundTransparency = 0.500
SSpy.BorderColor3 = Color3.fromRGB(0, 0, 0)
SSpy.BorderSizePixel = 0
SSpy.Position = UDim2.new(0, 0, 0.5, 0)
SSpy.Size = UDim2.new(1, 0, 0.125, 0)
SSpy.Font = Enum.Font.Unknown
SSpy.Text = "SimpleSpy"
SSpy.TextColor3 = Color3.fromRGB(255, 255, 255)
SSpy.TextScaled = true
SSpy.TextSize = 14.000
SSpy.TextWrapped = true

VV4.Name = "VV4"
VV4.Parent = Holder_2
VV4.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
VV4.BackgroundTransparency = 0.500
VV4.BorderColor3 = Color3.fromRGB(0, 0, 0)
VV4.BorderSizePixel = 0
VV4.Position = UDim2.new(0, 0, 0.625, 0)
VV4.Size = UDim2.new(1, 0, 0.125, 0)
VV4.Font = Enum.Font.Unknown
VV4.Text = "Vape v4"
VV4.TextColor3 = Color3.fromRGB(255, 255, 255)
VV4.TextScaled = true
VV4.TextSize = 14.000
VV4.TextWrapped = true

GCView.Name = "GCView"
GCView.Parent = Holder_2
GCView.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
GCView.BackgroundTransparency = 0.500
GCView.BorderColor3 = Color3.fromRGB(0, 0, 0)
GCView.BorderSizePixel = 0
GCView.Position = UDim2.new(0, 0, 0.75, 0)
GCView.Size = UDim2.new(1, 0, 0.125, 0)
GCView.Font = Enum.Font.Unknown
GCView.Text = "Airzy's GC Viewer"
GCView.TextColor3 = Color3.fromRGB(255, 255, 255)
GCView.TextScaled = true
GCView.TextSize = 14.000
GCView.TextWrapped = true

LeftSide.Name = "LeftSide"
LeftSide.Parent = Holder_2
LeftSide.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
LeftSide.BorderColor3 = Color3.fromRGB(0, 0, 0)
LeftSide.BorderSizePixel = 0
LeftSide.Size = UDim2.new(0.100000001, 0, 1, 0)

AntiKick.Name = "AntiKick"
AntiKick.Parent = Holder_2
AntiKick.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
AntiKick.BackgroundTransparency = 0.500
AntiKick.BorderColor3 = Color3.fromRGB(0, 0, 0)
AntiKick.BorderSizePixel = 0
AntiKick.Position = UDim2.new(0, 0, 0.875, 0)
AntiKick.Size = UDim2.new(1, 0, 0.125, 0)
AntiKick.Font = Enum.Font.Unknown
AntiKick.Text = "Europa's Anti-Kick"
AntiKick.TextColor3 = Color3.fromRGB(255, 255, 255)
AntiKick.TextScaled = true
AntiKick.TextSize = 14.000
AntiKick.TextWrapped = true

Descriptor.Name = "Descriptor"
Descriptor.Parent = ScriptHub_2

Holder_3.Name = "Holder"
Holder_3.Parent = Descriptor
Holder_3.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Holder_3.BackgroundTransparency = 0.200
Holder_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
Holder_3.BorderSizePixel = 0
Holder_3.Position = UDim2.new(0.999999881, 0, 0.175350115, 0)
Holder_3.Size = UDim2.new(0.906976044, 0, 0.822445989, 0)
Holder_3.Visible = false

Run.Name = "Run"
Run.Parent = Holder_3
Run.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Run.BorderColor3 = Color3.fromRGB(0, 0, 0)
Run.BorderSizePixel = 0
Run.Position = UDim2.new(0.653675556, 0, 0.796142995, 0)
Run.Size = UDim2.new(0.346324325, 0, 0.203490049, 0)
Run.Font = Enum.Font.Unknown
Run.Text = "Run"
Run.TextColor3 = Color3.fromRGB(255, 255, 255)
Run.TextScaled = true
Run.TextSize = 14.000
Run.TextWrapped = true

Desc.Name = "Desc"
Desc.Parent = Holder_3
Desc.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Desc.BackgroundTransparency = 1.000
Desc.BorderColor3 = Color3.fromRGB(0, 0, 0)
Desc.BorderSizePixel = 0
Desc.Position = UDim2.new(0.0283654816, 0, 0.0337938666, 0)
Desc.Size = UDim2.new(0.971634507, 0, 0.766206145, 0)
Desc.Font = Enum.Font.JosefinSans
Desc.Text = ""
Desc.TextColor3 = Color3.fromRGB(255, 255, 255)
Desc.TextSize = 18.000
Desc.TextWrapped = true
Desc.TextXAlignment = Enum.TextXAlignment.Left
Desc.TextYAlignment = Enum.TextYAlignment.Top

Name_6.Name = "Name"
Name_6.Parent = Holder_3
Name_6.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Name_6.BorderColor3 = Color3.fromRGB(0, 0, 0)
Name_6.BorderSizePixel = 0
Name_6.Position = UDim2.new(-0.000896190759, 0, -0.213205636, 0)
Name_6.Size = UDim2.new(1.00089586, 0, 0.21320565, 0)
Name_6.Font = Enum.Font.JosefinSans
Name_6.Text = "Infinite Yield"
Name_6.TextColor3 = Color3.fromRGB(255, 255, 255)
Name_6.TextScaled = true
Name_6.TextSize = 14.000
Name_6.TextWrapped = true

Bypasses.Name = "Bypasses"
Bypasses.Parent = Exec
Bypasses.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
Bypasses.BackgroundTransparency = 0.300
Bypasses.BorderColor3 = Color3.fromRGB(0, 0, 0)
Bypasses.BorderSizePixel = 0
Bypasses.Position = UDim2.new(0.492582172, 0, 0.493026733, 0)
Bypasses.Size = UDim2.new(0.222853288, 0, 0.398237795, 0)
Bypasses.Visible = false

Name_7.Name = "Name"
Name_7.Parent = Bypasses
Name_7.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Name_7.BorderColor3 = Color3.fromRGB(0, 0, 0)
Name_7.BorderSizePixel = 0
Name_7.Position = UDim2.new(0, 0, 9.19554068e-08, 0)
Name_7.Size = UDim2.new(1, 0, 0.172697663, 0)
Name_7.Font = Enum.Font.JosefinSans
Name_7.Text = "eurobypasses"
Name_7.TextColor3 = Color3.fromRGB(255, 255, 255)
Name_7.TextScaled = true
Name_7.TextSize = 14.000
Name_7.TextWrapped = true

Holder_4.Name = "Holder"
Holder_4.Parent = Bypasses
Holder_4.Active = true
Holder_4.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Holder_4.BackgroundTransparency = 0.500
Holder_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
Holder_4.BorderSizePixel = 0
Holder_4.Position = UDim2.new(0, 0, 0.17269747, 0)
Holder_4.Size = UDim2.new(1, 0, 0.827652335, 0)
Holder_4.CanvasSize = UDim2.new(0, 0, 0, 0)

gcinfo.Name = "gcinfo"
gcinfo.Parent = Holder_4
gcinfo.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
gcinfo.BackgroundTransparency = 0.500
gcinfo.BorderColor3 = Color3.fromRGB(0, 0, 0)
gcinfo.BorderSizePixel = 0
gcinfo.Size = UDim2.new(1, 0, 0.125, 0)
gcinfo.Font = Enum.Font.Unknown
gcinfo.Text = "gcinfo (+ collectgarbage)"
gcinfo.TextColor3 = Color3.fromRGB(255, 255, 255)
gcinfo.TextScaled = true
gcinfo.TextSize = 14.000
gcinfo.TextWrapped = true

GetTotalMemoryUsageMb.Name = "GetTotalMemoryUsageMb"
GetTotalMemoryUsageMb.Parent = Holder_4
GetTotalMemoryUsageMb.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
GetTotalMemoryUsageMb.BackgroundTransparency = 0.500
GetTotalMemoryUsageMb.BorderColor3 = Color3.fromRGB(0, 0, 0)
GetTotalMemoryUsageMb.BorderSizePixel = 0
GetTotalMemoryUsageMb.Position = UDim2.new(0, 0, 0.125, 0)
GetTotalMemoryUsageMb.Size = UDim2.new(1, 0, 0.125, 0)
GetTotalMemoryUsageMb.Font = Enum.Font.Unknown
GetTotalMemoryUsageMb.Text = "GetTotalMemoryUsageMb"
GetTotalMemoryUsageMb.TextColor3 = Color3.fromRGB(255, 255, 255)
GetTotalMemoryUsageMb.TextScaled = true
GetTotalMemoryUsageMb.TextSize = 14.000
GetTotalMemoryUsageMb.TextWrapped = true

GetMemoryUsageMbForTag.Name = "GetMemoryUsageMbForTag"
GetMemoryUsageMbForTag.Parent = Holder_4
GetMemoryUsageMbForTag.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
GetMemoryUsageMbForTag.BackgroundTransparency = 0.500
GetMemoryUsageMbForTag.BorderColor3 = Color3.fromRGB(0, 0, 0)
GetMemoryUsageMbForTag.BorderSizePixel = 0
GetMemoryUsageMbForTag.Position = UDim2.new(0, 0, 0.25, 0)
GetMemoryUsageMbForTag.Size = UDim2.new(1, 0, 0.125, 0)
GetMemoryUsageMbForTag.Font = Enum.Font.Unknown
GetMemoryUsageMbForTag.Text = "GetMemoryUsageMbForTag (Gui)"
GetMemoryUsageMbForTag.TextColor3 = Color3.fromRGB(255, 255, 255)
GetMemoryUsageMbForTag.TextScaled = true
GetMemoryUsageMbForTag.TextSize = 14.000
GetMemoryUsageMbForTag.TextWrapped = true

PreloadAsync.Name = "PreloadAsync"
PreloadAsync.Parent = Holder_4
PreloadAsync.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
PreloadAsync.BackgroundTransparency = 0.500
PreloadAsync.BorderColor3 = Color3.fromRGB(0, 0, 0)
PreloadAsync.BorderSizePixel = 0
PreloadAsync.Position = UDim2.new(0, 0, 0.375, 0)
PreloadAsync.Size = UDim2.new(1, 0, 0.125, 0)
PreloadAsync.Font = Enum.Font.Unknown
PreloadAsync.Text = "PreloadAsync"
PreloadAsync.TextColor3 = Color3.fromRGB(255, 255, 255)
PreloadAsync.TextScaled = true
PreloadAsync.TextSize = 14.000
PreloadAsync.TextWrapped = true

GetFocusedTextBox.Name = "GetFocusedTextBox"
GetFocusedTextBox.Parent = Holder_4
GetFocusedTextBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
GetFocusedTextBox.BackgroundTransparency = 0.500
GetFocusedTextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
GetFocusedTextBox.BorderSizePixel = 0
GetFocusedTextBox.Position = UDim2.new(0, 0, 0.625, 0)
GetFocusedTextBox.Size = UDim2.new(1, 0, 0.125, 0)
GetFocusedTextBox.Font = Enum.Font.Unknown
GetFocusedTextBox.Text = "GetFocusedTextBox"
GetFocusedTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
GetFocusedTextBox.TextScaled = true
GetFocusedTextBox.TextSize = 14.000
GetFocusedTextBox.TextWrapped = true

InstanceCount.Name = "InstanceCount"
InstanceCount.Parent = Holder_4
InstanceCount.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
InstanceCount.BackgroundTransparency = 0.500
InstanceCount.BorderColor3 = Color3.fromRGB(0, 0, 0)
InstanceCount.BorderSizePixel = 0
InstanceCount.Position = UDim2.new(0, 0, 0.5, 0)
InstanceCount.Size = UDim2.new(1, 0, 0.125, 0)
InstanceCount.Font = Enum.Font.Unknown
InstanceCount.Text = "InstanceCount"
InstanceCount.TextColor3 = Color3.fromRGB(255, 255, 255)
InstanceCount.TextScaled = true
InstanceCount.TextSize = 14.000
InstanceCount.TextWrapped = true

GuiObjects.Name = "GuiObjects"
GuiObjects.Parent = Holder_4
GuiObjects.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
GuiObjects.BackgroundTransparency = 0.500
GuiObjects.BorderColor3 = Color3.fromRGB(0, 0, 0)
GuiObjects.BorderSizePixel = 0
GuiObjects.Position = UDim2.new(0, 0, 0.75, 0)
GuiObjects.Size = UDim2.new(1, 0, 0.125, 0)
GuiObjects.Font = Enum.Font.Unknown
GuiObjects.Text = "GuiObjects"
GuiObjects.TextColor3 = Color3.fromRGB(255, 255, 255)
GuiObjects.TextScaled = true
GuiObjects.TextSize = 14.000
GuiObjects.TextWrapped = true

Weaktable.Name = "Weaktable"
Weaktable.Parent = Holder_4
Weaktable.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Weaktable.BackgroundTransparency = 0.500
Weaktable.BorderColor3 = Color3.fromRGB(0, 0, 0)
Weaktable.BorderSizePixel = 0
Weaktable.Position = UDim2.new(0, 0, 0.875, 0)
Weaktable.Size = UDim2.new(1, 0, 0.125, 0)
Weaktable.Font = Enum.Font.Unknown
Weaktable.Text = "Weaktable"
Weaktable.TextColor3 = Color3.fromRGB(255, 255, 255)
Weaktable.TextScaled = true
Weaktable.TextSize = 14.000
Weaktable.TextWrapped = true

AllBypasses.Name = "AllBypasses"
AllBypasses.Parent = Holder_4
AllBypasses.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
AllBypasses.BackgroundTransparency = 0.500
AllBypasses.BorderColor3 = Color3.fromRGB(0, 0, 0)
AllBypasses.BorderSizePixel = 0
AllBypasses.Position = UDim2.new(0, 0, 1, 0)
AllBypasses.Size = UDim2.new(1, 0, 0.125, 0)
AllBypasses.Font = Enum.Font.Unknown
AllBypasses.Text = "All Bypasses"
AllBypasses.TextColor3 = Color3.fromRGB(255, 255, 255)
AllBypasses.TextScaled = true
AllBypasses.TextSize = 14.000
AllBypasses.TextWrapped = true

UIListLayout_2.Parent = Holder_4
UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder

UI2DDrawcallCount.Name = "UI2DDrawcallCount"
UI2DDrawcallCount.Parent = Holder_4
UI2DDrawcallCount.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
UI2DDrawcallCount.BackgroundTransparency = 0.500
UI2DDrawcallCount.BorderColor3 = Color3.fromRGB(0, 0, 0)
UI2DDrawcallCount.BorderSizePixel = 0
UI2DDrawcallCount.Position = UDim2.new(0, 0, 1, 0)
UI2DDrawcallCount.Size = UDim2.new(1, 0, 0.125, 0)
UI2DDrawcallCount.Font = Enum.Font.Unknown
UI2DDrawcallCount.Text = "UI2DDrawcallCount"
UI2DDrawcallCount.TextColor3 = Color3.fromRGB(255, 255, 255)
UI2DDrawcallCount.TextScaled = true
UI2DDrawcallCount.TextSize = 14.000
UI2DDrawcallCount.TextWrapped = true

UI2DTriangleCount.Name = "UI2DTriangleCount"
UI2DTriangleCount.Parent = Holder_4
UI2DTriangleCount.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
UI2DTriangleCount.BackgroundTransparency = 0.500
UI2DTriangleCount.BorderColor3 = Color3.fromRGB(0, 0, 0)
UI2DTriangleCount.BorderSizePixel = 0
UI2DTriangleCount.Position = UDim2.new(0, 0, 1, 0)
UI2DTriangleCount.Size = UDim2.new(1, 0, 0.125, 0)
UI2DTriangleCount.Font = Enum.Font.Unknown
UI2DTriangleCount.Text = "UI2DTriangleCount"
UI2DTriangleCount.TextColor3 = Color3.fromRGB(255, 255, 255)
UI2DTriangleCount.TextScaled = true
UI2DTriangleCount.TextSize = 14.000
UI2DTriangleCount.TextWrapped = true

-- Scripts:

local function main() -- Script.MainScript 
	local script = Instance.new('LocalScript', Script)

	-- dont mind the fake script im too lazy to remove it
	
	local getgenv = getgenv or getfenv
	local hookfunction = hookfunction or nil
	local getnilinstances = getnilinstances or nil -- lol
	local getrawmetatable = getrawmetatable or nil
	local setrawmetatable = setrawmetatable or nil
	local checkcaller = checkcaller or nil
	local setreadonly = setreadonly or nil
	local getthreadidentity = getthreadidentity or nil
	local run_on_actor = run_on_actor or nil
	local getgc = getgc or nil
	local getconnections = getconnections or nil
	local isalive = isalive or nil
	local islclosure = islclosure or function(a) return debug.info(a, "s") ~= "[C]" end
	local isourclosure = isourclosure or nil
	local getconstants = getconstants or nil
	local getupvalues = getupvalues or nil
	local cloneref = cloneref or function(a)
		return a
	end
	if tostring(cloneref(Instance.new("Part"))) ~= "Part" then -- fuck u synz
		cloneref = function(a) return a end
	end
	local clonefunction = clonefunction or function(a)
		return a
	end
	local hookmetamethod = hookmetamethod or (getrawmetatable and setreadonly and function(...)
		local object, metamethod, func = ...
		local meta = getrawmetatable(object)
		local orgmetamethod = meta[metamethod]
	
		setreadonly(meta, false)
		meta[metamethod] = func
	
		setreadonly(meta, true)
		return orgmetamethod
	end) or nil
	local newcclosure = newcclosure or function(f) return f end
	local saveinstance = saveinstance or nil
	local setclipboard = setclipboard or nil
	local writefile = writefile or nil
	local isfile = isfile or nil
	local delfile = delfile or nil
	local readfile = readfile or nil
	local makefolder = makefolder or nil
	local isfolder = isfolder or nil
	local decompile = decompile or disassemble or getscriptbytecode or nil
	local getscripts = getscripts or nil
	local europa = europa or nil
	
	local Players = cloneref(game:GetService("Players"))
	local UserInputService = cloneref(game:GetService('UserInputService'))
	local StarterGui = cloneref(game:GetService("StarterGui"))
	local Stats = cloneref(game:GetService("Stats"))
	local LocalPlayer = cloneref(Players.LocalPlayer or Players:GetPropertyChangedSignal("LocalPlayer"):Wait())
	local Exec = Exec or (script and script.Parent.Parent)
	
	getgenv().EUROPA_INTERNAL_LOADED = true
	getgenv().print, getgenv().warn, getgenv().error = print, warn, error
	
	local gui = script.Parent.Parent
	local mainbutton = gui.Button
	local f_script = script.Parent
	local main = gui.Main
	local semitop = main.SemiTop
	local f_buttons = semitop.Buttons
	local side = main.Side
	local bottom = main.Bottom
	local scrhub = gui.ScriptHub
	local bypasses = gui.Bypasses
	local options = gui.Options
	
	local codeholder = main.CodeHolder
	local assigns = codeholder.Scroller.Assignments
	if not assigns.Assigner:FindFirstChild("Int") then
		local temp = Instance.new("IntValue", assigns.Assigner)
		temp.Name = "Int"
		temp.Value = 1
		temp = nil
	end
	local code = codeholder.Scroller.Code
	
	local pcallEnabled = false
	local deterEnabled = true
	local codeSavingEnabled = true
	
	local namecallEnabled, indexEnabled, newindexEnabled = true, true, true -- no purpose other than for settings
	
	if makefolder then
		if not isfolder("europa") then makefolder("europa") end
		if not isfolder("europa/logs") then makefolder("europa/logs") end
		if not isfolder("europa/dumps") then makefolder("europa/dumps") end
		if not isfolder("europa/backup") then makefolder("europa/backup") end
		if not isfolder("europa/settings") then makefolder("europa/settings") end
	end
	
	-- fix fonts for certain buttons (gui2lua doesnt set these fonts for some reason)
	task.spawn(function()
		local NunitoJSON = "rbxasset://fonts/families/Nunito.json"
	
		for i, v in pairs(gui:GetDescendants()) do
			if v:IsA("TextButton") and v.Font == Enum.Font.Legacy then
				v.FontFace = Font.new(NunitoJSON, Enum.FontWeight.Bold)
			end
		end
	end)
	
	if run_on_actor then
		-- run_on_actor validity check; if it's faked then make it nil
		local rnd = math.random()
		local CoreGui = cloneref(game:GetService("CoreGui"))
	
		Instance.new("Folder", CoreGui.RobloxGui).Name = rnd
		run_on_actor(Instance.new("Actor"), 'pcall(function() game:GetService("CoreGui").RobloxGui[' .. tostring(rnd) .. ']:Destroy() end)')
	
		task.delay(.1, function()
			if CoreGui.RobloxGui:FindFirstChild(tostring(rnd)) then
				run_on_actor = nil
				getgenv().run_on_actor = nil
			end
			CoreGui = nil
		end)
	end
	
	local function setnotif(title, info)
		for i = 1, math.random(1, 3) do -- prevent gui memory checks
			Instance.new("Frame")
		end
	
		StarterGui:SetCore("SendNotification", {
			Title = title,
			Text = info
		})
	end
	
	local function loadeuropaglobals()
		task.wait()
		if getgenv().europa then
			getgenv().europa.gui, getgenv().europa.internal = Exec, Exec
			return
		end
		loadstring(game:HttpGet("https://raw.githubusercontent.com/FaithfulAC/Megaprojects/main/europa_library_wip.lua"))()
		getgenv().europa.gui, getgenv().europa.internal = Exec, Exec
		setnotif("Library", "Europa Library Loaded")
		
		task.delay(.105, function() -- hijack europa.loaddex and europa.loadtsdex if run_on_actor exists
			local newloaddex = function()
				if run_on_actor then
					setnotif("Dex Notification", "The script you have just loaded has been run under an actor, as your executor supports it")
	
					run_on_actor(Instance.new("Actor"), "local in_actor = true;\n\n" .. game:HttpGet("https://raw.githubusercontent.com/FaithfulAC/universal-stuff/main/true-secure-dex.lua"))
				else
					loadstring(game:HttpGet("https://raw.githubusercontent.com/FaithfulAC/universal-stuff/refs/heads/main/true-secure-dex.lua"))(false)
				end
			end
			
			local newloadtsdex = function(a)
				if run_on_actor then
					setnotif("Dex Notification", "The script you have just loaded has been run under an actor, as your executor supports it")
	
					run_on_actor(Instance.new("Actor"), "local in_actor = true;" .. ((a == nil or a == true) and "local LoadBypasses = true;" or "") .. "\n\n" .. game:HttpGet("https://raw.githubusercontent.com/FaithfulAC/universal-stuff/main/true-secure-dex.lua"))
				else
					loadstring(game:HttpGet("https://raw.githubusercontent.com/FaithfulAC/universal-stuff/refs/heads/main/true-secure-dex.lua"))(a)
				end
			end
			getgenv().europa.loaddex = newloaddex
			getgenv().loaddex = newloaddex
			
			getgenv().europa.loadtsdex = newloadtsdex
			getgenv().loadtsdex = newloadtsdex
		end)
	end
	
	local Clone = clonefunction(game.Clone)
	local SetAttribute = clonefunction(game.SetAttribute)
	local coroutine_isyieldable = clonefunction(coroutine.isyieldable)
	local task_wait = clonefunction(task.wait)
	local task_delay = clonefunction(task.delay)
	local BrickColor_White = clonefunction(BrickColor.White)
	local BrickColor_Red = clonefunction(BrickColor.Red)
	local BrickColor_Blue = clonefunction(BrickColor.Blue)
	local BrickColor_Yellow = clonefunction(BrickColor.Yellow)
	local string_split = clonefunction(string.split)
	local string_find = clonefunction(string.find)
	local string_format = clonefunction(string.format)
	local math_floor = clonefunction(math.floor)
	local typeof = clonefunction(typeof)
	local pcall = clonefunction(pcall)
	local pairs = clonefunction(pairs)
	local tick = clonefunction(tick)
	local rawequal = clonefunction(rawequal)
	local UDim2_new = clonefunction(UDim2.new)
	local tostring = clonefunction(tostring)
	
	local FontFaceMt = Instance.new("TextLabel").FontFace
	local Font__newindex, __index, __newindex;
	
	if getrawmetatable then
		Font__newindex = clonefunction(getrawmetatable(FontFaceMt).__newindex)
		__index = clonefunction(getrawmetatable(game).__index)
		__newindex = clonefunction(getrawmetatable(game).__newindex)
	else
		Font__newindex = clonefunction(select(2, xpcall(function() FontFaceMt[nil]=nil end, function() return debug.info(2, "f") end)))
		__index = clonefunction(select(2, xpcall(function() return game[nil] end, function() return debug.info(2, "f") end)))
		__newindex = clonefunction(select(2, xpcall(function() game[nil]=nil end, function() return debug.info(2, "f") end)))
	end
	
	FontFaceMt = nil
	
	local Enum_TextXAlignment_Left = Enum.TextXAlignment.Left
	local Enum_FontWeight_Bold = Enum.FontWeight.Bold
	local Enum_MessageType_MessageWarning = Enum.MessageType.MessageWarning
	local Enum_MessageType_MessageInfo = Enum.MessageType.MessageInfo
	local Enum_MessageType_MessageError = Enum.MessageType.MessageError
	
	local function toTime(tick)
		local seconds = math_floor(tick % 60)
		local minutes = math_floor(tick / 60) % 60
		local hours = math_floor(tick / 3600) % 24
		seconds, minutes, hours = tostring(seconds), tostring(minutes), tostring(hours)
	
		if #seconds == 1 then seconds = "0" .. seconds end
		if #minutes == 1 then minutes = "0" .. minutes end
		if #hours == 1 then hours = "0" .. hours end
	
		return string_format("[%s:%s:%s]", hours, minutes, seconds)
	end
	
	local tempe = select(2, pcall(loadeuropaglobals))
	if tempe and not tempe:find("HttpGet") and not tempe:find("CoreScripts") then
		error("An error occured while loading europatech: " .. ((string.split(tempe, ":")[3]) or tempe), 0)
		return
	end
	
	local warnExcluded, infoExcluded, errorExcluded, printExcluded, printfunctionsyield, scroller =
		false, false, false, false, false, nil;
	local msgDelay = 0
	
	local function MessageOutFunction(str, type)
		-- everything inside this function calls cloned functions to prevent stack overflows in hooks where this may be called
		if printfunctionsyield then
			msgDelay += 1
	
			if msgDelay > 1000 then
				task_delay(.2, function()
					if msgDelay > 1000 then
						msgDelay = 0
					end
				end)
				return
			end
		end
	
		local offset = 0
		local bolden = false
		local color = BrickColor_White()
		if #str > 26 then
			offset += (1/25) * (#str - 26)
		end
	
		if string_find(str, "\n") then
			str = string_split(str, "\n")
			if str[#str] == "" or str[#str] == "\0" then
				str[#str] = nil
			end
		end
	
		if rawequal(type, Enum_MessageType_MessageWarning) then -- funny statements
	
			if warnExcluded then return end
			color = BrickColor_Yellow()
			bolden = true
	
		elseif rawequal(type, Enum_MessageType_MessageInfo) then
	
			if infoExcluded then return end
			color = BrickColor_Blue()
	
		elseif rawequal(type, Enum_MessageType_MessageError) then
	
			if errorExcluded then return end
			color = BrickColor_Red()
			bolden = true
	
		elseif printExcluded then return end
	
		local tbl = typeof(str) == "table" and str or {str}
	
		for i, str in pairs(tbl) do
			if printfunctionsyield and i >= 100 then str = "[DELAYED]: " .. str end
			if printfunctionsyield and i%100 == 0 and coroutine_isyieldable() then task_wait() end
			
			if not (scroller and pcall(function() return __index(scroller, "_Line_") end)) then break end
			local newline = Clone(__index(scroller, "_Line_"))
			__newindex(newline, "Parent", scroller)
			__newindex(newline, "Name", "Line")
			__newindex(newline, "BackgroundTransparency", 1)
			__newindex(newline, "TextXAlignment", Enum_TextXAlignment_Left)
			__newindex(newline, "Size", UDim2_new(1+offset, 0, 0.075, 0))
			__newindex(newline, "TextColor", color)
			__newindex(newline, "Text", "  --  " .. str)
			if rawequal(bolden, true) then
				Font__newindex(__index(newline, "FontFace"), "Weight", Enum_FontWeight_Bold)
			end
			SetAttribute(newline, "Time", toTime(tick()))
		end
	end
	
	local safetostring = function(...)
		local args = {...}
		local getrawmetatable = getrawmetatable or debug.getmetatable or getmetatable
	
		-- since varargs will automatically convert last args that are nil to nothing, we can just make them "nil" (not using table.pack)
		if #args < select("#", ...) then
			for i = #args+1, select("#",...) do
				args[i] = "nil"
			end
		end
	
		for i, v in pairs(args) do
			if (typeof(v) == "table" or typeof(v) == "userdata") and getrawmetatable(v) and rawget(getrawmetatable(v), "__tostring") then
				local mt = getrawmetatable(v)
				local func = rawget(mt, "__tostring")
				rawset(mt, "__tostring", nil)
	
				if pcall(function() return tostring(v) end) then
					args[i] = tostring(v)
				else
					args[i] = typeof(v) .. ":NO_TOSTRING"
				end
	
				rawset(mt, "__tostring", func)
			elseif pcall(function() return tostring(v) end) then
				args[i] = tostring(v)
			else
				args[i] = typeof(v) .. ":NO_TOSTRING"
			end
		end
	
		return args -- no unpack
	end
	
	local function randomstr() -- actually outputs numbers but wtv
		return tostring(math.random(10000, 99999))
	end
	
	coroutine.wrap(function() -- handles stuff
		local exit = f_buttons.Exit
		local mini = f_buttons.Minimize
		exit.MouseButton1Click:Connect(function()
			script.Parent = nil
			gui:Destroy()
			pcall(script.Destroy, script)
		end)
		mini.MouseButton1Click:Connect(function()
			main.Visible = not main.Visible
		end)
		mainbutton.MouseButton1Click:Connect(function()
			main.Visible = not main.Visible
		end)
	end)()
	
	coroutine.wrap(function() -- code handler
		local numoflines = 1
		
		local orgAbsSizeX = code.AbsoluteSize.X
		local orgTextBoundsX = code.TextBounds.X
		local orgTextSize = code.AbsoluteSize.Y
		local orgTextLen = #code.Text
	
		local factor = 0.9/orgAbsSizeX
		codeholder.Scroller.AutomaticCanvasSize = Enum.AutomaticSize.XY
		code.MultiLine = true
		code.TextSize = orgTextSize
	
		code:GetPropertyChangedSignal("Text"):Connect(function()
			local txt = code.Text
	
			txt:gsub("\n", function(a)
				numoflines += 1
			end)
			
			local maxofoneline, offset = 0, 0
			local newTextBoundsX = code.TextBounds.X
			
			if orgTextBoundsX > newTextBoundsX and #code.Text >= orgTextLen then
				newTextBoundsX = orgTextBoundsX
			else
				orgTextBoundsX = newTextBoundsX
			end
			
			if newTextBoundsX > (orgAbsSizeX-20) then
				maxofoneline = newTextBoundsX - (orgAbsSizeX-20)
				offset = 0.15
			end
			
			orgTextLen = #code.Text
	
			code.Size = UDim2.new(0.9+(maxofoneline*factor+offset), 0, 0.15*numoflines, 0)
			code.TextSize = math.round(code.AbsoluteSize.Y/numoflines)
			code.TextWrapped = false
			local ch = assigns:GetChildren()
	
			local function getmaxl()
				local n = 0
				for i, v in pairs(ch) do
					if v:FindFirstChild("Int") and v:FindFirstChild("Int").Value > n then
						n = v.Int.Value
					end
				end
				return n
			end
	
			if #ch < numoflines then
				for i = getmaxl()+1, numoflines do -- increase amount of children
					local cl = assigns:FindFirstChild("Assigner"):Clone()
					cl.Parent = assigns
					cl.Position = UDim2.new(0, 0, 0.15*(i-1), 0)
					cl:FindFirstChild("Int").Value = i
					cl.Text = tostring(i) .. "."
				end
			elseif #ch > numoflines then -- decrease amount of children
				for _, v in pairs(ch) do
					if v:FindFirstChild("Int").Value > numoflines then
						v:Destroy()
					end
				end
			end
	
			numoflines = 1
		end)
	end)()
	
	coroutine.wrap(function() -- load backup, if one
		if isfile and readfile and isfile("europa/backup/saved.lua") then
			code.Text = readfile("europa/backup/saved.lua")
			setnotif("Code Notification", "Loaded last backup")
		end
	end)()
	
	coroutine.wrap(function() -- settings (to be made)
		--[[
			format: [pcall]
		
			pcall, deterred print, disable namecall/index/newindex hooks, disable code saving
			logs - print: on/off, warn: on/off, error: on/off, info: on/off ([]Excluded)
		]]
		
		
	end)()
	
	coroutine.wrap(function() -- drag
		local frame = main
		local dragToggle = nil
		local dragStart = nil
		local startPos = nil
	
		local function updateInput(input)
			local delta = input.Position - dragStart
			local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
				startPos.Y.Scale, startPos.Y.Offset + delta.Y)
			frame.Position = position
		end
	
		frame.InputBegan:Connect(function(input)
			if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then 
				dragToggle = true
				dragStart = input.Position
				startPos = frame.Position
				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then
						dragToggle = false
					end
				end)
			end
		end)
	
		UserInputService.InputChanged:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
				if dragToggle then
					updateInput(input)
				end
			end
		end)
	end)()
	
	coroutine.wrap(function() -- buttons on the side
		local exec = side.Execute
		local clear = side.Clear
		local copy = side.Copy
		local _print = side.Print
		local _pcall = side.Pcall
	
		local defPrint, defWarn, defError = print, warn, error
	
		exec.MouseButton1Click:Connect(function()
			if not pcall(function() return loadstring("assert(true, '?')") end) then -- this basically will render the gui useless lol
				setnotif("Error", "Your executor does not have method 'loadstring'")
				return
			end
	
			local thing = loadstring(code.Text)
	
			if type(thing) ~= "function" then
				setnotif("Syntax Error", "Check your code for any issues and try again")
				return
			end
	
			if pcallEnabled then			
				local _, e = pcall(function() return thing() end)
				if e then setnotif("Error In Execution", e) end
			else
				return coroutine.wrap(thing)()
			end
		end)
	
		_pcall.MouseButton1Click:Connect(function()
			pcallEnabled = not pcallEnabled
			if pcallEnabled then
				_pcall.Text = "pcall: on"
			else
				_pcall.Text = "pcall: off"
			end
		end)
		_print.MouseButton1Click:Connect(function()
			deterEnabled = not deterEnabled
			if deterEnabled then
				getgenv().print = newcclosure(function(...)
					local args = safetostring(...)
					local final = table.concat(args, " ")
	
					MessageOutFunction(final, Enum.MessageType.MessageOutput)
				end, "print")
				getgenv().warn = newcclosure(function(...)
					local args = safetostring(...)
					local final = table.concat(args, " ")
	
					MessageOutFunction(final, Enum.MessageType.MessageWarning)
				end, "warn")
				getgenv().error = newcclosure(function(...)
					if not checkcaller() or (getthreadidentity and getthreadidentity() < 4 or true) then
						return defError(...)
					end
	
					local final = safetostring((...))[1]
	
					MessageOutFunction(final, Enum.MessageType.MessageError)
					return coroutine.yield()
				end, "error")
				getgenv().info = newcclosure(function(...)
					local args = safetostring(...)
					local final = table.concat(args, " ")
	
					MessageOutFunction(final, Enum.MessageType.MessageInfo)
				end, "info")
	
				_print.Text = "deterred print: on"
			else
				getgenv().print, getgenv().warn, getgenv().error, getgenv().info = defPrint, defWarn, defError, nil
				_print.Text = "deterred print: off"
			end
		end)
	
		getgenv().print = newcclosure(function(...)
			local args = safetostring(...)
			local final = table.concat(args, " ")
	
			MessageOutFunction(final, Enum.MessageType.MessageOutput)
		end, "print")
		getgenv().warn = newcclosure(function(...)
			local args = safetostring(...)
			local final = table.concat(args, " ")
	
			MessageOutFunction(final, Enum.MessageType.MessageWarning)
		end, "warn")
		getgenv().error = newcclosure(function(...)
			if not checkcaller() or (getthreadidentity and getthreadidentity() < 4 or true) then
				return defError(...)
			end
	
			local final = safetostring((...))[1]
	
			MessageOutFunction(final, Enum.MessageType.MessageError)
			return coroutine.yield()
		end, "error")
		getgenv().info = newcclosure(function(...)
			local args = safetostring(...)
			local final = table.concat(args, " ")
	
			MessageOutFunction(final, Enum.MessageType.MessageInfo)
		end, "info")
	
		clear.MouseButton1Click:Connect(function()
			code.Text = ""
			codeholder.Scroller.CanvasPosition = Vector2.zero
			code.Size = UDim2_new(0.9, 0, 0.15, 0)
		end)
		copy.MouseButton1Click:Connect(function()
			if not setclipboard then setnotif("Error", "Your executor does not have method 'setclipboard'") return end
			setclipboard(code.Text)
			setnotif("setclipboard", "Operation Successful")
		end)
	end)()
	
	coroutine.wrap(function() -- options and duoviewer
		coroutine.resume(coroutine.create(function() -- drag
			local frame = options
			local dragToggle = nil
			local dragStart = nil
			local startPos = nil
	
			local function updateInput(input)
				local delta = input.Position - dragStart
				local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
					startPos.Y.Scale, startPos.Y.Offset + delta.Y)
				frame.Position = position
			end
	
			frame.InputBegan:Connect(function(input)
				if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then 
					dragToggle = true
					dragStart = input.Position
					startPos = frame.Position
					input.Changed:Connect(function()
						if input.UserInputState == Enum.UserInputState.End then
							dragToggle = false
						end
					end)
				end
			end)
	
			UserInputService.InputChanged:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
					if dragToggle then
						updateInput(input)
					end
				end
			end)
		end))
		local buttons = options.Buttons
		local duoviewer = gui.DuoViewer
		local duoholder = duoviewer.Holder
		local optswitch = bottom.Options
		duoholder.AutomaticCanvasSize = Enum.AutomaticSize.XY
		buttons.AutomaticCanvasSize = Enum.AutomaticSize.Y
		
		if not buttons:FindFirstChildWhichIsA("UIListLayout") then
			local UIListLayout = Instance.new("UIListLayout", buttons)
			UIListLayout.FillDirection = Enum.FillDirection.Vertical
			UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Top
		end
		
		coroutine.resume(coroutine.create(function() -- drag
			local frame = duoviewer
			local dragToggle = nil
			local dragStart = nil
			local startPos = nil
	
			local function updateInput(input)
				local delta = input.Position - dragStart
				local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
					startPos.Y.Scale, startPos.Y.Offset + delta.Y)
				frame.Position = position
			end
	
			frame.InputBegan:Connect(function(input)
				if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then 
					dragToggle = true
					dragStart = input.Position
					startPos = frame.Position
					input.Changed:Connect(function()
						if input.UserInputState == Enum.UserInputState.End then
							dragToggle = false
						end
					end)
				end
			end)
	
			UserInputService.InputChanged:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
					if dragToggle then
						updateInput(input)
					end
				end
			end)
		end))
	
		local optionsStorage = duoviewer.OptionsStorage
	
		local objval1 = Instance.new("ObjectValue", optionsStorage.OptionsS)
		objval1.Name = "Subject"
	
		local loadviewer;
	
		local function loadprops(label: TextLabel, isDisabled: boolean)
			label.BackgroundTransparency = 1
			label.Size = UDim2.new(1, 0, 0.125, 0)
			label.Position = UDim2.new(0, 0, (#duoholder:GetChildren()-1)*0.125, 0) -- minus 1 for the added text label
			label.TextXAlignment = Enum.TextXAlignment.Left
			label.TextScaled = true
			label.TextColor3 = if isDisabled then Color3.fromRGB(255, 0, 0) else Color3.fromRGB(255, 255, 255)
			label.Font = Enum.Font.Nunito
			label.FontFace.Bold = true
		end
	
		local function updateScale()
			duoholder.CanvasSize = UDim2.new(0, 0, 0.825*#duoholder:GetChildren()*0.125, 0)
		end
	
		optionsStorage.OptionsS.CopyPath.MouseButton1Click:Connect(function()
			if objval1.Value then
				if not setclipboard then setnotif("Error", "Your executor does not have method 'setclipboard'") return end
				setclipboard(objval1.Value:GetFullName())
				setnotif("setclipboard", "Operation Successful")
			end
		end)
		optionsStorage.OptionsS:FindFirstChild("Destroy").MouseButton1Click:Connect(function()
			if objval1.Value then
				objval1.Value:Destroy()
				objval1.Value = nil
				loadviewer()
				setnotif("Destroy", "Operation Successful")
			end
		end)
		optionsStorage.OptionsS.Disable.MouseButton1Click:Connect(function()
			if objval1.Value and objval1.Value.ClassName ~= "ModuleScript" then
				objval1.Value.Disabled = true
				loadviewer()
				setnotif("Disable", "Operation Successful")
			end
		end)
		optionsStorage.OptionsS.Enable.MouseButton1Click:Connect(function()
			if objval1.Value and objval1.Value.ClassName ~= "ModuleScript" then
				objval1.Value.Enabled = true
				loadviewer()
				setnotif("Enable", "Operation Successful")
			end
		end)
		optionsStorage.OptionsS.CopySource.MouseButton1Click:Connect(function()
			if objval1.Value then
				if not setclipboard then
					setnotif("Error", "Your executor does not have method 'setclipboard'")
					return
				elseif not decompile then
					setnotif("Error", "Your executor does not have method 'decompile'")
					return
				end
				local source = decompile(objval1.Value)
				setclipboard(source)
				setnotif("decompile", "Operation Successful")
				setnotif("setclipboard", "Operation Successful")
			end
		end)
	
		local function assign(scr)
			if scr == nil then pcall(function() optionsStorage.OptionsS.Visible = false objval1.Value = nil end) return end
			objval1.Value = scr
			optionsStorage.OptionsS.Visible = true
		end
	
		loadviewer = function()
			for i, v in pairs(duoholder:GetChildren()) do
				if v:IsA("TextLabel") then
					v:Destroy()
				end
			end
	
			for i, v in getscripts() do
				if typeof(v) ~= "Instance" then continue end -- for the dumb dumb exploits
				if v:FindFirstAncestorOfClass("CoreGui") then continue end -- for the too many corescripts
	
				local lbl = Instance.new("TextLabel", duoholder)
				loadprops(lbl, if not v:IsA("ModuleScript") then v.Disabled else false)
				local name: string = v.Name
	
				if string.len(name) > 20 then
					name = string.sub(name, 1, 20) .. "..."
				end
	
				lbl.Text = v.Name .. " || " .. v.ClassName
				Instance.new("ObjectValue", lbl).Value = v
	
				local button = Instance.new("TextButton", lbl)
				button.Size = UDim2.new(1,0,1,0)
				button.Transparency = 1
				button.BackgroundColor3 = Color3.fromRGB(50, 150, 255)
				button.MouseButton1Click:Connect(function()
					assign(v)
				end)
			end
			updateScale()
		end
	
		local mouse = LocalPlayer and LocalPlayer:GetMouse()
		mouse.Button1Up:Connect(assign)
	
		optswitch.MouseButton1Click:Connect(function()
			options.Visible = not options.Visible
		end)
	
		local _saveins = buttons.SaveIns
		_saveins.MouseButton1Click:Connect(function()
			if not saveinstance then setnotif("Error", "Your executor does not have method 'saveinstance'") return end
	
			local s, e = pcall(saveinstance)
	
			if e then
				setnotif("Error in saveinstance", e)
			elseif s then
				setnotif("saveinstance", "Operation Successful")
			end
		end)
	
		local viewscripts = buttons.ViewScripts
		viewscripts.MouseButton1Click:Connect(function()
			if not getscripts then return setnotif("Error", "Your executor does not have method 'getscripts'") end
			
			duoviewer.Visible = not duoviewer.Visible
			if duoviewer.Visible then loadviewer() else assign() end -- assign here makes any objvalue nil
		end)
	
		local badboy = {"\\", "/", ":", "*", "?", '"', "<", ">", "|"}
	
		local function handlespecials(value, indentation)
			local buildStr = {}
			local i = 1
			local char = string.sub(value, i, i)
			local indentStr
			while char ~= "" do
				if table.find(badboy, char) then
					buildStr[i] = '#'
				elseif char == "\\" then
					buildStr[i] = "\\\\"
				elseif char == "\n" then
					buildStr[i] = "\\n"
				elseif char == "\t" then
					buildStr[i] = "\\t"
				elseif string.byte(char) > 126 or string.byte(char) < 32 then
					buildStr[i] = string.format("\\%d", string.byte(char))
				else
					buildStr[i] = char
				end
				i = i + 1
				char = string.sub(value, i, i)
				if i % 200 == 0 then
					indentStr = indentStr or string.rep(" ", indentation + "    ")
					table.move({ '"\n', indentStr, '... "' }, 1, 3, i, buildStr)
					i += 3
				end
			end
			return table.concat(buildStr)
		end
	
		local function fullName(scr)
			local parent = scr.Parent
			if parent == nil or parent == game then return handlespecials(scr.Name) end
			local name = "['" .. handlespecials(scr.Name) .. "']"
	
			while parent.Parent ~= game do
				name = "['" .. handlespecials(parent.Name) .. "']" .. name
				parent = parent.Parent
			end
	
			name = parent.ClassName .. name
			return name
		end
	
		local dumpscripts = buttons.DumpScripts
		dumpscripts.MouseButton1Click:Connect(function()
			if not (isfolder or makefolder or writefile) then return setnotif("Error", "Your executor does not support file functions") end
			
			local start = "europa/dumps/"
			local path = start .. "Dump_" .. tostring(game.PlaceId) .. "_"
	
			for i = 1, 100 do -- max dumps for one place is 100
				if not isfolder(path .. tostring(i)) then
					path = path .. tostring(i)
					makefolder(path)
					break
				end
			end
	
			for i, v in pairs(getscripts()) do
				if typeof(v) ~= "Instance" then continue end -- for the dumb dumb exploits
				if v:FindFirstAncestorOfClass("CoreGui") then continue end -- for the too many corescripts
	
				if v.ClassName == "LocalScript" or v.ClassName == "ModuleScript" or (v.ClassName == "Script" and v.RunContext == Enum.RunContext.Client) then
					writefile(path .. "/" .. fullName(v) .. ".lua", "-- Dumped with europatech: " .. os.date("%x") .. "\n\n" .. decompile(v))
				end
				if i%100 == 0 then task.wait() end
			end
	
			setnotif("Dump Scripts", "Dumped Scripts at " .. path)
		end)
		
		local dumpgc = buttons.DumpGC
		dumpgc.MouseButton1Click:Connect(function()
			if not (getgc or writefile) then return setnotif("Error", "Your executor does not support 'getgc' and/or 'writefile'") end
			
			local start = "europa/dumps/"
			local path = start .. "GCDump_" .. tostring(game.PlaceId)
			local valuetostring = loadstring(game:HttpGet("https://raw.githubusercontent.com/FaithfulAC/Megaprojects/refs/heads/main/valuetostring.lua"))()
			
			local temp = nil;
			
			for i = 1, 100 do -- max dumps for one place is 100
				if not isfile(path .. "/Dump" .. tostring(i) .. ".txt") then
					temp = tostring(i)
					break
				end
			end
			
			local filepath = path .. "/Dump" .. temp .. ".txt"
			local dump = ""
			local debounce = 0
			
			setnotif("Dump GC", "Dump has started; this may take a while...")
			temp = nil
			
			for i, v in getgc() do
				if typeof(v) == "function" and islclosure(v) and not isourclosure(v) then
					debounce += 1
					if debounce%100 == 0 then task.wait() end
					
					dump ..= "Function " .. tostring(debug.info(v, "f")) .. "\nSource: " .. debug.info(v, "s")
						.. "\nName: " .. debug.info(v, "n") .. "\nLine: " .. debug.info(v, "l") .. "\nNum of Params: "
						.. tostring((debug.info(v, "a"))) .. "\nVararg: " .. tostring(select(2, debug.info(v, "a"))) .. "\n\nConstants:\n";
					
					for i, v in getconstants(v) do
						dump ..= "\t" .. tostring(i) .. " - " .. valuetostring(v) .. " (of type: " .. typeof(v) .. ")\n"
					end
					
					dump ..= "\nUpvals:\n"
					
					for i, v in getupvalues(v) do
						dump ..= "\t" .. tostring(i) .. " - " .. valuetostring(v) .. " (of type: " .. typeof(v) .. ")\n"
					end
				end
			end
			
			writefile(filepath, dump)
			setnotif("Dump GC", "Dumped GC at " .. filepath)
		end)
		
		local _hookmetamethod = clonefunction(hookmetamethod)
		
		local disablenamecallhooks = buttons.DisableNamecallHooks
		local disableindexhooks = buttons.DisableIndexHooks
		local disablenewindexhooks = buttons.DisableNewIndexHooks
		
		local list; list = setmetatable({
			__namecall = not namecallEnabled,
			__index = not indexEnabled,
			__newindex = not newindexEnabled
		}, {__newindex = function(a,b,c)
			if c == true then
				hookfunction(getgenv().hookmetamethod, newcclosure(function(mt, method, deter)
					if list[method] then
						return mt[method]
					end
					return _hookmetamethod(mt, method, deter)
				end, "hookmetamethod"))
			else
				local anydisabled = false
				for i, v in pairs(list) do
					if v == true then
						anydisabled = true
					end
				end
				
				if not anydisabled then
					hookfunction(getgenv().hookmetamethod, _hookmetamethod)
				end
			end
		end})
		
		local function metamethodHandler(metamethod, boolean)
			list[metamethod] = boolean
		end
		
		disablenamecallhooks.MouseButton1Click:Connect(function()
			if not hookmetamethod then setnotif("Error", "Your executor does not have method 'hookmetamethod'") return end
			local new = ": OFF"
			if not list.__namecall then
				new = ": ON"
			end
			
			disablenamecallhooks.Text = "disable namecall hooks" .. new
			metamethodHandler("__namecall", not list.__namecall)
		end)
		disableindexhooks.MouseButton1Click:Connect(function()
			if not hookmetamethod then setnotif("Error", "Your executor does not have method 'hookmetamethod'") return end
			local new = ": OFF"
			if not list.__index then
				new = ": ON"
			end
			
			disableindexhooks.Text = "disable index hooks" .. new
			metamethodHandler("__index", not list.__index)
		end)
		disablenewindexhooks.MouseButton1Click:Connect(function()
			if not hookmetamethod then setnotif("Error", "Your executor does not have method 'hookmetamethod'") return end
			local new = ": OFF"
			if not list.__newindex then
				new = ": ON"
			end
			
			disablenewindexhooks.Text = "disable newindex hooks" .. new
			metamethodHandler("__newindex", not list.__newindex)
		end)
		
		local deterredprintyields = buttons.DeterredPrintYields
		deterredprintyields.MouseButton1Click:Connect(function()
			printfunctionsyield = not printfunctionsyield
			local new = ": OFF"
			if printfunctionsyield then
				new = ": ON"
			end
			
			deterredprintyields.Text = "deterred print yields" .. new
		end)
		
		local disablecodesaving = buttons.DisableCodeSaving
		disablecodesaving.MouseButton1Click:Connect(function()
			codeSavingEnabled = not codeSavingEnabled
			local new = ": OFF"
			if not codeSavingEnabled then -- remember that it's disablecodesaving and if it's on then code saving is off
				new = ": ON"
			end
			
			disablecodesaving.Text = "disable code saving" .. new
		end)
		
		local savechanges = buttons.SaveEuropatechChanges
		savechanges.MouseButton1Click:Connect(function()
			if not (readfile and writefile) then return setnotif("Error", "Your executor does not support file functions") end
			
			setnotif("Error", "This button is not functional yet!")
		end)
		
		local savecode = buttons.SaveCode
		savecode.MouseButton1Click:Connect(function()
			if not (readfile and writefile) then return setnotif("Error", "Your executor does not support file functions") end
			
			setnotif("Error", "This button is not functional yet!")
		end)
		
		local loadcode = buttons.LoadCode
		loadcode.MouseButton1Click:Connect(function()
			if not (readfile and writefile) then return setnotif("Error", "Your executor does not support file functions") end
			
			setnotif("Error", "This button is not functional yet!")
		end)
	end)()
	
	coroutine.wrap(function() -- hook gui
		local _hook = bottom.Hooks
		local holder = bypasses.Holder
		if not holder:FindFirstChildWhichIsA("UIListLayout") then
			local UIListLayout = Instance.new("UIListLayout", holder)
			UIListLayout.FillDirection = Enum.FillDirection.Vertical
			UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Top
		end
		holder.AutomaticCanvasSize = Enum.AutomaticSize.Y
		holder.ScrollBarImageColor3 = Color3.new(0,0,0)
	
		coroutine.resume(coroutine.create(function() -- drag
			local frame = bypasses
			local dragToggle = nil
			local dragStart = nil
			local startPos = nil
	
			local function updateInput(input)
				local delta = input.Position - dragStart
				local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
					startPos.Y.Scale, startPos.Y.Offset + delta.Y)
				frame.Position = position
			end
	
			frame.InputBegan:Connect(function(input)
				if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then 
					dragToggle = true
					dragStart = input.Position
					startPos = frame.Position
					input.Changed:Connect(function()
						if input.UserInputState == Enum.UserInputState.End then
							dragToggle = false
						end
					end)
				end
			end)
	
			UserInputService.InputChanged:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
					if dragToggle then
						updateInput(input)
					end
				end
			end)
		end))
	
		local tbl = {
			gcinfo = holder.gcinfo,
			GetTotalMemoryUsageMb = holder.GetTotalMemoryUsageMb,
			GetMemoryUsageMbForTag = holder.GetMemoryUsageMbForTag,
			PreloadAsync = holder.PreloadAsync,
			InstanceCount = holder.InstanceCount,
			UI2DDrawcallCount = holder.UI2DDrawcallCount,
			UI2DTriangleCount = holder.UI2DTriangleCount,
			GetFocusedTextBox = holder.GetFocusedTextBox,
			GuiObjects = holder.GuiObjects,
			Weaktable = holder.Weaktable,
			AllBypasses = holder.AllBypasses
		}
	
		for i, v in pairs(tbl) do
			v.MouseButton1Click:Connect(function()
				local args;
				if i == "AllBypasses" then
					args = {nil, game:GetService("CoreGui").RobloxGui}
				else
					args = {{[i] = true}, game:GetService("CoreGui").RobloxGui}
				end
	
				local s, e = pcall(loadstring(game:HttpGet("https://raw.githubusercontent.com/FaithfulAC/universal-stuff/refs/heads/main/true-secure-dex-bypasses.lua")),
					unpack(args)
				)
	
				if s then
					setnotif(i, "Bypass Loaded Successfully")
				else
					setnotif("Error", "Error in loading bypass: " .. e)
				end
			end)
		end
	
		_hook.MouseButton1Click:Connect(function()
			bypasses.Visible = not bypasses.Visible
		end)
	end)()
	
	coroutine.wrap(function() -- script hub
		local button = bottom.ScriptHub
		local theholder = scrhub.Holder
		local otherholder = scrhub.Descriptor.Holder
		local run = otherholder.Run
		local name = otherholder:FindFirstChild("Name")
		local desc = otherholder.Desc
		
		theholder.AutomaticCanvasSize = Enum.AutomaticSize.Y
	
		coroutine.resume(coroutine.create(function() -- drag
			local frame = scrhub
			local dragToggle = nil
			local dragStart = nil
			local startPos = nil
	
			local function updateInput(input)
				local delta = input.Position - dragStart
				local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
					startPos.Y.Scale, startPos.Y.Offset + delta.Y)
				frame.Position = position
			end
	
			frame.InputBegan:Connect(function(input)
				if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then 
					dragToggle = true
					dragStart = input.Position
					startPos = frame.Position
					input.Changed:Connect(function()
						if input.UserInputState == Enum.UserInputState.End then
							dragToggle = false
						end
					end)
				end
			end)
	
			UserInputService.InputChanged:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
					if dragToggle then
						updateInput(input)
					end
				end
			end)
		end))
	
		local selected = nil;
	
		button.MouseButton1Click:Connect(function()
			scrhub.Visible = not scrhub.Visible
			if not scrhub.Visible then
				otherholder.Visible = false
				selected = nil
			end
		end)
	
		local options = {
			SSpy = theholder.SSpy,
			CmdX = theholder.CmdX,
			IY = theholder.InfY,
			VV4 = theholder.VV4,
			TSD = theholder.TSDex,
			Dex = theholder.Dex,
			GCView = theholder.GCView,
			AntiKick = theholder.AntiKick
		}
	
		local tbl = {
			["Simple Spy"] = "A seamless, accurate, and secure solution for extracting the arguments of fired remotes.",
			["CMD-X"] = "Command utility with a broad range of commands, more than 600 to be specific.",
			["Infinite Yield"] = "The classic command utility option for executing your favorite commands.",
			["Vape v4"] = "Detections begone! Vape v4 bypasses almost any sort of physics and gui checks you can think of.",
			["True Secure Dex"] = "Captivate the full ability to use Dex with true guaranteed security for your experience.",
			["Dex"] = "No hooks? No problem! This Dex has 0 utilization of any hooks while still maintaining its stance as a force against detection vectors.",
			["Airzy GC Viewer"] = "A viewer that allows you to analyze the garbage collection of any game and edit the internals of in-game scripts as you wish.",
			["Europa Anti-Kick"] = "Tired of client-side anticheats disconnecting you from the game? This will prevent that, and more, from happening!"
		}
	
		local loadtbl = {
			["SSpy"] = "https://raw.githubusercontent.com/78n/SimpleSpy/main/SimpleSpySource.lua",
			["CmdX"] = "https://raw.githubusercontent.com/CMD-X/CMD-X/master/Source",
			["InfY"] = "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source",
			["VV4"] = "https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/NewMainScript.lua",
			["TSDex"] = "https://raw.githubusercontent.com/FaithfulAC/universal-stuff/main/true-secure-dex.lua",
			["Dex"] = "https://raw.githubusercontent.com/FaithfulAC/universal-stuff/main/true-secure-dex.lua",
			["GCView"] = "https://raw.githubusercontent.com/FaithfulAC/universal-stuff/refs/heads/main/Avex29GCViewer.lua",
			["AntiKick"] = "https://raw.githubusercontent.com/FaithfulAC/Megaprojects/refs/heads/main/total_anti_disconnect.lua",
		}
	
		local function setdesc(str)
			if str == nil then
				otherholder.Desc.Text = ""
				otherholder:FindFirstChild("Name").Text = ""
			else
				for i, v in pairs(tbl) do
					if v == str then
						otherholder.Desc.Text = str
						otherholder:FindFirstChild("Name").Text = i
						break
					end
				end
			end
		end
	
		local function connect(ins, desc)
			ins.MouseButton1Click:Connect(function()
				if selected == ins then
					otherholder.Visible = false
					selected = nil
					setdesc(nil)
					return
				end
	
				otherholder.Visible = true
				setdesc(desc)
	
				selected = ins
			end)
		end
	
		connect(options.SSpy, tbl["Simple Spy"])
		connect(options.CmdX, tbl["CMD-X"])
		connect(options.IY, tbl["Infinite Yield"])
		connect(options.VV4, tbl["Vape v4"])
		connect(options.TSD, tbl["True Secure Dex"])
		connect(options.Dex, tbl["Dex"])
		connect(options.GCView, tbl["Airzy GC Viewer"])
		connect(options.AntiKick, tbl["Europa Anti-Kick"])
	
		run.MouseButton1Click:Connect(function()
			if not selected then return end
			local key = loadtbl[selected.Name]
			if not key then return end
	
			if selected.Name ~= "Dex" and selected.Name ~= "TSDex" then
				loadstring(game:HttpGet(key))()
			elseif selected.Name == "Dex" then -- run true secure dex without bypasses
				if run_on_actor then
					setnotif("Dex Notification", "The script you have just loaded has been run under an actor, as your executor supports it")
					
					run_on_actor(Instance.new("Actor"), "local in_actor = true;\n\n" .. game:HttpGet("https://raw.githubusercontent.com/FaithfulAC/universal-stuff/main/true-secure-dex.lua"))
				else
					loadstring(game:HttpGet(key))(false)
				end
			elseif selected.Name == "TSDex" then
				if run_on_actor then
					setnotif("Dex Notification", "The script you have just loaded has been run under an actor, as your executor supports it")
					
					local f = Instance.new("Folder", game:GetService("CoreGui").RobloxGui)
					f.Name = "DexHost"
					loadstring(game:HttpGet("https://raw.githubusercontent.com/FaithfulAC/universal-stuff/main/true-secure-dex-bypasses.lua"))(nil, f, true)
					run_on_actor(Instance.new("Actor"), "local in_actor = true;\n\n" .. game:HttpGet("https://raw.githubusercontent.com/FaithfulAC/universal-stuff/main/true-secure-dex.lua"))
				else
					loadstring(game:HttpGet(key))()
				end
			end
		end)
	end)()
	
	coroutine.wrap(function() -- console
		local console = gui.Console
		local hide = console.Hide
		local logservice = cloneref(game:GetService("LogService"))
	
		scroller = console.Scroller
		scroller.AutomaticCanvasSize = Enum.AutomaticSize.XY
	
		local layout = Instance.new("UIListLayout", scroller)
		layout.SortOrder = Enum.SortOrder.LayoutOrder
	
		local switch = bottom.Console
		switch.MouseButton1Click:Connect(function()
			console.Visible = not console.Visible
		end)
	
		coroutine.resume(coroutine.create(function() -- drag
			local frame = console
			local dragToggle = nil
			local dragStart = nil
			local startPos = nil
	
			local function updateInput(input)
				local delta = input.Position - dragStart
				local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
					startPos.Y.Scale, startPos.Y.Offset + delta.Y)
				frame.Position = position
			end
	
			frame.InputBegan:Connect(function(input)
				if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then 
					dragToggle = true
					dragStart = input.Position
					startPos = frame.Position
					input.Changed:Connect(function()
						if input.UserInputState == Enum.UserInputState.End then
							dragToggle = false
						end
					end)
				end
			end)
	
			UserInputService.InputChanged:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
					if dragToggle then
						updateInput(input)
					end
				end
			end)
		end))
	
		logservice.MessageOut:Connect(MessageOutFunction)
	
		local buttons = console.Buttons
		local modes = buttons.Modes
		local bottom = buttons.BottomConsole
	
		local function changething(btn, bool)
			if bool == false then -- because if it isnt excluded
				btn.Text = btn.Name:gsub("^%u", string.lower) .. ": on"
			else
				btn.Text = btn.Name:gsub("^%u", string.lower) .. ": off"
			end
		end
	
		local function determinestring(label)
			if label.TextColor == BrickColor.Red() then
				return "[ERROR]: "
			elseif label.TextColor == BrickColor.Yellow() then
				return "[WARNING]: "
			elseif label.TextColor == BrickColor.Blue() then
				return "[INFO]: "
			end
			return ""
		end
	
		modes.Info.MouseButton1Click:Connect(function() infoExcluded = not infoExcluded changething(modes.Info, infoExcluded) end)
		modes.Print.MouseButton1Click:Connect(function() printExcluded = not printExcluded changething(modes.Print, printExcluded) end)
		modes.Warn.MouseButton1Click:Connect(function() warnExcluded = not warnExcluded changething(modes.Warn, warnExcluded) end)
		modes.Error.MouseButton1Click:Connect(function() errorExcluded = not errorExcluded changething(modes.Error, errorExcluded) end)
	
		bottom.Clear.MouseButton1Click:Connect(function()
			for i, v in pairs(scroller:GetChildren()) do
				if v:IsA("TextLabel") and v.Name ~= "_Line_" then v:Destroy() end
			end
			setnotif("Cleared!")
		end)
	
		bottom.Copy.MouseButton1Click:Connect(function()
			if not setclipboard then setnotif("Error", "Your executor does not have method 'setclipboard'") return end
			local str = ""
			for i, v in pairs(scroller:GetChildren()) do
				if v:IsA("TextLabel") and v.Name ~= "_Line_" then str = str .. v.Text .. "\n" end
			end
			setclipboard(str)
			setnotif("setclipboard", "Operation success")
		end)
	
		bottom.Save.MouseButton1Click:Connect(function()
			if not writefile then setnotif("Error", "Your executor does not have method 'writefile'") return end
			local str = "-- [europa_console_log]\n"
			for i, v in pairs(scroller:GetChildren()) do
				if v:IsA("TextLabel") and v.Name ~= "_Line_" then str = str .. (v:GetAttribute("Time") or " - [xx:xx:xx] -- ") .. determinestring(v) .. v.Text .. "\n" end
			end
			writefile("europa/logs/" .. "Log_" .. tostring(game.PlaceId) .. "_" .. randomstr() .. ".txt", str)
		end)
	
		local hidden = false
		hide.MouseButton1Click:Connect(function()
			hidden = not hidden
			if hidden == true then
				hide.Text = "show"
				for i, v in pairs(modes:GetChildren()) do
					if v:IsA("TextButton") then v.Visible = false end
				end
			else
				hide.Text = "hide"
				for i, v in pairs(modes:GetChildren()) do
					if v:IsA("TextButton") then v.Visible = true end
				end
			end
		end)
	end)()
	
	coroutine.wrap(function()
		if not (isfile and delfile and writefile) then return end
		
		local savedCode = ""
		while isalive() and gui.Parent ~= nil and task.wait(1) do pcall(function() savedCode = code.Text end) end
		
		if savedCode ~= "" and codeSavingEnabled then
			if isfile("europa/backup/saved.lua") then
				delfile("europa/backup/saved.lua")
			end
			
			writefile("europa/backup/saved.lua", savedCode)
			setnotif("Code Notification", "Disconnect from game detected; your code has been saved.")
		end
	end)()
end

main()
