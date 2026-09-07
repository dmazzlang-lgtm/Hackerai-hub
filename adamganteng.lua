-- Dan FFA Silent Aim | XShot
-- Reconstructed from the provided obfuscated source

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local UserInputService = game:GetService("UserInputService")

local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera

--==================================================
-- UI LIBRARY
--==================================================

local Library = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/mstudio45/LinoriaLib/main/Library.lua"
))()

local ThemeManager = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/mstudio45/LinoriaLib/main/addons/ThemeManager.lua"
))()

local SaveManager = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/mstudio45/LinoriaLib/main/addons/SaveManager.lua"
))()

Library.AccentColor = Color3.fromRGB(170, 85, 255)
Library.AccentColorDark = Color3.fromRGB(120, 50, 180)
Library.ShowCustomCursor = true

local Window = Library:CreateWindow({
    Title = "Dan FFA Silent Aim | XShot",
    Center = true,
    AutoShow = true
})

local SilentAimTab = Window:AddTab("Silent Aim")
local UISettingsTab = Window:AddTab("UI Settings")

local MainGroup = SilentAimTab:AddLeftGroupbox("Main")

--==================================================
-- SETTINGS
--==================================================

local Settings = {
    Enabled = false,
    Highlight = false,
    Tracers = false,
    ShowFOV = false,
    FOVRadius = 0
}

--==================================================
-- DRAWING
--==================================================

local FOVCircle = Drawing.new("Circle")

FOVCircle.Thickness = 2
FOVCircle.Color = Library.AccentColor
FOVCircle.Filled = false
FOVCircle.Visible = false

local Tracer = Drawing.new("Line")

Tracer.Thickness = 1
Tracer.Color = Library.AccentColor
Tracer.Visible = false

--==================================================
-- TARGET
--==================================================

local CurrentTarget = nil
local CurrentRoot = nil
local CurrentTool = nil

--==================================================
-- SILENT AIM TOGGLE
--==================================================

MainGroup:AddToggle("enabled", {
    Text = "Enable Silent Aim",
    Default = false,

    Callback = function(Value)
        Settings.Enabled = Value

        if not Value then
            CurrentTarget = nil
            CurrentRoot = nil
            Tracer.Visible = false
        end

        -- Bagian konfigurasi hook asli berada
        -- di sini pada script obfuscated.
    end
})

--==================================================
-- TARGET SELECTION
--==================================================

local function GetClosestTarget()
    local ClosestDistance = math.huge
    local ClosestPlayer = nil
    local ClosestRoot = nil

    Camera = Workspace.CurrentCamera

    if not Camera then
        return nil, nil
    end

    local ViewportSize = Camera.ViewportSize

    local ScreenCenter = Vector2.new(
        ViewportSize.X / 2,
        ViewportSize.Y / 2
    )

    for _, Player in Players:GetPlayers() do

        if Player ~= LocalPlayer and Player.Character then

            local Character = Player.Character

            local Root =
                Character:FindFirstChild("HumanoidRootPart")

            local Humanoid =
                Character:FindFirstChild("Humanoid")

            if Root and Humanoid and Humanoid.Health > 0 then

                local ScreenPosition, OnScreen =
                    Camera:WorldToViewportPoint(Root.Position)

                if OnScreen then

                    local ScreenDistance =
                        (
                            Vector2.new(
                                ScreenPosition.X,
                                ScreenPosition.Y
                            ) - ScreenCenter
                        ).Magnitude

                    local InsideFOV =
                        Settings.FOVRadius == 0
                        or ScreenDistance <= Settings.FOVRadius

                    if InsideFOV and ScreenDistance < ClosestDistance then

                        ClosestDistance = ScreenDistance
                        ClosestPlayer = Player
                        ClosestRoot = Root

                    end
                end
            end
        end
    end

    return ClosestPlayer, ClosestRoot
end

