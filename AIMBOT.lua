--==================================================
-- DYV HUB - MOBILE EDITION
-- Sidebar + Players + Funções + IAs + Créditos
--==================================================

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local GREEN = Color3.fromRGB(50, 255, 120)
local DARK = Color3.fromRGB(8, 12, 10)
local BLACK = Color3.fromRGB(3, 5, 4)
local RED = Color3.fromRGB(255, 80, 80)

--==================================================
-- GUI
--==================================================

local gui = Instance.new("ScreenGui")
gui.Name = "DYV_HUB"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.Parent = playerGui

--==================================================
-- INTRO
--==================================================

local intro = Instance.new("Frame")
intro.Size = UDim2.fromScale(1, 1)
intro.BackgroundColor3 = BLACK
intro.BackgroundTransparency = 1
intro.ZIndex = 999
intro.Parent = gui

local introText = Instance.new("TextLabel")
introText.Size = UDim2.fromScale(1, 1)
introText.BackgroundTransparency = 1
introText.Text = "DYV HUB"
introText.TextColor3 = GREEN
introText.TextScaled = true
introText.Font = Enum.Font.GothamBold
introText.TextTransparency = 1
introText.ZIndex = 1000
introText.Parent = gui

TweenService:Create(intro, TweenInfo.new(1.5), {BackgroundTransparency = 0}):Play()
TweenService:Create(introText, TweenInfo.new(1.5), {TextTransparency = 0}):Play()
task.wait(5)
TweenService:Create(intro, TweenInfo.new(1.5), {BackgroundTransparency = 1}):Play()
TweenService:Create(introText, TweenInfo.new(1.5), {TextTransparency = 1}):Play()
task.wait(1.6)
intro:Destroy()
introText:Destroy()

--==================================================
-- MENSAGENS DE BOAS-VINDAS
--==================================================

task.spawn(function()
	local container = Instance.new("Frame")
	container.Size = UDim2.fromOffset(280, 105)
	container.Position = UDim2.fromOffset(15, 15)
	container.BackgroundTransparency = 1
	container.ZIndex = 100
	container.Parent = gui

	local layout = Instance.new("UIListLayout")
	layout.Padding = UDim.new(0, 5)
	layout.SortOrder = Enum.SortOrder.LayoutOrder
	layout.Parent = container

	local mensagens = {
		"✋  você executou DYV HUB",
		"⚠️  use com moderação",
		"💬  discord: https://discord.gg/4RqVr27N"
	}

	local labels = {}

	for i, msg in ipairs(mensagens) do
		local label = Instance.new("TextLabel")
		label.Size = UDim2.fromOffset(280, 25)
		label.BackgroundColor3 = BLACK
		label.BackgroundTransparency = 1
		label.Text = msg
		label.TextColor3 = GREEN
		label.TextSize = 13
		label.Font = Enum.Font.GothamBold
		label.TextXAlignment = Enum.TextXAlignment.Left
		label.TextTransparency = 1
		label.ZIndex = 101
		label.LayoutOrder = i
		label.Parent = container

		local corner = Instance.new("UICorner")
		corner.CornerRadius = UDim.new(0, 8)
		corner.Parent = label

		local stroke = Instance.new("UIStroke")
		stroke.Color = GREEN
		stroke.Thickness = 1
		stroke.Transparency = 1
		stroke.Parent = label

		table.insert(labels, {label = label, stroke = stroke})
	end

	for i, obj in ipairs(labels) do
		task.spawn(function()
			task.wait((i - 1) * 0.4)
			TweenService:Create(obj.label, TweenInfo.new(0.6), {
				TextTransparency = 0.15,
				BackgroundTransparency = 0.55
			}):Play()
			TweenService:Create(obj.stroke, TweenInfo.new(0.6), {Transparency = 0.4}):Play()
		end)
	end

	task.wait(10)

	for i, obj in ipairs(labels) do
		task.spawn(function()
			task.wait((i - 1) * 0.2)
			TweenService:Create(obj.label, TweenInfo.new(1), {
				TextTransparency = 1,
				BackgroundTransparency = 1
			}):Play()
			TweenService:Create(obj.stroke, TweenInfo.new(1), {Transparency = 1}):Play()
		end)
	end

	task.wait(2)
	container:Destroy()
end)

--==================================================
-- MENU PRINCIPAL
--==================================================

local main = Instance.new("Frame")
main.Size = UDim2.fromOffset(100, 80)
main.Position = UDim2.fromScale(0.5, 0.5)
main.AnchorPoint = Vector2.new(0.5, 0.5)
main.BackgroundColor3 = DARK
main.Parent = gui

TweenService:Create(main, TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
	Size = UDim2.fromOffset(600, 360)
}):Play()

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 18)
mainCorner.Parent = main

local gradient = Instance.new("UIGradient")
gradient.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(12, 25, 18)),
	ColorSequenceKeypoint.new(1, DARK),
})
gradient.Rotation = 45
gradient.Parent = main

local mainStroke = Instance.new("UIStroke")
mainStroke.Color = GREEN
mainStroke.Thickness = 1.5
mainStroke.Transparency = 0.3
mainStroke.Parent = main

task.spawn(function()
	while mainStroke.Parent do
		for i = 0, 1, 0.05 do
			mainStroke.Transparency = 0.3 + (0.4 * i)
			task.wait(0.03)
		end
		for i = 0, 1, 0.05 do
			mainStroke.Transparency = 0.7 - (0.4 * i)
			task.wait(0.03)
		end
	end
end)

--==================================================
-- SIDEBAR
--==================================================

local sidebar = Instance.new("Frame")
sidebar.Size = UDim2.fromOffset(160, 1)
sidebar.Position = UDim2.fromOffset(0, 0)
sidebar.BackgroundColor3 = BLACK
sidebar.BackgroundTransparency = 0.4
sidebar.BorderSizePixel = 0
sidebar.Parent = main

task.spawn(function()
	task.wait(0.7)
	sidebar.Size = UDim2.new(0, 160, 1, 0)
end)

local sidebarCorner = Instance.new("UICorner")
sidebarCorner.CornerRadius = UDim.new(0, 18)
sidebarCorner.Parent = sidebar

