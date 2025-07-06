local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

-- Create GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "SpeedChanger"
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 250, 0, 140)
frame.Position = UDim2.new(0.5, -125, 0.5, -70)
frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
frame.BorderSizePixel = 0
frame.Visible = true
frame.Active = true
frame.Draggable = true
frame.Parent = screenGui

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
title.Text = "Speed Changer"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.SourceSansBold
title.TextSize = 20
title.Parent = frame

local speedLabel = Instance.new("TextLabel")
speedLabel.Size = UDim2.new(1, -20, 0, 25)
speedLabel.Position = UDim2.new(0, 10, 0, 40)
speedLabel.BackgroundTransparency = 1
speedLabel.Text = "Current Speed: " .. humanoid.WalkSpeed
speedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
speedLabel.Font = Enum.Font.SourceSans
speedLabel.TextSize = 18
speedLabel.TextXAlignment = Enum.TextXAlignment.Left
speedLabel.Parent = frame

local speedInput = Instance.new("TextBox")
speedInput.Size = UDim2.new(1, -20, 0, 25)
speedInput.Position = UDim2.new(0, 10, 0, 70)
speedInput.PlaceholderText = "Enter speed (0 - 100)"
speedInput.Text = ""
speedInput.TextColor3 = Color3.fromRGB(0, 0, 0)
speedInput.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
speedInput.ClearTextOnFocus = false
speedInput.Font = Enum.Font.SourceSans
speedInput.TextSize = 18
speedInput.Parent = frame

local setSpeedButton = Instance.new("TextButton")
setSpeedButton.Size = UDim2.new(1, -20, 0, 30)
setSpeedButton.Position = UDim2.new(0, 10, 0, 100)
setSpeedButton.Text = "Set Speed"
setSpeedButton.TextColor3 = Color3.fromRGB(255, 255, 255)
setSpeedButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
setSpeedButton.Font = Enum.Font.SourceSansBold
setSpeedButton.TextSize = 18
setSpeedButton.Parent = frame

-- Button action
setSpeedButton.MouseButton1Click:Connect(function()
	local newSpeed = tonumber(speedInput.Text)
	if newSpeed and newSpeed >= 0 and newSpeed <= 100 then
		humanoid.WalkSpeed = newSpeed
		speedLabel.Text = "Current Speed: " .. newSpeed
	else
		speedLabel.Text = "Invalid (0-100)"
	end
end)

-- Toggle GUI with "M"
UIS.InputBegan:Connect(function(input, gpe)
	if gpe then return end
	if input.KeyCode == Enum.KeyCode.M then
		frame.Visible = not frame.Visible
	end
end)
