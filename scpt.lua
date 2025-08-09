local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Generate two random numbers 1-1000
local num1 = math.random(1, 1000)
local num2 = math.random(1, 1000)
local correctAnswer = num1 + num2

-- Show a simple input dialog to ask user for the answer
local function requestKey()
    local success, userInput = pcall(function()
        -- Use Roblox's built-in Prompt or Rayfield's Input if available
        -- Rayfield doesn't have native input dialog, so let's use a custom window for this
        local keyWindow = Rayfield:CreateWindow({
            Name = "Key Verification",
            LoadingTitle = "Answer the math problem to continue",
            LoadingSubtitle = num1 .. " + " .. num2 .. " = ?",
            Theme = "Default",
            ToggleUIKeybind = nil,
            KeySystem = false,
        })

        local result
        local inputBox = nil
        local verified = false

        -- Create input box and submit button
        local tab = keyWindow:CreateTab("Verify", 4483362458)

        inputBox = tab:CreateTextbox({
            Name = "Enter your answer",
            PlaceholderText = "Type a number",
            TextDisappear = false,
            Callback = function(text)
                result = text
            end
        })

        tab:CreateButton({
            Name = "Submit",
            Callback = function()
                if tonumber(result) == correctAnswer then
                    verified = true
                    Rayfield:Notify({
                        Title = "Access Granted",
                        Content = "Correct answer! Welcome.",
                        Duration = 3
                    })
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

        -- Wait until verified (polling)
        repeat wait(0.5) until verified
        return true
    end)
    return success and userInput
end

if requestKey() then
    -- Now create your main window after key verified
    local Window = Rayfield:CreateWindow({
        Name = "NunHub",
        LoadingTitle = "NunHub Loading",
        LoadingSubtitle = "by Ysunza",
        Theme = "Default",
        ToggleUIKeybind = "K"
    })

    -- Your main UI code here...

    local StartTab = Window:CreateTab("Start", 4483362458)
    local loadingLabel = StartTab:CreateLabel("")
    local homeButtons = {}
    local modsButtons = {}

    -- Add your buttons and logic here...

else
    -- If the key input failed or user closed the window
    print("Access denied or input failed.")
end














