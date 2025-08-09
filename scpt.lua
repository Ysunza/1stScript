local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "NunHub",
    LoadingTitle = "NunHub Loading",
    LoadingSubtitle = "by Ysunza",
    Theme = "Default",
    ToggleUIKeybind = "K"
})

-- Create all tabs initially
local StartTab = Window:CreateTab("Start", 4483362458)
local HomeTab = Window:CreateTab("Home", 4483362458)
local ModsTab = Window:CreateTab("Mods", 4483362458)

-- Hide Home and Mods tabs by default by selecting Start tab first
Window:SelectTab(StartTab)

-- Store buttons so we can clear them if needed
local homeButtons = {}
local modsButtons = {}

-- Clear buttons function
local function clearButtons(buttonList)
    for _, btn in pairs(buttonList) do
        btn:Destroy()
    end
    return {}
end

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

        -- Clear any old buttons (if any)
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

        -- Switch to Home tab after loading
        Window:SelectTab(HomeTab)
    end
})







