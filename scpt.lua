local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "NunHub",
    LoadingTitle = "NunHub Loading",
    LoadingSubtitle = "by Ysunza",
    Theme = "Default",
    ToggleUIKeybind = "K"
})

-- Create StartTab now; do NOT create HomeTab or ModsTab yet
local StartTab = Window:CreateTab("Start", 4483362458)

local homeButtons = {}
local modsButtons = {}

local loadingLabel = StartTab:CreateLabel("")

local loading = false

StartTab:CreateButton({
    Name = "Start",
    Callback = function()
        if loading then return end
        loading = true

        for i = 1, 10 do
            loadingLabel:Set("Loading... " .. i .. " / 10")
            wait(1)
        end

        -- Destroy StartTab to hide it
        StartTab:Destroy()

        -- Create Home and Mods tabs AFTER loading finishes
        local HomeTab = Window:CreateTab("Home", 4483362458)
        table.insert(homeButtons, HomeTab:CreateButton({
            Name = "Discord Link",
            Callback = function()
                setclipboard("https://discord.gg/YourInviteHere")
                Rayfield:Notify({
                    Title = "Copied!",
                    Content = "Discord invite copied to clipboard.",
                    Duration = 3
                })
            end
        }))

        table.insert(homeButtons, HomeTab:CreateButton({
            Name = "YouTube Link",
            Callback = function()
                setclipboard("https://youtube.com/YourChannelHere")
                Rayfield:Notify({
                    Title = "Copied!",
                    Content = "YouTube channel link copied to clipboard.",
                    Duration = 3
                })
            end
        }))

        local ModsTab = Window:CreateTab("Mods", 4483362458)
        table.insert(modsButtons, ModsTab:CreateButton({
            Name = "Infinite Money",
            Callback = function()
                loadstring(game:HttpGet("https://pastefy.app/Ym83DFAi/raw"))()
            end
        }))

        table.insert(modsButtons, ModsTab:CreateButton({
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
        }))

        -- Switch to Home tab now
        Window:SelectTab(HomeTab)
    end
})







