local player = game.Players.LocalPlayer
local mainGui = Instance.new("ScreenGui")
local frame = Instance.new("Frame")
local textLabel = Instance.new("TextLabel")
local buttomShowMenu = Instance.new("TextButton")
local scrollGui = Instance.new("ScrollingFrame")
local gridLayout = Instance.new("UIGridLayout")
local getCoordinatedLabel = Instance.new("TextLabel")
local btnTeleport = Instance.new("TextButton")
mainGui.ResetOnSpawn = false



--Ferramentas
local function extrairNumeros(texto)
	local numeros = {}
	for numero in texto:gmatch("%-?%d+") do
		table.insert(numeros, tonumber(numero))
	end
	return unpack(numeros)
end

local function createButton(nome,size,textButton,background,textSize,textColor,parent,activate)
	local btn = Instance.new("TextButton")
	btn.Name = nome
	btn.Size = size
	btn.Text = textButton
	btn.BackgroundColor = background
	btn.TextSize = textSize
	btn.TextColor3 = textColor
	btn.Parent = parent
	btn.Activated:Connect(activate)
	return btn
end


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

local function walkspeed(btnWalkSpeed)
	if player.Character.Humanoid.WalkSpeed == 16  then
		player.Character.Humanoid.WalkSpeed = 50
	else
		player.Character.Humanoid.WalkSpeed = 16
	end

end


--SCRIPT GET CORD
local function getCord(getCordinateLabel)
	local X = math.floor(player.Character.HumanoidRootPart.Position.X)
	local Y = math.floor(player.Character.HumanoidRootPart.Position.Y)
	local Z = math.floor(player.Character.HumanoidRootPart.Position.Z)
	getCoordinatedLabel.Text = " X: ".. X .. " Y: ".. Y .. " Z: ".. Z
end


--SCRIPT TP
local function teleport ()
	local cord = getCoordinatedLabel.Text
	local x, y, z = extrairNumeros(cord)
	print(x,y,z)
	player.Character.HumanoidRootPart.CFrame = CFrame.new(x, y, z)
end


--SCRIPT Snow Farm
local function snowFarm ()
	local status = true
	player.Character.HumanoidRootPart.CFrame = CFrame.new(-1400, 15 ,2388)
	print("tp funcionou")
	player.Character.HumanoidRootPart.Anchored = true
end


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
buttomShowMenu.Position = UDim2.new(0.5,0,-0.05,0)
buttomShowMenu.TextColor3 = Color3.new(0,255,0)
buttomShowMenu.TextSize = 13
buttomShowMenu.AutoButtonColor = Color3.new(0,0,0)
buttomShowMenu.Size = UDim2.new(0.1,0,0.1,0)

--SCROLL GUI
scrollGui.Size = UDim2.new(0.98,0,0.90,0)
scrollGui.Position = UDim2.new(0.02,0,0.10,0)
scrollGui.Transparency = 1


--BOTAO WALKSPEED
local btnWalkSpeed = createButton("WalkSpeed",size,"Speed",backgroundColor,textSize,textColor,scrollGui,walkspeed)


--BOTAO GET CORD
local btnGetCord = createButton("GetCord",size,"GetCord",backgroundColor,textSize,textColor,scrollGui,getCord)

--BOTAO SNOW FARM
local btnSnowFarm = createButton("snowFarm", size,"snowFarm",backgroundColor,textSize,textColor,scrollGui,snowFarm)

--Label getcord
getCoordinatedLabel.TextColor3 = textColor
getCoordinatedLabel.Text = ""
getCoordinatedLabel.AnchorPoint = Vector2.new(0.5,1)
getCoordinatedLabel.Position = UDim2.new(0.5,0,1,0)
getCoordinatedLabel.Size = UDim2.new(1,0,0.1,0)


--TELEPORT
local btnTeleport = createButton("Teleport",size,"Teleport",backgroundColor,textSize,textColor,scrollGui,teleport)



--UIGRIDLAYOUT
gridLayout.CellPadding = UDim2.new(0.02,0,0.02,0)
gridLayout.CellSize = UDim2.new(0.2,0,0.10,0)

--PARENT
gridLayout.Parent = scrollGui
scrollGui.Parent = frame
buttomShowMenu.Parent = mainGui
frame.Parent = mainGui
mainGui.Parent = player.PlayerGui
textLabel.Parent = frame
getCoordinatedLabel.Parent = frame
