local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

local localPlayer = Players.LocalPlayer
local playerGui = localPlayer:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "s1rotaESP_Gui"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Parent = playerGui

local frame = Instance.new("Frame")
frame.Name = "MainFrame"
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
frame.BorderSizePixel = 0
frame.Position = UDim2.new(0.5, 0, 0.5, 0)
frame.Size = UDim2.new(0.3, 0, 0.3, 0)
frame.Active = true
frame.Parent = screenGui

local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "TitleLabel"
titleLabel.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
titleLabel.BorderSizePixel = 0
titleLabel.Size = UDim2.new(1, 0, 0.1, 0)
titleLabel.Font = Enum.Font.Oswald
titleLabel.Text = "  S1rota Script"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextSize = 24
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.Parent = frame

local dragDetector = Instance.new("UIDragDetector")
dragDetector.ReferenceUIInstance = frame
dragDetector.Parent = frame

local tabButtonsContainer = Instance.new("Frame")
tabButtonsContainer.Name = "TabButtons"
tabButtonsContainer.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
tabButtonsContainer.BorderSizePixel = 0
tabButtonsContainer.Position = UDim2.new(0, 0, 0.1, 0)
tabButtonsContainer.Size = UDim2.new(0.2, 0, 0.9, 0)
tabButtonsContainer.Parent = frame

local tabButtonsLayout = Instance.new("UIListLayout")
tabButtonsLayout.SortOrder = Enum.SortOrder.LayoutOrder
tabButtonsLayout.Parent = tabButtonsContainer

local tabContentContainer = Instance.new("Frame")
tabContentContainer.Name = "TabContent"
tabContentContainer.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
tabContentContainer.BorderSizePixel = 0
tabContentContainer.Position = UDim2.new(0.2, 0, 0.1, 0)
tabContentContainer.Size = UDim2.new(0.8, 0, 0.9, 0)
tabContentContainer.Parent = frame

local tabs = {}
local buttons = {}

local function createTab(name, layoutOrder)
	local btn = Instance.new("TextButton")
	local btn = Instance.new("TextButton")
	btn.Name = name
	btn.Size = UDim2.new(1, 0, 0, 35)
	btn.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
	btn.BorderSizePixel = 0
	btn.Font = Enum.Font.Oswald
	btn.Text = name
	btn.TextColor3 = Color3.fromRGB(255, 255, 255)
	btn.TextSize = 18
	btn.LayoutOrder = layoutOrder
	btn.Parent = tabButtonsContainer
	
	local content = Instance.new("Frame")
	content.Name = name
	content.BackgroundTransparency = 1
	content.Size = UDim2.new(1, 0, 1, 0)
	content.Visible = false
	content.Parent = tabContentContainer
	
	tabs[name] = content
	buttons[name] = btn
end

createTab("Home", 1)
createTab("ESP", 2)
createTab("AFKFarm", 3)
createTab("Character", 4)
createTab("Gameplay", 5)

local function switchTabs(targetName)
	for name, content in pairs(tabs) do
		if name == targetName then
			content.Visible = true
			buttons[name].BackgroundColor3 = Color3.fromRGB(50, 50, 50)
		else
			content.Visible = false
			buttons[name].BackgroundColor3 = Color3.fromRGB(70, 70, 70)
		end
	end
end

for name, btn in pairs(buttons) do
	btn.MouseButton1Click:Connect(function()
		switchTabs(name)
	end)
end

switchTabs("Home")

local homeLabel1 = Instance.new("TextLabel")
homeLabel1.BackgroundTransparency = 1
homeLabel1.Size = UDim2.new(1, 0, 0.2, 0)
homeLabel1.Font = Enum.Font.Oswald
homeLabel1.Text = "S1rota Script"
homeLabel1.TextColor3 = Color3.fromRGB(255, 255, 255)
homeLabel1.TextSize = 28
homeLabel1.Parent = tabs["Home"]

