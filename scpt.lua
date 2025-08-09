local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local num1 = math.random(1, 1000)
local num2 = math.random(1, 1000)
local correctAnswer = num1 + num2

local keyCorrect = false

-- Create the key input UI
local keyWindow = Rayfield:CreateWindow({
    Name = "Key Verification",
    LoadingTitle = "Answer the math problem to continue",
    LoadingSubtitle = num1 .. " + " .. num2 .. " = ?",
    Theme = "Default",
    ToggleUIKeybind = nil,
    KeySystem = false,
})

local tab = keyWindow:CreateTab("Verify", 4483362458)

local userAnswer = nil

local inputBox = tab:CreateTextbox({
    Name = "Enter your answer",
    PlaceholderText = "Type a number",
    TextDisappear = false,
    Callback = function(text)
        userAnswer = text
    end
})

local submitButton = tab:CreateButton({
    Name = "Submit",
    Callback = function()
        if tonumber(userAnswer) == correctAnswer then
            Rayfield:Notify({
                Title = "Access Granted",
                Content = "Correct answer! Welcome.",
                Duration = 3
            })
            keyCorrect = true
            keyWindow:Toggle(false)
        else
            Rayfield:Notify({
                Title = "Access Denied",
                Content = "Wrong answer. Try again.",
                Duration = 3
            })
        end
    end
})

-- Wait until user enters the correct key
repeat wait(0.1) until keyCorrect

-- Now create your main UI after key verified
local Window = Rayfield:CreateWindow({
    Name = "NunHub",
    LoadingTitle = "NunHub Loading",
    LoadingSubtitle = "by Ysunza",
    Theme = "Default",
    ToggleUIKeybind = "K"
})

-- Continue with your UI setup here...















