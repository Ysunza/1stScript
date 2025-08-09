local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "NunHub",
    LoadingTitle = "NunHub Loading",
    LoadingSubtitle = "by Ysunza",
    Theme = "Default",
    ToggleUIKeybind = "K"
})

local Spawner

local HomeTab = Window:CreateTab("Home", 4483362458)

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
            Spawner.Load() -- This shows the Spawner UI
            
            -- Wait a little for the UI to load
            wait(1)
            
            -- Attempt to find and remove Spawner's UI to "go back" to NunHub UI
            local player = game.Players.LocalPlayer
            local playerGui = player:WaitForChild("PlayerGui")
            
            -- Assuming Spawner UI is a ScreenGui named "SpawnerUI" (replace with actual name if different)
            local spawnerGui = playerGui:FindFirstChild("SpawnerUI")
            if spawnerGui then
                spawnerGui:Destroy()
            end
            
            Rayfield:Notify({
                Title = "Spawner",
                Content = "Spawner loaded briefly, now returning to NunHub.",
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

local SettingsTab = Window:CreateTab("Settings", 4483362458)

SettingsTab:CreateDropdown({
    Name = "Select Theme",
    Options = {"Default", "Light", "Dark", "Ocean", "Mocha"},
    CurrentOption = "Default",
    Callback = function(selectedTheme)
        Window:SetTheme(selectedTheme)
    end
})


