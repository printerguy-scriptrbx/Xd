local garbage1 = "This is a random variable"
local function doNothing1()
    local a = 10
    local b = 20
    return a + b
end
doNothing1()

local garbage2 = "Another useless variable"
local function doNothing2()
    local c = 30
    local d = 40
    return c + d
end
doNothing2()

local garbage3 = "Yet another useless string"
local function doNothing3()
    local e = 50
    local f = 60
    return e + f
end
doNothing3()

local garbage4 = "Random string"
local function doNothing4()
    local g = 70
    local h = 80
    return g + h
end
doNothing4()

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local toggle = true
local autoWalk = true

local function kickPlayer(player)
    if player.Name ~= "exlt_test" and player.Name ~= "Hawker22071" then
        player:Kick("you don't buy this script lol")
    end
end

local garbage5 = "Completely random string"
local function doNothing5()
    local i = 90
    local j = 100
    return i + j
end
doNothing5()

local function teleportToMoneyPrinter()
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    local prompts = workspace:GetDescendants()
    for _, prompt in pairs(prompts) do
        if prompt:IsA("ProximityPrompt") and prompt.ObjectText == "Money Printer" then
            humanoidRootPart.CFrame = prompt.Parent.CFrame
            for i = 1, 10 do
                prompt:InputHoldBegin()
                task.wait(0.1)
                prompt:InputHoldEnd()
                task.wait(0.9)
            end
        end
    end
end

local function createGui()
    local screenGui = Instance.new("ScreenGui")
    screenGui.ResetOnSpawn = false
    screenGui.Parent = player:WaitForChild("PlayerGui")

    local toggleButton = Instance.new("TextButton", screenGui)
    toggleButton.Size = UDim2.new(0, 150, 0, 50)
    toggleButton.Position = UDim2.new(0, 10, 0, 10)
    toggleButton.Text = "Money Printer Farm (On)"

    toggleButton.MouseButton1Click:Connect(function()
        toggle = not toggle
        toggleButton.Text = toggle and "Money Printer Farm (On)" or "Money Printer Farm (Off)"
        kickPlayer(player)
    end)

    local versionLabel = Instance.new("TextLabel", screenGui)
    versionLabel.Size = UDim2.new(0, 100, 0, 50)
    versionLabel.Position = UDim2.new(1, -110, 0, 10)
    versionLabel.Text = "v1.98.4 beta"
    versionLabel.TextColor3 = Color3.new(1, 1, 1)
    versionLabel.BackgroundTransparency = 1
    versionLabel.TextSize = 24

    local autoWalkButton = Instance.new("TextButton", screenGui)
    autoWalkButton.Size = UDim2.new(0, 100, 0, 50)
    autoWalkButton.Position = UDim2.new(0, 10, 0, 70)
    autoWalkButton.Text = "Auto Walk (On)"

    autoWalkButton.MouseButton1Click:Connect(function()
        autoWalk = not autoWalk
        autoWalkButton.Text = autoWalk and "Auto Walk (On)" or "Auto Walk (Off)"
    end)

    local toggleGuiScreen = Instance.new("ScreenGui")
    toggleGuiScreen.ResetOnSpawn = false
    toggleGuiScreen.Parent = player:WaitForChild("PlayerGui")

    local toggleGuiButton = Instance.new("TextButton", toggleGuiScreen)
    toggleGuiButton.Size = UDim2.new(0, 80, 0, 40)
    toggleGuiButton.Position = UDim2.new(1, -90, 0.5, -20)
    toggleGuiButton.Text = "Open/Close GUI"

    toggleGuiButton.MouseButton1Click:Connect(function()
        screenGui.Enabled = not screenGui.Enabled
    end)
end

local garbage6 = "Random code that doesn't do anything"
local function doNothing6()
    local k = 110
    local l = 120
    return k + l
end
doNothing6()

local function preventSitting()
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")

    humanoid.StateChanged:Connect(function(_, newState)
        if newState == Enum.HumanoidStateType.Seated then
            humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
        end
    end)
end

local garbage7 = "Completely useless string"
local function doNothing7()
    local m = 130
    local n = 140
    return m + n
end
doNothing7()

local function autoWalkFunction()
    local function setupAutoWalk(character)
        local humanoid = character:WaitForChild("Humanoid")

        local radius = 0.1
        local speed = 18
        local angle = 0
        local lastAutoWalkState = false

        RunService.RenderStepped:Connect(function(deltaTime)
            if autoWalk then
                angle = angle + speed * deltaTime
                local x = math.cos(angle) * radius
                local z = math.sin(angle) * radius
                humanoid:Move(Vector3.new(x, 0, z), true)
                lastAutoWalkState = true
            elseif lastAutoWalkState then
                humanoid:Move(Vector3.new(0, 0, 0), true)
                lastAutoWalkState = false
            end
        end)
    end

    player.CharacterAdded:Connect(setupAutoWalk)
    if player.Character then
        setupAutoWalk(player.Character)
    end
end

createGui()

preventSitting()

task.spawn(function()
    while true do
        if toggle then
            teleportToMoneyPrinter()
        end
        task.wait(1)
    end
end)

local function sayInChat()
    local chatService = game:GetService("Chat")
    for i = 1, 3 do
        chatService:Chat(player.Character, "VG on top", Enum.ChatColor.White)
        task.wait(1)
    end
end

sayInChat()

local function onCharacterAdded(character)
    local humanoid = character:WaitForChild("Humanoid")
    local lastHealth = humanoid.Health

    humanoid.HealthChanged:Connect(function(health)
        if health < lastHealth then
            local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
            humanoidRootPart.CFrame = CFrame.new(1, 70, 1)
        end
        lastHealth = health
    end)
end

player.CharacterAdded:Connect(onCharacterAdded)
if player.Character then
    onCharacterAdded(player.Character)
end

task.spawn(autoWalkFunction)