local sidebarTitle = Instance.new("TextLabel")
sidebarTitle.Size = UDim2.new(1, 0, 0, 45)
sidebarTitle.Position = UDim2.fromOffset(0, 10)
sidebarTitle.BackgroundTransparency = 1
sidebarTitle.Text = "DYV HUB"
sidebarTitle.TextColor3 = GREEN
sidebarTitle.TextSize = 18
sidebarTitle.Font = Enum.Font.GothamBold
sidebarTitle.Parent = sidebar

local sidebarLine = Instance.new("Frame")
sidebarLine.Size = UDim2.new(1, -30, 0, 2)
sidebarLine.Position = UDim2.fromOffset(15, 52)
sidebarLine.BackgroundColor3 = GREEN
sidebarLine.BorderSizePixel = 0
sidebarLine.Parent = sidebar

local sidebarLineGrad = Instance.new("UIGradient")
sidebarLineGrad.Transparency = NumberSequence.new({
	NumberSequenceKeypoint.new(0, 0),
	NumberSequenceKeypoint.new(0.5, 0.2),
	NumberSequenceKeypoint.new(1, 1),
})
sidebarLineGrad.Parent = sidebarLine

--==================================================
-- ÁREA DE CONTEÚDO
--==================================================

local content = Instance.new("Frame")
content.Size = UDim2.new(1, -175, 1, -20)
content.Position = UDim2.fromOffset(165, 10)
content.BackgroundTransparency = 1
content.Parent = main

local contentTitle = Instance.new("TextLabel")
contentTitle.Size = UDim2.new(1, -20, 0, 35)
contentTitle.Position = UDim2.fromOffset(10, 0)
contentTitle.BackgroundTransparency = 1
contentTitle.Text = "PLAYERS"
contentTitle.TextColor3 = GREEN
contentTitle.TextSize = 16
contentTitle.Font = Enum.Font.GothamBold
contentTitle.TextXAlignment = Enum.TextXAlignment.Left
contentTitle.Parent = content

local contentLine = Instance.new("Frame")
contentLine.Size = UDim2.new(1, -20, 0, 2)
contentLine.Position = UDim2.fromOffset(10, 38)
contentLine.BackgroundColor3 = GREEN
contentLine.BorderSizePixel = 0
contentLine.Parent = content

local contentLineGrad = Instance.new("UIGradient")
contentLineGrad.Transparency = NumberSequence.new({
	NumberSequenceKeypoint.new(0, 0),
	NumberSequenceKeypoint.new(0.5, 0.2),
	NumberSequenceKeypoint.new(1, 1),
})
contentLineGrad.Parent = contentLine

local contentArea = Instance.new("Frame")
contentArea.Size = UDim2.new(1, -20, 1, -50)
contentArea.Position = UDim2.fromOffset(10, 45)
contentArea.BackgroundTransparency = 1
contentArea.ClipsDescendants = true
contentArea.Parent = content

--==================================================
-- SISTEMA DE ABAS
--==================================================

local sidebarButtons = {}

local function clearContent()
	for _, child in ipairs(contentArea:GetChildren()) do
		child:Destroy()
	end
end

local function selectTab(index, titulo)
	for i, data in ipairs(sidebarButtons) do
		if i == index then
			TweenService:Create(data.btn, TweenInfo.new(0.25), {BackgroundTransparency = 0.5}):Play()
			TweenService:Create(data.stroke, TweenInfo.new(0.25), {Transparency = 0}):Play()
			data.btn.TextColor3 = GREEN
		else
			TweenService:Create(data.btn, TweenInfo.new(0.25), {BackgroundTransparency = 1}):Play()
			TweenService:Create(data.stroke, TweenInfo.new(0.25), {Transparency = 1}):Play()
			data.btn.TextColor3 = Color3.fromRGB(140, 180, 155)
		end
	end
	contentTitle.Text = titulo
	clearContent()
end

local function createSidebarButton(text, y, callback)
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(1, -20, 0, 38)
	btn.Position = UDim2.fromOffset(10, y)
	btn.BackgroundColor3 = BLACK
	btn.BackgroundTransparency = 1
	btn.Text = "   " .. text
	btn.TextColor3 = Color3.fromRGB(140, 180, 155)
	btn.TextSize = 14
	btn.Font = Enum.Font.GothamBold
	btn.TextXAlignment = Enum.TextXAlignment.Left
	btn.AutoButtonColor = false
	btn.Parent = sidebar

	local btnCorner = Instance.new("UICorner")
	btnCorner.CornerRadius = UDim.new(0, 10)
	btnCorner.Parent = btn

	local btnStroke = Instance.new("UIStroke")
	btnStroke.Color = GREEN
	btnStroke.Thickness = 1
	btnStroke.Transparency = 1
	btnStroke.Parent = btn

	btn.MouseEnter:Connect(function()
		if btnStroke.Transparency > 0.5 then
			TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundTransparency = 0.75}):Play()
		end
	end)
	btn.MouseLeave:Connect(function()
		if btnStroke.Transparency > 0.5 then
			TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundTransparency = 1}):Play()
		end
	end)

	btn.MouseButton1Click:Connect(callback)
	table.insert(sidebarButtons, {btn = btn, stroke = btnStroke})
	return btn
end

--==================================================
-- FUNÇÕES REUTILIZÁVEIS
--==================================================

