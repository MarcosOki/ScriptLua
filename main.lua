local player = game.Players.LocalPlayer
local mainGui = Instance.new("ScreenGui")
local frame = Instance.new("Frame")
local textLabel = Instance.new("TextLabel")
local buttomShowMenu = Instance.new("TextButton")

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
textLabel.Text = "SocramMenu"
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

--PARENT
buttomShowMenu.Parent = mainGui
frame.Parent = mainGui
mainGui.Parent = player.PlayerGui
textLabel.Parent = frame


--Script

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
