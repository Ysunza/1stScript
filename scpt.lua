local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local StartWindow = Rayfield:CreateWindow({
    Name = "Test Launcher",
    LoadingTitle = "Loading Launcher",
    LoadingSubtitle = "Testing...",
    Theme = "Default",
    ToggleUIKeybind = nil
})

local StartTab = StartWindow:CreateTab("Start", 4483362458)

local loadingLabel = StartTab:CreateLabel("")

StartTab:CreateButton({
    Name = "Start",
    Callback = function()
        for i = 1, 5 do
            loadingLabel:Set("Loading... " .. i .. " / 5")
            wait(1)
        end
        print("Loading done")
    end
})






