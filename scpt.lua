local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
if not Rayfield then
    warn("Failed to load Rayfield")
    return
end


-- Generate random addition problem
local num1 = math.random(1, 100)
local num2 = math.random(1, 100)
local correctKey = tostring(num1 + num2)
local keyNote = "Solve this to get the key: " .. num1 .. " + " .. num2

print("Math key problem:", keyNote, "Answer:", correctKey)

local MainWindow = Rayfield:CreateWindow({
    Name = "NunHub",
    LoadingTitle = "NunHub Loading",
    LoadingSubtitle = "by You",
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




local MainWindow = Rayfield:CreateWindow({
    Name = "NunHub",
    LoadingTitle = "NunHub Loaded",
    LoadingSubtitle = "Welcome back!",
    Theme = "Default",
    ToggleUIKeybind = "K"
})

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
        Rayfield:Notify({
            Title = "Notice",
            Content = "Executing Infinite Money...",
            Duration = 3
        })
        task.spawn(function()
            
            loadstring(game:HttpGet("https://pastefy.app/Ym83DFAi/raw"))()
        end)
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

task.spawn(function()
            
            loadstring(game:HttpGet("https://pastefy.app/Ym83DFAi/raw"))()
        end)


    end
})

MainWindow:Toggle(true) -- Show UI immediately

print("UI is now visible without key system")