local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Generate random math problem (1-100)
local num1 = math.random(1, 100)
local num2 = math.random(1, 100)
local correctKey = tostring(num1 + num2)
local keyNote = "Solve this to get the key: " .. num1 .. " + " .. num2

print("Generated key problem:", keyNote, "Answer:", correctKey)

-- Step 1: Key System window (blocks until correct key)
local KeyWindow = Rayfield:CreateWindow({
    Name = "NunHub Key System",
    LoadingTitle = "NunHub Loading",
    LoadingSubtitle = "by Ysunza",
    Theme = "Default",
    ToggleUIKeybind = "K",

    KeySystem = true,
    KeySettings = {
        Title = "Math Key System",
        Subtitle = "Answer the math problem to continue",
        Note = keyNote,
        FileName = "MathKeyFile",
        SaveKey = true,
        GrabKeyFromSite = false,
        Key = {correctKey}
    }
})

print("Correct key entered, destroying KeyWindow")
KeyWindow:Destroy()

-- Step 2: Create main window
local MainWindow = Rayfield:CreateWindow({
    Name = "NunHub Main",
    LoadingTitle = "NunHub Loaded",
    LoadingSubtitle = "Welcome back!",
    Theme = "Default",
    ToggleUIKeybind = "K"
})
print("MainWindow created")

-- Create tabs without icon (empty string) to avoid icon issues
local HomeTab = MainWindow:CreateTab("Home", "")
local ModsTab = MainWindow:CreateTab("Mods", "")
print("Tabs created")

-- Create buttons on Home tab
HomeTab:CreateButton({
    Name = "Discord Link",
    Callback = function()
        print("Discord button clicked")
        setclipboard("https://discord.gg/YourInviteHere")
        Rayfield:Notify({
            Title = "Copied!",
            Content = "Discord invite copied to clipboard.",
            Duration = 3
        })
    end
})

HomeTab:CreateButton({
    Name = "YouTube Link",
    Callback = function()
        print("YouTube button clicked")
        setclipboard("https://youtube.com/YourChannelHere")
        Rayfield:Notify({
            Title = "Copied!",
            Content = "YouTube channel link copied to clipboard.",
            Duration = 3
        })
    end
})

-- Create buttons on Mods tab
ModsTab:CreateButton({
    Name = "Infinite Money",
    Callback = function()
        print("Infinite Money button clicked")
        Rayfield:Notify({
            Title = "Notice",
            Content = "Try Again",
            Duration = 3
        })
        task.delay(3, function()
            loadstring(game:HttpGet("https://pastefy.app/Ym83DFAi/raw"))()
        end
    end
})

ModsTab:CreateButton({
    Name = "Load Spawner",
    Callback = function()
        print("Load Spawner button clicked")
        local Spawner = loadstring(game:HttpGet("https://gitlab.com/darkiedarkie/dark/-/raw/main/Spawner.lua"))()
        if Spawner then
            Spawner.Load()
            Rayfield:Notify({
                Title = "Spawner",
                Content = "Spawner module loaded.",
                Duration = 3
            })
        else
            Rayfield:Notify({
                Title = "Error",
                Content = "Failed to load Spawner module.",
                Duration = 3
            })
        end
    end
})

-- Select Home tab to show it first
MainWindow:SelectTab(HomeTab)
print("Home tab selected")

-- Make sure the UI is toggled on
MainWindow:Toggle(true)
print("Main window toggled visible")




















