local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Generate math problem for key system
local num1 = math.random(1, 100)
local num2 = math.random(1, 100)
local correctKey = tostring(num1 + num2)
local keyNote = "Solve this math problem to get the key: " .. num1 .. " + " .. num2

-- Step 1: Create key system window
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

-- Step 2: After passing key system, destroy key window and show Welcome window
KeyWindow:SetCallback(function(success)
    if success then
        KeyWindow:Destroy()

        -- Welcome window
        local WelcomeWindow = Rayfield:CreateWindow({
            Name = "NunHub Welcome",
            LoadingTitle = "Welcome!",
            LoadingSubtitle = "Press Continue to start",
            Theme = "Default",
            ToggleUIKeybind = "K"
        })

        WelcomeWindow:CreateButton({
            Name = "Continue",
            Callback = function()
                WelcomeWindow:Destroy()

                -- Step 3: Show main UI window
                local MainWindow = Rayfield:CreateWindow({
                    Name = "NunHub",
                    LoadingTitle = "NunHub Loaded",
                    LoadingSubtitle = "Welcome back!",
                    Theme = "Default",
                    ToggleUIKeybind = "K"
                })

                local HomeTab = MainWindow:CreateTab("Home", 4483362458)
                local ModsTab = MainWindow:CreateTab("Mods", 4483362458)

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

                ModsTab:CreateButton({
                    Name = "Infinite Money",
                    Callback = function()
                        loadstring(game:HttpGet("https://pastefy.app/Ym83DFAi/raw"))()
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
            end
        })
    else
        -- Optionally handle failed key attempts here
        Rayfield:Notify({
            Title = "Key Failed",
            Content = "Incorrect key entered. Please try again.",
            Duration = 3
        })
    end
end)


















