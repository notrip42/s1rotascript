local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

local localPlayer = Players.LocalPlayer
local playerGui = localPlayer:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ScreenGui"
screenGui.ResetOnSpawn = true
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Parent = playerGui

local frame = Instance.new("Frame")
frame.Name = "Frame"
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
frame.BorderSizePixel = 0
frame.Position = UDim2.new(0.5, 1, 0.5, -1)
frame.Size = UDim2.new(0.3, 0, 0.3, 0)
frame.Parent = screenGui

local textLabel = Instance.new("TextLabel")
textLabel.Name = "TextLabel"
textLabel.Font = Enum.Font.Oswald
textLabel.Text = "  S1rota Script"
textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
textLabel.TextSize = 24
textLabel.TextStrokeTransparency = 0
textLabel.TextXAlignment = Enum.TextXAlignment.Left
textLabel.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
textLabel.BorderSizePixel = 0
textLabel.Size = UDim2.new(1, 0, 0.1, 0)
textLabel.Parent = frame

local uiDragDetector = Instance.new("UIDragDetector")
uiDragDetector.Name = "UIDragDetector"
uiDragDetector.Parent = frame

local tabContent = Instance.new("Frame")
tabContent.Name = "TabContent"
tabContent.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
tabContent.BorderSizePixel = 0
tabContent.Position = UDim2.new(0.2, 0, 0.1, 0)
tabContent.Size = UDim2.new(0.8, 0, 0.9, 0)
tabContent.Parent = frame

local homePage = Instance.new("Frame")
homePage.Name = "Home"
homePage.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
homePage.BorderSizePixel = 0
homePage.Size = UDim2.new(1, 0, 1, 0)
homePage.Visible = true
homePage.Parent = tabContent

local homeTitle = Instance.new("TextLabel")
homeTitle.Name = "TextLabel"
homeTitle.Font = Enum.Font.Oswald
homeTitle.Text = "S1rota Script"
homeTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
homeTitle.TextSize = 28
homeTitle.BackgroundTransparency = 1
homeTitle.Size = UDim2.new(1, 0, 0.2, 0)
homeTitle.Parent = homePage

local homeCredits = Instance.new("TextLabel")
homeCredits.Name = "TextLabel"
homeCredits.Font = Enum.Font.Oswald
homeCredits.Text = "by notrip42"
homeCredits.TextColor3 = Color3.fromRGB(255, 255, 255)
homeCredits.TextSize = 28
homeCredits.BackgroundTransparency = 1
homeCredits.Position = UDim2.new(0, 0, 0.15, 0)
homeCredits.Size = UDim2.new(1, 0, 0.1, 0)
homeCredits.Parent = homePage

local homeEnjoy = Instance.new("TextLabel")
homeEnjoy.Name = "TextLabel"
homeEnjoy.Font = Enum.Font.Oswald
homeEnjoy.Text = "Enjoy!\n;)"
homeEnjoy.TextColor3 = Color3.fromRGB(255, 255, 255)
homeEnjoy.TextSize = 28
homeEnjoy.BackgroundTransparency = 1
homeEnjoy.Position = UDim2.new(0, 0, 0.3, 0)
homeEnjoy.Size = UDim2.new(1, 0, 0.1, 0)
homeEnjoy.Parent = homePage

local espPage = Instance.new("Frame")
espPage.Name = "ESP"
espPage.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
espPage.BorderSizePixel = 0
espPage.Size = UDim2.new(1, 0, 1, 0)
espPage.Visible = false
espPage.Parent = tabContent

local toggleButton = Instance.new("TextButton")
toggleButton.Name = "Toggle"
toggleButton.Font = Enum.Font.Oswald
toggleButton.Text = "Toggle ESP"
toggleButton.TextColor3 = Color3.fromRGB(0, 0, 0)
toggleButton.TextSize = 28
toggleButton.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.TextStrokeTransparency = 0
toggleButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
toggleButton.Position = UDim2.new(0.1, 0, 0.1, 0)
toggleButton.Size = UDim2.new(0.2, 0, 0.2, 0)
toggleButton.Parent = espPage

local sidebarContainer = Instance.new("Frame")
sidebarContainer.Name = "SidebarButtons"
sidebarContainer.BackgroundTransparency = 1
sidebarContainer.Position = UDim2.new(0, 0, 0.1, 0)
sidebarContainer.Size = UDim2.new(0.2, 0, 0.9, 0)
sidebarContainer.Parent = frame

