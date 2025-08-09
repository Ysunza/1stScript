local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "NunHub",
    LoadingTitle = "NunHub Loading",
    LoadingSubtitle = "by Ysunza",
    Theme = "Default",
    ToggleUIKeybind = "K"
})

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
