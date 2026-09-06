--========================================--
--        ADAM GANTENG LOADING SCREEN
--========================================--

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")

pcall(function()
    CoreGui:FindFirstChild("AdamGantengLoading"):Destroy()
end)

local LoadingGui = Instance.new("ScreenGui")
LoadingGui.Name = "AdamGantengLoading"
LoadingGui.IgnoreGuiInset = true
LoadingGui.ResetOnSpawn = false
LoadingGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
LoadingGui.Parent = CoreGui

-- Background gelap
local Background = Instance.new("Frame")
Background.Size = UDim2.fromScale(1, 1)
Background.BackgroundColor3 = Color3.fromRGB(8, 8, 14)
Background.BorderSizePixel = 0
Background.Parent = LoadingGui

-- Kotak utama
local Box = Instance.new("Frame")
Box.Size = UDim2.new(0, 420, 0, 230)
Box.Position = UDim2.new(0.5, -210, 0.5, -115)
Box.BackgroundColor3 = Color3.fromRGB(18, 18, 28)
Box.BorderSizePixel = 0
Box.Parent = Background

Instance.new("UICorner", Box).CornerRadius = UDim.new(0, 18)

local Stroke = Instance.new("UIStroke")
Stroke.Color = Color3.fromRGB(120, 70, 255)
Stroke.Thickness = 1.5
Stroke.Transparency = 0.25
Stroke.Parent = Box

-- Judul
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 45)
Title.Position = UDim2.new(0, 0, 0, 30)
Title.BackgroundTransparency = 1
Title.Text = "ADAM GANTENG"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 27
Title.TextColor3 = Color3.fromRGB(245, 245, 255)
Title.Parent = Box

-- Subtitle
local Subtitle = Instance.new("TextLabel")
Subtitle.Size = UDim2.new(1, 0, 0, 25)
Subtitle.Position = UDim2.new(0, 0, 0, 73)
Subtitle.BackgroundTransparency = 1
Subtitle.Text = "SERVER HOP • SAEG"
Subtitle.Font = Enum.Font.GothamMedium
Subtitle.TextSize = 12
Subtitle.TextColor3 = Color3.fromRGB(155, 120, 255)
Subtitle.Parent = Box

-- Status loading
local Status = Instance.new("TextLabel")
Status.Size = UDim2.new(1, -60, 0, 25)
Status.Position = UDim2.new(0, 30, 0, 115)
Status.BackgroundTransparency = 1
Status.Text = "Memulai sistem..."
Status.Font = Enum.Font.Gotham
Status.TextSize = 13
Status.TextColor3 = Color3.fromRGB(180, 180, 195)
Status.TextXAlignment = Enum.TextXAlignment.Left
Status.Parent = Box

-- Progress background
local BarBackground = Instance.new("Frame")
BarBackground.Size = UDim2.new(1, -60, 0, 12)
BarBackground.Position = UDim2.new(0, 30, 0, 148)
BarBackground.BackgroundColor3 = Color3.fromRGB(35, 35, 50)
BarBackground.BorderSizePixel = 0
BarBackground.Parent = Box

Instance.new("UICorner", BarBackground).CornerRadius = UDim.new(1, 0)

-- Progress
local Bar = Instance.new("Frame")
Bar.Size = UDim2.new(0, 0, 1, 0)
Bar.BackgroundColor3 = Color3.fromRGB(130, 70, 255)
Bar.BorderSizePixel = 0
Bar.Parent = BarBackground

Instance.new("UICorner", Bar).CornerRadius = UDim.new(1, 0)

local Gradient = Instance.new("UIGradient")
Gradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 70, 180)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(130, 70, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(60, 180, 255))
})
Gradient.Parent = Bar

-- Persentase
local Percent = Instance.new("TextLabel")
Percent.Size = UDim2.new(1, 0, 0, 30)
Percent.Position = UDim2.new(0, 0, 0, 175)
Percent.BackgroundTransparency = 1
Percent.Text = "0%"
Percent.Font = Enum.Font.GothamBold
Percent.TextSize = 18
Percent.TextColor3 = Color3.fromRGB(235, 235, 255)
Percent.Parent = Box

--========================================--
--           LOADING FUNCTION
--========================================--

local loadingTexts = {
    "Memulai sistem...",
    "Memuat Adam Ganteng Hub...",
    "Menghubungkan ke server...",
    "Menyiapkan Server Hop...",
    "Mengambil data player...",
    "Mencari konfigurasi...",
    "Menyiapkan antarmuka...",
    "Hampir selesai...",
    "Sistem siap!"
}