local function createTabButton(name, positionY)
	local btn = Instance.new("TextButton")
	btn.Name = name
	btn.Font = Enum.Font.Oswald
	btn.Text = name
	btn.TextColor3 = Color3.fromRGB(255, 255, 255)
	btn.TextSize = 20
	btn.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
	btn.BorderSizePixel = 0
	btn.Position = UDim2.new(0, 0, positionY, 0)
	btn.Size = UDim2.new(1, 0, 0.15, 0)
	btn.Parent = sidebarContainer
	return btn
end

local btnHome = createTabButton("Home", 0)
local btnESP = createTabButton("ESP", 0.15)
local btnAFK = createTabButton("AFKFarm", 0.3)
local btnChar = createTabButton("Character", 0.45)
local btnGame = createTabButton("Gameplay", 0.60)

local afkPage = Instance.new("Frame") afkPage.Name = "AFKFarm" afkPage.Visible = false afkPage.Parent = tabContent
local charPage = Instance.new("Frame") charPage.Name = "Character" charPage.Visible = false charPage.Parent = tabContent
local gamePage = Instance.new("Frame") gamePage.Name = "Gameplay" gamePage.Visible = false gamePage.Parent = tabContent

local tabToBtn = {
	[btnHome] = homePage,
	[btnESP] = espPage,
	[btnAFK] = afkPage,
	[btnChar] = charPage,
	[btnGame] = gamePage
}

local function switchTabs(clickedBtn)
	for btn, tab in pairs(tabToBtn) do
		if btn == clickedBtn then
			tab.Visible = true
			btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
		else
			tab.Visible = false
			btn.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
		end
	end
end

for btn, tab in pairs(tabToBtn) do
	btn.MouseButton1Click:Connect(function()
		switchTabs(btn)
	end)
end
switchTabs(btnHome)

local innocentInput = Instance.new("TextBox") innocentInput.Name = "InnocentColor" innocentInput.Text = "0,0,255" innocentInput.Parent = espPage
local sheriffInput = Instance.new("TextBox") sheriffInput.Name = "SheriffColor" sheriffInput.Text = "0,255,0" sheriffInput.Parent = espPage
local murdererInput = Instance.new("TextBox") murdererInput.Name = "MurdererColor" murdererInput.Text = "255,0,0" murdererInput.Parent = espPage
local applyButton = Instance.new("TextButton") applyButton.Name = "ApplyColors" applyButton.Parent = espPage

local RoleUpdateEvent = ReplicatedStorage:WaitForChild("RoleEvent")
local ResetRoundEvent = ReplicatedStorage:WaitForChild("ClearRoundEvent")

local ROLE_COLORS = {
	["Innocent"] = Color3.fromRGB(0, 0, 255),
	["Sheriff"]  = Color3.fromRGB(0, 255, 0),
	["Murderer"] = Color3.fromRGB(255, 0, 0)
}

local activeHighlights = {}
local activeBeams = {}
local storedRoles = {}
local isToggledOn = false

local function stringToColor3(text)
	local r, g, b = string.match(text, "(%d+),%s*(%d+),%s*(%d+)")
	if r and g and b then
		return Color3.fromRGB(tonumber(r), tonumber(g), tonumber(b))
	end
	return nil
end

local function updateRoleColor(roleName, newColor)
	if ROLE_COLORS[roleName] then
		ROLE_COLORS[roleName] = newColor
		if isToggledOn then
			for player, role in pairs(storedRoles) do
				if role == roleName and player.Character then
					local character = player.Character
					local highlight = character:FindFirstChild("RoleHighlight")
					if highlight then
						highlight.FillColor = newColor
						highlight.OutlineColor = newColor
					end
					if activeBeams[character] and activeBeams[character].Beam then
						activeBeams[character].Beam.Color = ColorSequence.new(newColor)
					end
				end
			end
		end
	end
end

applyButton.MouseButton1Click:Connect(function()
	local innocentColor = stringToColor3(innocentInput.Text)
	local sheriffColor = stringToColor3(sheriffInput.Text)
	local murdererColor = stringToColor3(murdererInput.Text)
	if innocentColor then updateRoleColor("Innocent", innocentColor) end
	if sheriffColor then updateRoleColor("Sheriff", sheriffColor) end
	if murdererColor then updateRoleColor("Murderer", murdererColor) end
end)

local function removeVisualsFromCharacter(character)
	if not character then return end
	local existingHighlight = character:FindFirstChild("RoleHighlight")
	if existingHighlight then
		existingHighlight:Destroy()
	end
	if activeBeams[character] then
		if activeBeams[character].Beam then activeBeams[character].Beam:Destroy() end
		if activeBeams[character].TargetAttachment then activeBeams[character].TargetAttachment:Destroy() end
		activeBeams[character] = nil
	end
	activeHighlights[character] = nil