local function inputBox(titulo, placeholder, callback)
	local panel = Instance.new("Frame")
	panel.Size = UDim2.fromOffset(300, 130)
	panel.Position = UDim2.fromScale(0.5, 0.5)
	panel.AnchorPoint = Vector2.new(0.5, 0.5)
	panel.BackgroundColor3 = DARK
	panel.ZIndex = 90
	panel.Parent = gui

	local pc = Instance.new("UICorner"); pc.CornerRadius = UDim.new(0, 14); pc.Parent = panel
	local ps = Instance.new("UIStroke"); ps.Color = GREEN; ps.Thickness = 1.5; ps.Transparency = 0.3; ps.Parent = panel

	local title = Instance.new("TextLabel")
	title.Size = UDim2.new(1, -20, 0, 30)
	title.Position = UDim2.fromOffset(10, 5)
	title.BackgroundTransparency = 1
	title.Text = titulo
	title.TextColor3 = GREEN
	title.TextSize = 14
	title.Font = Enum.Font.GothamBold
	title.TextXAlignment = Enum.TextXAlignment.Left
	title.ZIndex = 91
	title.Parent = panel

	local close = Instance.new("TextButton")
	close.Size = UDim2.fromOffset(30, 30)
	close.Position = UDim2.new(1, -35, 0, 5)
	close.BackgroundTransparency = 1
	close.Text = "X"
	close.TextColor3 = GREEN
	close.TextSize = 14
	close.Font = Enum.Font.GothamBold
	close.ZIndex = 91
	close.Parent = panel
	close.MouseButton1Click:Connect(function() panel:Destroy() end)

	local input = Instance.new("TextBox")
	input.Size = UDim2.new(1, -20, 0, 40)
	input.Position = UDim2.fromOffset(10, 40)
	input.BackgroundColor3 = BLACK
	input.TextColor3 = GREEN
	input.PlaceholderText = placeholder
	input.PlaceholderColor3 = Color3.fromRGB(130,130,130)
	input.TextSize = 14
	input.Font = Enum.Font.Gotham
	input.ClearTextOnFocus = false
	input.ZIndex = 91
	input.Parent = panel
	local ic = Instance.new("UICorner"); ic.CornerRadius = UDim.new(0, 10); ic.Parent = input

	local confirm = Instance.new("TextButton")
	confirm.Size = UDim2.new(1, -20, 0, 35)
	confirm.Position = UDim2.fromOffset(10, 88)
	confirm.BackgroundColor3 = BLACK
	confirm.Text = "CONFIRMAR"
	confirm.TextColor3 = GREEN
	confirm.TextSize = 14
	confirm.Font = Enum.Font.GothamBold
	confirm.ZIndex = 91
	confirm.Parent = panel
	local cfc = Instance.new("UICorner"); cfc.CornerRadius = UDim.new(0, 10); cfc.Parent = confirm
	local cfs = Instance.new("UIStroke"); cfs.Color = GREEN; cfs.Thickness = 1; cfs.Parent = confirm

	input:CaptureFocus()
	confirm.MouseButton1Click:Connect(function()
		callback(input.Text)
		panel:Destroy()
	end)
end

local function findPlayer(text)
	text = text:lower()
	if #text < 4 then return nil end
	for _, target in ipairs(Players:GetPlayers()) do
		if target ~= player then
			if target.Name:lower():sub(1, #text) == text
				or target.DisplayName:lower():sub(1, #text) == text then
				return target
			end
		end
	end
	return nil
end

--==================================================
-- ABA: PLAYERS
--==================================================

local selectedPlayer = nil
local playerRows = {}

local function buildPlayersList()

	clearContent()
	playerRows = {}
	selectedPlayer = nil

	local scrollP = Instance.new("ScrollingFrame")
	scrollP.Size = UDim2.new(1, 0, 1, -60)
	scrollP.BackgroundTransparency = 1
	scrollP.BorderSizePixel = 0
	scrollP.ScrollBarThickness = 4
	scrollP.ScrollBarImageColor3 = GREEN
	scrollP.CanvasSize = UDim2.new(0, 0, 0, 0)
	scrollP.AutomaticCanvasSize = Enum.AutomaticSize.Y
	scrollP.Parent = contentArea

	local listLayout = Instance.new("UIListLayout")
	listLayout.Padding = UDim.new(0, 6)
	listLayout.Parent = scrollP

	local titleList = Instance.new("TextLabel")
	titleList.Size = UDim2.new(1, 0, 0, 22)
	titleList.BackgroundTransparency = 1
	titleList.Text = "PLAYERS NO SERVIDOR"
	titleList.TextColor3 = GREEN
	titleList.TextSize = 12
	titleList.Font = Enum.Font.GothamBold
	titleList.TextXAlignment = Enum.TextXAlignment.Left
	titleList.LayoutOrder = 0
	titleList.Parent = scrollP

	for _, target in ipairs(Players:GetPlayers()) do
		if target ~= player then
			local row = Instance.new("TextButton")
			row.Size = UDim2.new(1, -6, 0, 40)
			row.BackgroundColor3 = BLACK
			row.Text = "   " .. target.Name
			row.TextColor3 = GREEN
			row.TextSize = 13
			row.Font = Enum.Font.GothamBold
			row.TextXAlignment = Enum.TextXAlignment.Left
			row.AutoButtonColor = false
			row.Parent = scrollP

			local rc = Instance.new("UICorner"); rc.CornerRadius = UDim.new(0, 10); rc.Parent = row
			local rs = Instance.new("UIStroke"); rs.Color = GREEN; rs.Thickness = 1; rs.Transparency = 0.5; rs.Parent = row

			row.MouseButton1Click:Connect(function()
				for _, r in ipairs(playerRows) do
					TweenService:Create(r.row, TweenInfo.new(0.2), {BackgroundColor3 = BLACK}):Play()
					TweenService:Create(r.stroke, TweenInfo.new(0.2), {Transparency = 0.5}):Play()
				end
				TweenService:Create(row, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(15, 45, 25)}):Play()
				TweenService:Create(rs, TweenInfo.new(0.2), {Transparency = 0}):Play()
				selectedPlayer = target

				local btn = contentArea:FindFirstChild("TeleportBtn")
				if btn then btn.Text = "◉  TELEPORTAR PARA " .. target.Name end
			end)

			table.insert(playerRows, {row = row, stroke = rs, target = target})
		end
	end

	local teleportBtn = Instance.new("TextButton")
	teleportBtn.Name = "TeleportBtn"
	teleportBtn.Size = UDim2.new(1, 0, 0, 48)
	teleportBtn.Position = UDim2.new(0, 0, 1, -52)
	teleportBtn.BackgroundColor3 = BLACK
	teleportBtn.Text = "◉  TELEPORTAR"
	teleportBtn.TextColor3 = GREEN
	teleportBtn.TextSize = 14
	teleportBtn.Font = Enum.Font.GothamBold
	teleportBtn.AutoButtonColor = false
	teleportBtn.ZIndex = 5
	teleportBtn.Parent = contentArea

	local tbc = Instance.new("UICorner"); tbc.CornerRadius = UDim.new(0, 12); tbc.Parent = teleportBtn
	local tbs = Instance.new("UIStroke"); tbs.Color = GREEN; tbs.Thickness = 1.5; tbs.Transparency = 0.2; tbs.Parent = teleportBtn

	teleportBtn.MouseEnter:Connect(function()
		TweenService:Create(teleportBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(15, 45, 25)}):Play()
	end)
	teleportBtn.MouseLeave:Connect(function()
		TweenService:Create(teleportBtn, TweenInfo.new(0.2), {BackgroundColor3 = BLACK}):Play()
	end)

	teleportBtn.MouseButton1Click:Connect(function()
		if not selectedPlayer then
			teleportBtn.Text = "⚠️ ESCOLHA UM PLAYER"
			task.wait(1.5)
			teleportBtn.Text = "◉  TELEPORTAR"
			return
		end
		local myChar = player.Character
		local tChar = selectedPlayer.Character
		if myChar and tChar then
			local myRoot = myChar:FindFirstChild("HumanoidRootPart")
			local tRoot = tChar:FindFirstChild("HumanoidRootPart")
			if myRoot and tRoot then
				myRoot.CFrame = tRoot.CFrame + Vector3.new(0, 3, 0)
				teleportBtn.Text = "✔  TELEPORTADO!"
				task.wait(1.5)
				teleportBtn.Text = "◉  TELEPORTAR PARA " .. selectedPlayer.Name
			end
		end
	end)
