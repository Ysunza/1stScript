local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Create Main Window
local Window = Rayfield:CreateWindow({
   Name = "NunHub",
   Icon = 0,
   LoadingTitle = "Loading NunHub",
   LoadingSubtitle = "powered by Rayfield",
   ShowText = "NunHub",
   Theme = "Default",
   ToggleUIKeybind = "K",

   ConfigurationSaving = {
      Enabled = true,
      FolderName = "NunHubConfig",
      FileName = "NunHubSettings"
   },

   Discord = {
      Enabled = false,
      Invite = "noinvitelink",
      RememberJoins = true
   },

   KeySystem = false
})

-- HOME TAB
local HomeTab = Window:CreateTab("Home", 4483362458) -- Icon ID from Roblox

HomeTab:CreateButton({
    Name = "Join Discord",
    Callback = function()
        setclipboard("https://discord.gg/YourInviteHere") -- Copies Discord link to clipboard
        Rayfield:Notify({
            Title = "Discord Link Copied",
            Content = "Invite link has been copied to your clipboard!",
            Duration = 5
        })
    end
})

-- SETTINGS TAB
local SettingsTab = Window:CreateTab("Settings", 4483362458)

SettingsTab:CreateDropdown({
    Name = "Select Theme",
    Options = {"Default", "Light", "Dark", "Ocean", "Tokyo Night"},
    CurrentOption = "Default",
    Callback = function(option)
        Rayfield:SetTheme(option)
        Rayfield:Notify({
            Title = "Theme Changed",
            Content = "Theme set to " .. option,
            Duration = 3
        })
    end
})
