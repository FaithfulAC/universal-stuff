-- multi purpose internal coregui executor for the purpose of bypassing a few stuff and bringing more conveniency in exploiting and whatever
-- if you know about that stupid 0.00045 check designed to detect uwp executors on execution then this in auto execute bypasses that
-- self note: CHECK WHAT THE GUI IS BEING PARENTED TO

for i = 1, math.random(2, 5) do
	Instance.new("Script"):Destroy()
end

-- hey again, i expanded the console's size and also fixed the indenting, quote unquote

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
local Buttons_3 = Instance.new("Folder")
local SaveIns = Instance.new("TextButton")
local ViewScripts = Instance.new("TextButton")
local ViewGCFunctions = Instance.new("TextButton")
local ViewGCTables = Instance.new("TextButton")
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
local Descriptor = Instance.new("Folder")
local Holder_3 = Instance.new("Frame")
local Run = Instance.new("TextButton")
local Desc = Instance.new("TextLabel")
local Name_6 = Instance.new("TextLabel")

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
Code.TextScaled = true
Code.TextSize = 14.000
Code.TextWrapped = true
Code.TextXAlignment = Enum.TextXAlignment.Left

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
_Line_.Font = Enum.Font.Unknown
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
Warn.Position = UDim2.new(-0.212313041, 0, 0.443687171, 0)
Warn.Size = UDim2.new(0.211999997, 0, 0.143999994, 0)
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
Print_2.Position = UDim2.new(-0.212313041, 0, 0.299456388, 0)
Print_2.Size = UDim2.new(0.211999997, 0, 0.143999994, 0)
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
Error.Position = UDim2.new(-0.212313041, 0, 0.582164586, 0)
Error.Size = UDim2.new(0.211999997, 0, 0.143999994, 0)
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
Info.Position = UDim2.new(-0.212313041, 0, 0.155225605, 0)
Info.Size = UDim2.new(0.211999997, 0, 0.143999994, 0)
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
Options_2.Position = UDim2.new(0.801245809, 0, 0.598557711, 0)
Options_2.Size = UDim2.new(0.198754206, 0, 0.400000066, 0)
Options_2.Visible = false

Name_3.Name = "Name"
Name_3.Parent = Options_2
Name_3.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Name_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
Name_3.BorderSizePixel = 0
Name_3.Position = UDim2.new(0, 0, 9.19554068e-08, 0)
Name_3.Size = UDim2.new(1, 0, 0.172697663, 0)
Name_3.Font = Enum.Font.JosefinSans
Name_3.Text = "europtions"
Name_3.TextColor3 = Color3.fromRGB(255, 255, 255)
Name_3.TextScaled = true
Name_3.TextSize = 14.000
Name_3.TextWrapped = true

Buttons_3.Name = "Buttons"
Buttons_3.Parent = Options_2

SaveIns.Name = "SaveIns"
SaveIns.Parent = Buttons_3
SaveIns.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
SaveIns.BackgroundTransparency = 0.500
SaveIns.BorderColor3 = Color3.fromRGB(0, 0, 0)
SaveIns.BorderSizePixel = 0
SaveIns.Position = UDim2.new(0.00195826101, 0, 0.172697917, 0)
SaveIns.Size = UDim2.new(0.998042047, 0, 0.139127493, 0)
SaveIns.Font = Enum.Font.Unknown
SaveIns.Text = "saveinstance"
SaveIns.TextColor3 = Color3.fromRGB(255, 255, 255)
SaveIns.TextScaled = true
SaveIns.TextSize = 14.000
SaveIns.TextWrapped = true

ViewScripts.Name = "ViewScripts"
ViewScripts.Parent = Buttons_3
ViewScripts.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
ViewScripts.BackgroundTransparency = 0.500
ViewScripts.BorderColor3 = Color3.fromRGB(0, 0, 0)
ViewScripts.BorderSizePixel = 0
ViewScripts.Position = UDim2.new(0.00195826101, 0, 0.310473442, 0)
ViewScripts.Size = UDim2.new(0.998042047, 0, 0.139127493, 0)
ViewScripts.Font = Enum.Font.Unknown
ViewScripts.Text = "view scripts"
ViewScripts.TextColor3 = Color3.fromRGB(255, 255, 255)
ViewScripts.TextScaled = true
ViewScripts.TextSize = 14.000
ViewScripts.TextWrapped = true

