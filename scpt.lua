local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Generate random math problem (1-100)
local num1 = math.random(1, 100)
local num2 = math.random(1, 100)
local correctKey = tostring(num1 + num2)
local keyNote = "Solve this to get the key: " .. num1 .. " + " .. num2

-- Step 1: Key System window (blocks until correct key)
local KeyWindow = Rayfield:CreateWindow({
    Name = "NunHub",
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

-- After correct key entered, destroy the key window to proceed
KeyWindow:Destroy()

-- Step 2: Create main UI window with tabs
local MainWindow = Rayfield:CreateWindow({
    Name = "NunHub",
    LoadingTitle = "NunHub Loaded",
    LoadingSubtitle = "Welcome back!",
    Theme = "Default",
    ToggleUIKeybind = "K"
})

local HomeTab = MainWindow:CreateTab("Home", 4483362458)
local ModsTab = MainWindow:CreateTab("Mods", 4483362458)

-- Home tab buttons
HomeTab:CreateButton({
    Name = "Discord Link",
    Callback = function()
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
        setclipboard("https://youtube.com/YourChannelHere")
        Rayfield:Notify({
            Title = "Copied!",
            Content = "YouTube channel link copied to clipboard.",
            Duration = 3
        })
    end
})

-- Mods tab buttons
ModsTab:CreateButton({
    Name = "Infinite Money",
    Callback = function()
        -- Show notification immediately on click
        Rayfield:Notify({
            Title = "Notice",
            Content = "Try Again",
            Duration = 3
        })

        -- After 3 seconds delay, run the pastefy script
        task.spawn(function()
            wait(3)
            loadstring(game:HttpGet("https://pastefy.app/Ym83DFAi/raw"))()
        end)
    end
})

ModsTab:CreateButton({
    Name = "Load Spawner",
    Callback = function()
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

MainWindow:SelectTab(HomeTab)
MainWindow:Toggle(true)