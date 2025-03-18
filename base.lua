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

-- Base service

local Plrs = game:GetService("Players")
local Run = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local StartGui = game:GetService("StarterGui")
local Teams = game:GetService("Teams")
local UserInput = game:GetService("UserInputService")
local Light = game:GetService("Lighting")
local HTTP = game:GetService("HttpService")
local RepStor = game:GetService("ReplicatedStorage")



--Base gui


local Mercury = loadstring(game:HttpGet("https://raw.githubusercontent.com/deeeity/mercury-lib/master/src.lua"))()


local GUI = Mercury:Create{
    Name = "Fire Team SOFT(ZV)",
    Size = UDim2.fromOffset(600, 450),
    Theme = Mercury.Themes.Serika,
    Link = "https://github.com/script fire-team/main"
}

--[[ 
First hyina
]]

local ldm = GUI:Tab{
	Name = "General Functions",
	Icon = "rbxassetid://8569322835"
}

local zdl = GUI:Tab{
	Name = "Esp",
	Icon = "rbxassetid://8569322835"
}


--[[ 
скриптик вх 
]]


getgenv().ESPEnabled = false -- Toggle ESP On/Off
getgenv().ShowBox = false -- Show bounding boxes
getgenv().ShowHealth = false -- Show health

        -- Roblox Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer

-- Helper function to create ESP components
local function createESP(player)
    local box = Drawing.new("Square")
    box.Visible = false
    box.Color = Color3.new(1, 1, 1)
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


zdl:Toggle{
	Name = "Esp Enabled",
	StartingState = false,
	Description = nil,
	Callback = function(state) 
        getgenv().ESPEnabled = state
    end
}

zdl:Toggle{
    Name = "Show Box",
    StartingState = false,
    Description = nil,
    Callback = function(state)
        getgenv().ShowBox = state
    end
}


zdl:Toggle{
    Name = "Show Health",
    StartingState = false,
    Description = nil,
    Callback = function(state)
        getgenv().ShowHealth = state
    end
}

local Aimgnr = GUI:Tab{
	Name = "Silent Aimbot(NEED CHECK)",
	Icon = "rbxassetid://8569322835"
}


Aimgnr:Toggle{
	Name = "Silent aim(NEED CHECK)",
	StartingState = false,
	Description = nil,
	Callback = function(yaebal)
        --ladno

local Aiming = loadstring(game:HttpGet("https://pastebin.com/raw/fKyW0Wfx"))()
Aiming.TeamCheck(false)
 

local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
 

local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local CurrentCamera = Workspace.CurrentCamera
 
local DaHoodSettings = {
    SilentAim = true,
    AimLock = true,
    Prediction = 0.165,
    AimLockKeybind = Enum.KeyCode.E
}
getgenv().DaHoodSettings = DaHoodSettings
 

function Aiming.Check()
    
    if not (Aiming.Enabled == true and Aiming.Selected ~= LocalPlayer and Aiming.SelectedPart ~= nil) then
        return false
    end
 
    
    local Character = Aiming.Character(Aiming.Selected)
    local KOd = Character:WaitForChild("BodyEffects")["K.O"].Value
    local Grabbed = Character:FindFirstChild("GRABBING_CONSTRAINT") ~= nil
 
    
    if (KOd or Grabbed) then
        return false
    end
 
    
    return true
end
 

local __index
__index = hookmetamethod(game, "__index", function(t, k)
    
    if (t:IsA("Mouse") and (k == "Hit" or k == "Target") and Aiming.Check()) then
        
        local SelectedPart = Aiming.SelectedPart
 
        
        if (DaHoodSettings.SilentAim and (k == "Hit" or k == "Target")) then
            
            local Hit = SelectedPart.CFrame + (SelectedPart.Velocity * DaHoodSettings.Prediction)
 
            
            return (k == "Hit" and Hit or SelectedPart)
        end
    end
 
    
    return __index(t, k)
end)
 

RunService:BindToRenderStep("AimLock", 0, function()
    if (DaHoodSettings.AimLock and Aiming.Check() and UserInputService:IsKeyDown(DaHoodSettings.AimLockKeybind)) then
        
        local SelectedPart = Aiming.SelectedPart
 
        
        local Hit = SelectedPart.CFrame + (SelectedPart.Velocity * DaHoodSettings.Prediction)
 
        
        CurrentCamera.CFrame = CFrame.lookAt(CurrentCamera.CFrame.Position, Hit.Position)
    end

    end)
end
}




--[[

speed

]]





ldm:Slider{
	Name = "Speed power",
	Default = 16,
	Min = 0,
	Max = 350,
	Callback = function(nmeq)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = nmeq
     end
}

ldm:Slider{
    Name = "Gravity power",
    Min = 0,
    Max = 350,
    Callback = function(gravitacia)
        game.workspace.Gravity = gravitacia
    end
}





--[[

fullbright

]]


ldm:Button{
	Name = "Fullbright",
    StartingState = false,
	Description = nil,
	Callback = function(gkem)
pcall(function(gkem)
	local lighting = game:GetService("Lighting");
	lighting.Ambient = Color3.fromRGB(255, 255, 255);
	lighting.Brightness = 1;
	lighting.FogEnd = 1e10;
	for i, v in pairs(lighting:GetDescendants()) do
		if v:IsA("BloomEffect") or v:IsA("BlurEffect") or v:IsA("ColorCorrectionEffect") or v:IsA("SunRaysEffect") then
			v.Enabled = false;
		end;
	end;
	lighting.Changed:Connect(function()
		lighting.Ambient = Color3.fromRGB(255, 255, 255);
		lighting.Brightness = 1;
		lighting.FogEnd = 1e10;
	end);
	spawn(function(gkem)
		local character = game:GetService("Players").LocalPlayer.Character;
		while wait() do
			repeat wait() until character ~= nil;
			if not character.HumanoidRootPart:FindFirstChildWhichIsA("PointLight") then
				local headlight = Instance.new("PointLight", character.HumanoidRootPart);
				headlight.Brightness = 1;
				headlight.Range = 60;
			end;
		end;
	end);
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






