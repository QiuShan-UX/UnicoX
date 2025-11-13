local Players = game:GetService("Players")
local PFS = game:GetService("PathfindingService")
local VIM = game:GetService("VirtualInputManager")
local TeleportService = game:GetService("TeleportService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LP = Players.LocalPlayer
local Spectators = {}
local currentCharacter
local isInGame, busy, isSprinting = false, false, false
local stamina, counter = 100, 0
local Killer, Survivor = false, false

-- 安全位置检测函数
local function safe(pos)
    local rayParams = RaycastParams.new()
    rayParams.FilterDescendantsInstances = {workspace.Map.Ingame.Map}
    rayParams.FilterType = Enum.RaycastFilterType.Include
    local rayResult = workspace:Raycast(pos + Vector3.new(0, 5, 0), Vector3.new(0, -10, 0), rayParams)
    if rayResult then
        local yDiff = math.abs(rayResult.Position.Y - pos.Y)
        return yDiff < 5 
    end
    return false
end

-- 加载库
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Articles-Hub/ROBLOXScript/refs/heads/main/Library/LinoriaLib/Test.lua"))()
local ThemeManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/Articles-Hub/ROBLOXScript/refs/heads/main/Library/LinoriaLib/addons/ThemeManagerCopy.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/Articles-Hub/ROBLOXScript/refs/heads/main/Library/LinoriaLib/addons/SaveManagerCopy.lua"))()
local Options = Library.Options
local Toggles = Library.Toggles

-- 通知函数
function Notification(Message, Time)
    if _G.ChooseNotify == "Obsidian" then
        Library:Notify(Message, Time or 5)
    elseif _G.ChooseNotify == "Roblox" then
        game:GetService("StarterGui"):SetCore("SendNotification",{
            Title = "提示",
            Text = Message,
            Icon = "rbxassetid://7733658504",
            Duration = Time or 5
        })
    end
    if _G.NotificationSound then
        local sound = Instance.new("Sound", workspace)
        sound.SoundId = "rbxassetid://4590662766"
        sound.Volume = _G.VolumeTime or 2
        sound.PlayOnRemove = true
        sound:Destroy()
    end
end

Library:SetDPIScale(85)

-- 创建主窗口
local Window = Library:CreateWindow({
    Title = "旧冬Forsake",
    Center = true,
    AutoShow = true,
    Resizable = true,
    Footer = "旧冬Forsaken版本: 1.0.0 |by XiaoXu",
    Icon = 125448486325517,
    AutoLock = true,
    ShowCustomCursor = true,
    NotifySide = "Right",
    TabPadding = 2,
    MenuFadeTime = 0
})

-- 创建标签页
Tabs = {
    Main = Window:AddTab("主功能", "rbxassetid://7734053426"),
    Anti = Window:AddTab("反检测", "rbxassetid://7734056608"),
    ["UI Settings"] = Window:AddTab("界面设置", "rbxassetid://7733955511")
}

-- 主功能标签页 - 左侧组
local Main1Group = Tabs.Main:AddLeftGroupbox("主要功能")

Main1Group:AddToggle("AutoGeneral", {
    Text = "自动修复发电机",
    Default = false, 
    Callback = function(Value) 
        _G.AutoGeneral = Value
        while _G.AutoGeneral do
            if workspace.Map.Ingame:FindFirstChild("Map") then
                for i, v in ipairs(workspace.Map.Ingame:FindFirstChild("Map"):GetChildren()) do
                    if v.Name == "Generator" and v:FindFirstChild("Remotes") and v.Remotes:FindFirstChild("RE") and v:FindFirstChild("Progress").Value ~= 100 then
                        v.Remotes:FindFirstChild("RE"):FireServer()
                    end
                end
            end
            task.wait(2)
        end
    end
})

Main1Group:AddButton("传送到发电机", function()
    if workspace.Map.Ingame:FindFirstChild("Map") then
        for i, v in ipairs(workspace.Map.Ingame:FindFirstChild("Map"):GetChildren()) do
            if v.Name == "Generator" and v:FindFirstChild("Positions") and v.Positions:FindFirstChild("Center") and v:FindFirstChild("Progress").Value ~= 100 then
                if LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then
                    LP.Character.HumanoidRootPart.CFrame = v.Positions:FindFirstChild("Center").CFrame
                    break
                end
            end
        end
    end
end)

Main1Group:AddToggle("InfStamina", {
    Text = "无限体力",
    Default = false, 
    Callback = function(Value) 
        _G.InfStamina = Value
        while _G.InfStamina do
            local staminaModule = require(game.ReplicatedStorage:WaitForChild("Systems"):WaitForChild("Character"):WaitForChild("Game"):WaitForChild("Sprinting"))
            if staminaModule then
                staminaModule.MaxStamina = 999999
                staminaModule.Stamina = 999999
                if staminaModule.__staminaChangedEvent then
                    staminaModule.__staminaChangedEvent:Fire(staminaModule.Stamina)
                end
            end
            task.wait()
        end
    end
})

Main1Group:AddSlider("Speed", {
    Text = "移动速度",
    Default = 20,
    Min = 7,
    Max = 50,
    Rounding = 0,
    Compact = false,
    Callback = function(Value)
        _G.SpeedWalk = Value
    end
})

Main1Group:AddToggle("SetSpeed", {
    Text = "设置速度",
    Default = false, 
    Callback = function(Value) 
        _G.NahSpeed = Value
        while _G.NahSpeed do
            if LP.Character and LP.Character:FindFirstChild("Humanoid") then
                LP.Character.Humanoid:SetAttribute("BaseSpeed", _G.SpeedWalk)
                if LP.Character.Humanoid:GetAttribute("BaseSpeed") == _G.SpeedWalk then
                    LP.Character.Humanoid.WalkSpeed = _G.SpeedWalk
                end
            end
            task.wait()
        end
    end
})

Main1Group:AddToggle("ItemPick", {
    Text = "自动拾取物品",
    Default = false, 
    Callback = function(Value) 
        _G.PickupItem = Value
        while _G.PickupItem do
            if LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then
                if workspace.Map.Ingame:FindFirstChild("Map") then
                    for i, v in ipairs(workspace.Map.Ingame:FindFirstChild("Map"):GetChildren()) do
                        if v:IsA("Tool") and v:FindFirstChild("ItemRoot") and v.ItemRoot:FindFirstChild("ProximityPrompt") then
                            if (LP.Character.HumanoidRootPart.Position - v.ItemRoot.Position).Magnitude < 25 then
                                fireproximityprompt(v.ItemRoot:FindFirstChild("ProximityPrompt"))
                            end
                        end
                    end
                end
            end
            task.wait()
        end
    end
})

Main1Group:AddButton("拾取物品", function()
    if LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then
        if workspace.Map.Ingame:FindFirstChild("Map") then
            local OldCFrame = LP.Character.HumanoidRootPart.CFrame
            for i, v in ipairs(workspace.Map.Ingame:FindFirstChild("Map"):GetChildren()) do
                if v:IsA("Tool") and v:FindFirstChild("ItemRoot") and v.ItemRoot:FindFirstChild("ProximityPrompt") then
                    LP.Character.HumanoidRootPart.CFrame = v:FindFirstChild("ItemRoot").CFrame
                    wait(0.3)
                    fireproximityprompt(v.ItemRoot:FindFirstChild("ProximityPrompt"))
                    wait(0.4)
                    LP.Character.HumanoidRootPart.CFrame = OldCFrame
                    break
                end
            end
        end
    end
end)

Main1Group:AddToggle("AutoExpMoney", {
    Text = "自动刷经验/金钱",
    Default = false, 
    Callback = function(Value) 
        _G.AutoFarm = Value
        
        -- 观察者列表更新
        task.spawn(function()
            while _G.AutoFarm do
                Spectators = {}
                local spectatingFolder = workspace:WaitForChild("Players"):WaitForChild("Spectating")
                if spectatingFolder then
                    for _, v in ipairs(spectatingFolder:GetChildren()) do
                        table.insert(Spectators, v.Name)
                    end
                end
                isInGame = not table.find(Spectators, LP.Name)
                task.wait(1)
            end
        end)
        
        -- 角色属性设置
        task.spawn(function()
            while _G.AutoFarm do
                if isInGame and currentCharacter and currentCharacter:FindFirstChild("Humanoid") then
                    pcall(function()
                        currentCharacter.Humanoid:SetAttribute("BaseSpeed", 14)
                        local playerGui = LP:WaitForChild("PlayerGui")
                        if playerGui:FindFirstChild("TemporaryUI") then
                            local tempUI = playerGui.TemporaryUI
                            if tempUI:FindFirstChild("PlayerInfo") then
                                local playerInfo = tempUI.PlayerInfo
                                if playerInfo:FindFirstChild("Bars") and playerInfo.Bars:FindFirstChild("Stamina") then
                                    local staminaBar = playerInfo.Bars.Stamina
                                    if staminaBar:FindFirstChild("Amount") then
                                        local barText = staminaBar.Amount.Text
                                        stamina = tonumber(string.split(barText, "/")[1]) or 100
                                    end
                                end
                            end
                        end
                        
                        local fovMult = currentCharacter:FindFirstChild("FOVMultipliers") and currentCharacter.FOVMultipliers:FindFirstChild("Sprinting")
                        if fovMult and fovMult.Value ~= 1.125 and stamina >= 70 and not busy then
                            VIM:SendKeyEvent(true, Enum.KeyCode.LeftShift, false, game)
                        end
                    end)
                end
                task.wait(1)
            end
        end)
        
        -- 角色身份检测
        task.spawn(function()
            while _G.AutoFarm do
                if workspace:FindFirstChild("Players") then
                    local killersFolder = workspace.Players:FindFirstChild("Killers")
                    local survivorsFolder = workspace.Players:FindFirstChild("Survivors")
                    if killersFolder and survivorsFolder then
                        Killer = killersFolder:FindFirstChild(LP.Name) ~= nil
                        Survivor = survivorsFolder:FindFirstChild(LP.Name) ~= nil
                    end
                end
                task.wait(1)
            end
        end)
        
        -- 主要农场逻辑
        task.spawn(function()
            task.wait(2)
            local killersFolder = workspace.Players:WaitForChild("Killers")
            local survivorsFolder = workspace.Players:WaitForChild("Survivors")
            
            while _G.AutoFarm do
                if Killer then
                    local target = nil
                    for _, survivor in ipairs(survivorsFolder:GetChildren()) do
                        if survivor:IsA("Model") and survivor:FindFirstChild("HumanoidRootPart") then
                            target = survivor
                            break
                        end
                    end
                    
                    if target then
                        local followingTarget = true
                        
                        -- 跟随目标
                        task.spawn(function()
                            while followingTarget and _G.AutoFarm do
                                local character = LP.Character
                                if character and character:FindFirstChild("HumanoidRootPart") and target and target:FindFirstChild("HumanoidRootPart") then
                                    character:PivotTo(target.HumanoidRootPart.CFrame)
                                end
                                task.wait(0.1)
                            end
                        end)
                        
                        -- 攻击目标
                        task.spawn(function()
                            while target and target:FindFirstChild("HumanoidRootPart") and target:IsDescendantOf(survivorsFolder) and _G.AutoFarm do
                                VIM:SendMouseButtonEvent(0, 0, 0, true, game, 0)
                                task.wait(0.05)
                                VIM:SendMouseButtonEvent(0, 0, 0, false, game, 0)
                                task.wait(0.1)
                                VIM:SendKeyEvent(true, Enum.KeyCode.Q, false, game)
                                task.wait(0.05)
                                VIM:SendKeyEvent(false, Enum.KeyCode.Q, false, game)
                                task.wait(0.1)
                                VIM:SendKeyEvent(true, Enum.KeyCode.E, false, game)
                                task.wait(0.05)
                                VIM:SendKeyEvent(false, Enum.KeyCode.E, false, game)
                                task.wait(0.1)
                                VIM:SendKeyEvent(true, Enum.KeyCode.R, false, game)
                                task.wait(0.05)
                                VIM:SendKeyEvent(false, Enum.KeyCode.R, false, game)
                                task.wait(0.8)
                            end
                            followingTarget = false
                        end)
                    else
                        task.wait(1)
                    end
                    
                elseif Survivor then
                    if isInGame then
                        -- 查找当前角色
                        for _, surv in ipairs(survivorsFolder:GetChildren()) do
                            if surv:GetAttribute("Username") == LP.Name then
                                currentCharacter = surv
                                break
                            end
                        end
                        
                        -- 角色状态监控
                        task.spawn(function()
                            while _G.AutoFarm do
                                if currentCharacter and currentCharacter:FindFirstChild("Humanoid") and currentCharacter.Humanoid.Health <= 0 then
                                    isInGame = false
                                    isSprinting = false
                                    busy = false
                                    break
                                end
                                task.wait(0.5)
                            end
                        end)
                        
                        -- 检查发电机状态
                        for _, completedgen in ipairs(ReplicatedStorage.ObjectiveStorage:GetChildren()) do
                            if not isInGame then break end
                            local required = completedgen:GetAttribute("RequiredProgress")
                            if completedgen.Value == required then
                                -- 逃离杀手逻辑
                                while #killersFolder:GetChildren() >= 1 and _G.AutoFarm do
                                    for _, killer in ipairs(killersFolder:GetChildren()) do
                                        if currentCharacter and killer:FindFirstChild("HumanoidRootPart") and currentCharacter:FindFirstChild("HumanoidRootPart") then
                                            local killerHRP = killer.HumanoidRootPart
                                            local charHRP = currentCharacter.HumanoidRootPart
                                            local dist = (killerHRP.Position - charHRP.Position).Magnitude
                                            
                                            if dist <= 100 then
                                                local fleeDistance = 50
                                                local bestFleePos = nil
                                                
                                                for i = 1, 10 do
                                                    local randomAngle = math.rad(math.random(-180, 180))
                                                    local cos, sin = math.cos(randomAngle), math.sin(randomAngle)
                                                    local randomDir = Vector3.new(cos, 0, sin).Unit
                                                    local potentialPos = charHRP.Position + randomDir * fleeDistance
                                                    
                                                    if safe(potentialPos) then
                                                        local path = PFS:CreatePath({
                                                            AgentRadius = 2,
                                                            AgentHeight = 5,
                                                            AgentCanJump = true,
                                                        })
                                                        
                                                        local success, err = pcall(function()
                                                            path:ComputeAsync(charHRP.Position, potentialPos)
                                                        end)
                                                        
                                                        if success and path.Status == Enum.PathStatus.Success then
                                                            local waypoints = path:GetWaypoints()
                                                            for i = #waypoints, 1, -1 do
                                                                if safe(waypoints[i].Position) then
                                                                    bestFleePos = waypoints[i].Position
                                                                    break
                                                                end
                                                            end
                                                            if bestFleePos then break end
                                                        end
                                                    end
                                                end
                                                
                                                if bestFleePos then
                                                    currentCharacter:PivotTo(CFrame.new(bestFleePos + Vector3.new(0, 3, 0)))
                                                end
                                            end
                                        end
                                        task.wait(0.1)
                                    end
                                end
                            else
                                -- 修复发电机逻辑
                                for _, gen in ipairs(workspace.Map.Ingame:WaitForChild("Map"):GetChildren()) do
                                    if gen.Name == "Generator" and gen:FindFirstChild("Progress") and gen.Progress.Value ~= 100 then
                                        if currentCharacter and currentCharacter:FindFirstChild("HumanoidRootPart") then
                                            local goalPos = gen:WaitForChild("Positions"):WaitForChild("Right").Position
                                            currentCharacter:PivotTo(CFrame.new(goalPos + Vector3.new(0, 2, 0)))
                                            task.wait(0.25)
                                            
                                            local thing = gen:FindFirstChild("Main")
                                            if thing then
                                                thing = thing:FindFirstChild("Prompt")
                                                if thing then
                                                    thing.HoldDuration = 0
                                                    thing.RequiresLineOfSight = false
                                                    thing.MaxActivationDistance = 99999
                                                    task.wait(0.1)
                                                    
                                                    pcall(function()
                                                        thing:InputHoldBegin()
                                                        thing:InputHoldEnd()
                                                    end)
                                                    
                                                    busy = true
                                                    counter = 0
                                                    
                                                    while gen.Progress.Value ~= 100 and _G.AutoFarm do
                                                        pcall(function()
                                                            thing:InputHoldBegin()
                                                            thing:InputHoldEnd()
                                                            if _G.AutoGeneral == false then
                                                                gen.Remotes.RE:FireServer()
                                                            end
                                                        end)
                                                        task.wait(2.5)
                                                        counter += 1
                                                        if counter >= 10 or not isInGame then break end
                                                    end
                                                    
                                                    busy = false
                                                    if not isInGame then break end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
                task.wait(0.5)
            end
        end)
    end
})

-- 主功能标签页 - 右侧组 (ESP功能)
local Main2Group = Tabs.Main:AddRightGroupbox("透视功能")

Main2Group:AddToggle("Generator", {
    Text = "发电机透视",
    Default = false, 
    Callback = function(Value) 
        _G.EspGeneral = Value
        
        if _G.EspGeneral == false then
            if workspace.Map.Ingame:FindFirstChild("Map") then
                for i, v in pairs(workspace.Map.Ingame:FindFirstChild("Map"):GetChildren()) do
                    if v.Name == "Generator" then
                        for x, n in pairs(v:GetChildren()) do
                            if n.Name:find("Esp_") then
                                n:Destroy()
                            end
                        end
                    end
                end
            end
        end
        
        while _G.EspGeneral do
            if workspace.Map.Ingame:FindFirstChild("Map") then
                for i, v in pairs(workspace.Map.Ingame:FindFirstChild("Map"):GetChildren()) do
                    if v.Name == "Generator" and v:FindFirstChild("Progress") then
                        -- 高亮处理
                        if v:FindFirstChild("Esp_Highlight") then
                            if v:FindFirstChild("Progress").Value == 100 then
                                v:FindFirstChild("Esp_Highlight").FillColor = Color3.fromRGB(0, 255, 0)
                                v:FindFirstChild("Esp_Highlight").OutlineColor = Color3.fromRGB(0, 255, 0)
                            else
                                v:FindFirstChild("Esp_Highlight").FillColor = _G.ColorLight or Color3.new(255, 255, 255)
                                v:FindFirstChild("Esp_Highlight").OutlineColor = _G.ColorLight or Color3.new(255, 255, 255)
                            end
                        end
                        
                        if _G.EspHighlight == true and v:FindFirstChild("Esp_Highlight") == nil then
                            local Highlight = Instance.new("Highlight")
                            Highlight.Name = "Esp_Highlight"
                            Highlight.FillColor = Color3.fromRGB(255, 255, 255) 
                            Highlight.OutlineColor = Color3.fromRGB(255, 255, 255) 
                            Highlight.FillTransparency = 0.5
                            Highlight.OutlineTransparency = 0
                            Highlight.Adornee = v
                            Highlight.Parent = v
                        elseif _G.EspHighlight == false and v:FindFirstChild("Esp_Highlight") then
                            v:FindFirstChild("Esp_Highlight"):Destroy()
                        end
                        
                        -- GUI处理
                        if v:FindFirstChild("Esp_Gui") and v["Esp_Gui"]:FindFirstChild("TextLabel") then
                            local text = ""
                            if _G.EspName == true then
                                text = text .. "发电机 ("..v.Progress.Value.."%)"
                            end
                            if _G.EspDistance == true then
                                if LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then
                                    text = text .. "\n距离 ("..string.format("%.1f", (LP.Character.HumanoidRootPart.Position - v.Positions.Center.Position).Magnitude).."m)"
                                end
                            end
                            v["Esp_Gui"]:FindFirstChild("TextLabel").Text = text
                            v["Esp_Gui"]:FindFirstChild("TextLabel").TextSize = _G.EspGuiTextSize or 15
                            v["Esp_Gui"]:FindFirstChild("TextLabel").TextColor3 = _G.EspGuiTextColor or Color3.new(255, 255, 255)
                        end
                        
                        if _G.EspGui == true and v:FindFirstChild("Esp_Gui") == nil then
                            local GuiGenEsp = Instance.new("BillboardGui", v)
                            GuiGenEsp.Adornee = v
                            GuiGenEsp.Name = "Esp_Gui"
                            GuiGenEsp.Size = UDim2.new(0, 100, 0, 150)
                            GuiGenEsp.AlwaysOnTop = true
                            GuiGenEsp.StudsOffset = Vector3.new(0, 3, 0)
                            
                            local GuiGenEspText = Instance.new("TextLabel", GuiGenEsp)
                            GuiGenEspText.BackgroundTransparency = 1
                            GuiGenEspText.Font = Enum.Font.Code
                            GuiGenEspText.Size = UDim2.new(0, 100, 0, 100)
                            GuiGenEspText.TextSize = 15
                            GuiGenEspText.TextColor3 = Color3.new(0,0,0) 
                            GuiGenEspText.TextStrokeTransparency = 0.5
                            GuiGenEspText.Text = ""
                            
                            local UIStroke = Instance.new("UIStroke")
                            UIStroke.Color = Color3.new(0, 0, 0)
                            UIStroke.Thickness = 1.5
                            UIStroke.Parent = GuiGenEspText
                        elseif _G.EspGui == false and v:FindFirstChild("Esp_Gui") then
                            v:FindFirstChild("Esp_Gui"):Destroy()
                        end
                    end
                end
            end
            task.wait()
        end
    end
})

-- 玩家ESP函数
function Esp_Player(v, Colorlight)
    -- 高亮处理
    if v:FindFirstChild("Esp_Highlight") then
        v:FindFirstChild("Esp_Highlight").FillColor = Colorlight or Color3.fromRGB(255, 255, 255)
        v:FindFirstChild("Esp_Highlight").OutlineColor = Colorlight or Color3.fromRGB(255, 255, 255)
    end
    
    if _G.EspHighlight == true and v:FindFirstChild("Esp_Highlight") == nil then
        local Highlight = Instance.new("Highlight")
        Highlight.Name = "Esp_Highlight"
        Highlight.FillColor = Color3.fromRGB(255, 255, 255) 
        Highlight.OutlineColor = Color3.fromRGB(255, 255, 255) 
        Highlight.FillTransparency = 0.5
        Highlight.OutlineTransparency = 0
        Highlight.Adornee = v
        Highlight.Parent = v
    elseif _G.EspHighlight == false and v:FindFirstChild("Esp_Highlight") then
        v:FindFirstChild("Esp_Highlight"):Destroy()
    end
    
    -- GUI处理
    if v.Head:FindFirstChild("Esp_Gui") and v.Head["Esp_Gui"]:FindFirstChild("TextLabel") then
        local text = ""
        if _G.EspName == true then
            text = text .. v.Name
        end
        if _G.EspDistance == true then
            if LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then
                text = text .. "\n距离 ("..string.format("%.1f", (LP.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude).."m)"
            end
        end
        if _G.EspHealth == true then
            text = text .. "\n生命值 ("..string.format("%.0f", v.Humanoid.Health)..")"
        end
        
        v.Head["Esp_Gui"]:FindFirstChild("TextLabel").Text = text
        v.Head["Esp_Gui"]:FindFirstChild("TextLabel").TextSize = _G.EspGuiTextSize or 15
        v.Head["Esp_Gui"]:FindFirstChild("TextLabel").TextColor3 = _G.EspGuiTextColor or Color3.new(255, 255, 255)
    end
    
    if _G.EspGui == true and v.Head:FindFirstChild("Esp_Gui") == nil then
        local GuiPlayerEsp = Instance.new("BillboardGui", v.Head)
        GuiPlayerEsp.Adornee = v.Head
        GuiPlayerEsp.Name = "Esp_Gui"
        GuiPlayerEsp.Size = UDim2.new(0, 100, 0, 150)
        GuiPlayerEsp.AlwaysOnTop = true
        GuiPlayerEsp.StudsOffset = Vector3.new(0, 3, 0)
        
        local GuiPlayerEspText = Instance.new("TextLabel", GuiPlayerEsp)
        GuiPlayerEspText.BackgroundTransparency = 1
        GuiPlayerEspText.Font = Enum.Font.Code
        GuiPlayerEspText.Size = UDim2.new(0, 100, 0, 100)
        GuiPlayerEspText.TextSize = 15
        GuiPlayerEspText.TextColor3 = Color3.new(0,0,0) 
        GuiPlayerEspText.TextStrokeTransparency = 0.5
        GuiPlayerEspText.Text = ""
        
        local UIStroke = Instance.new("UIStroke")
        UIStroke.Color = Color3.new(0, 0, 0)
        UIStroke.Thickness = 1.5
        UIStroke.Parent = GuiPlayerEspText
    elseif _G.EspGui == false and v.Head:FindFirstChild("Esp_Gui") then
        v.Head:FindFirstChild("Esp_Gui"):Destroy()
    end
end

Main2Group:AddToggle("Killer", {
    Text = "杀手透视",
    Default = false, 
    Callback = function(Value) 
        _G.EspKiller = Value
        
        if _G.EspKiller == false then
            for i, v in pairs(workspace.Players:GetChildren()) do
                if v.Name == "Killers" then
                    for y, z in pairs(v:GetChildren()) do
                        if z:FindFirstChild("Esp_Highlight") then
                            z:FindFirstChild("Esp_Highlight"):Destroy()
                        end
                        if z:FindFirstChild("Head") then
                            for _, gui in pairs(z.Head:GetChildren()) do
                                if gui.Name:find("Esp_") then
                                    gui:Destroy()
                                end
                            end
                        end
                    end
                end
            end
        end
        
        while _G.EspKiller do
            for i, v in pairs(workspace.Players:GetChildren()) do
                if v.Name == "Killers" then
                    for y, z in pairs(v:GetChildren()) do
                        if z:GetAttribute("Username") ~= LP.Name and z:FindFirstChild("HumanoidRootPart") and z:FindFirstChild("Humanoid") and z:FindFirstChild("Head") then
                            Esp_Player(z, _G.ColorLightKill or Color3.fromRGB(255, 0, 0))
                        end
                    end
                end
            end
            task.wait()
        end
    end
}):AddColorPicker("杀手颜色", {
     Default = Color3.new(255, 0, 0),
     Callback = function(Value)
        _G.ColorLightKill = Value
     end
})

Main2Group:AddToggle("Survivors", {
    Text = "幸存者透视",
    Default = false, 
    Callback = function(Value) 
        _G.EspSurvivors = Value
        
        if _G.EspSurvivors == false then
            for i, v in pairs(workspace.Players:GetChildren()) do
                if v.Name == "Survivors" then
                    for y, z in pairs(v:GetChildren()) do
                        if z:FindFirstChild("Esp_Highlight") then
                            z:FindFirstChild("Esp_Highlight"):Destroy()
                        end
                        if z:FindFirstChild("Head") then
                            for _, gui in pairs(z.Head:GetChildren()) do
                                if gui.Name:find("Esp_") then
                                    gui:Destroy()
                                end
                            end
                        end
                    end
                end
            end
        end
        
        while _G.EspSurvivors do
            for i, v in pairs(workspace.Players:GetChildren()) do
                if v.Name == "Survivors" then
                    for y, z in pairs(v:GetChildren()) do
                        if z:GetAttribute("Username") ~= LP.Name and z:FindFirstChild("HumanoidRootPart") and z:FindFirstChild("Humanoid") and z:FindFirstChild("Head") then
                            Esp_Player(z, _G.ColorLightSurvivors or Color3.fromRGB(0, 255, 0))
                        end
                    end
                end
            end
            task.wait()
        end
    end
}):AddColorPicker("幸存者颜色", {
     Default = Color3.new(0, 255, 0),
     Callback = function(Value)
        _G.ColorLightSurvivors = Value
     end
})

Main2Group:AddToggle("Item", {
    Text = "物品透视",
    Default = false, 
    Callback = function(Value) 
        _G.EspItem = Value
        
        if _G.EspItem == false then
            if workspace.Map.Ingame:FindFirstChild("Map") then
                for i, v in ipairs(workspace.Map.Ingame:FindFirstChild("Map"):GetChildren()) do
                    if v:IsA("Tool") and v:FindFirstChild("ItemRoot") then
                        for c, n in ipairs(v.ItemRoot:GetChildren()) do
                            if n.Name:find("Esp_") then
                                n:Destroy()
                            end
                        end
                    end
                end
            end
        end
        
        while _G.EspItem do
            if workspace.Map.Ingame:FindFirstChild("Map") then
                for i, v in ipairs(workspace.Map.Ingame:FindFirstChild("Map"):GetChildren()) do
                    if v:IsA("Tool") and v:FindFirstChild("ItemRoot") then
                        -- 高亮处理
                        if v.ItemRoot:FindFirstChild("Esp_Highlight") then
                            v.ItemRoot:FindFirstChild("Esp_Highlight").FillColor = _G.ColorLight or Color3.fromRGB(255, 255, 255)
                            v.ItemRoot:FindFirstChild("Esp_Highlight").OutlineColor = _G.ColorLight or Color3.fromRGB(255, 255, 255)
                        end
                        
                        if _G.EspHighlight == true and v.ItemRoot:FindFirstChild("Esp_Highlight") == nil then
                            local Highlight = Instance.new("Highlight")
                            Highlight.Name = "Esp_Highlight"
                            Highlight.FillColor = Color3.fromRGB(255, 255, 255) 
                            Highlight.OutlineColor = Color3.fromRGB(255, 255, 255) 
                            Highlight.FillTransparency = 0.5
                            Highlight.OutlineTransparency = 0
                            Highlight.Adornee = v.ItemRoot
                            Highlight.Parent = v.ItemRoot
                        elseif _G.EspHighlight == false and v.ItemRoot:FindFirstChild("Esp_Highlight") then
                            v.ItemRoot:FindFirstChild("Esp_Highlight"):Destroy()
                        end
                        
                        -- GUI处理
                        if v.ItemRoot:FindFirstChild("Esp_Gui") and v.ItemRoot["Esp_Gui"]:FindFirstChild("TextLabel") then
                            local text = ""
                            if _G.EspName == true then
                                text = text .. v.Name
                            end
                            if _G.EspDistance == true then
                                if LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then
                                    text = text .. "\n距离 ("..string.format("%.0f", (LP.Character.HumanoidRootPart.Position - v.ItemRoot.Position).Magnitude).."m)"
                                end
                            end
                            
                            v.ItemRoot["Esp_Gui"]:FindFirstChild("TextLabel").Text = text
                            v.ItemRoot["Esp_Gui"]:FindFirstChild("TextLabel").TextSize = _G.EspGuiTextSize or 15
                            v.ItemRoot["Esp_Gui"]:FindFirstChild("TextLabel").TextColor3 = _G.EspGuiTextColor or Color3.new(255, 255, 255)
                        end
                        
                        if _G.EspGui == true and v.ItemRoot:FindFirstChild("Esp_Gui") == nil then
                            local GuiItemEsp = Instance.new("BillboardGui", v.ItemRoot)
                            GuiItemEsp.Adornee = v.ItemRoot
                            GuiItemEsp.Name = "Esp_Gui"
                            GuiItemEsp.Size = UDim2.new(0, 100, 0, 150)
                            GuiItemEsp.AlwaysOnTop = true
                            GuiItemEsp.StudsOffset = Vector3.new(0, 3, 0)
                            
                            local GuiItemEspText = Instance.new("TextLabel", GuiItemEsp)
                            GuiItemEspText.BackgroundTransparency = 1
                            GuiItemEspText.Font = Enum.Font.Code
                            GuiItemEspText.Size = UDim2.new(0, 100, 0, 100)
                            GuiItemEspText.TextSize = 15
                            GuiItemEspText.TextColor3 = Color3.new(0,0,0) 
                            GuiItemEspText.TextStrokeTransparency = 0.5
                            GuiItemEspText.Text = ""
                            
                            local UIStroke = Instance.new("UIStroke")
                            UIStroke.Color = Color3.new(0, 0, 0)
                            UIStroke.Thickness = 1.5
                            UIStroke.Parent = GuiItemEspText
                        elseif _G.EspGui == false and v.ItemRoot:FindFirstChild("Esp_Gui") then
                            v.ItemRoot:FindFirstChild("Esp_Gui"):Destroy()
                        end
                    end
                end
            end
            task.wait()
        end
    end
})

Main2Group:AddDivider()

-- ESP设置
_G.EspHighlight = false
Main2Group:AddToggle("高亮显示", {
    Text = "高亮显示",
    Default = false, 
    Callback = function(Value) 
        _G.EspHighlight = Value
    end
}):AddColorPicker("高亮颜色", {
     Default = Color3.new(255,255,255),
     Callback = function(Value)
        _G.ColorLight = Value
     end
})

_G.EspGui = false
Main2Group:AddToggle("GUI显示", {
    Text = "GUI显示",
    Default = false, 
    Callback = function(Value) 
        _G.EspGui = Value
    end
}):AddColorPicker("文字颜色", {
     Default = Color3.new(255,255,255),
     Callback = function(Value)
        _G.EspGuiTextColor = Value
     end
})

Main2Group:AddSlider("TextSize", {
    Text = "文字大小 [GUI]",
    Default = 7,
    Min = 7,
    Max = 50,
    Rounding = 0,
    Compact = false,
    Callback = function(Value)
        _G.EspGuiTextSize = Value
    end
})

Main2Group:AddDivider()

_G.EspName = false
Main2Group:AddToggle("显示名称", {
    Text = "显示名称",
    Default = false, 
    Callback = function(Value) 
        _G.EspName = Value
    end
})

_G.EspDistance = false
Main2Group:AddToggle("显示距离", {
    Text = "显示距离",
    Default = false, 
    Callback = function(Value) 
        _G.EspDistance = Value
    end
})

_G.EspHealth = false
Main2Group:AddToggle("显示生命值", {
    Text = "显示生命值",
    Default = false, 
    Callback = function(Value) 
        _G.EspHealth = Value
    end
})

-- 反检测标签页
local Anti1Group = Tabs.Anti:AddLeftGroupbox("反检测")

Anti1Group:AddToggle("Acid", {
    Text = "防酸液",
    Default = false, 
    Callback = function(Value) 
        _G.AntiAcid = Value
        while _G.AntiAcid do
            if workspace.Map.Ingame:FindFirstChild("Map") then
                for i, v in ipairs(workspace.Map.Ingame:FindFirstChild("Map"):GetChildren()) do
                    if v.Name == "AcidContainer" then
                        for _, Acid in ipairs(v:GetChildren()) do
                            if Acid:IsA("BasePart") then
                                Acid.CanTouch = false
                            end
                        end
                    end
                end
            end
            task.wait()
        end
    end
})

-- 界面设置标签页
local MenuGroup = Tabs["UI Settings"]:AddLeftGroupbox("菜单设置")
local CreditsGroup = Tabs["UI Settings"]:AddRightGroupbox("制作人员")
local Info = Tabs["UI Settings"]:AddRightGroupbox("信息")

MenuGroup:AddDropdown("NotifySide", {
    Text = "通知位置",
    Values = {"左侧", "右侧"},
    Default = "右侧",
    Multi = false,
    Callback = function(Value)
        Library:SetNotifySide(Value == "左侧" and "Left" or "Right")
    end
})

_G.ChooseNotify = "Obsidian"
MenuGroup:AddDropdown("NotifyChoose", {
    Text = "通知类型",
    Values = {"Obsidian", "Roblox"},
    Default = "Obsidian",
    Multi = false,
    Callback = function(Value)
        _G.ChooseNotify = Value
    end
})

_G.NotificationSound = true
MenuGroup:AddToggle("NotifySound", {
    Text = "通知音效",
    Default = true, 
    Callback = function(Value) 
        _G.NotificationSound = Value 
    end
})

MenuGroup:AddSlider("VolumeNotification", {
    Text = "通知音量",
    Default = 2,
    Min = 2,
    Max = 10,
    Rounding = 1,
    Compact = true,
    Callback = function(Value)
        _G.VolumeTime = Value
    end
})

MenuGroup:AddToggle("KeybindMenuOpen", {
    Text = "显示按键绑定菜单",
    Default = false, 
    Callback = function(Value) 
        Library.KeybindFrame.Visible = Value 
    end
})

MenuGroup:AddToggle("ShowCustomCursor", {
    Text = "自定义光标",
    Default = true, 
    Callback = function(Value) 
        Library.ShowCustomCursor = Value 
    end
})

MenuGroup:AddDivider()
MenuGroup:AddLabel("菜单按键绑定"):AddKeyPicker("MenuKeybind", {
    Default = "RightShift", 
    NoUI = true, 
    Text = "菜单按键"
})

_G.LinkJoin = loadstring(game:HttpGet("https://pastefy.app/2LKQlhQM/raw"))()

MenuGroup:AddButton("复制Discord链接", function()
    if setclipboard then
        setclipboard(_G.LinkJoin["Discord"])
        Library:Notify("已复制Discord链接到剪贴板!")
    else
        Library:Notify("Discord链接: ".._G.LinkJoin["Discord"], 10)
    end
end)

MenuGroup:AddButton("复制Zalo链接", function()
    if setclipboard then
        setclipboard(_G.LinkJoin["Zalo"])
        Library:Notify("已复制Zalo链接到剪贴板!")
    else
        Library:Notify("Zalo链接: ".._G.LinkJoin["Zalo"], 10)
    end
end)

MenuGroup:AddButton("卸载脚本", function() 
    Library:Unload() 
end)

CreditsGroup:AddLabel("AmongUs - Python / Dex / 脚本", true)
CreditsGroup:AddLabel("Giang Hub - 脚本 / Dex", true)
CreditsGroup:AddLabel("Vu - 脚本 / Dex", true)

-- 信息显示
Info:AddLabel("国家/地区 [ "..game:GetService("LocalizationService"):GetCountryRegionForPlayerAsync(LP).." ]", true)
Info:AddLabel("执行器 [ "..identifyexecutor().." ]", true)
Info:AddLabel("游戏ID [ "..game.JobId.." ]", true)
Info:AddDivider()

Info:AddButton("复制游戏ID", function()
    if setclipboard then
        setclipboard(tostring(game.JobId))
        Library:Notify("复制成功")
    else
        Library:Notify(tostring(game.JobId), 10)
    end
end)

Info:AddInput("JoinJob", {
    Default = "",
    Numeric = false,
    Text = "加入游戏",
    Placeholder = "输入游戏ID",
    Callback = function(Value)
        _G.JobIdJoin = Value
    end
})

Info:AddButton("加入游戏", function()
    if _G.JobIdJoin and _G.JobIdJoin ~= "" then
        TeleportService:TeleportToPlaceInstance(game.PlaceId, _G.JobIdJoin, LP)
    else
        Library:Notify("请输入有效的游戏ID")
    end
end)

Info:AddButton("复制加入代码", function()
    if setclipboard then
        setclipboard('game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, "'..game.JobId..'", game.Players.LocalPlayer)')
        Library:Notify("复制成功") 
    else
        Library:Notify('game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, "'..game.JobId..'", game.Players.LocalPlayer)', 10)
    end
end)

-- 设置库
Library.ToggleKeybind = Options.MenuKeybind

ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
SaveManager:BuildConfigSection(Tabs["UI Settings"])
ThemeManager:ApplyToTab(Tabs["UI Settings"])
SaveManager:LoadAutoloadConfig()

Library:Notify("被遗弃加载成功!", 5)