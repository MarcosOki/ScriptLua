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
local statusFarm = true


wait(0.5)local ba=Instance.new("ScreenGui")
local ca=Instance.new("TextLabel")local da=Instance.new("Frame")
local _b=Instance.new("TextLabel")local ab=Instance.new("TextLabel")ba.Parent=game.CoreGui
ba.ZIndexBehavior=Enum.ZIndexBehavior.Sibling;ca.Parent=ba;ca.Active=true
ca.BackgroundColor3=Color3.new(0.176471,0.176471,0.176471)ca.Draggable=true
ca.Position=UDim2.new(0.698610067,0,0.098096624,0)ca.Size=UDim2.new(0,370,0,52)
ca.Font=Enum.Font.SourceSansSemibold;ca.Text="Anti Afk"ca.TextColor3=Color3.new(0,1,1)
ca.TextSize=22;da.Parent=ca
da.BackgroundColor3=Color3.new(0.196078,0.196078,0.196078)da.Position=UDim2.new(0,0,1.0192306,0)
da.Size=UDim2.new(0,370,0,107)_b.Parent=da
_b.BackgroundColor3=Color3.new(0.176471,0.176471,0.176471)_b.Position=UDim2.new(0,0,0.800455689,0)
_b.Size=UDim2.new(0,370,0,21)_b.Font=Enum.Font.Arial;_b.Text=""
_b.TextColor3=Color3.new(0,1,1)_b.TextSize=20;ab.Parent=da
ab.BackgroundColor3=Color3.new(0.176471,0.176471,0.176471)ab.Position=UDim2.new(0,0,0.158377,0)
ab.Size=UDim2.new(0,370,0,44)ab.Font=Enum.Font.ArialBold;ab.Text="Status: Active"
ab.TextColor3=Color3.new(0,1,1)ab.TextSize=20;local bb=game:service'VirtualUser'
game:service'Players'.LocalPlayer.Idled:connect(function()
bb:CaptureController()bb:ClickButton2(Vector2.new())
ab.Text="Roblox tried kicking you buy I didnt let them!"wait(2)ab.Text="Status : Active"end)


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
buttomShowMenu.TouchTap:Connect(function ()
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

local function v_snow ()
	local args = {
		[1] = "DF_SnowSnow_V",
		[2] = {
			["Type"] = "Down",
			["MouseHit"] = CFrame.new(-1123.123779296875, -287.5234680175781, 2309.5244140625) * CFrame.Angles(-1.3162145614624023, -0.7221925854682922, -1.1957588195800781)
		}
	}

	game:GetService("ReplicatedStorage").Chest.Remotes.Functions.SkillAction:InvokeServer(unpack(args))
	local args = {
		[1] = "DF_SnowSnow_V",
		[2] = {
			["Type"] = "Up",
			["MouseHit"] = CFrame.new(player.Character.HumanoidRootPart.Position.X, player.Character.HumanoidRootPart.Position.Y,player.Character.HumanoidRootPart.Position.Z) * CFrame.Angles(0, 0, 0)
		}
	}
	game:GetService("ReplicatedStorage").Chest.Remotes.Functions.SkillAction:InvokeServer(unpack(args))
end


--Script WalkSpeed

local function walkspeed(btnWalkSpeed)
	if player.Character.Humanoid.WalkSpeed == 16  then
		player.Character.Humanoid.WalkSpeed = 50
	else
		player.Character.Humanoid.WalkSpeed = 16
	end

end

--Script StopFarm
local function stopFarm()
    statusFarm = false
    print("era pra farm pausar")
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
    statusFarm = true
	while statusFarm do
		player.Character.HumanoidRootPart.CFrame = CFrame.new(-1405, 36 ,2405)
		v_snow()
		player.Character.HumanoidRootPart.CFrame = CFrame.new(-1257, 111 ,2354)
		wait(1)
	end  
    print("Farm pausada")

end

--SCRIPT FARM Freshfish SNOW

local function fishFarm ()
    statusFarm = true
	while statusFarm do
		player.Character.HumanoidRootPart.CFrame = CFrame.new(-713, 24 ,-1508)
		v_snow()
		player.Character.HumanoidRootPart.CFrame = CFrame.new(-720, 24 ,-1515)
		wait(1)
	end  

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
local btnSnowFarm = createButton("snowFarm", size,"snowFarm",backgroundColor,textSize,textColor,scrollGui,function()
	snowFarm()
end)

--BTN FRESHFISH
local btnFreshFish = createButton("FishFarm", size,"FishFarm",backgroundColor,textSize,textColor,scrollGui,function()
    fishFarm()
end)

--BTN Stop Farm
local btnStopTheFarm = createButton("StopFarm", size,"StopFarm",backgroundColor,textSize,textColor,scrollGui,stopFarm)

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