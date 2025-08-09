local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "NunHub",
    LoadingTitle = "NunHub Loading",
    LoadingSubtitle = "by Ysunza",
    Theme = "Default",
    ToggleUIKeybind = "K"
})

local startButton
local loadingLabel = Window:CreateLabel("") -- empty at first

local contentButtons = {} -- to track and clear Home/Mods buttons

local function clearContentButtons()
    for _, btn in pairs(contentButtons) do
        if btn.Destroy then
            btn:Destroy()
        end
    end
    contentButtons = {}
end

-- Function to create Home content buttons
local function showHomeContent()
    clearContentButtons()
    table.insert(contentButtons, Window:CreateButton({
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
    table.insert(contentButtons, Window:CreateButton({
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
end

-- Function to create Mods content buttons
local function showModsContent()
    clearContentButtons()
    table.insert(contentButtons, Window:CreateButton({
        Name = "Infinite Money",
        Callback = function()
            loadstring(game:HttpGet("https://pastefy.app/Ym83DFAi/raw"))()
        end
    }))
    table.insert(contentButtons, Window:CreateButton({
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
end

startButton = Window:CreateButton({
    Name = "Start",
    Callback = function()
        startButton:Destroy() -- remove start button
        loadingLabel:Set("Loading... 0 / 10")

        for i = 1, 10 do
            loadingLabel:Set("Loading... " .. i .. " / 10")
            wait(1)
        end

        loadingLabel:Set("") -- clear loading label

        -- Create Home and Mods buttons below
        Window:CreateButton({
            Name = "Home",
            Callback = showHomeContent
        })

        Window:CreateButton({
            Name = "Mods",
            Callback = showModsContent
        })
    end
})













