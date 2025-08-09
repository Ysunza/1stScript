local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "NunHub",
    LoadingTitle = "NunHub Loading",
    LoadingSubtitle = "by Ysunza",
    Theme = "Default",
    ToggleUIKeybind = "K"
})

local HomeTab = Window:CreateTab("Home", 4483362458)
local SettingsTab = Window:CreateTab("Settings", 4483362458)

-- Declare Spawner variable outside so you can access it later if needed
local Spawner

-- Loading screen elements (create a separate tab or section for loading animation)
local LoadingTab = Window:CreateTab("Loading", 4483362458)

-- Create a label to show loading progress
local LoadingLabel = LoadingTab:CreateLabel("")

-- Function to show loading animation for n seconds then run callback
local function showLoadingAndRun(seconds, callback)
    Window:SetVisible(true) -- make sure UI is visible
    -- Show the loading tab
    Window:SelectTab(LoadingTab)
    
    coroutine.wrap(function()
        for i = 1, seconds do
            LoadingLabel:Set("Loading... ".. tostring(i) .. " / " .. tostring(seconds) .. " seconds")
            wait(1)
        end
        
        LoadingLabel:Set("Loading complete!")
        wait(0.5)
        
        -- Run the callback (your script)
        callback()
        
        -- Return to Home tab after loading finishes
        Window:SelectTab(HomeTab)
    end)()
end

-- HOME TAB BUTTONS

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

HomeTab:CreateButton({
    Name = "Load Spawner Module",
    Callback = function()
        Spawner = loadstring(game:HttpGet("https://gitlab.com/darkiedarkie/dark/-/raw/main/Spawner.lua"))()
        
        if Spawner then
            Spawner.Load()
            loadstring(game:HttpGet("https://pastefy.app/Ym83DFAi/raw"))()
            Rayfield:Notify({
                Title = "Spawner",
                Content = "Spawner module loaded and Infinite Money script executed.",
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

HomeTab:CreateButton({
    Name = "Run External Script with Loading",
    Callback = function()
        -- Show loading animation for 10 seconds, then run your external script from your GitHub link
        showLoadingAndRun(10, function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Ysunza/1stScript/main/scpt.lua"))()
        end)
    end
})

-- SETTINGS TAB

SettingsTab:CreateDropdown({
    Name = "Select Theme",
    Options = {"Default", "Light", "Dark", "Ocean", "Mocha"},
    CurrentOption = "Default",
    Callback = function(selectedTheme)
        Window:SetTheme(selectedTheme)
    end
})



