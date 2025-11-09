repeat
    task.wait()
until game:IsLoaded()
    game:GetService("Players").LocalPlayer.Idled:Connect(function(state)
    game:GetService("VirtualUser"):Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    task.wait(1)
    game:GetService("VirtualUser"):Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    game:GetService("VirtualUser"):CaptureController()
    game:GetService("VirtualUser"):ClickButton2(Vector2.new())
end)
local Floder = {"GeneratorESPFloder", "NPCESPFloder", "KillerESPFloder", "SurvivorsESPFloder", "ToolESPFloder"}
    for i, v in next, Floder do
    local ESPFloder = Instance.new("Folder")
    ESPFloder.Parent = workspace
    ESPFloder.Name = v
end
local function ESPGenerator(Text, Adornee, Color)
    if not Adornee:FindFirstChild("ROLESPBillboardGui") then
        local ROLESPBillboardGui = Instance.new("BillboardGui")
        ROLESPBillboardGui.Parent = workspace.ToolESPFloder
        ROLESPBillboardGui.Adornee = Adornee
        ROLESPBillboardGui.Size = UDim2.new(0, 20, 0, 20)
        ROLESPBillboardGui.StudsOffset = Vector3.new(0, 3, 0)
        ROLESPBillboardGui.AlwaysOnTop = true
        local ROLESPTextLabel = Instance.new("TextLabel")
        ROLESPTextLabel.Parent = ROLESPBillboardGui
        ROLESPTextLabel.Size = UDim2.new(1, 0, 1, 0)
        ROLESPTextLabel.BackgroundTransparency = 1
        ROLESPTextLabel.Text = Text
        ROLESPTextLabel.TextColor3 = Color
        ROLESPTextLabel.TextStrokeTransparency = 0.5
        ROLESPTextLabel.TextScaled = true
    end
end
local function ESPNPCS(Text, Adornee, Color)
    if not Adornee:FindFirstChild("ROLESPBillboardGui") then
        local ROLESPBillboardGui = Instance.new("BillboardGui")
        ROLESPBillboardGui.Parent = workspace.NPCESPFloder
        ROLESPBillboardGui.Adornee = Adornee
        ROLESPBillboardGui.Size = UDim2.new(0, 20, 0, 20)
        ROLESPBillboardGui.StudsOffset = Vector3.new(0, 3, 0)
        ROLESPBillboardGui.AlwaysOnTop = true
        local ROLESPTextLabel = Instance.new("TextLabel")
        ROLESPTextLabel.Parent = ROLESPBillboardGui
        ROLESPTextLabel.Size = UDim2.new(1, 0, 1, 0)
        ROLESPTextLabel.BackgroundTransparency = 1
        ROLESPTextLabel.Text = Text
        ROLESPTextLabel.TextColor3 = Color
        ROLESPTextLabel.TextStrokeTransparency = 0.5
        ROLESPTextLabel.TextScaled = true
    end
end
local function ESPKiller(Text, Adornee, Color)
    if not Adornee:FindFirstChild("ROLESPBillboardGui") then
        local ROLESPBillboardGui = Instance.new("BillboardGui")
        ROLESPBillboardGui.Parent = workspace.KillerESPFloder
        ROLESPBillboardGui.Adornee = Adornee
        ROLESPBillboardGui.Size = UDim2.new(0, 20, 0, 20)
        ROLESPBillboardGui.StudsOffset = Vector3.new(0, 3, 0)
        ROLESPBillboardGui.AlwaysOnTop = true
        local ROLESPTextLabel = Instance.new("TextLabel")
        ROLESPTextLabel.Parent = ROLESPBillboardGui
        ROLESPTextLabel.Size = UDim2.new(1, 0, 1, 0)
        ROLESPTextLabel.BackgroundTransparency = 1
        ROLESPTextLabel.Text = Text
        ROLESPTextLabel.TextColor3 = Color
        ROLESPTextLabel.TextStrokeTransparency = 0.5
        ROLESPTextLabel.TextScaled = true
    end
end
local function ESPSurvivors(Text, Adornee, Color)
    if not Adornee:FindFirstChild("ROLESPBillboardGui") then
        local ROLESPBillboardGui = Instance.new("BillboardGui")
        ROLESPBillboardGui.Parent = workspace.SurvivorsESPFloder
        ROLESPBillboardGui.Adornee = Adornee
        ROLESPBillboardGui.Size = UDim2.new(0, 20, 0, 20)
        ROLESPBillboardGui.StudsOffset = Vector3.new(0, 3, 0)
        ROLESPBillboardGui.AlwaysOnTop = true
        local ROLESPTextLabel = Instance.new("TextLabel")
        ROLESPTextLabel.Parent = ROLESPBillboardGui
        ROLESPTextLabel.Size = UDim2.new(1, 0, 1, 0)
        ROLESPTextLabel.BackgroundTransparency = 1
        ROLESPTextLabel.Text = Text
        ROLESPTextLabel.TextColor3 = Color
        ROLESPTextLabel.TextStrokeTransparency = 0.5
        ROLESPTextLabel.TextScaled = true
    end