end

local function applyVisuals(player, roleName)
	if player == Players.LocalPlayer then return end
	local character = player.Character
	if not character then return end
	local targetHrp = character:FindFirstChild("HumanoidRootPart")
	if not targetHrp then return end
	
	local myCharacter = Players.LocalPlayer.Character
	local myHrp = myCharacter and myCharacter:FindFirstChild("HumanoidRootPart")
	local myAttachment = myHrp and myHrp:FindFirstChild("RootAttachment")
	
	if not isToggledOn then return end
	local roleColor = ROLE_COLORS[roleName] or Color3.fromRGB(255, 255, 255)
	
	local highlight = character:FindFirstChild("RoleHighlight")
	if not highlight then
		highlight = Instance.new("Highlight")
		highlight.Name = "RoleHighlight"
	end
	
	highlight.Adornee = character
	highlight.FillColor = roleColor
	highlight.FillTransparency = 0.5
	highlight.OutlineColor = roleColor
	highlight.OutlineTransparency = 0
	highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop 
	highlight.Parent = character
	
	activeHighlights[character] = highlight
	
	if myAttachment and not activeBeams[character] then
		local targetAttachment = Instance.new("Attachment")
		targetAttachment.Name = "RoleBeamAttachment"
		targetAttachment.Parent = targetHrp
		
		local beam = Instance.new("Beam")
		beam.Name = "RoleBeam"
		beam.Attachment0 = myAttachment
		beam.Attachment1 = targetAttachment
		beam.Color = ColorSequence.new(roleColor)
		beam.Width0 = 0.2
		beam.Width1 = 0.2
		beam.FaceCamera = true
		beam.Parent = targetHrp
		activeBeams[character] = {Beam = beam, TargetAttachment = targetAttachment}
	end
end

local function monitorPlayerLife(player)
	player.CharacterAdded:Connect(function(character)
		local humanoid = character:WaitForChild("Humanoid", 5)
		if humanoid then
			humanoid.Died:Connect(function()
				removeVisualsFromCharacter(character)
			end)
		end
	end)
end

for _, player in ipairs(Players:GetPlayers()) do
	monitorPlayerLife(player)
end
Players.PlayerAdded:Connect(monitorPlayerLife)

RunService.RenderStepped:Connect(function()
	if not isToggledOn then return end
	local myCharacter = Players.LocalPlayer.Character
	local myHrp = myCharacter and myCharacter:FindFirstChild("HumanoidRootPart")
	if not myHrp then return end
	local myAttachment = myHrp:FindFirstChild("RootAttachment")
	if not myAttachment then return end
	
	for player, role in pairs(storedRoles) do
		local character = player.Character
		local targetHrp = character and character:FindFirstChild("HumanoidRootPart")
		if targetHrp and character:FindFirstChild("Humanoid") and character.Humanoid.Health > 0 then
			if not activeBeams[character] then
				applyVisuals(player, role)
			else
				activeBeams[character].Beam.Attachment0 = myAttachment
			end
		elseif character then
			if activeBeams[character] then
				if activeBeams[character].Beam then activeBeams[character].Beam:Destroy() end
				if activeBeams[character].TargetAttachment then activeBeams[character].TargetAttachment:Destroy() end
				activeBeams[character] = nil
			end
		end
	end
end)

RoleUpdateEvent.OnClientEvent:Connect(function(data, specificRole)
	if typeof(data) == "Instance" and data:IsA("Player") then
		storedRoles[data] = specificRole
		applyVisuals(data, specificRole)
	elseif typeof(data) == "table" then
		for _, info in ipairs(data) do
			if info.Player and info.Role then
				storedRoles[info.Player] = info.Role
				applyVisuals(info.Player, info.Role)
			end
		end
	end
end)

ResetRoundEvent.OnClientEvent:Connect(function()
	for character, _ in pairs(activeHighlights) do
		removeVisualsFromCharacter(character)
	end
	table.clear(activeHighlights)
	table.clear(activeBeams)
	table.clear(storedRoles)
end)

toggleButton.MouseButton1Click:Connect(function()
	isToggledOn = not isToggledOn
	if isToggledOn then
		toggleButton.BackgroundColor3 = Color3.fromRGB(0, 200, 100)
		for player, role in pairs(storedRoles) do
			applyVisuals(player, role)
		end
	else
		toggleButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
		for character, _ in pairs(activeHighlights) do
			removeVisualsFromCharacter(character)
		end
		table.clear(activeHighlights)
		table.clear(activeBeams)
	end
end)