end

--==================================================
-- ABA: FUNÇÕES
--==================================================

local function buildFunctions()

	clearContent()
	task.wait(0.1)

	local grid = Instance.new("ScrollingFrame")
	grid.Size = UDim2.new(1, 0, 1, 0)
	grid.Position = UDim2.fromOffset(0, 0)
	grid.BackgroundTransparency = 1
	grid.BorderSizePixel = 0
	grid.ScrollBarThickness = 4
	grid.ScrollBarImageColor3 = GREEN
	grid.CanvasSize = UDim2.new(0, 0, 0, 250)
	grid.ZIndex = 1
	grid.Parent = contentArea

	local gridLayout = Instance.new("UIGridLayout")
	gridLayout.CellSize = UDim2.new(0.5, -8, 0, 48)
	gridLayout.CellPadding = UDim.new(0, 8, 0, 8)
	gridLayout.SortOrder = Enum.SortOrder.LayoutOrder
	gridLayout.Parent = grid

	local function makeBtn(text)
		local b = Instance.new("TextButton")
		b.Size = UDim2.new(0.5, -8, 0, 48)
		b.BackgroundColor3 = BLACK
		b.Text = text
		b.TextColor3 = GREEN
		b.TextSize = 13
		b.Font = Enum.Font.GothamBold
		b.AutoButtonColor = false
		b.ZIndex = 5
		b.Parent = grid

		local c = Instance.new("UICorner")
		c.CornerRadius = UDim.new(0, 12)
		c.Parent = b

		local s = Instance.new("UIStroke")
		s.Color = GREEN
		s.Thickness = 1
		s.Transparency = 0.4
		s.Parent = b

		b.MouseEnter:Connect(function()
			TweenService:Create(b, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(15, 35, 22)}):Play()
		end)
		b.MouseLeave:Connect(function()
			TweenService:Create(b, TweenInfo.new(0.2), {BackgroundColor3 = BLACK}):Play()
		end)

		return b
	end

	local flyBtn    = makeBtn("✈  FLY")
	local speedBtn  = makeBtn("⚡  SPEED")
	local followBtn = makeBtn("👥  SEGUIR")
	local viewBtn   = makeBtn("👁  VER PLAYER")
	local calcBtn   = makeBtn("▣  CALCULADORA")
	local emoteBtn  = makeBtn("💃  EMOTES")

	-- FLY
	local flying = false
	local flyVelocity
	local flyConnection

	local flyControls = Instance.new("Frame")
	flyControls.Size = UDim2.fromOffset(170, 130)
	flyControls.Position = UDim2.new(0, 20, 1, -150)
	flyControls.BackgroundTransparency = 1
	flyControls.Visible = false
	flyControls.ZIndex = 95
	flyControls.Parent = gui

	local function flyControl(text, pos)
		local b = Instance.new("TextButton")
		b.Size = UDim2.fromOffset(55, 45)
		b.Position = pos
		b.BackgroundColor3 = BLACK
		b.Text = text
		b.TextColor3 = GREEN
		b.TextSize = 20
		b.Font = Enum.Font.GothamBold
		b.ZIndex = 96
		b.Parent = flyControls
		local c = Instance.new("UICorner"); c.CornerRadius = UDim.new(0, 12); c.Parent = b
		local s = Instance.new("UIStroke"); s.Color = GREEN; s.Thickness = 1; s.Parent = b
		return b
	end

	local upBtn    = flyControl("▲", UDim2.fromOffset(58, 0))
	local leftBtn  = flyControl("◀", UDim2.fromOffset(0, 48))
	local downBtn  = flyControl("▼", UDim2.fromOffset(58, 48))
	local rightBtn = flyControl("▶", UDim2.fromOffset(116, 48))

	local goingUp, goingDown, moveLeft, moveRight = false, false, false, false

	upBtn.MouseButton1Down:Connect(function() goingUp = true end)
	upBtn.MouseButton1Up:Connect(function() goingUp = false end)
	downBtn.MouseButton1Down:Connect(function() goingDown = true end)
	downBtn.MouseButton1Up:Connect(function() goingDown = false end)
	leftBtn.MouseButton1Down:Connect(function() moveLeft = true end)
	leftBtn.MouseButton1Up:Connect(function() moveLeft = false end)
	rightBtn.MouseButton1Down:Connect(function() moveRight = true end)
	rightBtn.MouseButton1Up:Connect(function() moveRight = false end)

	flyBtn.MouseButton1Click:Connect(function()
		flying = not flying
		local char = player.Character
		if not char then return end
		local root = char:FindFirstChild("HumanoidRootPart")
		local hum = char:FindFirstChildOfClass("Humanoid")
		if not root or not hum then return end

		if flying then
			flyBtn.Text = "✈  FLY: ON"
			flyControls.Visible = true
			flyVelocity = Instance.new("BodyVelocity")
			flyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
			flyVelocity.Velocity = Vector3.zero
			flyVelocity.Parent = root
			hum.PlatformStand = true

			flyConnection = RunService.RenderStepped:Connect(function()
				if not flying or not root.Parent then return end
				local cam = workspace.CurrentCamera
				local vel = Vector3.zero
				vel += cam.CFrame.LookVector * 45
				if moveLeft then vel -= cam.CFrame.RightVector * 35 end
				if moveRight then vel += cam.CFrame.RightVector * 35 end
				if goingUp then vel += Vector3.new(0, 40, 0) end
				if goingDown then vel -= Vector3.new(0, 40, 0) end
				flyVelocity.Velocity = vel
				local look = cam.CFrame.LookVector
				root.CFrame = CFrame.new(root.Position, root.Position + Vector3.new(look.X, 0, look.Z))
			end)
		else
			flyBtn.Text = "✈  FLY"
			flyControls.Visible = false
			if flyConnection then flyConnection:Disconnect() end
			if flyVelocity then flyVelocity:Destroy() end
			hum.PlatformStand = false
		end
	end)

	-- SPEED
	speedBtn.MouseButton1Click:Connect(function()
		inputBox("DIGITE A VELOCIDADE", "Ex: 100", function(texto)
			local value = tonumber(texto)
			if value then
				local char = player.Character
				if char then
					local hum = char:FindFirstChildOfClass("Humanoid")
					if hum then hum.WalkSpeed = value end
				end
				speedBtn.Text = "⚡  SPEED: " .. value
			end
		end)
	end)

	-- SEGUIR
	local following = false
	local followConn

	followBtn.MouseButton1Click:Connect(function()
		if following then
			following = false
			if followConn then followConn:Disconnect() end
			followBtn.Text = "👥  SEGUIR"
			return
		end
		inputBox("SEGUIR PLAYER", "Nick do player", function(texto)
			local target = findPlayer(texto)
			if target then
				following = true
				followBtn.Text = "👥  SEG: " .. target.Name
				followConn = RunService.Heartbeat:Connect(function()
					if not following then return end
					local myChar = player.Character
					local tChar = target.Character
					if not myChar or not tChar then return end
					local myRoot = myChar:FindFirstChild("HumanoidRootPart")
					local tRoot = tChar:FindFirstChild("HumanoidRootPart")
					if myRoot and tRoot then
						myRoot.CFrame = myRoot.CFrame:Lerp(tRoot.CFrame * CFrame.new(0, 0, 4), 0.15)
					end
				end)
			end
		end)
	end)

	-- VER PLAYER
	local viewing = false
	local viewConn

	viewBtn.MouseButton1Click:Connect(function()
		if viewing then
			viewing = false
			if viewConn then viewConn:Disconnect() end
			workspace.CurrentCamera.CameraSubject = player.Character and player.Character:FindFirstChildOfClass("Humanoid") or nil
			viewBtn.Text = "👁  VER PLAYER"
			return
		end
		inputBox("VER PLAYER", "Nick do player", function(texto)
			local target = findPlayer(texto)
			if target and target.Character then
				local hum = target.Character:FindFirstChildOfClass("Humanoid")
				if hum then
					viewing = true
					workspace.CurrentCamera.CameraSubject = hum
					viewBtn.Text = "👁  VER: " .. target.Name
					if viewConn then viewConn:Disconnect() end
					viewConn = RunService.RenderStepped:Connect(function()
						if not viewing then return end
						local c = target.Character
						if c then
							local h = c:FindFirstChildOfClass("Humanoid")
							if h then workspace.CurrentCamera.CameraSubject = h end
						end
					end)
				end
			end
		end)
	end)

	-- CALCULADORA
	calcBtn.MouseButton1Click:Connect(function()
		local panel = Instance.new("Frame")
		panel.Size = UDim2.fromOffset(280, 220)
		panel.Position = UDim2.fromScale(0.5, 0.5)
		panel.AnchorPoint = Vector2.new(0.5, 0.5)
		panel.BackgroundColor3 = DARK
		panel.ZIndex = 90
		panel.Parent = gui

		local pc = Instance.new("UICorner"); pc.CornerRadius = UDim.new(0, 14); pc.Parent = panel
		local ps = Instance.new("UIStroke"); ps.Color = GREEN; ps.Thickness = 1.5; ps.Transparency = 0.3; ps.Parent = panel

		local inp = Instance.new("TextBox")
		inp.Size = UDim2.new(1, -20, 0, 45)
		inp.Position = UDim2.fromOffset(10, 20)
		inp.BackgroundColor3 = BLACK
		inp.TextColor3 = GREEN
		inp.PlaceholderText = "Ex: 10 * 5"
		inp.PlaceholderColor3 = Color3.fromRGB(130,130,130)
		inp.TextSize = 16
		inp.Font = Enum.Font.Gotham
		inp.ZIndex = 91
		inp.Parent = panel
		local ic = Instance.new("UICorner"); ic.CornerRadius = UDim.new(0, 10); ic.Parent = inp

		local res = Instance.new("TextLabel")
		res.Size = UDim2.new(1, -20, 0, 40)
		res.Position = UDim2.fromOffset(10, 75)
		res.BackgroundTransparency = 1
		res.Text = "Resultado: —"
		res.TextColor3 = GREEN
		res.TextSize = 18
		res.Font = Enum.Font.GothamBold
		res.ZIndex = 91
		res.Parent = panel

		local calcBtn2 = Instance.new("TextButton")
		calcBtn2.Size = UDim2.new(1, -20, 0, 40)
		calcBtn2.Position = UDim2.fromOffset(10, 125)
		calcBtn2.BackgroundColor3 = BLACK
		calcBtn2.Text = "CALCULAR"
		calcBtn2.TextColor3 = GREEN
		calcBtn2.TextSize = 14
		calcBtn2.Font = Enum.Font.GothamBold
		calcBtn2.ZIndex = 91
		calcBtn2.Parent = panel
		local cc = Instance.new("UICorner"); cc.CornerRadius = UDim.new(0, 10); cc.Parent = calcBtn2
		local cs = Instance.new("UIStroke"); cs.Color = GREEN; cs.Thickness = 1; cs.Parent = calcBtn2

		local close = Instance.new("TextButton")
		close.Size = UDim2.fromOffset(30, 30)
		close.Position = UDim2.new(1, -35, 0, 5)
		close.BackgroundTransparency = 1
		close.Text = "X"
		close.TextColor3 = GREEN
		close.TextSize = 14
		close.Font = Enum.Font.GothamBold
		close.ZIndex = 91
		close.Parent = panel
		close.MouseButton1Click:Connect(function() panel:Destroy() end)

		calcBtn2.MouseButton1Click:Connect(function()
			local t = inp.Text:gsub("×", "*"):gsub("÷", "/")
			local a, op, b = t:match("^%s*(-?[%d%.]+)%s*([%+%-%*/])%s*(-?[%d%.]+)%s*$")
			if a and op and b then
				a = tonumber(a); b = tonumber(b)
				local ans
				if op == "+" then ans = a + b
				elseif op == "-" then ans = a - b
				elseif op == "*" then ans = a * b
				elseif op == "/" then if b ~= 0 then ans = a / b end end
				res.Text = "Resultado: " .. (ans or "inválido")
			else
				res.Text = "Resultado: inválido"
			end
		end)
	end)

	-- EMOTES
	local freeEmotes = {
		{name = "Scuba", id = 98089581420752},
		{name = "Dança Nervosa", id = 125328720114284},
		{name = "Yungblud", id = 15610015346},
		{name = "Dança de Fúria", id = 92849748107049},
		{name = "Michael Myers", id = 120728157712439},
		{name = "Pegue o L", id = 86830387246209},
		{name = "Aura Fácil", id = 101573394483995},
		{name = "Jamal OG", id = 137057022541237},
		{name = "Parede Aura", id = 118853736905967},
		{name = "Flexão Rápida", id = 114319678441531},
		{name = "Funk Brasileiro", id = 110099433569655},
		{name = "Jogadinha Malfalado", id = 87884932747690},
		{name = "Jamal Groove", id = 104131847054135},
		{name = "Saída", id = 101289807932349},
	}

	local function playEmote(animId)
		local char = player.Character
		if not char then return end
		local hum = char:FindFirstChildOfClass("Humanoid")
		if not hum then return end
		local anim = hum:FindFirstChildOfClass("Animator")
		if not anim then anim = Instance.new("Animator"); anim.Parent = hum end
		for _, t in pairs(anim:GetPlayingAnimationTracks()) do t:Stop() end
		local a = Instance.new("Animation")
		a.AnimationId = "rbxassetid://" .. animId
		local ok, l = pcall(function() return anim:LoadAnimation(a) end)
		if ok and l then l:Play() end
	end

	emoteBtn.MouseButton1Click:Connect(function()
		local panel = Instance.new("Frame")
		panel.Size = UDim2.fromOffset(480, 340)
		panel.Position = UDim2.fromScale(0.5, 0.5)
		panel.AnchorPoint = Vector2.new(0.5, 0.5)
		panel.BackgroundColor3 = DARK
		panel.ZIndex = 90
		panel.Parent = gui

		local pc = Instance.new("UICorner"); pc.CornerRadius = UDim.new(0, 16); pc.Parent = panel
		local ps = Instance.new("UIStroke"); ps.Color = GREEN; ps.Thickness = 1.5; ps.Transparency = 0.3; ps.Parent = panel

		local pt = Instance.new("TextLabel")
		pt.Size = UDim2.new(1, -20, 0, 30)
		pt.Position = UDim2.fromOffset(10, 8)
		pt.BackgroundTransparency = 1
		pt.Text = "💃  EMOTES"
		pt.TextColor3 = GREEN
		pt.TextSize = 15
		pt.Font = Enum.Font.GothamBold
		pt.TextXAlignment = Enum.TextXAlignment.Left
		pt.ZIndex = 91
		pt.Parent = panel

		local close = Instance.new("TextButton")
		close.Size = UDim2.fromOffset(30, 30)
		close.Position = UDim2.new(1, -35, 0, 5)
		close.BackgroundTransparency = 1
		close.Text = "X"
		close.TextColor3 = GREEN
		close.TextSize = 14
		close.Font = Enum.Font.GothamBold
		close.ZIndex = 91
		close.Parent = panel
		close.MouseButton1Click:Connect(function() panel:Destroy() end)

		local sBox = Instance.new("TextBox")
		sBox.Size = UDim2.new(1, -20, 0, 32)
		sBox.Position = UDim2.fromOffset(10, 42)
		sBox.BackgroundColor3 = BLACK
		sBox.TextColor3 = GREEN
		sBox.PlaceholderText = "🔎 Pesquisar..."
		sBox.PlaceholderColor3 = Color3.fromRGB(130,130,130)
		sBox.TextSize = 13
		sBox.Font = Enum.Font.Gotham
		sBox.ClearTextOnFocus = false
		sBox.ZIndex = 91
		sBox.Parent = panel
		local sc = Instance.new("UICorner"); sc.CornerRadius = UDim.new(0, 10); sc.Parent = sBox

		local scrollE = Instance.new("ScrollingFrame")
		scrollE.Size = UDim2.new(1, -20, 1, -85)
		scrollE.Position = UDim2.fromOffset(10, 80)
		scrollE.BackgroundTransparency = 1
		scrollE.BorderSizePixel = 0
		scrollE.ScrollBarThickness = 4
		scrollE.ScrollBarImageColor3 = GREEN
		scrollE.CanvasSize = UDim2.new(0, 0, 0, 0)
		scrollE.AutomaticCanvasSize = Enum.AutomaticSize.Y
		scrollE.ZIndex = 91
		scrollE.Parent = panel

		local gE = Instance.new("UIGridLayout")
		gE.CellSize = UDim2.new(0, 100, 0, 100)
		gE.CellPadding = UDim2.new(0, 8, 0, 8)
		gE.Parent = scrollE

		local function build(filtro)
			for _, c in ipairs(scrollE:GetChildren()) do
				if c:IsA("TextButton") then c:Destroy() end
			end
			filtro = filtro:lower()
			for _, e in ipairs(freeEmotes) do
				if filtro == "" or e.name:lower():find(filtro, 1, true) then
					local card = Instance.new("TextButton")
					card.Size = UDim2.fromOffset(100, 100)
					card.BackgroundColor3 = BLACK
					card.Text = ""
					card.AutoButtonColor = false
					card.ZIndex = 92
					card.Parent = scrollE
					local ccc = Instance.new("UICorner"); ccc.CornerRadius = UDim.new(0, 12); ccc.Parent = card
					local ccs = Instance.new("UIStroke"); ccs.Color = GREEN; ccs.Thickness = 1; ccs.Transparency = 0.5; ccs.Parent = card

					local icon = Instance.new("ImageLabel")
					icon.Size = UDim2.new(1, -10, 0, 65)
					icon.Position = UDim2.fromOffset(5, 5)
					icon.BackgroundTransparency = 1
					icon.Image = "rbxassetid://" .. e.id
					icon.ZIndex = 93
					icon.Parent = card

					local nm = Instance.new("TextLabel")
					nm.Size = UDim2.new(1, -6, 0, 22)
					nm.Position = UDim2.new(0, 3, 1, -25)
					nm.BackgroundTransparency = 1
					nm.Text = e.name
					nm.TextColor3 = GREEN
					nm.TextSize = 11
					nm.Font = Enum.Font.GothamBold
					nm.ZIndex = 93
					nm.Parent = card

					card.MouseButton1Click:Connect(function() playEmote(e.id) end)
				end
			end
		end

		build("")
		sBox:GetPropertyChangedSignal("Text"):Connect(function() build(sBox.Text) end)
	end)
