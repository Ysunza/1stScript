local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
if not Rayfield then
    warn("Failed to load Rayfield")
    return
end

local fixedKey = "12345"
local keyNote = "Enter the key: " .. fixedKey

print("Key system prompt:", keyNote)

local MainWindow = Rayfield:CreateWindow({
    Name = "NunHub",
    LoadingTitle = "NunHub Loading",
    LoadingSubtitle = "by Ysunza",
    Theme = "Default",
    ToggleUIKeybind = "K",
    KeySystem = true,
    KeySettings = {
        Title = "Fixed Key System",
        Subtitle = "Enter the key to continue",
        Note = keyNote,
        FileName = "FixedKeyFile",
        SaveKey = true,
        GrabKeyFromSite = false,
        Key = {fixedKey}
    }
})

MainWindow:Toggle(true) -- Show the key input UI

MainWindow:OnKeySystemSuccess(function()
    print("Correct key entered, creating tabs")

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

    MainWindow:Toggle(true) -- Ensure window stays visible
end)