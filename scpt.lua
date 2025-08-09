local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Define CreateMainWindow function first
local function CreateMainWindow()
    local MainWindow = Rayfield:CreateWindow({
        Name = "NunHub",
        LoadingTitle = "NunHub Loaded",
        LoadingSubtitle = "by Ysunza",
        Theme = "Default",
        ToggleUIKeybind = "K"
    })

    local HomeTab = MainWindow:CreateTab("Home", 4483362458)
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

    local ModsTab = MainWindow:CreateTab("Mods", 4483362458)
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
end

-- Create Start Window
local StartWindow = Rayfield:CreateWindow({
    Name = "Launcher",
    LoadingTitle = "Loading Launcher",
    LoadingSubtitle = "by Ysunza",
    Theme = "Default",
    ToggleUIKeybind = nil -- No keybind for start window
})

local StartTab = StartWindow:CreateTab("Start", 4483362458)

-- Create the loading label outside callback to avoid nil errors
local loadingLabel = StartTab:CreateLabel("")

StartTab:CreateButton({
    Name = "Start",
    Callback = function()
        -- Disable the Start button manually by hiding it or ignoring further presses
        -- Rayfield might not support disable, so we use a simple guard:
        if loadingLabel.Text ~= "" and loadingLabel.Text ~= "Loading... 0 / 10" then
            return -- Prevent double press
        end
        
        -- Loading animation loop
        for i = 1, 10 do
            loadingLabel:Set("Loading... " .. i .. " / 10")
            wait(1)
        end
        
        -- Hide the start window
        StartWindow:Toggle(false)
        
        -- Open the main window
        CreateMainWindow()
    end
})