end

--==================================================
-- ABA: IAs
--==================================================

local function buildIAs()
	clearContent()

	local container = Instance.new("Frame")
	container.Size = UDim2.new(1, 0, 1, 0)
	container.BackgroundTransparency = 1
	container.Parent = contentArea

	local titulo = Instance.new("TextLabel")
	titulo.Size = UDim2.new(1, 0, 0, 25)
	titulo.BackgroundTransparency = 1
	titulo.Text = "🤖  PERGUNTE À IA"
	titulo.TextColor3 = GREEN
	titulo.TextSize = 13
	titulo.Font = Enum.Font.GothamBold
	titulo.TextXAlignment = Enum.TextXAlignment.Left
	titulo.Parent = container

	local inputIA = Instance.new("TextBox")
	inputIA.Size = UDim2.new(1, 0, 0, 40)
	inputIA.Position = UDim2.fromOffset(0, 30)
	inputIA.BackgroundColor3 = BLACK
	inputIA.TextColor3 = GREEN
	inputIA.PlaceholderText = "Ex: quem descobriu o brasil"
	inputIA.PlaceholderColor3 = Color3.fromRGB(130,130,130)
	inputIA.TextSize = 13
	inputIA.Font = Enum.Font.Gotham
	inputIA.ClearTextOnFocus = false
	inputIA.Parent = container
	local iac = Instance.new("UICorner"); iac.CornerRadius = UDim.new(0, 10); iac.Parent = inputIA
	local ias = Instance.new("UIStroke"); ias.Color = GREEN; ias.Thickness = 1; ias.Parent = inputIA

	local askBtn = Instance.new("TextButton")
	askBtn.Size = UDim2.new(1, 0, 0, 38)
	askBtn.Position = UDim2.fromOffset(0, 78)
	askBtn.BackgroundColor3 = BLACK
	askBtn.Text = "🔎  PERGUNTAR"
	askBtn.TextColor3 = GREEN
	askBtn.TextSize = 13
	askBtn.Font = Enum.Font.GothamBold
	askBtn.Parent = container
	local ac = Instance.new("UICorner"); ac.CornerRadius = UDim.new(0, 10); ac.Parent = askBtn
	local as = Instance.new("UIStroke"); as.Color = GREEN; as.Thickness = 1; as.Parent = askBtn

	local answerScroll = Instance.new("ScrollingFrame")
	answerScroll.Size = UDim2.new(1, 0, 1, -125)
	answerScroll.Position = UDim2.fromOffset(0, 125)
	answerScroll.BackgroundColor3 = BLACK
	answerScroll.BorderSizePixel = 0
	answerScroll.ScrollBarThickness = 4
	answerScroll.ScrollBarImageColor3 = GREEN
	answerScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
	answerScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
	answerScroll.Parent = container
	local asc = Instance.new("UICorner"); asc.CornerRadius = UDim.new(0, 10); asc.Parent = answerScroll

	local answer = Instance.new("TextLabel")
	answer.Size = UDim2.new(1, -16, 0, 0)
	answer.Position = UDim2.fromOffset(8, 8)
	answer.BackgroundTransparency = 1
	answer.Text = "A resposta vai aparecer aqui..."
	answer.TextColor3 = GREEN
	answer.TextSize = 13
	answer.Font = Enum.Font.Gotham
	answer.TextWrapped = true
	answer.TextYAlignment = Enum.TextYAlignment.Top
	answer.TextXAlignment = Enum.TextXAlignment.Left
	answer.AutomaticSize = Enum.AutomaticSize.Y
	answer.Parent = answerScroll

	askBtn.MouseButton1Click:Connect(function()
		local pergunta = inputIA.Text
		if not pergunta or #pergunta < 2 then
			answer.Text = "⚠️ Digite uma pergunta!"
			answer.TextColor3 = RED
			return
		end
		answer.TextColor3 = GREEN
		answer.Text = "🤖 Pensando... aguarde"
		local encoded = pergunta:gsub(" ", "%%20")
		encoded = encoded:gsub("[^%w%%%.%-%_]", function(c) return string.format("%%%02X", string.byte(c)) end)
		local url = "https://text.pollinations.ai/" .. encoded .. "?system=Responda%20em%20portugues%20de%20forma%20curta%20e%20direta."
		local ok, resultado = pcall(function() return game:HttpGet(url) end)
		if ok and resultado and #resultado > 0 then
			resultado = resultado:gsub("^%s+", ""):gsub("%s+$", "")
			if #resultado > 900 then resultado = resultado:sub(1, 900) .. "..." end
			answer.Text = "🤖 " .. resultado
		else
			answer.Text = "❌ Não consegui responder. Tenta reformular a pergunta."
			answer.TextColor3 = RED
		end
	end)