for i = 0, 100 do

    local progress = i / 100

    Bar.Size = UDim2.new(progress, 0, 1, 0)
    Percent.Text = i .. "%"

    -- Ganti teks berdasarkan progress
    if i < 10 then
        Status.Text = loadingTexts[1]
    elseif i < 25 then
        Status.Text = loadingTexts[2]
    elseif i < 40 then
        Status.Text = loadingTexts[3]
    elseif i < 55 then
        Status.Text = loadingTexts[4]
    elseif i < 70 then
        Status.Text = loadingTexts[5]
    elseif i < 82 then
        Status.Text = loadingTexts[6]
    elseif i < 92 then
        Status.Text = loadingTexts[7]
    elseif i < 100 then
        Status.Text = loadingTexts[8]
    else
        Status.Text = loadingTexts[9]
    end

    task.wait(0.025)
end

task.wait(0.6)

-- Animasi loading hilang
TweenService:Create(
    Box,
    TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.In),
    {
        Size = UDim2.new(0, 0, 0, 0)
    }
):Play()

TweenService:Create(
    Background,
    TweenInfo.new(0.4),
    {
        BackgroundTransparency = 1
    }
):Play()

task.wait(0.45)

LoadingGui:Destroy()

--========================================--
--===================================--
--        ADAM GANTENG SERVER HOP
--========================================----========================================--
--        ADAM GANTENG LOADING SCREEN
--========================================--

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")

pcall(function()
    CoreGui:FindFirstChild("AdamGantengLoading"):Destroy()
end)

local LoadingGui = Instance.new("ScreenGui")
LoadingGui.Name = "AdamGantengLoading"
LoadingGui.IgnoreGuiInset = true
LoadingGui.ResetOnSpawn = false
LoadingGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
LoadingGui.Parent = CoreGui

-- Background gelap
local Background = Instance.new("Frame")
Background.Size = UDim2.fromScale(1, 1)
Background.BackgroundColor3 = Color3.fromRGB(8, 8, 14)
Background.BorderSizePixel = 0
Background.Parent = LoadingGui

-- Kotak utama
local Box = Instance.new("Frame")
Box.Size = UDim2.new(0, 420, 0, 230)
Box.Position = UDim2.new(0.5, -210, 0.5, -115)
Box.BackgroundColor3 = Color3.fromRGB(18, 18, 28)
Box.BorderSizePixel = 0
Box.Parent = Background

Instance.new("UICorner", Box).CornerRadius = UDim.new(0, 18)

local Stroke = Instance.new("UIStroke")
Stroke.Color = Color3.fromRGB(120, 70, 255)
Stroke.Thickness = 1.5
Stroke.Transparency = 0.25
Stroke.Parent = Box

-- Judul
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 45)
Title.Position = UDim2.new(0, 0, 0, 30)
Title.BackgroundTransparency = 1
Title.Text = "ADAM GANTENG"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 27
Title.TextColor3 = Color3.fromRGB(245, 245, 255)
Title.Parent = Box

-- Subtitle
local Subtitle = Instance.new("TextLabel")
Subtitle.Size = UDim2.new(1, 0, 0, 25)
Subtitle.Position = UDim2.new(0, 0, 0, 73)
Subtitle.BackgroundTransparency = 1
Subtitle.Text = "SERVER HOP • SAEG"
Subtitle.Font = Enum.Font.GothamMedium
Subtitle.TextSize = 12
Subtitle.TextColor3 = Color3.fromRGB(155, 120, 255)
Subtitle.Parent = Box

-- Status loading
local Status = Instance.new("TextLabel")
Status.Size = UDim2.new(1, -60, 0, 25)
Status.Position = UDim2.new(0, 30, 0, 115)
Status.BackgroundTransparency = 1
Status.Text = "Memulai sistem..."
Status.Font = Enum.Font.Gotham
Status.TextSize = 13
Status.TextColor3 = Color3.fromRGB(180, 180, 195)
Status.TextXAlignment = Enum.TextXAlignment.Left
Status.Parent = Box

-- Progress background
local BarBackground = Instance.new("Frame")
BarBackground.Size = UDim2.new(1, -60, 0, 12)
BarBackground.Position = UDim2.new(0, 30, 0, 148)
BarBackground.BackgroundColor3 = Color3.fromRGB(35, 35, 50)
BarBackground.BorderSizePixel = 0
BarBackground.Parent = Box

Instance.new("UICorner", BarBackground).CornerRadius = UDim.new(1, 0)