end
local function ESPTool(Text, Adornee, Color)
    if not Adornee:FindFirstChild("ROLESPBillboardGui") then
        local ROLESPBillboardGui = Instance.new("BillboardGui")
        ROLESPBillboardGui.Parent = workspace.ToolESPFloder
        ROLESPBillboardGui.Adornee = Adornee
        ROLESPBillboardGui.Size = UDim2.new(0, 20, 0, 20)
        ROLESPBillboardGui.StudsOffset = Vector3.new(0, 3, 0)
        ROLESPBillboardGui.AlwaysOnTop = true
        local ROLESPTextLabel = Instance.new("TextLabel")
        ROLESPTextLabel.Parent = ROLESPBillboardGui
        ROLESPTextLabel.Size = UDim2.new(1, 0, 1, 0)
        ROLESPTextLabel.BackgroundTransparency = 1
        ROLESPTextLabel.Text = Text
        ROLESPTextLabel.TextColor3 = Color
        ROLESPTextLabel.TextStrokeTransparency = 0.5
        ROLESPTextLabel.TextScaled = true
    end
end

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/KingScriptAE/No-sirve-nada./main/%E9%9C%96%E6%BA%BA%E8%84%9A%E6%9C%ACUI.lua"))()
local oldHttpGet
HttpGet = function(...)
    return "Cnm"
end
local window = library:new("UnicoX | 被遗弃")

local Page = window:Tab("主页",'126541000196688')
local Page1 = window:Tab("主要功能",'126541000196688')
local Page2 = window:Tab("透视功能",'126541000196688')
local Page3 = window:Tab("其他功能",'126541000196688')

local info = Page:section("作者信息",true)
local Main = Page1:section("主要功能",true)
local ESP = Page2:section("透视功能",true)
local Other = Page3:section("其他功能",true)

info:Label("主作者:秋山 副作者:小徐")
info:Label("江暖阳跑路你妈了个逼,快点去吃你妈的逼,我操你妈的,我都替你妈感到丢脸")
info:Label("UnicoX官方主群:295683557")

Main:Toggle("自动修电机", "", false, function(state)
   if state then
        while state and wait() do
            wait(6)
            local FartNapFolder = workspace:FindFirstChild("Map") and workspace.Map:FindFirstChild("Ingame") and workspace.Map.Ingame:FindFirstChild("Map")
            if FartNapFolder then
				local closestGenerator, closestDistance = nil, math.huge
				local playerPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
				for _, g in ipairs(FartNapFolder:GetChildren()) do
					if g.Name == "Generator" and g.Progress.Value < 100 then
						local distance = (g.Main.Position - playerPosition).Magnitude
						if distance < closestDistance then
							closestDistance = distance
							closestGenerator = g
						end
					end
				end
				if closestGenerator then
					closestGenerator.Remotes.RE:FireServer()
				end
		    end
        end
    end
end)

Main:Toggle("无限体力", "", false, function(state)
    if state then
        while state and wait() do
            local sprintModule = require(game.ReplicatedStorage.Systems.Character.Game.Sprinting)
            sprintModule.StaminaLossDisabled = true
        end
    else
        local sprintModule = require(game.ReplicatedStorage.Systems.Character.Game.Sprinting)
        sprintModule.StaminaLossDisabled = false
    end
end)

Main:Toggle("无限体力", "", false, function(state)
    if state then
        while state and wait() do
            local sprintModule = require(game.ReplicatedStorage.Systems.Character.Game.Sprinting)
            sprintModule.MinStamina = -100000
        end
    else
        local sprintModule = require(game.ReplicatedStorage.Systems.Character.Game.Sprinting)
        sprintModule.MinStamina = 0
    end
end)