end

--==================================================
-- ABA: CRÉDITOS
--==================================================

local function buildCredits()
	clearContent()

	local credits = Instance.new("TextLabel")
	credits.Size = UDim2.new(1, 0, 1, 0)
	credits.BackgroundTransparency = 1
	credits.TextColor3 = GREEN
	credits.TextSize = 14
	credits.Font = Enum.Font.Gotham
	credits.TextWrapped = true
	credits.TextYAlignment = Enum.TextYAlignment.Top
	credits.TextXAlignment = Enum.TextXAlignment.Left
	credits.RichText = true
	credits.Parent = contentArea

	credits.Text = [[
<b>🤖  IA:</b>
<font color="rgb(50,255,120)">DeepSeek</font>
<font size="11" color="rgb(180,180,180)">Responsavel pela maioria das funcoes e scripts.</font>

<b>👑  FUNDADOR:</b>
<font color="rgb(50,255,120)">Deyvin</font>
<font size="11" color="rgb(180,180,180)">Nick: ph_deyvinn3</font>

<b>💚  MENSAGEM:</b>
<font size="12" color="rgb(50,255,120)">"Crescendo a cada dia!"</font>

<b>🔗  COMUNIDADE:</b>
<font size="11" color="rgb(180,180,180)">discord.gg/4RqVr27N</font>
]]
end

