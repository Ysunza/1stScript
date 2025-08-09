local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
if not Rayfield then
    warn("Failed to load Rayfield")
    return
end

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

MainWindow:Toggle(true)
print("Key system UI should now be visible")

local Tab = MainWindow:CreateTab("Tab Example", 4483362458)

end)

