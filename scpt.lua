local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "NunHub",
    LoadingTitle = "NunHub Loading",
    LoadingSubtitle = "by Ysunza",
    Theme = "Default",
    ToggleUIKeybind = "K"
})

local StartSection = Window:CreateSection("Start")
local ContentSection = nil -- Will create later

local loadingLabel = StartSection:CreateLabel("")
local startButton

local contentButtons = {}

local function clearContentButtons()
    for _, btn in pairs(contentButtons) do
        if btn.Destroy then
            btn:Destroy()
        end
    end
    contentButtons = {}
    if ContentSection then
        ContentSection:ClearAllChildren()
    end
end

local function createContentSection()
    if ContentSection then
        ContentSection:ClearAllChildren()
    else
        ContentSection = Window:CreateSection("Content")
    end
end

local function showHomeContent()
    clearContentButtons()
    createContentSection()

    table.insert(contentButtons, ContentSection:CreateButton({
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

    table.insert(contentButtons, ContentSection:CreateButton({
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

local function showModsContent()
    clearContentButtons()
    createContentSection()

    table.insert(contentButtons, ContentSection:CreateButton({
        Name = "Infinite Money",
        Callback = function()
            loadstring(game:HttpGet("https://pastefy.app/Ym83DFAi/raw"))()
        end
    }))

    table.insert(contentButtons, ContentSection:CreateButton({
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

startButton = StartSection:CreateButton({
    Name = "Start",
    Callback = function()
        startButton:Destroy()
        loadingLabel:Set("Loading... 0 / 10")

        for i = 1, 10 do
            loadingLabel:Set("Loading... " .. i .. " / 10")
            wait(1)
        end

        loadingLabel:Set("")

        -- Create Home and Mods buttons inside Start section after loading
        StartSection:CreateButton({
            Name = "Home",
            Callback = showHomeContent
        })

        StartSection:CreateButton({
            Name = "Mods",
            Callback = showModsContent
        })
    end
})