local homeLabel2 = Instance.new("TextLabel")
homeLabel2.BackgroundTransparency = 1
homeLabel2.Position = UDim2.new(0, 0, 0.15, 0)
homeLabel2.Size = UDim2.new(1, 0, 0.1, 0)
homeLabel2.Font = Enum.Font.Oswald
homeLabel2.Text = "by notrip42"
homeLabel2.TextColor3 = Color3.fromRGB(255, 255, 255)
homeLabel2.TextSize = 28
homeLabel2.Parent = tabs["Home"]

local homeLabel3 = Instance.new("TextLabel")
homeLabel3.BackgroundTransparency = 1
homeLabel3.Position = UDim2.new(0, 0, 0.3, 0)
homeLabel3.Size = UDim2.new(1, 0, 0.1, 0)
homeLabel3.Font = Enum.Font.Oswald
homeLabel3.Text = "Enjoy! ;)"
homeLabel3.TextColor3 = Color3.fromRGB(255, 255, 255)
homeLabel3.TextSize = 28
homeLabel3.Parent = tabs["Home"]

local espPage = tabs["ESP"]

local toggleButton = Instance.new("TextButton")
toggleButton.Name = "Toggle"
toggleButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
toggleButton.BorderSizePixel = 0
toggleButton.Position = UDim2.new(0.05, 0, 0.05, 0)
toggleButton.Size = UDim2.new(0.4, 0, 0.2, 0)
toggleButton.Font = Enum.Font.Oswald
toggleButton.Text = "Toggle ESP"
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.TextSize = 24
toggleButton.Parent = espPage

local inputsFrame = Instance.new("Frame")
inputsFrame.Name = "InputsFrame"
inputsFrame.BackgroundTransparency = 1
inputsFrame.Position = UDim2.new(0.5, 0, 0.05, 0)
inputsFrame.Size = UDim2.new(0.45, 0, 0.9, 0)
inputsFrame.Parent = espPage

local inputsLayout = Instance.new("UIListLayout")
inputsLayout.Padding = UDim.new(0, 5)
inputsLayout.SortOrder = Enum.SortOrder.LayoutOrder
inputsLayout.Parent = inputsFrame

local function createConfigBox(name, placeholder, order)
	local box = Instance.new("TextBox")
	box.Name = name
	box.Size = UDim2.new(1, 0, 0, 30)
	box.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	box.BorderSizePixel = 0
	box.Font = Enum.Font.SourceSans
	box.PlaceholderText = placeholder
	box.Text = ""
	box.TextColor3 = Color3.fromRGB(255, 255, 255)
	box.TextSize = 14
	box.LayoutOrder = order
	box.Parent = inputsFrame
	return box
end

local innocentInput = createConfigBox("InnocentColor", "Innocent RGB (e.g. 0,0,255)", 1)
local sheriffInput = createConfigBox("SheriffColor", "Sheriff RGB (e.g. 0,255,0)", 2)
local murdererInput = createConfigBox("MurdererColor", "Murderer RGB (e.g. 255,0,0)", 3)

local applyButton = Instance.new("TextButton")
applyButton.Name = "ApplyColors"
applyButton.Size = UDim2.new(1, 0, 0, 35)
applyButton.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
applyButton.BorderSizePixel = 0
applyButton.Font = Enum.Font.SourceSansBold
applyButton.Text = "Apply Colors"
applyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
applyButton.TextSize = 16
applyButton.LayoutOrder = 4
applyButton.Parent = inputsFrame

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
		highlight.Parent = character
	end
	highlight.FillColor = roleColor
	highlight.FillTransparency = 0.5
	highlight.OutlineColor = roleColor
	highlight.OutlineTransparency = 0
	highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop 
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
		toggleButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
		for character, _ in pairs(activeHighlights) do
			removeVisualsFromCharacter(character)
		end
		table.clear(activeHighlights)
		table.clear(activeBeams)
	end
end)
