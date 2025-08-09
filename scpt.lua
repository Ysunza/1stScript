local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local num1 = math.random(1, 100)
local num2 = math.random(1, 100)
local correctKey = tostring(num1 + num2)
local keyNote = "Solve this to get the key: " .. num1 .. " + " .. num2

print("Key system problem:", keyNote, "Answer:", correctKey)

local MainWindow = Rayfield:CreateWindow({
    Name = "NunHub",
    LoadingTitle = "NunHub Loading",
    LoadingSubtitle = "by Ysunza",
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

-- Wait for the key system to be completed successfully before creating tabs
MainWindow:OnKeySystemSuccess(function()
    print("Correct key entered, creating tabs")

    local HomeTab = MainWindow:CreateTab("Home", "")
    local ModsTab = MainWindow:CreateTab("Mods", "")

    