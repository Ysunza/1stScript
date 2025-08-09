local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "NunHub",
    LoadingTitle = "NunHub Loading",
    LoadingSubtitle = "by Ysunza",
    Theme = "Default",
    ToggleUIKeybind = "K"
})

-- Create all tabs upfront
local StartTab = Window:CreateTab("Start", 4483362458)
local HomeTab = Window:CreateTab("Home", 4483362458)
local ModsTab = Window:CreateTab("Mods", 4483362458)

-- Show Start tab initially
Window:SelectTab(StartTab)

local loadingLabel = StartTab:CreateLabel("")

local homeButtons = {}
local modsButtons = {}

local function clearButtons(buttons)
    for _, btn in pairs(buttons) do
        if btn.Destroy then
            btn:Destroy()
        end
    end
    return {}
end

local loading = false

-- Create the Start button on Start tab
StartTab:CreateButton({
    Name = "Start",
    Callback = function()
        if loading then return end
        loading = true

        -- Loading animation 1 to 10 seconds
        for i = 1, 10 do
            loadingLabel:Set("Loading... " .. i .. " / 10")
            wait(1)
        end

        -- Clear old buttons just in case
        homeButtons = clearButtons(homeButtons)
        modsButtons = clearButtons(modsButtons)

        -- Add buttons to Home tab
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

        -- Add buttons to Mods tab
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

        -- Switch to Home tab to show buttons
        Window:SelectTab(HomeTab)
    end
})












