--[[


      𝓷𝓲𝓰𝓰𝓪
      𝓷𝓲𝓰𝓰𝓪
      𝓷𝓲𝓰𝓰𝓪
      𝓷𝓲𝓰𝓰𝓪
𝓷𝓲𝓰𝓰𝓪𝓷𝓲𝓰𝓰𝓪𝓷𝓲𝓰𝓰𝓪𝓷𝓲𝓰𝓰𝓪
𝓷𝓲𝓰𝓰𝓪𝓷𝓲𝓰𝓰𝓪𝓷𝓲𝓰𝓰𝓪𝓷𝓲𝓰𝓰𝓪

]]

--[[

https://github.com/GhostDuckyy/UI-Libraries/tree/main/Mercury-lib

]]

--базы гуи


local Mercury = loadstring(game:HttpGet("https://raw.githubusercontent.com/deeeity/mercury-lib/master/src.lua"))()


local GUI = Mercury:Create{
    Name = "Fire Team SOFT(ZV)",
    Size = UDim2.fromOffset(500, 350),
    Theme = Mercury.Themes.Aqua,
    Link = "https://github.com/deeeity/mercury-lib"
}

--[[ 
первая хуйня 
]]

local ldm = GUI:Tab{
	Name = "General Functions",
	Icon = "rbxassetid://8569322835"
}

ldm:Button{
	Name = "Esp",
	Description = nil,
	Callback = function()
    -- такая вот хуйня

getgenv().ESPEnabled = true -- Toggle ESP On/Off
getgenv().ShowBox = true -- Show bounding boxes
getgenv().ShowHealth = true -- Show health

        -- Roblox Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer

-- Helper function to create ESP components
local function createESP(player)
    local box = Drawing.new("Square")
    box.Visible = false
    box.Color = Color3.new(0, 0, 1)
    box.Thickness = 0.5
    box.Filled = false

    local healthText = Drawing.new("Text")
    healthText.Visible = false
    healthText.Color = Color3.new(0, 1, 0)
    healthText.Size = 13

    -- Update ESP dynamically
    RunService.RenderStepped:Connect(function()
        if not getgenv().ESPEnabled or not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") or not player.Character:FindFirstChild("Humanoid") or player == LocalPlayer then
            box.Visible = false
            healthText.Visible = false
            return
        end

        if getgenv().TeamCheck and player.Team == LocalPlayer.Team then
            box.Visible = false
            healthText.Visible = false
            return
        end

        local character = player.Character
        local rootPart = character:FindFirstChild("HumanoidRootPart")
        local humanoid = character:FindFirstChild("Humanoid")

        if rootPart and humanoid and humanoid.Health > 0 then
            local rootPos, onScreen = Camera:WorldToViewportPoint(rootPart.Position)
            local headPos, _ = Camera:WorldToViewportPoint(rootPart.Position + Vector3.new(0, 3, 0))
            local legPos, _ = Camera:WorldToViewportPoint(rootPart.Position - Vector3.new(0, 3, 0))

            -- Box
            if getgenv().ShowBox and onScreen then
                box.Size = Vector2.new(1000 / rootPos.Z, headPos.Y - legPos.Y)
                box.Position = Vector2.new(rootPos.X - box.Size.X / 2, rootPos.Y - box.Size.Y / 2)
                box.Visible = true
            else
                box.Visible = false
            end

            -- Health
            if getgenv().ShowHealth and onScreen then
                healthText.Position = Vector2.new(rootPos.X, rootPos.Y - box.Size.Y / 2 - 20)
                healthText.Text = "Health: " .. math.floor(humanoid.Health)
                healthText.Visible = true
            else
                healthText.Visible = false
            end
        end
    end)
end

-- Apply ESP to all players
for _, player in pairs(Players:GetPlayers()) do
    if player ~= LocalPlayer then
        createESP(player)
    end
end

Players.PlayerAdded:Connect(function(player)
    if player ~= LocalPlayer then
        createESP(player)
    end
end)
    end
}





--[[

крендель

]]

GUI:Credit{
	Name = "brenton tarrent",
	Description = "15.03.25",
	V3rm = "None",
	Discord = "None"
}
