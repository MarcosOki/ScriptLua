local player = game.Players.LocalPlayer
local mainGui = Instance.new("ScreenGui")
local frame = Instance.new("Frame")
local textLabel = Instance.new("TextLabel")
local buttomShowMenu = Instance.new("TextButton")
local scrollGui = Instance.new("ScrollingFrame")
local gridLayout = Instance.new("UIGridLayout")
local btnWalkSpeed = Instance.new("TextButton")
local getCoordinated = Instance.new("TextButton")
local getCoordinatedLabel = Instance.new("TextLabel")

--Button Configs
local size = UDim2.new(0.25,0,0.10,0)
local backgroundColor = BrickColor.new("Lily white")
local textColor = Color3.new(0,0,0)
local textSize = 10

--FRAME
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.Size = UDim2.new(0.5,0,0.8,0)
frame.Position = UDim2.new(0.5, -frame.Size.X.Offset/2, 0.5, -frame.Size.Y.Offset/2)
frame.BackgroundColor3 = Color3.new(0,0,0)

--TEXT LABEL
textLabel.Name = "Title"
textLabel.AnchorPoint = Vector2.new(0.5,0.5)
textLabel.Size = UDim2.new(1,0,0.15,0)
textLabel.Position = UDim2.new(0.5, 0, 0, 0)
textLabel.BackgroundColor3 = Color3.new(0,0,0)
textLabel.Text = "Nightmare Menu"
textLabel.TextColor3 = Color3.new(0,255,0)
textLabel.TextSize = 19
textLabel.BorderColor3 = Color3.new(0,0,0)

--BUTTON SHOW MENU
buttomShowMenu.Text = "Close"
buttomShowMenu.BorderColor3 = Color3.new(0,0,0)
buttomShowMenu.AnchorPoint = Vector2.new(0.5,0.5)
buttomShowMenu.Position = UDim2.new(0.5,0,-0.1,0)
buttomShowMenu.TextColor3 = Color3.new(0,255,0)
buttomShowMenu.TextSize = 13
buttomShowMenu.AutoButtonColor = Color3.new(0,0,0)
buttomShowMenu.Size = UDim2.new(0.1,0,0.1,0)

--SCROLL GUI
scrollGui.Size = UDim2.new(0.98,0,0.90,0)
scrollGui.Position = UDim2.new(0.02,0,0.10,0)
scrollGui.Transparency = 1


--BOTAO WALKSPEED
btnWalkSpeed.Text = "Speed"
btnWalkSpeed.Size = size
btnWalkSpeed.BackgroundColor = backgroundColor
btnWalkSpeed.TextColor3 = textColor
btnWalkSpeed.Name = "WalkSpeed"
btnWalkSpeed.TextSize = textSize

--BOTAO GET CORD
getCoordinated.Text = "GetCord"
getCoordinated.Size = size
getCoordinated.BackgroundColor = backgroundColor
getCoordinated.TextSize = textSize
getCoordinated.TextColor3 = textColor
--Label getcord
getCoordinatedLabel.TextColor3 = textColor
getCoordinatedLabel.Text = ""
getCoordinatedLabel.AnchorPoint = Vector2.new(0.5,1)
getCoordinatedLabel.Position = UDim2.new(0.5,0,1,0)
getCoordinatedLabel.Size = UDim2.new(1,0,0.1,0)

--UIGRIDLAYOUT
gridLayout.CellPadding = UDim2.new(0.02,0,0.02,0)
gridLayout.CellSize = UDim2.new(0.2,0,0.10,0)

--PARENT
gridLayout.Parent = scrollGui
btnWalkSpeed.Parent = scrollGui
scrollGui.Parent = frame
buttomShowMenu.Parent = mainGui
frame.Parent = mainGui
mainGui.Parent = player.PlayerGui
textLabel.Parent = frame
getCoordinated.Parent = scrollGui
getCoordinatedLabel.Parent = frame

--Scripts

buttomShowMenu.MouseButton1Click:Connect(function ()
	if buttomShowMenu.Text == "Close"  then
		print("close")
		frame.Visible = false
		buttomShowMenu.Text = "Open"
	else
		print("open")
		frame.Visible = true
		buttomShowMenu.Text = "Close"
	end
end)


--Script WalkSpeed

btnWalkSpeed.Activated:Connect(function ()
	if player.Character.Humanoid.WalkSpeed == 16  then
		player.Character.Humanoid.WalkSpeed = 50
		btnWalkSpeed.BackgroundColor3 = Color3.new(0,0,255)
	else
		player.Character.Humanoid.WalkSpeed = 16
		btnWalkSpeed.BackgroundColor = BrickColor.new("Mid gray")
	end

end)


--SCRIPT GET CORD
getCoordinated.Activated:Connect(function ()
	getCoordinatedLabel.Text = "X: "..math.floor(player.Character.HumanoidRootPart.Position.X)..", Y: "..math.floor(player.Character.HumanoidRootPart.Position.Y)..", Z: "..math.floor(player.Character.HumanoidRootPart.Position.Z)
end)