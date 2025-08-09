local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "NunHub",
    LoadingTitle = "NunHub Loading",
    LoadingSubtitle = "by Ysunza",
    Theme = "Default",
    ToggleUIKeybind = "K"
})

-- Declare Spawner variable outside so you can access it later if needed
local Spawner

-- HOME TAB
local HomeTab = Window:CreateTab("Home", 4483362458) -- The number is an icon asset ID

HomeTab:CreateButton({
    Name = "Join Discord",
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
    Name = "Infinite Money",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/Ym83DFAi/raw"))()
    end
})

-- NEW BUTTON TO LOAD SPAWNER MODULE
HomeTab:CreateButton({
    Name = "Load Spawner Module",
    Callback = function()
        Spawner = loadstring(game:HttpGet("https://gitlab.com/darkiedarkie/dark/-/raw/main/Spawner.lua"))()
        if Spawner then
            Spawner.Load() -- Load the default UI from Spawner
            Rayfield:Notify({
                Title = "Spawner",
                Content = "Spawner module loaded and UI displayed.",
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

-- SETTINGS TAB
local SettingsTab = Window:CreateTab("Settings", 4483362458)

SettingsTab:CreateDropdown({
    Name = "Select Theme",
    Options = {"Default", "Light", "Dark", "Ocean", "Mocha"},
    CurrentOption = "Default",
    Callback = function(selectedTheme)
        Window:SetTheme(selectedTheme)
    end
})

