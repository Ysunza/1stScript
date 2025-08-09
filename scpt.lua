local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Generate random math problem (1-100)
local num1 = math.random(1, 100)
local num2 = math.random(1, 100)
local correctKey = tostring(num1 + num2)
local keyNote = "Solve this to get the key: " .. num1 .. " + " .. num2

-- Step 1: Create Key System Window (blocks until correct key)
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

-- After correct key entered, the script continues here:
KeyWindow:Destroy()

-- Step 2: Show Welcome Window
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

        -- Step 3: Show Main UI Window with tabs
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






