--==================================================
-- BOTÕES DO SIDEBAR
--==================================================

createSidebarButton("👥  Players", 65, function()
	selectTab(1, "PLAYERS")
	buildPlayersList()
end)

createSidebarButton("🎮  Funções", 105, function()
	selectTab(2, "FUNÇÕES")
	buildFunctions()
end)

createSidebarButton("🤖  IAs", 145, function()
	selectTab(3, "IAs")
	buildIAs()
end)

createSidebarButton("⭐  Créditos", 185, function()
	selectTab(4, "CRÉDITOS")
	buildCredits()
end)

--==================================================
-- BOTÃO DO MENU
--==================================================

local toggle = Instance.new("ImageButton")
toggle.Size = UDim2.fromOffset(55, 55)
toggle.Position = UDim2.new(1, -70, 0, 15)
toggle.BackgroundColor3 = BLACK
toggle.Image = "rbxassetid://78055449451338"
toggle.ImageColor3 = GREEN
toggle.AutoButtonColor = false
toggle.Parent = gui

local tc = Instance.new("UICorner"); tc.CornerRadius = UDim.new(0, 14); tc.Parent = toggle
local ts = Instance.new("UIStroke"); ts.Color = GREEN; ts.Thickness = 1.5; ts.Transparency = 0.3; ts.Parent = toggle

