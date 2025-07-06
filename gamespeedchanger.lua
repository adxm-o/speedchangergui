loadstring([[

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local frame = script.Parent
local speedLabel = frame:WaitForChild("SpeedLabel")
local speedInput = frame:WaitForChild("SpeedInput")
local setSpeedButton = frame:WaitForChild("SetSpeedButton")

-- Make UI draggable
frame.Active = true
frame.Draggable = true

-- Show current WalkSpeed on load
speedLabel.Text = "Current Speed: " .. humanoid.WalkSpeed

-- Button click sets speed
setSpeedButton.MouseButton1Click:Connect(function()
	local newSpeed = tonumber(speedInput.Text)
	if newSpeed and newSpeed >= 0 and newSpeed <= 100 then
		humanoid.WalkSpeed = newSpeed
		speedLabel.Text = "Current Speed: " .. newSpeed
	else
		speedLabel.Text = "Invalid (0-100)"
	end
end)

-- Toggle UI visibility with M key
UIS.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then return end
	if input.KeyCode == Enum.KeyCode.M then
		frame.Visible = not frame.Visible
	end
end)

]])()