-- Progress
local Bar = Instance.new("Frame")
Bar.Size = UDim2.new(0, 0, 1, 0)
Bar.BackgroundColor3 = Color3.fromRGB(130, 70, 255)
Bar.BorderSizePixel = 0
Bar.Parent = BarBackground

Instance.new("UICorner", Bar).CornerRadius = UDim.new(1, 0)

local Gradient = Instance.new("UIGradient")
Gradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 70, 180)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(130, 70, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(60, 180, 255))
})
Gradient.Parent = Bar

-- Persentase
local Percent = Instance.new("TextLabel")
Percent.Size = UDim2.new(1, 0, 0, 30)
Percent.Position = UDim2.new(0, 0, 0, 175)
Percent.BackgroundTransparency = 1
Percent.Text = "0%"
Percent.Font = Enum.Font.GothamBold
Percent.TextSize = 18
Percent.TextColor3 = Color3.fromRGB(235, 235, 255)
Percent.Parent = Box

--========================================--
--           LOADING FUNCTION
--========================================--

local loadingTexts = {
    "Memulai sistem...",
    "Memuat Adam Ganteng Hub...",
    "Menghubungkan ke server...",
    "Menyiapkan Server Hop...",
    "Mengambil data player...",
    "Mencari konfigurasi...",
    "Menyiapkan antarmuka...",
    "Hampir selesai...",
    "Sistem siap!"
}

for i = 0, 100 do

    local progress = i / 100

    Bar.Size = UDim2.new(progress, 0, 1, 0)
    Percent.Text = i .. "%"

    -- Ganti teks berdasarkan progress
    if i < 10 then
        Status.Text = loadingTexts[1]
    elseif i < 25 then
        Status.Text = loadingTexts[2]
    elseif i < 40 then
        Status.Text = loadingTexts[3]
    elseif i < 55 then
        Status.Text = loadingTexts[4]
    elseif i < 70 then
        Status.Text = loadingTexts[5]
    elseif i < 82 then
        Status.Text = loadingTexts[6]
    elseif i < 92 then
        Status.Text = loadingTexts[7]
    elseif i < 100 then
        Status.Text = loadingTexts[8]
    else
        Status.Text = loadingTexts[9]
    end

    task.wait(0.025)
end

task.wait(0.6)

-- Animasi loading hilang
TweenService:Create(
    Box,
    TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.In),
    {
        Size = UDim2.new(0, 0, 0, 0)
    }
):Play()

TweenService:Create(
    Background,
    TweenInfo.new(0.4),
    {
        BackgroundTransparency = 1
    }
):Play()

task.wait(0.45)

LoadingGui:Destroy()

--========================================--
----------------------------------
--        ADAM GANTENG SERVER HOP
--========================================--╔══════════════════════════════════════╗
    ║       ADAM GANTENG SERVER HOP        ║
    ║               SAEG                   ║
    ╚══════════════════════════════════════╝

    Public Server Hopper
    Cari server dengan jumlah player lebih kecil
    dari / sesuai batas yang kamu tentukan.
]]

--// SERVICES
local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

--// PLAYER
local LocalPlayer = Players.LocalPlayer
local PlaceId = game.PlaceId
local CurrentJobId = game.JobId

--// CLEAN OLD GUI
pcall(function()
    game.CoreGui:FindFirstChild("AdamGantengServerHop"):Destroy()
end)

--// VARIABLES
local AutoHop = false
local Searching = false
local Minimized = false

--====================================================
-- GUI
--====================================================

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AdamGantengServerHop"
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = game.CoreGui

--====================================================
-- MAIN
--====================================================

local Main = Instance.new("Frame")
Main.Name = "Main"
Main.Size = UDim2.new(0, 460, 0, 385)
Main.Position = UDim2.new(0.5, -230, 0.5, -192)
Main.BackgroundColor3 = Color3.fromRGB(13, 13, 20)
Main.BorderSizePixel = 0
Main.ClipsDescendants = true
Main.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 16)
MainCorner.Parent = Main

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(110, 70, 255)
MainStroke.Thickness = 1.5
MainStroke.Transparency = 0.2
MainStroke.Parent = Main

--====================================================
-- TOP GLOW
--====================================================

local Glow = Instance.new("Frame")
Glow.Size = UDim2.new(1, 0, 0, 5)
Glow.BackgroundColor3 = Color3.fromRGB(135, 80, 255)
Glow.BorderSizePixel = 0
Glow.Parent = Main

local GlowGradient = Instance.new("UIGradient")
GlowGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 70, 180)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(130, 70, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(60, 180, 255))
})
GlowGradient.Parent = Glow