task.spawn(function()
	while ts.Parent do
		for i = 0, 1, 0.1 do
			ts.Transparency = 0.3 + (0.4 * i)
			task.wait(0.05)
		end
		for i = 0, 1, 0.1 do
			ts.Transparency = 0.7 - (0.4 * i)
			task.wait(0.05)
		end
	end
end)

local toggleDragging = false
local toggleDragStart
local toggleStartPos
local toggleMoved = false

toggle.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1
		or input.UserInputType == Enum.UserInputType.Touch then
		toggleDragging = true
		toggleMoved = false
		toggleDragStart = input.Position
		toggleStartPos = toggle.Position
		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then toggleDragging = false end
		end)
	end
end)

local function updateTogglePos(input)
	local delta = input.Position - toggleDragStart
	if math.abs(delta.X) > 5 or math.abs(delta.Y) > 5 then toggleMoved = true end
	toggle.Position = UDim2.new(
		toggleStartPos.X.Scale, toggleStartPos.X.Offset + delta.X,
		toggleStartPos.Y.Scale, toggleStartPos.Y.Offset + delta.Y
	)
end

toggle.InputChanged:Connect(function(input)
	if toggleDragging and (input.UserInputType == Enum.UserInputType.MouseMovement
		or input.UserInputType == Enum.UserInputType.Touch) then
		updateTogglePos(input)
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if toggleDragging and (input.UserInputType == Enum.UserInputType.MouseMovement
		or input.UserInputType == Enum.UserInputType.Touch) then
		updateTogglePos(input)
	end
end)

local openSound = Instance.new("Sound")
openSound.SoundId = "rbxassetid://118702070205579"
openSound.Volume = 1
openSound.Parent = gui

--==================================================
-- ARRASTAR MENU
--==================================================

local dragging = false
local dragStart
local startPos

local function updateDrag(input)
	local delta = input.Position - dragStart
	main.Position = UDim2.new(
		startPos.X.Scale, startPos.X.Offset + delta.X,
		startPos.Y.Scale, startPos.Y.Offset + delta.Y
	)
end

main.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1
		or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = main.Position
		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then dragging = false end
		end)
	end
end)

main.InputChanged:Connect(function(input)
	if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement
		or input.UserInputType == Enum.UserInputType.Touch) then
		updateDrag(input)
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement
		or input.UserInputType == Enum.UserInputType.Touch) then
		updateDrag(input)
	end
end)

--==================================================
-- ABRIR / FECHAR
--==================================================

local menuOpen = true

toggle.MouseButton1Click:Connect(function()
	if toggleMoved then
		toggleMoved = false
		return
	end
	menuOpen = not menuOpen
	if menuOpen then
		openSound.TimePosition = 0
		openSound:Play()
		main.Visible = true
		main.BackgroundTransparency = 1
		TweenService:Create(main, TweenInfo.new(0.4), {BackgroundTransparency = 0}):Play()
	else
		TweenService:Create(main, TweenInfo.new(0.4), {BackgroundTransparency = 1}):Play()
		task.wait(0.4)
		if not menuOpen then main.Visible = false end
	end
end)

--==================================================
-- INICIA NA ABA PLAYERS
--==================================================

task.wait(0.7)
sidebarButtons[1].btn.MouseButton1Click:Fire()