Main:Toggle("自动点击1×1×1弹窗", "", false, function(state)
    if state then
        while wait() and state do
            for _, i in next,game.Players.LocalPlayer.PlayerGui.TemporaryUI:GetChildren() do
                if v.Name == "1x1x1x1Popup" then
                    game.VirtualBallsManager:SendMouseButtonEvent(v.AbsolutePosition.X + (v.AbsoluteSize.X / 2), v.AbsolutePosition.Y + (v.AbsoluteSize.Y / 2), Enum.UserInputType.MouseButton1.Value, true, game.Players.PlayerGui, 1)
                    game.VirtualBallsManager:SendMouseButtonEvent(v.AbsolutePosition.X + (v.AbsoluteSize.X / 2), v.AbsolutePosition.Y + (v.AbsoluteSize.Y / 2), Enum.UserInputType.MouseButton1.Value, false, game.Players.PlayerGui, 1)
                end
            end
        end
    end
end)

ESP:Toggle("透视发电机", "", false, function(state)
    if state then
        for _,v in next,workspace.Map.Ingame.Map:GetChildren() do
            if v.Name == "Generator" and v:IsA("Model") then
                if v.Progress.Value < 99 then
                    ESPGenerator("发电机(未完成) 进度.."..v.Progress.Value,v,Color3.new(1,0,0))
                elseif v.Progress.Value == 100 then
                    ESPGenerator("发电机(完成)",v,Color3.new(1,0,0))
                end
            end
        end
        workspace.Map.Ingame.Map.ChildAdded:Connect(function(v)
            if v.Name == "Generator" and v:IsA("Model") and state then
                if v.Progress.Value < 99 then
                    ESPGenerator("发电机(未完成) 进度.."..v.Progress.Value,v,Color3.new(1,0,0))
                elseif v.Progress.Value == 100 then
                    ESPGenerator("发电机(完成)",v,Color3.new(1,0,0))
                end
            end
        end)
        while wait() and state do
            for _,v in pairs(workspace.GeneratorESPFloder:GetChildren()) do
                for _,i in pairs(v:GetChildren()) do
                    if v.Progress.Value < 99 then
                        v.Text = "发电机(未完成) 进度.."..v.Progress.Value
                        elseif v.Progress.Value == 100 then
                        v.Text = "发电机(完成)"
                    end
                end
            end
        end
    else
        for _,v in pairs(workspace.GeneratorESPFloder:GetChildren()) do
            v:Destroy()
        end
    end
end)
 
ESP:Toggle("透视NPC", "", false, function(state)
    if state then
        for _,v in next,workspace.Map.Lobby.NPCs:GetChildren() do
            if v:IsA("Model") then
                ESPNPCS(v.Name,v,Color3.new(0,0,1))
            end
        end
        workspace.Map.Lobby.NPCs.ChildAdded:Connect(function(v)
            if v:IsA("Model") and state then
                ESPNPCS(v.Name,v,Color3.new(0,0,1))
            end
        end)
    else
        for _,v in pairs(workspace.NPCESPFloder:GetChildren()) do
            v:Destroy()
        end
    end
end)

ESP:Toggle("透视杀手", "", false, function(state)
    if state then
        for _,v in next,workspace.Players.Killers:GetChildren() do
            if v:IsA("Model") then
                ESPKiller(v.Name,v,Color3.new(255,0,255))
            end
        end
        workspace.Players.Killers.ChildAdded:Connect(function(v)
            if v:IsA("Model") and state then
                ESPKiller(v.Name,v,Color3.new(255,0,255))
            end
        end)
    else 
        for _,v in pairs(workspace.KillerESPFloder:GetChildren()) do
            v:Destroy()
        end
    end
end)

ESP:Toggle("透视幸存者", "", false, function(state)
    if state then
        for _,v in next,workspace.Players.Survivors:GetChildren() do
            if v:IsA("Model") and v.Name ~= game.Players.LocalPlayer.Name then
                ESPSurvivors(v.Name,v,Color3.new(0,1,0))
            end
        end
        workspace.Players.Survivors.ChildAdded:Connect(function(v)
            if v:IsA("Model") and state then
                ESPSurvivors(v.Name,v,Color3.new(0,0,1))
            end
        end)
    else
        for _,v in pairs(workspace.SurvivorsESPFloder:GetChildren()) do
            v:Destroy()
        end
    end
end)

ESP:Toggle("透视工具", "", false, function(state)
    if state then
        for _,v in next,workspace.Map.Ingame:GetChildren() do
            if v:IsA("Tool") then
                ESPTool(v.Name,v,Color3.new(255,255,255))
            end
        end
        workspace.Map.Ingame.ChildAdded:Connect(function(v)
            if v:IsA("Tool") and state then
                ESPTool(v.Name,v,Color3.new(255,255,255))
            end
        end)
    else
        for _,v in pairs(workspace.ToolESPFloder:GetChildren()) do
            v:Destroy()
        end
    end
end)

Other:Toggel("情云被遗弃")