--====================================================
-- HEADER
--====================================================

local Header = Instance.new("Frame")
Header.Size = UDim2.new(1, 0, 0, 78)
Header.BackgroundTransparency = 1
Header.Parent = Main

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -120, 0, 30)
Title.Position = UDim2.new(0, 22, 0, 14)
Title.BackgroundTransparency = 1
Title.Text = "ADAM GANTENG"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 22
Title.TextColor3 = Color3.fromRGB(245, 245, 255)
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Header

local Subtitle = Instance.new("TextLabel")
Subtitle.Size = UDim2.new(1, -120, 0, 22)
Subtitle.Position = UDim2.new(0, 23, 0, 43)
Subtitle.BackgroundTransparency = 1
Subtitle.Text = "SERVER HOP • SAEG"
Subtitle.Font = Enum.Font.GothamMedium
Subtitle.TextSize = 11
Subtitle.TextColor3 = Color3.fromRGB(145, 125, 220)
Subtitle.TextXAlignment = Enum.TextXAlignment.Left
Subtitle.Parent = Header

-- MINIMIZE

local Minimize = Instance.new("TextButton")
Minimize.Size = UDim2.new(0, 32, 0, 32)
Minimize.Position = UDim2.new(1, -76, 0, 18)
Minimize.BackgroundColor3 = Color3.fromRGB(32, 32, 48)
Minimize.Text = "−"
Minimize.Font = Enum.Font.GothamBold
Minimize.TextSize = 20
Minimize.TextColor3 = Color3.fromRGB(220, 220, 230)
Minimize.BorderSizePixel = 0
Minimize.Parent = Header

Instance.new("UICorner", Minimize).CornerRadius = UDim.new(0, 8)

-- CLOSE

local Close = Instance.new("TextButton")
Close.Size = UDim2.new(0, 32, 0, 32)
Close.Position = UDim2.new(1, -38, 0, 18)
Close.BackgroundColor3 = Color3.fromRGB(65, 30, 45)
Close.Text = "×"
Close.Font = Enum.Font.GothamBold
Close.TextSize = 22
Close.TextColor3 = Color3.fromRGB(255, 110, 140)
Close.BorderSizePixel = 0
Close.Parent = Header

Instance.new("UICorner", Close).CornerRadius = UDim.new(0, 8)

--====================================================
-- CONTENT HOLDER
--====================================================

local Content = Instance.new("Frame")
Content.Name = "Content"
Content.Size = UDim2.new(1, -40, 1, -95)
Content.Position = UDim2.new(0, 20, 0, 78)
Content.BackgroundTransparency = 1
Content.Parent = Main

--====================================================
-- STATUS CARD
--====================================================

local StatusCard = Instance.new("Frame")
StatusCard.Size = UDim2.new(1, 0, 0, 72)
StatusCard.BackgroundColor3 = Color3.fromRGB(23, 23, 35)
StatusCard.BorderSizePixel = 0
StatusCard.Parent = Content

Instance.new("UICorner", StatusCard).CornerRadius = UDim.new(0, 12)

local StatusStroke = Instance.new("UIStroke")
StatusStroke.Color = Color3.fromRGB(60, 55, 90)
StatusStroke.Thickness = 1
StatusStroke.Transparency = 0.3
StatusStroke.Parent = StatusCard

-- DOT

local DotHolder = Instance.new("Frame")
DotHolder.Size = UDim2.new(0, 42, 0, 42)
DotHolder.Position = UDim2.new(0, 14, 0.5, -21)
DotHolder.BackgroundColor3 = Color3.fromRGB(25, 75, 55)
DotHolder.BorderSizePixel = 0
DotHolder.Parent = StatusCard

Instance.new("UICorner", DotHolder).CornerRadius = UDim.new(1, 0)

local Dot = Instance.new("Frame")
Dot.Size = UDim2.new(0, 12, 0, 12)
Dot.Position = UDim2.new(0.5, -6, 0.5, -6)
Dot.BackgroundColor3 = Color3.fromRGB(75, 255, 145)
Dot.BorderSizePixel = 0
Dot.Parent = DotHolder

Instance.new("UICorner", Dot).CornerRadius = UDim.new(1, 0)

local PlayerLabel = Instance.new("TextLabel")
PlayerLabel.Size = UDim2.new(1, -75, 0, 24)
PlayerLabel.Position = UDim2.new(0, 68, 0, 12)
PlayerLabel.BackgroundTransparency = 1
PlayerLabel.Text = "SERVER SEKARANG"
PlayerLabel.Font = Enum.Font.GothamBold
PlayerLabel.TextSize = 11
PlayerLabel.TextColor3 = Color3.fromRGB(135, 135, 155)
PlayerLabel.TextXAlignment = Enum.TextXAlignment.Left
PlayerLabel.Parent = StatusCard