--==================================================
-- RANDOM SPREAD / DIRECTION
--==================================================

local function GetDirection(Origin, TargetPosition, Spread)

    local Direction

    if not TargetPosition then
        return Vector3.zero
    end

    Direction = (TargetPosition - Origin).Unit

    if Spread and Spread > 0 then

        local Distance =
            (TargetPosition - Origin).Magnitude

        local Offset =
            Vector3.new(
                math.random(-100, 100) / 100,
                math.random(-100, 100) / 100,
                math.random(-100, 100) / 100
            )

        TargetPosition =
            TargetPosition +
            Offset * (Spread * (Distance / 100))

        Direction =
            (TargetPosition - Origin).Unit
    end

    return Direction
end

--==================================================
-- CHARACTER / TOOL TRACKING
--==================================================

local function SetupCharacter(Character)

    CurrentTool = nil

    for _, Child in Character:GetChildren() do

        if Child:IsA("Tool") then
            CurrentTool = Child.Name
            break
        end

    end

    Character.ChildAdded:Connect(function(Child)

        if Child:IsA("Tool") then
            CurrentTool = Child.Name
        end

    end)

    Character.ChildRemoved:Connect(function(Child)

        if Child:IsA("Tool") then
            CurrentTool = nil
        end

    end)
end

if LocalPlayer.Character then
    SetupCharacter(LocalPlayer.Character)
end

LocalPlayer.CharacterAdded:Connect(function(Character)
    SetupCharacter(Character)
end)

--==================================================
-- UPDATE
--==================================================

RunService.RenderStepped:Connect(function()

    if not Settings.Enabled then
        CurrentTarget = nil
        CurrentRoot = nil
        return
    end

    local Target, Root = GetClosestTarget()

    CurrentTarget = Target
    CurrentRoot = Root
end)

--==================================================
-- FOV + TRACER
--==================================================

RunService.Heartbeat:Connect(function()

    Camera = Workspace.CurrentCamera

    if not Camera then
        return
    end

    local ViewportSize = Camera.ViewportSize

    local ScreenCenter = Vector2.new(
        ViewportSize.X / 2,
        ViewportSize.Y / 2
    )

    -- FOV

    FOVCircle.Position = ScreenCenter
    FOVCircle.Radius = Settings.FOVRadius

    FOVCircle.Visible =
        Settings.ShowFOV
        and Settings.FOVRadius > 0

    -- Tracer

    if Settings.Tracers and CurrentRoot then

        local Position, OnScreen =
            Camera:WorldToViewportPoint(
                CurrentRoot.Position
            )

        if OnScreen then

            Tracer.From = ScreenCenter

            Tracer.To = Vector2.new(
                Position.X,
                Position.Y
            )

            Tracer.Visible = true

        else
            Tracer.Visible = false
        end

    else
        Tracer.Visible = false
    end
end)

--==================================================
-- NAMECALL HOOK
--==================================================

local OldNamecall

OldNamecall = hookmetamethod(
    game,
    "__namecall",
    newcclosure(function(...)

        local Args = {...}

        local Self = Args[1]

        local Method = getnamecallmethod()

        -- =================================================
        -- BAGIAN INI ADALAH BAGIAN YANG TIDAK TERLIHAT
        -- PADA POTONGAN SOURCE YANG DIBERIKAN.
        --
        -- Source asli berhenti pada:
        --
        -- local v153 = 0
        -- while true do
        --
        -- Jadi logic asli setelah titik tersebut tidak
        -- bisa direkonstruksi 100% tanpa source lanjutannya.
        -- =================================================

        return OldNamecall(...)
    end)
)

--==================================================
-- UI SETTINGS
--==================================================

ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)

Library:OnUnload(function()

    FOVCircle.Visible = false
    Tracer.Visible = false

    FOVCircle:Remove()
    Tracer:Remove()

end)

Library:Notify("Dan FFA Silent Aim loaded.")