ViewGCFunctions.Name = "ViewGCFunctions"
ViewGCFunctions.Parent = Buttons_3
ViewGCFunctions.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
ViewGCFunctions.BackgroundTransparency = 0.500
ViewGCFunctions.BorderColor3 = Color3.fromRGB(0, 0, 0)
ViewGCFunctions.BorderSizePixel = 0
ViewGCFunctions.Position = UDim2.new(0, 0, 0.44600001, 0)
ViewGCFunctions.Size = UDim2.new(1, 0, 0.138999999, 0)
ViewGCFunctions.Font = Enum.Font.Unknown
ViewGCFunctions.Text = "view gc functions (NOT YET)"
ViewGCFunctions.TextColor3 = Color3.fromRGB(255, 255, 255)
ViewGCFunctions.TextScaled = true
ViewGCFunctions.TextSize = 14.000
ViewGCFunctions.TextWrapped = true

ViewGCTables.Name = "ViewGCTables"
ViewGCTables.Parent = Buttons_3
ViewGCTables.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
ViewGCTables.BackgroundTransparency = 0.500
ViewGCTables.BorderColor3 = Color3.fromRGB(0, 0, 0)
ViewGCTables.BorderSizePixel = 0
ViewGCTables.Position = UDim2.new(0, 0, 0.581613123, 0)
ViewGCTables.Size = UDim2.new(1, 0, 0.138999999, 0)
ViewGCTables.Font = Enum.Font.Unknown
ViewGCTables.Text = "view gc tables (NOT YET)"
ViewGCTables.TextColor3 = Color3.fromRGB(255, 255, 255)
ViewGCTables.TextScaled = true
ViewGCTables.TextSize = 14.000
ViewGCTables.TextWrapped = true

DuoViewer.Name = "DuoViewer"
DuoViewer.Parent = Exec
DuoViewer.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
DuoViewer.BackgroundTransparency = 0.300
DuoViewer.BorderColor3 = Color3.fromRGB(0, 0, 0)
DuoViewer.BorderSizePixel = 0
DuoViewer.Position = UDim2.new(0.578148723, 0, 0.598557711, 0)
DuoViewer.Size = UDim2.new(0.222853288, 0, 0.400000125, 0)
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
CopySource.Text = "CopySource"
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
Name_5.Position = UDim2.new(0, 0, 9.19554068e-08, 0)
Name_5.Size = UDim2.new(1, 0, 0.172697663, 0)
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
Holder_2.Size = UDim2.new(0.999000013, 0, 0.824999988, 0)
Holder_2.CanvasSize = UDim2.new(0, 0, 0, 0)

InfY.Name = "InfY"
InfY.Parent = Holder_2
InfY.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
InfY.BackgroundTransparency = 0.500
InfY.BorderColor3 = Color3.fromRGB(0, 0, 0)
InfY.BorderSizePixel = 0
InfY.Position = UDim2.new(-5.5704362e-08, 0, -0.00601119967, 0)
InfY.Size = UDim2.new(1.00000012, 0, 0.124679103, 0)
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
TSDex.Position = UDim2.new(-5.5704362e-08, 0, 0.115716428, 0)
TSDex.Size = UDim2.new(1.00000012, 0, 0.124679103, 0)
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
Dex.Position = UDim2.new(-5.5704362e-08, 0, 0.237444058, 0)
Dex.Size = UDim2.new(1.00000012, 0, 0.124679103, 0)
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
CmdX.Position = UDim2.new(-5.5704362e-08, 0, 0.359171689, 0)
CmdX.Size = UDim2.new(1.00000012, 0, 0.124679103, 0)
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
SSpy.Position = UDim2.new(-5.5704362e-08, 0, 0.480899304, 0)
SSpy.Size = UDim2.new(1.00000012, 0, 0.124679103, 0)
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
VV4.Position = UDim2.new(-5.5704362e-08, 0, 0.60262692, 0)
VV4.Size = UDim2.new(1.00000012, 0, 0.124679103, 0)
VV4.Font = Enum.Font.Unknown
VV4.Text = "Vape v4"
VV4.TextColor3 = Color3.fromRGB(255, 255, 255)
VV4.TextScaled = true
VV4.TextSize = 14.000
VV4.TextWrapped = true

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

-- Scripts:

local function main() -- Script.MainScript 
	local script = Instance.new('LocalScript', Script)

	-- dont mind the fake script im too lazy to remove it
	
	local getgenv = getgenv or getfenv
	local hookfunction = hookfunction or (getrenv and function(a,b)
		for i, v in next, getrenv() do
			if v == a then
				rawset(getrenv(), i, b)
				break
			end
		end
	end) or nil
	local getnilinstances = getnilinstances or nil -- lol
	local getrawmetatable = getrawmetatable or nil
	local setrawmetatable = setrawmetatable or nil
	local setreadonly = setreadonly or nil
	local cloneref = cloneref or function(a)
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
	local decompile = decompile or disassemble or nil
	local getscripts = getscripts or nil
	local europa = europa or nil
	local Players = cloneref(game:GetService("Players"))
	local LocalPlayer = cloneref(Players.LocalPlayer)
	local sgui = cloneref(game:GetService("StarterGui"))

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
	
	local pcallOn = false
	local printEnabled = true
	
	local function setnotif(title, info)
		for i = 1, math.random(1, 3) do -- prevent gui memory checks
			Instance.new("Frame")
		end
		
		sgui:SetCore("SendNotification", {
			Title = title,
			Text = info
		})
	end
	
	local function loadeuropaglobals()
		task.wait()
		if getgenv().europa then return end
		loadstring(game:HttpGet("https://raw.githubusercontent.com/FaithfulAC/Megaprojects/main/europa_library_wip.lua"))()
		getgenv().europa.gui = Exec
		setnotif("Library", "Europa Library Loaded")
	end
	
	local tempe = select(2, pcall(loadeuropaglobals))
	if tempe and not tempe:find("HttpGet") and not tempe:find("CoreScripts") then
		error("An error occured while loading europatech: " .. ((string.split(tempe, ":")[3]) or tempe), 0)
		return
	end
	
	local warnExcluded, infoExcluded, errorExcluded, printExcluded, scroller = false,false,false,false,nil;
	
	local function MessageOutFunction(str, type)
		local offset = 0
		local bolden = false
		local color = BrickColor.White()
		if str:len() > 26 then
			offset += (1/25)*(str:len()-26)
		end
	
		if type == Enum.MessageType.MessageWarning then -- funny statement
	
			if warnExcluded then return end
			color = BrickColor.Yellow()
			bolden = true
	
		elseif type == Enum.MessageType.MessageInfo then
	
			if infoExcluded then return end
			color = BrickColor.Blue()
	
		elseif type == Enum.MessageType.MessageError then
	
			if errorExcluded then return end
			color = BrickColor.Red()
			bolden = true
	
			if str:find("\n") then
				str = string.split(str, "\n")[1]
			end
	
		elseif printExcluded then return end
	
		local newline = scroller._Line_:Clone()
		newline.Parent = scroller
		newline.Name = "Line"
		newline.BackgroundTransparency = 1
		newline.TextXAlignment = Enum.TextXAlignment.Left
		newline.Size = UDim2.new(1+offset, 0, 0.075, 0)
		newline.TextColor = color
		newline.Text = "  --  " .. str
		if bolden == true then
			newline.FontFace.Weight = Enum.FontWeight.Bold
		end
	end
	
	local function cleareuropaglobals()
		if getgenv().europa == nil then return end
		for i, v in getgenv() do
			if table.find(getgenv().europa, v) then
				v = nil
			end
		end
		getgenv().europa = nil
	end
	
	local function randomstr()
		local str = ""
		for i = 1, math.random(3,7) do
			str = str .. math.random(32,126)
		end
		return str
	end
	
	coroutine.wrap(function() -- handles stuff
		local exit = f_buttons.Exit
		local mini = f_buttons.Minimize
		exit.MouseButton1Click:Connect(function()
			gui:Destroy()
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
		codeholder.Scroller.AutomaticCanvasSize = Enum.AutomaticSize.XY
		code.MultiLine = true
		
		code:GetPropertyChangedSignal("Text"):Connect(function()
			local txt = code.Text
			
			txt:gsub("\n", function(a)
				numoflines += 1
			end)
			local maxofoneline = 0
			
			if txt:find("\n") then -- increases horizontial length of code
				for i, v in pairs(string.split(txt, "\n")) do
					if #v > 22 and (0.05*(#v-22)) > maxofoneline then
						maxofoneline = (0.05*(#v-22))
					end
				end
			else
				if #txt > 22 and (0.05*(#txt-22)) > maxofoneline then
					maxofoneline = (0.05*(#txt-22))
				end
			end
			
			code.Size = UDim2.new(0.9+maxofoneline, 0, 0.15*numoflines, 0)
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
	
	coroutine.wrap(function() -- drag
		local UIS = game:GetService('UserInputService')
		local frame = main
		local dragToggle = nil
		local dragStart = nil
		local startPos = nil
	
		local function updateInput(input)
			local delta = input.Position - dragStart
			local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
				startPos.Y.Scale, startPos.Y.Offset + delta.Y)
			game:GetService('TweenService'):Create(frame, TweenInfo.new(0.01), {Position = position}):Play()
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
	
		UIS.InputChanged:Connect(function(input)
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
				setnotif("Error", "Your executor does not support Method 'loadstring'")
				return
			end
			
			local thing = loadstring(code.Text)
			
			if type(thing) ~= "function" then
				setnotif("Syntax Error", "Check your code for any issues and try again")
				return
			end
			
			if pcallOn then			
				local _, e = pcall(function() return thing() end)
				if e then setnotif("Error In Execution", e) end
			else
				return coroutine.wrap(thing)()
			end
		end)
		
		_pcall.MouseButton1Click:Connect(function()
			pcallOn = not pcallOn
			if pcallOn then
				_pcall.Text = "pcall: on"
			else
				_pcall.Text = "pcall: off"
			end
		end)
		_print.MouseButton1Click:Connect(function()
			printEnabled = not printEnabled
			if printEnabled then
				getgenv().print = function(...)
					local args = {...}
					for i, v in pairs(args) do
						args[i] = tostring(v)
					end
					
					local final = table.concat(args, " ")
					
					MessageOutFunction(final, Enum.MessageType.MessageOutput)
				end
				getgenv().warn = function(...)
					local args = {...}
					for i, v in pairs(args) do
						args[i] = tostring(v)
					end
	
					local final = table.concat(args, " ")
					
					MessageOutFunction(final, Enum.MessageType.MessageWarning)
				end
				getgenv().error = function(...)
					local args = {...}
					for i, v in pairs(args) do
						args[i] = tostring(v)
					end
	
					local final = table.concat(args, " ")
					
					MessageOutFunction(final, Enum.MessageType.MessageError)
					return coroutine.yield()
				end
				
				_print.Text = "deterred print: on"
			else
				getgenv().print, getgenv().warn, getgenv().error = defPrint, defWarn, defError
				_print.Text = "deterred print: off"
			end
		end)
		
		getgenv().print = function(...)
			local args = {...}
			for i, v in pairs(args) do
				args[i] = tostring(v)
			end
	
			local final = table.concat(args, " ")
	
			MessageOutFunction(final, Enum.MessageType.MessageOutput)
		end
		getgenv().warn = function(...)
			local args = {...}
			for i, v in pairs(args) do
				args[i] = tostring(v)
			end
	
			local final = table.concat(args, " ")
	
			MessageOutFunction(final, Enum.MessageType.MessageWarning)
		end
		getgenv().error = function(...)
			local args = {...}
			for i, v in pairs(args) do
				args[i] = tostring(v)
			end
	
			local final = table.concat(args, " ")
	
			MessageOutFunction(final, Enum.MessageType.MessageError)
			return coroutine.yield()
		end
		
		clear.MouseButton1Click:Connect(function()
			code.Text = ""
		end)
		copy.MouseButton1Click:Connect(function()
			if not setclipboard then setnotif("Error", "Your executor does not have method 'setclipboard'") return end
			setclipboard(code.Text)
			setnotif("setclipboard", "Operation Successful")
		end)
	end)()
	
	coroutine.wrap(function() -- options and duoviewer
		coroutine.resume(coroutine.create(function() -- drag
			local UIS = game:GetService('UserInputService')
			local frame = options
			local dragToggle = nil
			local dragSpeed = 0.01
			local dragStart = nil
			local startPos = nil
	
			local function updateInput(input)
				local delta = input.Position - dragStart
				local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
					startPos.Y.Scale, startPos.Y.Offset + delta.Y)
				game:GetService('TweenService'):Create(frame, TweenInfo.new(dragSpeed), {Position = position}):Play()
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
	
			UIS.InputChanged:Connect(function(input)
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
		coroutine.resume(coroutine.create(function() -- drag
			local UIS = game:GetService('UserInputService')
			local frame = duoviewer
			local dragToggle = nil
			local dragSpeed = 0.01
			local dragStart = nil
			local startPos = nil
	
			local function updateInput(input)
				local delta = input.Position - dragStart
				local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
					startPos.Y.Scale, startPos.Y.Offset + delta.Y)
				game:GetService('TweenService'):Create(frame, TweenInfo.new(dragSpeed), {Position = position}):Play()
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
	
			UIS.InputChanged:Connect(function(input)
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
			if objval1.Value then
				objval1.Value.Disabled = true
				loadviewer()
				setnotif("Disable", "Operation Successful")
			end
		end)
		optionsStorage.OptionsS.Enable.MouseButton1Click:Connect(function()
			if objval1.Value then
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
			if scr == nil then optionsStorage.OptionsS.Visible = false objval1.Value = nil return end
			objval1.Value = scr
			optionsStorage.OptionsS.Visible = true
		end
		
		loadviewer = function()
			if not getscripts then warn("Viewer cannot be loaded because im too lazy to not use my globals") return end
			
			for i, v in pairs(duoholder:GetChildren()) do
				if v:IsA("TextLabel") then
					v:Destroy()
				end
			end
			
			for i, v in getscripts() do
				if typeof(v) ~= "Instance" then continue end -- for the retarded exploits
				if getgenv().BlacklistCoreGui and v:FindFirstAncestorOfClass("CoreGui") then continue end
				
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
		
		local mouse = (LocalPlayer and LocalPlayer:GetMouse()) or (function()
			repeat task.wait() until game:GetService("Players").LocalPlayer
			LocalPlayer = game:GetService("Players").LocalPlayer
			return LocalPlayer:GetMouse()
		end)()
		
		mouse.Button1Up:Connect(assign)
		
		optswitch.MouseButton1Click:Connect(function()
			options.Visible = not options.Visible
		end)
		
		local _saveins = buttons.SaveIns
		_saveins.MouseButton1Click:Connect(function()
			if not saveinstance then setnotif("Error", "Your executor does not have method 'saveinstance'") return end
			
			local s, e = pcall(function()
				saveinstance()
			end)
			
			if e then
				setnotif("Error in saveinstance", e)
			elseif s then
				setnotif("saveinstance", "Operation Successful")
			end
		end)
		local viewscripts = buttons.ViewScripts
		viewscripts.MouseButton1Click:Connect(function()
			duoviewer.Visible = not duoviewer.Visible
			if duoviewer.Visible then loadviewer() else assign() end -- assign here makes any objvalue nil
		end)
	end)()
	
	coroutine.wrap(function() -- hook gui
		local _hook = bottom.Hooks
		_hook.MouseButton1Click:Connect(function()
			setnotif("HookInfo", "Note that you must have globals enabled for these to work")
			task.wait(4)
			setnotif("hookgcinfo", "Hooks gcinfo and collectgarbage('count')")
			task.wait(3)
			setnotif("hookggoap", "Hooks GetGuiObjectsAtPosition to always return 1")
			task.wait(3)
			setnotif("hookggoap2", "Hooks MenuIsOpen to always return true")
			task.wait(3)
			setnotif("hookgs", "Hooks GetService, option to add an instance to return instead")
			task.wait(3)
			setnotif("antikick", "Client anti-kick, hookfunctions and hookmetamethods the namecall")
			task.wait(3)
			setnotif("hookmem", "Hooks the memory")
			task.wait(3)
			setnotif("hookinscount", "Hooks Instance Count")
			task.wait(3)
			setnotif("hookfs", "Hooks the FireServer function of a given remote argument")
			task.wait(3)
			setnotif("hookis", "Hooks the InvokeServer function of a given remote argument")
			task.wait(3)
			setnotif("Finished", "Enjoy using these!")
		end)
	end)()
	
	coroutine.wrap(function() -- script hub
		local button = bottom.ScriptHub
		local theholder = scrhub.Holder
		local otherholder = scrhub.Descriptor.Holder
		local run = otherholder.Run
		local name = otherholder:FindFirstChild("Name")
		local desc = otherholder.Desc
		
		coroutine.resume(coroutine.create(function() -- drag
			local UIS = game:GetService('UserInputService')
			local frame = scrhub
			local dragToggle = nil
			local dragSpeed = 0.01
			local dragStart = nil
			local startPos = nil
	
			local function updateInput(input)
				local delta = input.Position - dragStart
				local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
					startPos.Y.Scale, startPos.Y.Offset + delta.Y)
				game:GetService('TweenService'):Create(frame, TweenInfo.new(dragSpeed), {Position = position}):Play()
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
	
			UIS.InputChanged:Connect(function(input)
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
			Dex = theholder.Dex
		}
		
		local tbl = {
			["Simple Spy"] = "A seamless, accurate, and secure solution for extracting the arguments of fired remotes.",
			["CMD-X"] = "Command utility with a broad range of commands, more than 600 to be specific.",
			["Infinite Yield"] = "The classic command utility option for executing your favorite commands.",
			["Vape v4"] = "Detections begone! Vape v4 bypasses almost any sort of physics and gui checks you can think of.",
			["True Secure Dex"] = "Captivate the full ability to use Dex with true guaranteed security for your experience.",
			["Dex"] = "No hooks? No problem! This Dex has 0 utilization of any hooks while still maintaining its stance as a force against detection vectors."
		}
		
		local loadtbl = {
			["SSpy"] = "https://raw.githubusercontent.com/78n/SimpleSpy/main/SimpleSpySource.lua",
			["CmdX"] = "https://raw.githubusercontent.com/CMD-X/CMD-X/master/Source",
			["InfY"] = "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source",
			["VV4"] = "https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/NewMainScript.lua",
			["TSDex"] = "https://raw.githubusercontent.com/FaithfulAC/universal-stuff/main/true-secure-dex.lua",
			["Dex"] = "https://raw.githubusercontent.com/FaithfulAC/universal-stuff/main/true-secure-dex.lua" -- to be modified
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
		
		run.MouseButton1Click:Connect(function()
			if not selected then return end
			local key = loadtbl[selected.Name]
			if not key then return end
			
			if selected.Name == "Dex" then -- run true secure dex without bypasses
				local renv = getgenv().getrenv
				getgenv().getrenv = nil
				
				loadstring(game:HttpGet(key))()
				getgenv().getrenv = renv
			else
				loadstring(game:HttpGet(key))()
			end
		end)
	end)()
	
	coroutine.wrap(function() -- console
		local console = gui.Console
		local hide = console.Hide
		local logservice = game:GetService("LogService")
		
		scroller = console.Scroller
		scroller.AutomaticCanvasSize = Enum.AutomaticSize.XY
		
		local layout = Instance.new("UIListLayout", scroller)
		layout.SortOrder = Enum.SortOrder.LayoutOrder
		
		local switch = bottom.Console
		switch.MouseButton1Click:Connect(function()
			console.Visible = not console.Visible
		end)
		
		coroutine.resume(coroutine.create(function() -- drag
			local UIS = game:GetService('UserInputService')
			local frame = console
			local dragToggle = nil
			local dragSpeed = 0.01
			local dragStart = nil
			local startPos = nil
	
			local function updateInput(input)
				local delta = input.Position - dragStart
				local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
					startPos.Y.Scale, startPos.Y.Offset + delta.Y)
				game:GetService('TweenService'):Create(frame, TweenInfo.new(dragSpeed), {Position = position}):Play()
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
	
			UIS.InputChanged:Connect(function(input)
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
			local str = ""
			for i, v in pairs(scroller:GetChildren()) do
				if v:IsA("TextLabel") and v.Name ~= "_Line_" then str = str .. v.Text .. "\n" end
			end
			writefile("Log_" .. tostring(game.PlaceId) .. "_" .. randomstr(), str)
		end)
		
		local hidden = false
		hide.MouseButton1Click:Connect(function()
			hidden = not hidden
			if hidden == true then
				hide.Text = "show"
				for i, v in pairs(modes:GetChildren())do
					if v:IsA("TextButton") then v.Visible = false end
				end
			else
				hide.Text = "hide"
				for i, v in pairs(modes:GetChildren())do
					if v:IsA("TextButton") then v.Visible = true end
				end
			end
		end)
	end)()
end
coroutine.wrap(main)()