local PlayerCount = Instance.new("TextLabel")
PlayerCount.Size = UDim2.new(1, -75, 0, 30)
PlayerCount.Position = UDim2.new(0, 68, 0, 31)
PlayerCount.BackgroundTransparency = 1
PlayerCount.Text = "0 PLAYER"
PlayerCount.Font = Enum.Font.GothamBold
PlayerCount.TextSize = 19
PlayerCount.TextColor3 = Color3.fromRGB(245, 245, 255)
PlayerCount.TextXAlignment = Enum.TextXAlignment.Left
PlayerCount.Parent = StatusCard

--====================================================
-- INPUT SECTION
--====================================================

local InputLabel = Instance.new("TextLabel")
InputLabel.Size = UDim2.new(1, 0, 0, 26)
InputLabel.Position = UDim2.new(0, 0, 0, 87)
InputLabel.BackgroundTransparency = 1
InputLabel.Text = "HOP JIKA PLAYER DI SERVER INI LEBIH DARI"
InputLabel.Font = Enum.Font.GothamBold
InputLabel.TextSize = 10
InputLabel.TextColor3 = Color3.fromRGB(155, 150, 180)
InputLabel.TextXAlignment = Enum.TextXAlignment.Left
InputLabel.Parent = Content

local InputHolder = Instance.new("Frame")
InputHolder.Size = UDim2.new(1, 0, 0, 52)
InputHolder.Position = UDim2.new(0, 0, 0, 113)
InputHolder.BackgroundColor3 = Color3.fromRGB(28, 28, 42)
InputHolder.BorderSizePixel = 0
InputHolder.Parent = Content

Instance.new("UICorner", InputHolder).CornerRadius = UDim.new(0, 10)

local InputStroke = Instance.new("UIStroke")
InputStroke.Color = Color3.fromRGB(75, 65, 115)
InputStroke.Thickness = 1
InputStroke.Transparency = 0.25
InputStroke.Parent = InputHolder

local Hash = Instance.new("TextLabel")
Hash.Size = UDim2.new(0, 50, 1, 0)
Hash.BackgroundTransparency = 1
Hash.Text = "#"
Hash.Font = Enum.Font.GothamBold
Hash.TextSize = 20
Hash.TextColor3 = Color3.fromRGB(135, 100, 255)
Hash.Parent = InputHolder

local Input = Instance.new("TextBox")
Input.Size = UDim2.new(1, -65, 1, 0)
Input.Position = UDim2.new(0, 55, 0, 0)
Input.BackgroundTransparency = 1
Input.Text = "2"
Input.PlaceholderText = "Masukkan jumlah player..."
Input.Font = Enum.Font.GothamBold
Input.TextSize = 18
Input.TextColor3 = Color3.fromRGB(245, 245, 255)
Input.PlaceholderColor3 = Color3.fromRGB(100, 100, 120)
Input.TextXAlignment = Enum.TextXAlignment.Left
Input.ClearTextOnFocus = false
Input.Parent = InputHolder

--====================================================
-- STATUS TEXT
--====================================================

local Status = Instance.new("TextLabel")
Status.Size = UDim2.new(1, 0, 0, 25)
Status.Position = UDim2.new(0, 0, 0, 172)
Status.BackgroundTransparency = 1
Status.Text = "●  SIAP UNTUK MENCARI SERVER"
Status.Font = Enum.Font.GothamMedium
Status.TextSize = 11
Status.TextColor3 = Color3.fromRGB(120, 190, 255)
Status.TextXAlignment = Enum.TextXAlignment.Left
Status.Parent = Content

--====================================================
-- PROGRESS BAR
--====================================================

local ProgressBack = Instance.new("Frame")
ProgressBack.Size = UDim2.new(1, 0, 0, 4)
ProgressBack.Position = UDim2.new(0, 0, 0, 200)
ProgressBack.BackgroundColor3 = Color3.fromRGB(40, 40, 55)
ProgressBack.BorderSizePixel = 0
ProgressBack.Parent = Content

Instance.new("UICorner", ProgressBack).CornerRadius = UDim.new(1, 0)

local Progress = Instance.new("Frame")
Progress.Size = UDim2.new(0, 0, 1, 0)
Progress.BackgroundColor3 = Color3.fromRGB(130, 80
