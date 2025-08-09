local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Generate math problem
local num1 = math.random(1, 100)
local num2 = math.random(1, 100)
local correctKey = tostring(num1 + num2)
local keyNote = "Solve this to get the key: " .. num1 .. " + " .. num2

local Window = Rayfield:CreateWindow({
    Name = "NunHub",
    LoadingTitle = "NunHub Loading",
    LoadingSubtitle = "by Ysunza",
    Theme = "Default",
    ToggleUIKeybind = "K"
})

-- Create Welcome Tab
local WelcomeTab = Window:CreateTab("Welcome", 4483362458)
local welcomeButton = WelcomeTab:CreateButton({
    Name = "Continue",
    Callback = function()
        -- Clear Welcome tab content (simulate hiding)
        for _, btn in pairs(WelcomeTab:GetButtons()) do
            btn:Destroy()
        end

        -- Open Key System window now (destroy current window and recreate with key)
        Window:Destroy()

        -- Create Window with KeySystem
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

        -- Create Home and Mods tabs after key system
        local HomeTab = KeyWindow:CreateTab("Home", 4483362458)
        local ModsTab = KeyWindow:CreateTab("Mods", 4483362458)

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

        KeyWindow:SelectTab(HomeTab)
    end
})

















