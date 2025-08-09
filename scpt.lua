local function CreateMainWindow()
    local MainWindow = Rayfield:CreateWindow({
        Name = "Main Window",
        LoadingTitle = "Main Loaded",
        LoadingSubtitle = "Welcome!",
        Theme = "Default",
        ToggleUIKeybind = "K"
    })

    local HomeTab = MainWindow:CreateTab("Home", 4483362458)

    HomeTab:CreateButton({
        Name = "Say Hello",
        Callback = function()
            print("Hello from main window!")
        end
    })
end

StartTab:CreateButton({
    Name = "Start",
    Callback = function()
        for i = 1, 5 do
            loadingLabel:Set("Loading... " .. i .. " / 5")
            wait(1)
        end
        StartWindow:Toggle(false)
        CreateMainWindow()
    end
})







