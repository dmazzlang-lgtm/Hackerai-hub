--[[
    ╔══════════════════════════════════════╗
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
Progress.BackgroundColor3 = Color3.fromRGB(130, 80, 255)
Progress.BorderSizePixel = 0
Progress.Parent = ProgressBack

Instance.new("UICorner", Progress).CornerRadius = UDim.new(1, 0)

local ProgressGradient = Instance.new("UIGradient")
ProgressGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 75, 190)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(140, 80, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(65, 180, 255))
})
ProgressGradient.Parent = Progress

--====================================================
-- BUTTONS
--====================================================

local HopButton = Instance.new("TextButton")
HopButton.Size = UDim2.new(0.5, -5, 0, 60)
HopButton.Position = UDim2.new(0, 0, 0, 220)
HopButton.BackgroundColor3 = Color3.fromRGB(105, 65, 230)
HopButton.BorderSizePixel = 0
HopButton.Text = "HOP SEKALI"
HopButton.Font = Enum.Font.GothamBold
HopButton.TextSize = 14
HopButton.TextColor3 = Color3.fromRGB(255, 255, 255)
HopButton.Parent = Content

Instance.new("UICorner", HopButton).CornerRadius = UDim.new(0, 12)

local HopGradient = Instance.new("UIGradient")
HopGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(95, 60, 210)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(160, 70, 255))
})
HopGradient.Parent = HopButton

local AutoButton = Instance.new("TextButton")
AutoButton.Size = UDim2.new(0.5, -5, 0, 60)
AutoButton.Position = UDim2.new(0.5, 5, 0, 220)
AutoButton.BackgroundColor3 = Color3.fromRGB(28, 48, 42)
AutoButton.BorderSizePixel = 0
AutoButton.Text = "AUTO HOP  •  OFF"
AutoButton.Font = Enum.Font.GothamBold
AutoButton.TextSize = 13
AutoButton.TextColor3 = Color3.fromRGB(180, 190, 190)
AutoButton.Parent = Content

Instance.new("UICorner", AutoButton).CornerRadius = UDim.new(0, 12)

local AutoStroke = Instance.new("UIStroke")
AutoStroke.Color = Color3.fromRGB(55, 90, 75)
AutoStroke.Thickness = 1
AutoStroke.Parent = AutoButton

--====================================================
-- FOOTER
--====================================================

local Footer = Instance.new("TextLabel")
Footer.Size = UDim2.new(1, 0, 0, 20)
Footer.Position = UDim2.new(0, 0, 1, -20)
Footer.BackgroundTransparency = 1
Footer.Text = "ADAM GANTENG • PUBLIC SERVER FINDER"
Footer.Font = Enum.Font.GothamMedium
Footer.TextSize = 9
Footer.TextColor3 = Color3.fromRGB(85, 85, 105)
Footer.TextXAlignment = Enum.TextXAlignment.Center
Footer.Parent = Content

--====================================================
-- HELPER FUNCTIONS
--====================================================

local function GetLimit()
    local number = tonumber(Input.Text)

    if not number then
        number = 2
    end

    number = math.floor(number)

    if number < 1 then
        number = 1
    end

    return number
end

local function UpdatePlayerCount()
    local amount = #Players:GetPlayers()

    PlayerCount.Text = amount .. " PLAYER"

    if amount == 1 then
        PlayerCount.Text = "1 PLAYER • SEPI"
        Dot.BackgroundColor3 = Color3.fromRGB(80, 255, 150)
    elseif amount <= 3 then
        PlayerCount.Text = amount .. " PLAYER • CUKUP SEPI"
        Dot.BackgroundColor3 = Color3.fromRGB(130, 220, 100)
    else
        PlayerCount.Text = amount .. " PLAYER"
        Dot.BackgroundColor3 = Color3.fromRGB(255, 190, 70)
    end
end

local function SetStatus(text, color)
    Status.Text = "●  " .. string.upper(text)
    Status.TextColor3 = color or Color3.fromRGB(120, 190, 255)
end

local function SetProgress(value, duration)
    TweenService:Create(
        Progress,
        TweenInfo.new(duration or 0.3, Enum.EasingStyle.Quint),
        {
            Size = UDim2.new(value, 0, 1, 0)
        }
    ):Play()
end

--====================================================
-- SERVER HOP
--====================================================

