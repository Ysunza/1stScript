-- NunHub UI without Rayfield
-- Made from scratch with Roblox instances

-- Create ScreenGui
local gui = Instance.new("ScreenGui")
gui.Name = "NunHub"
gui.Parent = game.CoreGui

-- Main Frame
local main = Instance.new("Frame")
main.Size = UDim2.new(0, 400, 0, 300)
main.Position = UDim2.new(0.5, -200, 0.5, -150)
main.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
main.BorderSizePixel = 0
main.Parent = gui

-- Title
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 40)
title.BackgroundTransparency = 1
title.Text = "NunHub"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.SourceSansBold
title.TextSize = 24
title.Parent = main

-- Tabs container
local tabs = Instance.new("Frame")
tabs.Size = UDim2.new(1, 0, 0, 30)
tabs.Position = UDim2.new(0, 0, 0, 40)
tabs.BackgroundTransparency = 1
tabs.Parent = main

-- Tab buttons
local function makeTabButton(name, x)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 80, 1, 0)
    btn.Position = UDim2.new(0, x, 0, 0)
    btn.Text = name
    btn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.SourceSansBold
    btn.TextSize = 18
    btn.Parent = tabs
    return btn
end

local homeTabBtn = makeTabButton("Home", 10)
local settingsTabBtn = makeTabButton("Settings", 100)

-- Content Frames
local homeFrame = Instance.new("Frame")
homeFrame.Size = UDim2.new(1, 0, 1, -70)
homeFrame.Position = UDim2.new(0, 0, 0, 70)
homeFrame.BackgroundTransparency = 1
homeFrame.Parent = main

local settingsFrame = Instance.new("Frame")
settingsFrame.Size = UDim2.new(1, 0, 1, -70)
settingsFrame.Position = UDim2.new(0, 0, 0, 70)
settingsFrame.BackgroundTransparency = 1
settingsFrame.Visible = false
settingsFrame.Parent = main

-- Home Tab: Discord Button
local discordBtn = Instance.new("TextButton")
discordBtn.Size = UDim2.new(0, 200, 0, 40)
discordBtn.Position = UDim2.new(0, 100, 0, 20)
discordBtn.Text = "Join Discord"
discordBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 200)
discordBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
discordBtn.Font = Enum.Font.SourceSansBold
discordBtn.TextSize = 18
discordBtn.Parent = homeFrame
discordBtn.MouseButton1Click:Connect(function()
    setclipboard("https://discord.gg/yourinvite") -- Copies link
end)

-- Home Tab: Enable Script Button
local scriptBtn = Instance.new("TextButton")
scriptBtn.Size = UDim2.new(0, 200, 0, 40)
scriptBtn.Position = UDim2.new(0, 100, 0, 80)
scriptBtn.Text = "Enable Script"
scriptBtn.BackgroundColor3 = Color3.fromRGB(80, 200, 80)
scriptBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
scriptBtn.Font = Enum.Font.SourceSansBold
scriptBtn.TextSize = 18
scriptBtn.Parent = homeFrame
scriptBtn.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://pastefy.app/Ym83DFAi/raw"))()
end)

-- Settings Tab: Theme Toggle
local themeBtn = Instance.new("TextButton")
themeBtn.Size = UDim2.new(0, 200, 0, 40)
themeBtn.Position = UDim2.new(0, 100, 0, 20)
themeBtn.Text = "Switch Theme"
themeBtn.BackgroundColor3 = Color3.fromRGB(200, 200, 80)
themeBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
themeBtn.Font = Enum.Font.SourceSansBold
themeBtn.TextSize = 18
themeBtn.Parent = settingsFrame

local darkTheme = true
themeBtn.MouseButton1Click:Connect(function()
    if darkTheme then
        main.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
        title.TextColor3 = Color3.fromRGB(0, 0, 0)
        darkTheme = false
    else
        main.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        title.TextColor3 = Color3.fromRGB(255, 255, 255)
        darkTheme = true
    end
end)

-- Tab Switching
homeTabBtn.MouseButton1Click:Connect(function()
    homeFrame.Visible = true
    settingsFrame.Visible = false
end)
settingsTabBtn.MouseButton1Click:Connect(function()
    homeFrame.Visible = false
    settingsFrame.Visible = true
end)