local function FindQuietServer()
    if Searching then
        return false
    end

    Searching = true

    HopButton.Text = "MENCARI..."
    SetStatus("Sedang mengambil daftar server", Color3.fromRGB(130, 180, 255))

    SetProgress(0.08, 0.2)

    local cursor = nil
    local visited = {}
    local maxPages = 8

    local successTeleport = false

    for page = 1, maxPages do

        if not Searching then
            break
        end

        SetStatus(
            "Scanning server • halaman " .. page,
            Color3.fromRGB(150, 130, 255)
        )

        SetProgress(page / maxPages, 0.35)

        local url =
            "https://games.roblox.com/v1/games/"
            .. PlaceId
            .. "/servers/Public?sortOrder=Asc&limit=100"

        if cursor then
            url = url .. "&cursor=" .. HttpService:UrlEncode(cursor)
        end

        local ok, response = pcall(function()
            return HttpService:JSONDecode(game:HttpGet(url))
        end)

        if ok and response and response.data then

            local limit = GetLimit()

            for _, server in ipairs(response.data) do

                if server.id ~= CurrentJobId
                    and server.playing <= limit
                    and server.playing < server.maxPlayers
                    and not visited[server.id]
                then

                    visited[server.id] = true

                    SetProgress(1, 0.25)

                    SetStatus(
                        "Ditemukan! " ..
                        server.playing ..
                        " player • teleporting...",
                        Color3.fromRGB(80, 255, 160)
                    )

                    HopButton.Text = "SERVER DITEMUKAN!"

                    task.wait(0.7)

                    local teleportOK = pcall(function()
                        TeleportService:TeleportToPlaceInstance(
                            PlaceId,
                            server.id,
                            LocalPlayer
                        )
                    end)

                    if teleportOK then
                        successTeleport = true
                        break
                    end
                end
            end

            cursor = response.nextPageCursor

            if not cursor then
                break
            end

        else
            SetStatus(
                "Gagal mengambil daftar server",
                Color3.fromRGB(255, 100, 120)
            )
            break
        end

        task.wait(0.35)
    end

    Searching = false

    if not successTeleport then
        SetProgress(0, 0.35)

        if AutoHop then
            SetStatus(
                "Belum ketemu • mencoba lagi...",
                Color3.fromRGB(255, 200, 90)
            )
        else
            SetStatus(
                "Server sesuai belum ditemukan",
                Color3.fromRGB(255, 120, 120)
            )
        end

        HopButton.Text = "HOP SEKALI"
    end

    return successTeleport
end

--====================================================
-- BUTTON EFFECT
--====================================================

local function ButtonEffect(button)
    button.MouseButton1Down:Connect(function()
        TweenService:Create(
            button,
            TweenInfo.new(0.1),
            {Size = UDim2.new(
                button.Size.X.Scale,
                button.Size.X.Offset - 2,
                button.Size.Y.Scale,
                button.Size.Y.Offset - 2
            )}
        ):Play()
    end)

    button.MouseButton1Up:Connect(function()
        TweenService:Create(
            button,
            TweenInfo.new(0.12),
            {
                Size = UDim2.new(
                    button.Size.X.Scale,
                    button.Size.X.Offset + 2,
                    button.Size.Y.Scale,
                    button.Size.Y.Offset + 2
                )
            }
        ):Play()
    end)
end

--====================================================
-- HOP BUTTON
--====================================================

HopButton.MouseButton1Click:Connect(function()
    if not Searching then
        FindQuietServer()
    end
end)

--====================================================
-- AUTO HOP
--====================================================

AutoButton.MouseButton1Click:Connect(function()

    AutoHop = not AutoHop

    if AutoHop then

        AutoButton.Text = "AUTO HOP  •  ON"
        AutoButton.TextColor3 = Color3.fromRGB(130, 255, 180)

        AutoButton.BackgroundColor3 =
            Color3.fromRGB(25, 80, 55)

        AutoStroke.Color =
            Color3.fromRGB(60, 180, 110)

        task.spawn(function()

            while AutoHop and ScreenGui.Parent do

                local limit = GetLimit()
                local currentPlayers = #Players:GetPlayers()

                if currentPlayers > limit then

                    if not Searching then
                        FindQuietServer()
                    end

                else

                    SetStatus(
                        "Server sudah cukup sepi • " ..
                        currentPlayers ..
                        " player",
                        Color3.fromRGB(80, 255, 160)
                    )

                end

                task.wait(3)

            end

        end)

    else

        AutoButton.Text = "AUTO HOP  •  OFF"
        AutoButton.TextColor3 =
            Color3.fromRGB(180, 190, 190)

        AutoButton.BackgroundColor3 =
            Color3.fromRGB(28, 48, 42)

        AutoStroke.Color =
            Color3.fromRGB(55, 90, 75)

        SetStatus(
            "Auto hop dimatikan",
            Color3.fromRGB(160, 160, 180)
        )
    end
end)

--====================================================
-- PLAYER UPDATE
--====================================================

UpdatePlayerCount()

Players.PlayerAdded:Connect(function()
    task.wait(0.5)
    UpdatePlayerCount()
end)

Players.PlayerRemoving:Connect(function()
    task.wait(0.5)
    UpdatePlayerCount()
end)

--====================================================
-- MINIMIZE
--====================================================

Minimize.MouseButton1Click:Connect(function()

    Minimized = not Minimized

    if Minimized then

        Minimize.Text = "+"

        TweenService:Create(
            Main,
            TweenInfo.new(
                0.35,
                Enum.EasingStyle.Quint,
                Enu
