local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

local Window = WindUI:CreateWindow({
  Title = "旧冬Script V1",
  Icon = "XiaoXu",
  Author = "By XiaoXu",
  Folder = "旧冬&UnicoX",
  Size = UDim2.fromOffset(560, 360),
  Transparent = true,
  Theme = "Dark",
  User = {
    Enabled = true, -- <- or false
    Callback = function() print("clicked") end, -- <- optional
    Anonymous = true -- <- or true
  },
})

Window:EditOpenButton({
  Title = "旧冬Script",
  Icon = "XiaoXu",
  CornerRadius = UDim.new(0,16),
  StrokeThickness = 2,
  Color = ColorSequence.new( -- gradient
  Color3.fromHex("FF0F7B"),
  Color3.fromHex("F89B29")
  ),
  --Enabled = false,
  Draggable = true,
})

function Tab(a)
  return Window:Tab({Title = a, Icon = "eye"})
end
function Button(a, b, c)
  return a:Button({Title = b, Callback = c})
end
function Toggle(a, b, c, d)
  return a:Toggle({Title = b, Value = c, Callback = d})
end
function Slider(a, b, c, d, e, f)
  return a:Slider({Title = b, Step = 1, Value = {Min = c, Max = d, Default = e}, Callback = f})
end
function Dropdown(a, b, c, d, e)
  return a:Dropdown({Title = b, Values = c, Value = d, Callback = e})
end

local Tab1 = Tab("通用")
local Tab2 = Tab("DOORS")
local Tab3 = Tab("rooms&doors")
local Tab4 = Tab("压力,doors")
local Tab5 = Tab("动感星期五")
local Tab6 = Tab("压力")
local Tab7 = Tab("战争大亨")
local Tab8 = Tab("da hood")
local Tab9 = Tab("力量传奇")
local Tab10 = Tab("忍者传奇")
local Tab11 = Tab("极速传奇")
local Tab12 = Tab("彩虹朋友")
local Tab13 = Tab("By手腕")
local Tab14 = Tab("能量突击")
local Tab15 = Tab("汽车经销大亨")
local Tab16 = Tab("伐木大亨")
local Tab17 = Tab("破坏者谜团")
local Tab18 = Tab("进击的僵尸")
local Tab19 = Tab("战斗勇士")
local Tab20 = Tab("监狱人生")
local Tab21 = Tab("战争大亨")
local Tab22 = Tab("最强战场🔥")
local Tab23 = Tab("BF🌲")
local Tab24 = Tab("巴掌模拟器👋")
local Tab25 = Tab("一次尘土的旅行🚗")
local Tab26 = Tab("动感星期五🎤")
local Tab27 = Tab("战斗勇士⚔️")
local Tab28 = Tab("俄亥俄州")
local Tab29 = Tab("鲨口求生2")
local Tab30 = Tab("造船寻宝")
local Tab31 = Tab("自然灾害模拟器")
local Tab32 = Tab("骨折VI")
local Tab33 = Tab("刀刃球")
local Tab34 = Tab("感染性微笑")
local Tab35 = Tab("铲雪模拟器")
local Tab36 = Tab("河北唐县")
local Tab37 = Tab("火箭发射模拟器")
local Tab38 = Tab("脚本")
local Tab39 = Tab("FE")
local Tab40 = Tab("其他脚本")
local Tab41 = Tab("Forsaken")

Button(Tab1, "飞行", function() loadstring(game:HttpGet'https://raw.githubusercontent.com/QiuShan-UX/UnicoX/refs/heads/main/%E9%A3%9E%E8%A1%8C%E7%A4%BA%E4%BE%8B.lua')() end)
Slider(Tab1, "移动速度", 1, 10000, game.Players.LocalPlayer.Character.Humanoid.WalkSpeed, function(a) game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = a end)
Slider(Tab1, "跳跃高度", 1, 10000, game.Players.LocalPlayer.Character.Humanoid.JumpPower, function(a) game.Players.LocalPlayer.Character.Humanoid.JumpPower = a end)
Slider(Tab1, "重力设置", -50, 500, workspace.Gravity, function(a) workspace.Gravity = a end)
Toggle(Tab1, "穿墙", false, function(a)
    if game.Players.LocalPlayer.Character then
        for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
            if v:IsA("BasePart") then
                if a then
                    v.CanCollide = false
                else
                    v.CanCollide = true
                end
            end
        end
    end
end)
Button(Tab1, "隐身", function() loadstring(game:HttpGet("https://gist.githubusercontent.com/skid123skidlol/cd0d2dce51b3f20ad1aac941da06a1a1/raw/f58b98cce7d51e53ade94e7bb460e4f24fb7e0ff/%257BFE%257D%2520Invisible%2520Tool%2520(can%2520hold%2520tools)"))()end)
Button(Tab1, "爬墙", function() loadstring(game:HttpGet("https://pastebin.com/raw/zXk4Rq2r"))() end)
Button(Tab1, "光影V4", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/MZEEN2424/Graphics/main/Graphics.xml"))()end)
Button(Tab1, "飞车", function()loadstring(game:HttpGet("https://pastebin.com/raw/MHE1cbWF"))()end)
Button(Tab1, "甩飞", function()loadstring(game:HttpGet("https://pastebin.com/raw/GnvPVBEi"))()end)
Button(Tab1, "跟踪玩家", function()loadstring(game:HttpGet("https://pastebin.com/raw/F9PNLcXk"))()end)
Button(Tab1,"踏空行走", function()loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Float'))()end)
Button(Tab1,"转起来", function()loadstring(game:HttpGet('https://pastebin.com/raw/r97d7dS0'))()end)
Button(Tab1,"透视", function()loadstring(game:HttpGet('https://raw.githubusercontent.com/cool83birdcarfly02six/UNIVERSALESPLTX/main/README.md'))()end)
Button(Tab1,"聊天绕过", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/BingusWR/Fechatbypassroblox/refs/heads/main/Fe%20Roblox%20ChatBypass"))()end)
Button(Tab1,"帽子旋转", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/BingusWR/Fe-Spinning-Hat-Script/refs/heads/main/Fe%20Spinning%20Hats%20Script"))()end)
Button(Tab1,"r15变r6", function()loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-R6-Animations-on-R15-16865"))()end)
Button(Tab1,"选人甩飞（需要输入别人的名字）", function()loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Auto%20Fling%20Player'))()end)
Button(Tab1,"阿尔宙斯自瞄", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/chillz-workshop/main/Arceus%20Aimbot.lua"))()end)
Button(Tab1,"换皮肤（需要别人id还需要加入群组Hell_$treet）", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/Invooker11/Outfit/main/OutfitCopier.lua"))()end)
Button(Tab1,"键盘脚本", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/Xxtan31/Ata/main/deltakeyboardcrack.txt"))()end)
Button(Tab1,"无限收益（copyid 输入别人名字获得id可搭配换皮肤使用）", function()loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()end)
Button(Tab1,"光影", function()loadstring(game:HttpGet('https://pastefy.app/xXkUxA0P/raw'))()end)
Button(Tab1,"无头加kor", function()loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Permanent-Headless-And-korblox-Script-4140"))() end)
Button(Tab1,"情云同款自瞄可调", function() local fov = 100 local smoothness = 10 local crosshairDistance = 5 local RunService = game:GetService("RunService") local UserInputService = game:GetService("UserInputService") local Players = game:GetService("Players") local Cam = game.Workspace.CurrentCamera local FOVring = Drawing.new("Circle") FOVring.Visible = true FOVring.Thickness = 2 FOVring.Color = Color3.fromRGB(0, 255, 0) FOVring.Filled = false FOVring.Radius = fov FOVring.Position = Cam.ViewportSize / 2 local Player = Players.LocalPlayer local PlayerGui = Player:WaitForChild("PlayerGui") local ScreenGui = Instance.new("ScreenGui") ScreenGui.Name = "FovAdjustGui" ScreenGui.Parent = PlayerGui local Frame = Instance.new("Frame") Frame.Name = "MainFrame" Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30) Frame.BorderColor3 = Color3.fromRGB(128, 0, 128) Frame.BorderSizePixel = 2 Frame.Position = UDim2.new(0.3, 0, 0.3, 0) Frame.Size = UDim2.new(0.4, 0, 0.4, 0) Frame.Active = true Frame.Draggable = true Frame.Parent = ScreenGui local MinimizeButton = Instance.new("TextButton") MinimizeButton.Name = "MinimizeButton" MinimizeButton.Text = "-" MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255) MinimizeButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50) MinimizeButton.Position = UDim2.new(0.9, 0, 0, 0) MinimizeButton.Size = UDim2.new(0.1, 0, 0.1, 0) MinimizeButton.Parent = Frame local isMinimized = false MinimizeButton.MouseButton1Click:Connect(function() isMinimized = not isMinimized if isMinimized then Frame:TweenSize(UDim2.new(0.1, 0, 0.1, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3, true) MinimizeButton.Text = "+" else Frame:TweenSize(UDim2.new(0.4, 0, 0.4, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3, true) MinimizeButton.Text = "-" end end) local FovLabel = Instance.new("TextLabel") FovLabel.Name = "FovLabel" FovLabel.Text = "自瞄范围" FovLabel.TextColor3 = Color3.fromRGB(255, 255, 255) FovLabel.BackgroundTransparency = 1 FovLabel.Position = UDim2.new(0.1, 0, 0.1, 0) FovLabel.Size = UDim2.new(0.8, 0, 0.2, 0) FovLabel.Parent = Frame local FovSlider = Instance.new("TextBox") FovSlider.Name = "FovSlider" FovSlider.Text = tostring(fov) FovSlider.TextColor3 = Color3.fromRGB(255, 255, 255) FovSlider.BackgroundColor3 = Color3.fromRGB(50, 50, 50) FovSlider.Position = UDim2.new(0.1, 0, 0.3, 0) FovSlider.Size = UDim2.new(0.8, 0, 0.2, 0) FovSlider.Parent = Frame local SmoothnessLabel = Instance.new("TextLabel") SmoothnessLabel.Name = "SmoothnessLabel" SmoothnessLabel.Text = "自瞄平滑度" SmoothnessLabel.TextColor3 = Color3.fromRGB(255, 255, 255) SmoothnessLabel.BackgroundTransparency = 1 SmoothnessLabel.Position = UDim2.new(0.1, 0, 0.5, 0) SmoothnessLabel.Size = UDim2.new(0.8, 0, 0.2, 0) SmoothnessLabel.Parent = Frame local SmoothnessSlider = Instance.new("TextBox") SmoothnessSlider.Name = "SmoothnessSlider" SmoothnessSlider.Text = tostring(smoothness) SmoothnessSlider.TextColor3 = Color3.fromRGB(255, 255, 255) SmoothnessSlider.BackgroundColor3 = Color3.fromRGB(50, 50, 50) SmoothnessSlider.Position = UDim2.new(0.1, 0, 0.7, 0) SmoothnessSlider.Size = UDim2.new(0.8, 0, 0.2, 0) SmoothnessSlider.Parent = Frame local CrosshairDistanceLabel = Instance.new("TextLabel") CrosshairDistanceLabel.Name = "CrosshairDistanceLabel" CrosshairDistanceLabel.Text = "自瞄预判距离" CrosshairDistanceLabel.TextColor3 = Color3.fromRGB(255, 255, 255) CrosshairDistanceLabel.BackgroundTransparency = 1 CrosshairDistanceLabel.Position = UDim2.new(0.1, 0, 0.9, 0) CrosshairDistanceLabel.Size = UDim2.new(0.8, 0, 0.2, 0) CrosshairDistanceLabel.Parent = Frame local CrosshairDistanceSlider = Instance.new("TextBox") CrosshairDistanceSlider.Name = "CrosshairDistanceSlider" CrosshairDistanceSlider.Text = tostring(crosshairDistance) CrosshairDistanceSlider.TextColor3 = Color3.fromRGB(255, 255, 255) CrosshairDistanceSlider.BackgroundColor3 = Color3.fromRGB(50, 50, 50) CrosshairDistanceSlider.Position = UDim2.new(0.1, 0, 1.1, 0) CrosshairDistanceSlider.Size = UDim2.new(0.8, 0, 0.2, 0) CrosshairDistanceSlider.Parent = Frame local targetCFrame = Cam.CFrame local function updateDrawings() local camViewportSize = Cam.ViewportSize FOVring.Position = camViewportSize / 2 FOVring.Radius = fov end local function onKeyDown(input) if input.KeyCode == Enum.KeyCode.Delete then RunService:UnbindFromRenderStep("FOVUpdate") FOVring:Remove() end end UserInputService.InputBegan:Connect(onKeyDown) local function getClosestPlayerInFOV(trg_part) local nearest = nil local last = math.huge local playerMousePos = Cam.ViewportSize / 2 for _, player in ipairs(Players:GetPlayers()) do if player ~= Players.LocalPlayer then local part = player.Character and player.Character:FindFirstChild(trg_part) if part then local ePos, isVisible = Cam:WorldToViewportPoint(part.Position) local distance = (Vector2.new(ePos.x, ePos.y) - playerMousePos).Magnitude if distance < last and isVisible and distance < fov then last = distance nearest = player end end end end return nearest end RunService.RenderStepped:Connect(function() updateDrawings() local closest = getClosestPlayerInFOV("Head") if closest and closest.Character:FindFirstChild("Head") then local targetCharacter = closest.Character local targetHead = targetCharacter.Head local targetRootPart = targetCharacter:FindFirstChild("HumanoidRootPart") local isMoving = targetRootPart.Velocity.Magnitude > 0.1 local targetPosition if isMoving then targetPosition = targetHead.Position + (targetHead.CFrame.LookVector * crosshairDistance) else targetPosition = targetHead.Position end targetCFrame = CFrame.new(Cam.CFrame.Position, targetPosition) else targetCFrame = Cam.CFrame end Cam.CFrame = Cam.CFrame:Lerp(targetCFrame, 1 / smoothness) end) FovSlider.FocusLost:Connect(function(enterPressed, inputThatCausedFocusLoss) if enterPressed then local newFov = tonumber(FovSlider.Text) if newFov then fov = newFov else FovSlider.Text = tostring(fov) end end end) SmoothnessSlider.FocusLost:Connect(function(enterPressed, inputThatCausedFocusLoss) if enterPressed then local newSmoothness = tonumber(SmoothnessSlider.Text) if newSmoothness then smoothness = newSmoothness else SmoothnessSlider.Text = tostring(smoothness) end end end) CrosshairDistanceSlider.FocusLost:Connect(function(enterPressed, inputThatCausedFocusLoss) if enterPressed then local newCrosshairDistance = tonumber(CrosshairDistanceSlider.Text) if newCrosshairDistance then crosshairDistance = newCrosshairDistance else CrosshairDistanceSlider.Text = tostring(crosshairDistance) end end end) end)
Toggle(Tab1, "Circle ESP", false, function(state)
  for _, player in pairs(game.Players:GetPlayers()) do
    if player ~= game.Players.LocalPlayer then
      if state then
        local highlight = Instance.new("Highlight")
        highlight.Parent = player.Character
        highlight.Adornee = player.Character

        local billboard = Instance.new("BillboardGui")
        billboard.Parent = player.Character
        billboard.Adornee = player.Character
        billboard.Size = UDim2.new(0, 100, 0, 100)
        billboard.StudsOffset = Vector3.new(0, 3, 0)
        billboard.AlwaysOnTop = true

        local nameLabel = Instance.new("TextLabel")
        nameLabel.Parent = billboard
        nameLabel.Size = UDim2.new(1, 0, 1, 0)
        nameLabel.BackgroundTransparency = 1
        nameLabel.Text = player.Name
        nameLabel.TextColor3 = Color3.new(1, 1, 1)
        nameLabel.TextStrokeTransparency = 0.5
        nameLabel.TextScaled = true

        local circle = Instance.new("ImageLabel")
        circle.Parent = billboard
        circle.Size = UDim2.new(0, 50, 0, 50)
        circle.Position = UDim2.new(0.5, 0, 0.5, 0) -- Center the circle
        circle.AnchorPoint = Vector2.new(0.5, 0.5) -- Set the anchor point to the center
        circle.BackgroundTransparency = 1
        circle.Image = "rbxassetid://2200552246" -- Replace with your circle image asset ID
       else
        if player.Character:FindFirstChildOfClass("Highlight") then
          player.Character:FindFirstChildOfClass("Highlight"):Destroy()
        end
        if player.Character:FindFirstChildOfClass("BillboardGui") then
          player.Character:FindFirstChildOfClass("BillboardGui"):Destroy()
        end
      end
    end
  end
end)

Button(Tab2,"门", function()loadstring(game:HttpGet("https://github.com/DocYogurt/free/raw/main/long"))()end)
Button(Tab2,"Poop doors", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/mstudio45/poopdoors_edited/main/poopdoors_edited.lua"))()end)
Button(Tab2,"穿墙(无拉回)", function()loadstring(game:HttpGet("https://github.com/DXuwu/OK/raw/main/clip"))()end)
Button(Tab2,"变身(阿巴怪提供)", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/ChronoAccelerator/Public-Scripts/main/Morphing/MorphScript.lua"))()end)
Button(Tab2,"剪刀", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/MrNeRD0/Doors-Hack/main/shears_done.lua"))()end)
Button(Tab2,"XD夜", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/DXuwu/test-lol/main/YO.lua"))()end)
Button(Tab2,"超级脚本", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/Fazedrab/EntitySpawner/main/doors(orionlib).lua"))()end)
Button(Tab2,"脚本", function()loadstring(game:HttpGet('https://pastebin.com/raw/s5dhYNrm'))()end)
Button(Tab2,"MS", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/notpoiu/mspaint/main/main.lua"))()end)
Button(Tab2,"bob汉化", function()loadstring(game:HttpGet("https://pastebin.com/raw/65TwT8ja"))()end)
Button(Tab2,"脚本doors", function()loadstring(game:HttpGet("https://pastebin.com/raw/whXp1Ca2"))()end)
Button(Tab2,"刷怪菜单", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/cbhlyy/lyycbh/main/shuaguai"))()end)
Button(Tab2,"DOORS变身脚本", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/ChronoAccelerator/Public-Scripts/main/Morphing/MorphScript.lua"))()end)
Button(Tab2,"耶稣十字架", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/cbhlyy/lyycbh/main/shizi2"))()end)
Button(Tab2,"紫光十字架", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/cbhlyy/lyycbh/main/shizi3"))()end)
Button(Tab2,"万圣节十字架", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/cbhlyy/lyycbh/main/shizi4"))()end)
Button(Tab2,"普通十字架", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/cbhlyy/lyycbh/main/shizizhen"))()end)
Button(Tab2,"门", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/wshibsiyedehl/Doorsxiaochen/main/DoorschenNew114514%20or%203.1415926%20%E6%97%A0%E6%B3%95%E7%90%86%E8%A7%A3%E6%97%A0%E6%B3%95%E7%90%86%E8%A7%A3%E6%97%A0%E6%B3%95%E7%90%86%E8%A7%A3"))()end)
Button(Tab2,"Darkrai", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/GamingScripter/Darkrai-X/main/Games/Doors"))()end)
Button(Tab2,"RP变怪（别人看不见）", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/ChronoAccelerator/Public-Scripts/main/Morphing/MorphScript.lua"))()end)
Button(Tab2,"门", function()loadstring(game:HttpGet("https://github.com/DocYogurt/free/raw/main/long"))()end)
Button(Tab2,"手电筒（没电会有bug）", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/K0t1n/Public/main/Normal%20Flashlight"))() end)
Button(Tab2,"神圣炸弹（清岩提供）", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/MrNeRD0/Doors-Hack/main/HolyGrenadeByNerd.lua"))()end)
Button(Tab2,"十字架", function()loadstring(game:HttpGet('https://gist.githubusercontent.com/C00LBOZO/0c78ad8c74ca26324c87ede16ce8b387/raw/c0887ac0d24fde80bea11ab1a6a696ec296af272/Crucifix'))()end)
Button(Tab2,"吸铁石", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/MrNeRD0/Doors-Hack/main/MagnetByNerd.lua"))()end)
Button(Tab2,"剪刀", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/MrNeRD0/Doors-Hack/main/shears_done.lua"))() end)
Button(Tab2,"激光枪", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/K0t1n/Public/main/Laser%20Gun"))()end)
Button(Tab2,"能量罐（清岩提供）", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/cbhlyy/lyycbh/main/nengliangtiao"))() end)
Button(Tab2,"紫色手电筒（在电梯购买东西的时候使用）", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/K0t1n/Public/main/Purple%20Flashlight"))() end)
Button(Tab2,"刷怪菜单", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/cbhlyy/lyycbh/main/shuaguai"))()end)
Button(Tab2,"DOORS变身脚本", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/ChronoAccelerator/Public-Scripts/main/Morphing/MorphScript.lua"))() end)
Button(Tab2,"耶稣十字架", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/cbhlyy/lyycbh/main/shizi2"))()end)
Button(Tab2,"紫光十字架", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/cbhlyy/lyycbh/main/shizi3"))()end)
Button(Tab2,"万圣节十字架", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/cbhlyy/lyycbh/main/shizi4"))()end)
Button(Tab2,"普通十字架", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/cbhlyy/lyycbh/main/shizizhen"))()end)

Button(Tab3,"rooms&doors", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/ChinaQY/Scripts/Main/Rooms%20%26%20Doors"))()end)
Button(Tab3,"rooms同人服务器", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/ChinaQY/Scripts/Main/Rooms"))()end)

Button(Tab4,"最强doors & 压力", function()loadstring(game:HttpGet("https://github.com/Drop56796/CreepyEyeHub/blob/main/obfuscate.lua?raw=true"))()end)

Button(Tab5,"动感星期五1", function()loadstring(game:HttpGet("https://rawscripts.net/raw/Funky-Friday-Fire-Hub-18850"))()end)

Button(Tab6,"NB", function()loadstring(game:HttpGet('https://github.com/DocYogurt/Main/raw/main/Scripts/Pressure'))()end)

Button(Tab7,"自动偷箱", function()loadstring(game:HttpGet('https://raw.githubusercontent.com/Cazzanos/The-basement/main/Basement%20hub'))()end)

Button(Tab8,"不知名中心", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/DHBCommunity/DHBOfficialScript/main/FinallyV4"))()end)
Button(Tab8,"自瞄", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/yzeedw/Mortalv2-main/main/mortal.cc/ekittens/mc%20target%20v0.3"))()end)

Button(Tab9,"力量传奇", function()loadstring(game:HttpGet('https://raw.githubusercontent.com/jynzl/main/main/Musclas%20Legenos.lua'))() end)
Button(Tab9,"杯脚本", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/zuohongjian/bjb/main/llcq"))()end)
Button(Tab9,"V.G Hub", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/1201for/littlegui/main/MuscleLegends"))()end)
Button(Tab9,"英文", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/why-png/scriptstuffz/master/ninjaleg2"))()end)
Button(Tab9,"改力量", function()loadstring(game:HttpGet('https://raw.githubusercontent.com/jynzl/main/main/Musclas%20Legenos.lua'))()end)
Button(Tab9,"力量传奇Muscle Legend", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/harisiskandar178/Roblox-Script/main/Muscle%20Legend"))()end)
Button(Tab9,"力量传奇", function()loadstring(game:GetObjects("rbxassetid://10048914323")[1].Source)()end)
Button(Tab9,"传送到出生点", function()game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(7, 3, 108)end)
Button(Tab9,"传送到安全岛", function()game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-39, 10, 1838)end)
Button(Tab9,"传送到幸运抽奖区域", function()game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2606, -2, 5753)end)
Button(Tab9,"传送到肌肉之王健身房", function()game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-8554, 22, -5642)end)
Button(Tab9,"传送到传说健身房", function()game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4676, 997, -3915)end)
Button(Tab9,"传送到永恒健身房", function()game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-6686, 13, -1284)end)
Button(Tab9,"传送到神话健身房", function()game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2177, 13, 1070)end)
Button(Tab9,"传送到冰霜健身房", function()game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2543, 13, -410)end)

Button(Tab10,"忍者传奇", function()loadstring(game:HttpGet("https://pastebin.com/raw/2UjrXwTV"))()end)
Button(Tab10,"青", function()loadstring(game:HttpGet('https://rentry.co/ct293/raw'))()end)
Button(Tab10,"项目一", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/harisiskandar178/5repo/main/script4.lua"))()end)
Button(Tab10,"项目二", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/zerpqe/script/main/NinjaLegends.lua"))() end)
Button(Tab10,"项目三", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/XRoLLu/UWU/main/Ninja-Legenos.exe.lua"))()end)
Button(Tab10,"解锁所有岛", function()
  for _, v in next, game.workspace.islandUnlockParts:GetChildren() do
    if v then
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.islandSignPart.CFrame
      wait(.5)
    end
  end
end)

Button(Tab11,"速度传奇", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/241131685/baidhub/main/speed-of-len"))()end)
Button(Tab11,"极速传奇", function()loadstring(game:HttpGet('https://raw.githubusercontent.com/boyscp/beta/main/%E9%80%9F%E5%BA%A6%E7%82%B8%E8%B5%B7.lua'))()end)
Button(Tab11,"青", function()loadstring(game:HttpGet('https://rentry.co/ct293/raw'))()end)
Button(Tab11,"Boa", function()loadstring(game:HttpGet('https://raw.githubusercontent.com/BoaHacker/ROBLOX/main/cheat'))()end)
Button(Tab11,"汉化（改数值）", function()loadstring(game:HttpGet("https://pastebin.com/raw/egMXJcwB"))()end)

Button(Tab12,"彩虹朋友", function()loadstring(game:HttpGet('https://raw.githubusercontent.com/Sempiller/RainbowTool/main/Turkish.lua'))()end)

Button(Tab13,"掰手腕", function()loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/99d16edc79729a038994f85ce7335971.lua"))()end)
Button(Tab13,"脚本2——Key:ScriptJezz", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/ZhenX201/FE-Infinite-Money-All-Stats/main/source"))()end)
Button(Tab13,"无卡", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/KrzysztofHub/script/main/loader.lua"))()end)
Button(Tab13,"无卡", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/zicus-scripts/SkullHub/main/Loader.lua"))()end)
Button(Tab13,"无卡", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/LOLking123456/wrestle2/main/armsim"))()end)

Button(Tab14,"能量突击", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/Harley-HUB/Energy-Assault/main/Ene"))()end)

Button(Tab15,"英文版", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/03sAlt/BlueLockSeason2/main/README.md"))()end)

Button(Tab16,"0x37", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/x0x37x/darkx-crack/refs/heads/main/crack.lua"))()end)
Button(Tab16,"Butter hub", function()loadstring(game:HttpGet('https://raw.githubusercontent.com/Butterisgood/Butter/main/Butter%20V3%20Testers.txt'))("")end)
Button(Tab16,"Dark脚本", function()loadstring(game:HttpGet"https://raw.githubusercontent.com/darkxwin/darkxsourcethinkyoutousedarkx/main/darkx")()end)
Button(Tab16,"伐木", function()loadstring(game:HttpGet('https://raw.githubusercontent.com/ItsEcstasy/Nightfall/main/Versions/2.10.4'))()end)
Button(Tab16,"LuaWare", function()loadstring(game:HttpGet('https://raw.githubusercontent.com/frencaliber/LuaWareLoader.lw/main/luawareloader.wtf'))()end)
Button(Tab16,"伐木大亨", function()loadstring(game:HttpGet('https://getexploits.com/key-system/',true))('https://da.com/936657404291084298/1006220505583460352/Script.txt')end)
Button(Tab16,"伐木大亨", function()loadstring(game:HttpGet('https://gist.githubusercontent.com/ItsEcstasy/327b705029ed89fd1be0f8382b3fb04f/raw/07c7beb24aebec0a26f4622c92b593428811db4d/Nightfall1.7-Temp'))()end)
Button(Tab16,"青脚本", function()loadstring(game:HttpGet('https://raw.githubusercontent.com/kkaaccnnbb/money/main/fix'))()end)

Button(Tab17,"破坏者迷团", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/Ethanoj1/EclipseMM2/master/Script"))()end)

Button(Tab18,"进击的僵尸", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/GamingScripter/Darkrai-X/main/Games/Zombie%20Attack"))()end)

Button(Tab19,"战斗勇士", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/frkfx/Combat-Warriors/main/Script"))()end)

Button(Tab20,"监狱人生", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/Denverrz/scripts/master/PRISONWARE_v1.3.txt"))()end)
Button(Tab20,"过于牛逼，谁用谁孤儿的管理员", function()loadstring(game:HttpGet('https://raw.githubusercontent.com/H17S32/Tiger_Admin/main/Script'))()end)
Button(Tab20,"新菜单", function()loadstring(game:HttpGet('https://raw.githubusercontent.com/LiverMods/xRawnder/main/HubMoblie'))()end)
Button(Tab20,"警卫室", function()game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(847.7261352539062, 98.95999908447266, 2267.387451171875)end)
Button(Tab20,"监狱室内", function()game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(919.2575073242188, 98.95999908447266, 2379.74169921875)end)
Button(Tab20,"罪犯复活点", function()game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-937.5891723632812, 93.09876251220703, 2063.031982421875)end)
Button(Tab20,"监狱室外", function()game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(760.6033325195312, 96.96992492675781, 2475.405029296875)end)

Button(Tab21,"脚本1", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/ufouzzed/WarTycoon/main/ByJMaxeyy"))()end)
Button(Tab21,"脚本二", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/ToraIsMe/ToraIsMe/main/0wartycoon"))()end)
Button(Tab21,"脚本三", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/Nivex123456/War-Tycoon/main/Script"))()end)

Button(Tab22,"Kj动作", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/Tariviste/Scripts/eaf7c8bdc00fcd01c656d9b4c103b6e4a260e374/The%20Strongest%20Battlegrounds"))()end)
Button(Tab22,"1v1单挑王", function()loadstring(game:HttpGet("https://pastefy.app/HxjXAU2d/raw"))()end)
Button(Tab22,"刀锋", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/zyrask/Nexus-Base/main/atomic-blademaster%20to%20sukuna"))()end)
Button(Tab22,"五条悟", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/skibiditoiletfan2007/BaldyToSorcerer/main/Latest.lua"))()end)
Button(Tab22,"饿狼自动1+2", function()loadstring(game:HttpGet("https://pastefy.app/Z7DawZJB/raw"))()end)
Button(Tab22,"饿狼改索尼克", function()loadstring(game:HttpGet("https://pastebin.com/raw/7V1mUBtQ"))()end)
Button(Tab22,"琦玉改JUN", function()loadstring(game:HttpGet('https://raw.githubusercontent.com/Kenjihin69/Kenjihin69/refs/heads/main/Tp%20exploit%20saitama%20to%20jun'))()end)
Button(Tab22,"死神v2", function()getgenv().Music = false getgenv().AttackQuality = 'High' getgenv().ConstantSpeed = false loadstring(game:HttpGet("https://raw.githubusercontent.com/Reapvitalized/TSB/main/APOPHENIA.lua"))()end)
Button(Tab22,"迪奥", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/Medley-Taboritsky/RobloxScripting/refs/heads/main/DIO_Garou_TSB"))()end)
Button(Tab22,"饿狼不知道该叫什么", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/Reapvitalized/TSB/refs/heads/main/ARCAURA.lua"))()end)
Button(Tab22,"索尼克改TOJI", function()loadstring(game:HttpGet"https://raw.githubusercontent.com/Wi-sp/Limitless-legacy/refs/heads/main/GUI")()end)
Button(Tab22,"骨架", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/Qaiddanial2904/ROBLOX-FREAKY-GOJO-REAL/refs/heads/main/SANS%20%5BREDACTED%5D"))()end)
Button(Tab22,"饿狼改YUJI", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/xVicity/GLACIER/main/LATEST.lua"))()end)
Button(Tab22,"五条悟2", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/Kamyk-player/FinalSuperSenior/refs/heads/main/SaitamaToSuperSeniorGojo"))()end)
Button(Tab22,"自动防御", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/Cyborg883/TSB/refs/heads/main/CombatGui"))()end)
Button(Tab22,"火影", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/LolnotaKid/SCRIPTSBYVEUX/refs/heads/main/BoombasticLol.lua.txt"))()end)
Toggle(Tab22, "锁敌", false, function(state)
    -- Combined Local Script for Sticking and Toggle Button
    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    
    -- Create RemoteEvent for server communication
    local stickToggleEvent = Instance.new("RemoteEvent")
    stickToggleEvent.Name = "StickToggleEvent"
    stickToggleEvent.Parent = ReplicatedStorage
    
    -- Create a screen GUI and button
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "StickToggleGui"
    screenGui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")
    
    local toggleButton = Instance.new("TextButton")
    toggleButton.Size = UDim2.new(0, 100, 0, 30)
    toggleButton.Position = UDim2.new(0, 10, 0, 10)
    toggleButton.Text = "开始锁敌awa"
    toggleButton.Parent = screenGui
    
    -- Variables
    local player = Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    local stickEnabled = false
    local stickOffset = Vector3.new(0, -5, 0)  -- Offset below the player's feet
    
    -- Function to get the closest player
    local function getClosestPlayer(position)
        local closestPlayer = nil
        local shortestDistance = math.huge
        for _, p in ipairs(Players:GetPlayers()) do
            if p ~= player and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                local distance = (p.Character.HumanoidRootPart.Position - position).magnitude
                if distance < shortestDistance then
                    shortestDistance = distance
                    closestPlayer = p
                end
            end
        end
        return closestPlayer
    end
    
    -- Function to stick to the nearest player
    local function updateCharacterPosition()
        if stickEnabled then
            local closestPlayer = getClosestPlayer(humanoidRootPart.Position)
            if closestPlayer and closestPlayer.Character and closestPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local targetPosition = closestPlayer.Character.HumanoidRootPart.Position
                -- Place the character below the nearest player
                local newPosition = targetPosition + stickOffset
                humanoidRootPart.CFrame = CFrame.new(newPosition, newPosition + Vector3.new(0, 1, 0))
            end
        end
    end
    
    -- Toggle button functionality
    toggleButton.MouseButton1Click:Connect(function()
        stickEnabled = not stickEnabled
        stickToggleEvent:FireServer(stickEnabled)
        if stickEnabled then
            toggleButton.Text = "停止锁敌qwq"
        else
            toggleButton.Text = "开始锁敌awa"
        end
    end)
    
    -- Update position every frame
    RunService.Heartbeat:Connect(updateCharacterPosition)
end)
Button(Tab22,"最强V3", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/skibiditoiletfan2007/tsbscripts/main/Main"))()end)

Button(Tab23,"bf老外刷级王", function()loadstring(game:HttpGet"https://raw.githubusercontent.com/Basicallyy/Basicallyy/main/MinGamingV4.lua")()end)
Button(Tab23,"BF HOHO", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/acsu123/HohoV2/main/ScriptLoad.lua"))()end)
Button(Tab23,"海贼王", function()loadstring(game:HttpGet"https://raw.githubusercontent.com/xDepressionx/Free-Script/main/AllScript.lua")()end)
Button(Tab23,"汉化版", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoYunCN/Xiao-Yun-UWU/main/%E6%B5%B7%E8%B4%BC%E7%8E%8Bbf.lua"))()end)
Button(Tab23,"项目三", function()loadstring(game:HttpGet('https://rawscripts.net/raw/UPDATE-16-Blox-Fruits-Nub-V1-Hub-4583'))()end)
Button(Tab23,"Zen Hub", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/Kaizenofficiall/ZenHub/main/Loader"))()end)

Button(Tab24,"老外超牛脚本", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/Giangplay/Slap_Battles/main/Slap_Battles.lua"))()end)
Button(Tab24,"巴掌模拟器", function()loadstring(game:HttpGet('https://raw.githubusercontent.com/Unknownkellymc1/Unknownscripts/main/slap-battles'))()end)
Button(Tab24,"项目一", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/dizyhvh/slap_battles_gui/main/0.lua"))()end)
Toggle(Tab24,"巴掌光环", false, function(bool)
    -- 添加getGlove函数定义
    local function getGlove()
        for _, tool in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            if tool:IsA("Tool") and shared.gloveHits[tool] then
                return tool
            end
        end
        for _, tool in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
            if tool:IsA("Tool") and shared.gloveHits[tool] then
                return tool
            end
        end
        return nil
    end
  
    getgenv().SlapAura = bool
    if bool == true then
        while getgenv().SlapAura do
            task.wait(.005)
            pcall(function()
                for Index, Player in next, game.Players:GetPlayers() do
                    if Player ~= game.Players.LocalPlayer and Player.Character and Player.Character:FindFirstChild("entered") then
                        if Player.Character:FindFirstChild("Head") then
                            if Player.Character.Head:FindFirstChild("UnoReverseCard") == nil and Player.Character:FindFirstChild("rock") == nil then
                                if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                                    local Magnitude = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Player.Character.HumanoidRootPart.Position).Magnitude
                                    if 25 >= Magnitude then
                                        local glove = getGlove()
                                        if glove and shared.gloveHits[glove] then
                                            shared.gloveHits[glove]:FireServer(Player.Character:WaitForChild("Head"))
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)
Button(Tab25,"老外牛逼脚本", function()loadstring(game:HttpGet("https://scriptblox.com/raw/a-dusty-trip-FREE-CAR-Gui-14352"))()end)

Button(Tab26,"自动唱歌(老外)", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/wally-rblx/funky-friday-autoplay/main/main.lua"))()end)
Button(Tab26,"script一", function()loadstring(game:HttpGet('https://raw.githubusercontent.com/ShowerHead-FluxTeam/scripts/main/funky-friday-autoplay'))()end)

Button(Tab27,"老外杀人脚本", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/IsaaaKK/cwhb/main/cw.txt"))()end)

Button(Tab28,"皇脚本", function()loadstring(game:HttpGet("https://pastebin.com/raw/PdT7cART"))()end)
Button(Tab28,"xa一拳超人+捡印钞", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/Xingtaiduan/Script/main/Games/Ohio"))()end)
Button(Tab28,"俄亥俄州熊脚本普通版", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/Bear-script0/OHIO/main/%E7%86%8A%E8%84%9A%E6%9C%AC%E6%99%AE%E9%80%9A%E7%89%88"))()end)
Button(Tab28,"俄亥俄州", function()loadstring(game:HttpGet("https://pastebin.com/raw/hkvHeHed"))()end)
Button(Tab28,"项目一", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/rxn-xyz/Ohio./main/Ohio.lua"))()end)
Button(Tab28,"1", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/PUSCRIPTS/C-BRING/refs/heads/main/PINGUIN-CBRING-PHONE"))()end)
Button(Tab28,"自动印钞", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/PUSCRIPTS/MONEY-PRINTER-YAY/main/MONEY"))()end)
Button(Tab28,"2", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/PUSCRIPTS/OHIOVFUCKIN3/refs/heads/main/FUCKOHIOPU"))()end)
Button(Tab28,"物品透视", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/asehbzi/good/refs/heads/main/good"))()end)
Button(Tab28,"远程买东西", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/PUSCRIPTS/MOBILE-DEALER/refs/heads/main/PINGU-DEALER"))()end)
Button(Tab28,"物品抓取", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/PUSCRIPTS/ITEM-GRABBER/refs/heads/main/item-grabber-by-pinguin-V1"))()end)

Dropdown(Tab29, "选择你的免费船(鲨鱼2)", {"无", "DuckyBoatBeta", "DuckyBoat", "BlueCanopyMotorboat", "BlueWoodenMotorboat", "UnicornBoat", "Jetski", "RedMarlin", "Sloop", "TugBoat", "SmallDinghyMotorboat", "JetskiDonut", "Marlin", "TubeBoat", "FishingBoat", "VikingShip", "SmallWoodenSailboat", "RedCanopyMotorboat", "Catamaran", "CombatBoat", "TourBoat", "Duckmarine", "PartyBoat", "MilitarySubmarine", "GingerbreadSteamBoat", "Sleigh2022", "Snowmobile", "CruiseShip"}, "无", function(a) game:GetService("ReplicatedStorage").EventsFolder.BoatSelection.UpdateHostBoat:FireServer(a) end)

Button(Tab30,"自动刷金条", function()loadstring(game:HttpGet("https://pastebin.com/raw/Lyy77rnr"))()end)

Button(Tab31,"项目一", function()loadstring(game:HttpGet('https://raw.githubusercontent.com/9NLK7/93qjoadnlaknwldk/main/main'))()end)
Button(Tab31,"项目二", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/2dgeneralspam1/scripts-and-stuff/master/scripts/LoadstringUjHI6RQpz2o8"))()end)
Button(Tab31,"自然灾害模拟器", function()loadstring(game:HttpGet("https://gist.githubusercontent.com/TurkOyuncu99/7c75386107937fa006304efd24543ad4/raw/8d759dfcd95d39949c692735cfdf62baec0bf835/cafwetweg"))()end)

Button(Tab32,"项目一", function()loadstring(game:HttpGet('https://pastebin.com/raw/5rEAVmcC'))()end)

Button(Tab33,"VectorHub", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/Tuxoz/VectorHub/main/MB*PC.lua"))() end)
Button(Tab33,"项目二", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/Prymoric/Alaxus-Refinement-/main/Alaxus%20Blade%20Ball"))()end)
Button(Tab33,"crazzy hub", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/kmmwhocare/Crazzy-Hub/main/Blade%20Ball"))()end)

Button(Tab34,"感染性微笑1", function()loadstring(game:HttpGet("https://pastebin.com/raw/WG1BMS72"))()end)
Button(Tab34,"感染性微笑2", function()loadstring(game:HttpGet("https://pastebin.com/raw/mT10xnt7"))()end)

Toggle(Tab35,"自动收集雪", false, function(a)
  AutoCollect = a and true or false
  if a then
    repeat
      task.wait()
      game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("e8eGb8RgRXFcug8q"):FireServer(workspace:WaitForChild("HitParts"):WaitForChild("Snow1"), "Snow1", "MagicWand")
    until not AutoCollect
  end
end)
Toggle(Tab35,"自动出售雪（要传送到指定地方）", false, function(a)
  AutoSell = a and true or false
  if a then
    repeat
      task.wait()
      game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Network"):WaitForChild("RemoteEvent"):FireServer("SellSnow", "Frosty")
    until not AutoSell
  end
end)
Button(Tab35,"传送出售雪的地方", function()game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(481.4659423828125, 15.846257209777832, -66.55204010009766)end)
Button(Tab35,"传送买车的地方", function()game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(90.10160064697266, 16.051794052124023, -141.703125)end)
Button(Tab35,"传送买工具的地方", function()game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(131.7429962158203, 16.39700698852539, -12.935890197753906)end)
Button(Tab35,"传送买背包的地方", function()game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(348.6633605957031, 17.03822898864746, -16.793842315673828)end)
Button(Tab35,"传送买假日礼物的地方", function()game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(154.57424926757812, 16.215335845947266, 147.10423278808594)end)
Button(Tab35,"传送买宠物的地方", function()game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(138.49563598632812, 17.887277603149414, 278.3686218261719)end)
Button(Tab35,"传送超大铲雪的地方", function()game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-391.4309997558594, 15.84949016571045, 150.15187072753906)end)

Button(Tab36,"传送到警察局", function()game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-5513.97412109375, 8.656171798706055, 4964.291015625)end)
Button(Tab36,"传送到出生点", function()game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-3338.31982421875, 10.048742294311523, 3741.84033203125)end)
Button(Tab36,"传送到医院", function()game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-5471.482421875, 14.149418830871582, 4259.75341796875)end)
Button(Tab36,"传送到手机店", function()game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-6789.2041015625, 11.197686195373535, 1762.687255859375)end)
Button(Tab36,"传送到火锅店", function()game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-5912.84765625, 12.217276573181152, 1058.29443359375)end)
Button(Tab36,"河北唐县1", function()loadstring(game:HttpGet("https://pastefy.app/s20nni0h/raw"))()end)
Button(Tab36,"河北唐县2", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/Sw1ndlerScripts/RobloxScripts/main/Tang%20Country.lua"))()end)

Toggle(Tab37,"自动收集燃料", false, function(ARL)
  isFuelScoopEnabled = ARL while true do wait() if isFuelScoopEnabled then for i, h in pairs(game.Players.LocalPlayer.Character:GetChildren()) do if h:IsA("Tool") and h.Name == "FuelScoop" then h:Activate() end end end end
end)
Button(Tab37,"登上火箭", function()game:GetService("ReplicatedStorage"):WaitForChild("BoardRocket"):FireServer()end)
Button(Tab37,"将玩家从所有者座位移除", function()game:GetService("ReplicatedStorage"):WaitForChild("RemovePlayer"):FireServer()end)
Button(Tab37,"发射台岛", function()game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-123.15931701660156, 2.7371432781219482, 3.491959810256958)end)
Button(Tab37,"白云岛", function()game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-76.13252258300781, 170.55825805664062, -60.4516716003418)end)
Button(Tab37,"浮漂岛", function()game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-66.51714324951172, 720.4866333007812, -5.391753196716309)end)
Button(Tab37,"卫星岛", function()game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-34.2462043762207, 1429.4990234375, 1.3739361763000488)end)
Button(Tab37,"蜜蜂迷宫岛", function()game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(6.5361199378967285, 3131.249267578125, -29.759048461914062)end)
Button(Tab37,"月球人救援", function()game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-7.212917804718018, 5016.341796875, -19.815933227539062)end)
Button(Tab37,"暗物质岛", function()game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(68.43186950683594, 6851.94091796875, 7.890637397766113)end)
Button(Tab37,"太空岩石岛", function()game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(49.92888641357422, 8942.955078125, 8.674375534057617)end)
Button(Tab37,"零号火星岛", function()game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(54.44503402709961, 11270.0927734375, -1.273137092590332)end)
Button(Tab37,"太空水晶小行星岛", function()game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-11.579089164733887, 15295.6318359375, -27.54974365234375)end)
Button(Tab37,"月球浆果岛", function()game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-14.601255416870117, 18410.9609375, 0.9418511986732483)end)
Button(Tab37,"铺路石岛", function()game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-3.272758960723877, 22539.494140625, 63.283935546875)end)
Button(Tab37,"流星岛", function()game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-45.515689849853516, 27961.560546875, -7.358333110809326)end)
Button(Tab37,"升级岛", function()game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2.7595248222351074, 33959.98828125, 53.93095397949219)end)
Button(Tab37,"火箭发射模拟器1", function()loadstring(game:HttpGet("https://ayangwp.cn/api/v3/file/get/9245/%E7%8C%AB%E9%80%9A%E7%94%A8.txt?sign=hrWROZdVfK2mtJcIFa3Tvbl-TojP1C86_Zd3q03qttc%3D%3A0"))()end)
Button(Tab37,"火箭发射模拟器2", function()loadstring(game:HttpGet('https://raw.githubusercontent.com/dizyhvh/rbx_scripts/main/321_blast_off_simulator'))()end)

Button(Tab38,"IY指令", function()loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()end)
Button(Tab38,"黑客脚本", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/BirthScripts/Scripts/main/c00l.lua"))()end)
Button(Tab38,"管理员", function()loadstring(game:HttpGet('https://raw.githubusercontent.com/iK4oS/backdoor.exe/master/source.lua'))()end)
Button(Tab38,"阿尔宙斯V3", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/chillz-workshop/main/Arceus%20X%20V3"))() end)
Button(Tab38,"脚本中心1.54", function()loadstring(game:HttpGet("https://pastebin.com/raw/gemxHwA1"))()end)
Button(Tab38,"龙脚本(卡密:114514)", function()getgenv().baiscript="龙脚本，加载时间长请耐心"loadstring(game:HttpGet("https://textbin.net/raw/9mhxr3ndw7"))()end)

Button(Tab39,"飞机V2", function()loadstring(game:HttpGet('https://pastefy.ga/o45IJG3Z/raw'))()end)
Button(Tab39,"蛇脚本", function()loadstring(game:HttpGet('https://pastefy.ga/tWBTcE4R/raw'))()end)
Button(Tab39,"点击传送工具", function()mouse = game.Players.LocalPlayer:GetMouse() tool = Instance.new("Tool") tool.RequiresHandle = false tool.Name = "[FE] TELEPORT TOOL" tool.Activated:connect(function() local pos = mouse.Hit+Vector3.new(0,2.5,0) pos = CFrame.new(pos.X,pos.Y,pos.Z) game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos end) tool.Parent = game.Players.LocalPlayer.Backpack end)
Button(Tab39,"键盘", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt"))()end)
Button(Tab39,"复仇者", function()loadstring(game:HttpGet('https://pastefy.ga/iGyVaTvs/raw'))()end)
Button(Tab39,"鼠标", function()loadstring(game:HttpGet('https://pastefy.ga/V75mqzaz/raw'))()end)
Button(Tab39,"动作", function()loadstring(game:HttpGet("https://pastebin.com/raw/HrXgGiND"))()end)
Button(Tab39,"全(英文😭)", function()loadstring(game:HttpGet("https://pastebin.com/raw/kEq7bdf9"))()end)
Button(Tab39,"C00lgui", function()loadstring(game:GetObjects("rbxassetid://8127297852")[1].Source)()end)
Button(Tab39,"1x1x1x1", function()loadstring(game:HttpGet(('https://pastebin.com/raw/JipYNCht'),true))()end)
Button(Tab39,"变玩家（R6）", function()loadstring(game:HttpGet("https://pastebin.com/raw/XR4sGcgJ"))()end)
Button(Tab39,"动画中心", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/GamingScripter/Animation-Hub/main/Animation%20Gui"))()end)
Button(Tab39,"幽灵中心", function()loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/GhostHub'))()end)
Button(Tab39,"蜘蛛侠爬墙配合键盘脚本按c", function()loadstring(game:HttpGet(('https://pastebin.com/raw/2X0hKUgq'),true))()end)
Button(Tab39,"铁拳打死你", function()loadstring(game:HttpGet(('https://raw.githubusercontent.com/0Ben1/fe/main/obf_rf6iQURzu1fqrytcnLBAvW34C9N55kS9g9G3CKz086rC47M6632sEd4ZZYB0AYgV.lua.txt'),true))()end)
Button(Tab39,"声音播放器", function()loadstring(game:HttpGet("https://pastebin.com/raw/GEianeKX"))()end)
Button(Tab39,"NA管理员", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/FilteringEnabled/NamelessAdmin/main/Source"))()end)

Button(Tab40,"Apex脚本", function() By = "作者:Xiao Mo"VapeApex = "欢迎您的使用"loadstring(game:HttpGet("https://raw.github.com/VcPa/V/main/Apex"))() end)
Button(Tab40,"烂梗社区刷钱", function() --[[by du8]]--[[交流群: 993659706]]loadstring(game:HttpGet(('https://raw.githubusercontent.com/XOTRXONY/EasyScript/main/Suao.luau'),true))() end)
Button(Tab40,"du8一路向西", function() --[[Aureate Top 1]]--[[UPT 1.8.2025]]--[[Dev du8]]--[[交流群: 993659706]]loadstring(game:HttpGet("https://pastebin.com/raw/0SKKXLB7"))() end)
Button(Tab40,"星火交辉", function()loadstring(game:HttpGet("https://pastebin.com/raw/37tCRtum"))()end)
Button(Tab40,"USA", function()loadstring(game:HttpGet("https://pastebin.com/raw/69KZqhER"))()end)
Button(Tab40,"xk脚本中心", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/BINjiaobzx6/BINjiao/main/XK.TXT"))()end)
Button(Tab40,"导管中心", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/useranewrff/roblox/main/%E6%9D%A1%E6%AC%BE%E5%8D%8F%E8%AE%AE.lua"))()end)
Button(Tab40,"情云", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/ChinaQY/-/main/%E6%83%85%E4%BA%91"))()end)
Button(Tab40,"落叶", function()getgenv().LS="落叶中心"loadstring(game:HttpGet("https://raw.githubusercontent.com/krlpl/Deciduous-center-LS/main/%E8%90%BD%E5%8F%B6%E4%B8%AD%E5%BF%83%E6%B7%B7%E6%B7%86.txt"))()end)
Button(Tab40,"XK", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/BINjiaobzx6/BINjiao/main/XK.TXT"))()end)
Button(Tab40,"皮", function()getgenv().XiaoPi="皮脚本QQ群1002100032" loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaopi77/xiaopi77/main/QQ1002100032-Roblox-Pi-script.lua"))()end)
Button(Tab40,"导管", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/useranewrff/roblox-/main/%E6%9D%A1%E6%AC%BE%E5%8D%8F%E8%AE%AE"))()end)
Button(Tab40,"脚本", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoYunCN/LOL/main/%E4%BA%91%E8%84%9A%E6%9C%ACCloud%20script.lua"))()end)
Button(Tab40,"XC卡密:w", function()getgenv().XC="作者XC"loadstring(game:HttpGet("https://pastebin.com/raw/PAFzYx0F"))()end)
Button(Tab40,"青脚本", function()loadstring(game:HttpGet('https://raw.githubusercontent.com/kkaaccnnbb/money/main/fix'))()end)
Button(Tab40,"秋脚本", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/WS857960/-/main/%E7%A7%8B%C2%B7%E8%87%AA%E5%88%B6%E8%84%9A%E6%9C%AC%E6%96%B0%E6%BA%90%E7%A0%81.txt"))()end)
Button(Tab40,"冰脚本", function()loadstring(game:HttpGet("https://pastebin.com/raw/GR4ChWKv"))()end)
Button(Tab40,"鲨脚本", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/sharksharksharkshark/shark-shark-shark-shark-shark/main/shark-scriptlollol.txt"))()end)
Button(Tab40,"怀脚本", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/zuohongjian/bjb/main/bjb"))()end)
Button(Tab40,"EZ Hub 150+", function()loadstring(game:HttpGet('https://raw.githubusercontent.com/debug420/Ez-Industries-Launcher-Data/master/Launcher.lua'))()end)
Button(Tab40,"客户端中心", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/ObviouslyOrchi/Moonlight_Client.lua/main/Universal"))()end)
Button(Tab40,"作弊中心", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/mrgunz/UnnamedCheat/main/Loader"))();end)
Button(Tab40,"阿斯顿中心", function()loadstring(game:HttpGet('https://raw.githubusercontent.com/rblxscriptsnet/unfair/main/rblxhub.lua'))()end)
Button(Tab40,"脚本中心3卡密—released", function()--[[DISCORD: https://discord.gg/8YZMwfYaNq]]getgenv().key = "JOIN DISCORD FOR KEY";loadstring(game:HttpGet("https://raw.githubusercontent.com/Ner0ox/sexy-script-hub/main/Loader.lua"))()end)
Button(Tab40,"脚本中心外网", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/TakeModzz/Games-Hub-Script/main/Games%20Hub%20(Always%20updated)"))()end)
Button(Tab40,"Every day中心", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/KATERGaming/Roblox/main/KaterHub.Lua"))()end)
Button(Tab40,"移动中心", function()loadstring(game:HttpGetAsync("https://shz.al/~mobile-hub-v2"))()end)
Button(Tab40,"脚本中心另一版本", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/fgasfga/SCRIPT-HUB/main/Hello.lua"))()end)
Button(Tab40,"140+中心", function()loadstring(game:HttpGet('https://raw.githubusercontent.com/1201for/V.G-Hub/main/V.Ghub'))()end)
Button(Tab40,"青蛙脚本", function()getgenv().eom="青蛙"loadstring(game:HttpGet('https://pastebin.com/raw/DzxsQRDU'))()end)
Button(Tab40,"地岩脚本", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/bbamxbbamxbbamx/codespaces-blank/main/%E7%99%BD"))()end)
Button(Tab40,"ato脚本", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/atoyayaya/jiaoben/main/jiamilist"))()end)
Button(Tab40,"龙", function()loadstring(game:HttpGet "https://pastebin.com/raw/bXApbsu8")()end)
Button(Tab40,"云脚本", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoYunCN/UWU/main/Xiaos______________________________________________________________Yun__________________________________________________________________________betaV2.3------------------------------------------------------------------------------------jsjalololololololololololololololololololllololol.lua"))()end)
Button(Tab40,"青风", function()loadstring(game:HttpGet("https://pastebin.com/raw/t5WK5H0H"))()end)
Button(Tab40,"静新", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/jxdjbx/gggggghjjnbb/main/jdjdd"))()end)
Button(Tab40,"北极", function()loadstring(game:HttpGet("https://pastebin.com/raw/KwARpDxV"))()end)
Button(Tab40,"水下世界", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/sjsidjdnnsnsns/sjsidjdnnsnsns/main/README.md"))()end)
Button(Tab40,"QB", function()loadstring(game:HttpGet("https://pastebin.com/raw/3E16L3Zj"))()end)
Button(Tab40,"神光", function()loadstring(game:HttpGet("https://pastebin.com/raw/8f2LcqqP"))()end)
Button(Tab40,"云", function()_G.Clouduilib = "白灰脚作者小云，加载出十几秒"loadstring(game:HttpGet("https://raw.githubusercontent.com/CloudX-ScriptsWane/White-ash-script/main/%E7%99%BD%E7%81%B0%E8%84%9A%E6%9C%ACbeta.lua"))()end)
Button(Tab40,"XC", function()getgenv().XC="作者XC"loadstring(game:HttpGet("https://pastebin.com/raw/PAFzYx0F"))()end)
Button(Tab40,"青", function()loadstring(game:HttpGet('https://rentry.co/cyq78/raw'))()end)
Button(Tab40,"皇", function()loadstring(game:HttpGet("https://ayangwp.cn/api/v3/file/get/8577/%E7%9A%87v5.txt?sign=ToDT3Udyh4r3WwDu_yVblRL849qC2GJjjjQ7FTidF_w%3D%3A0"))()end)
Button(Tab40,"空情", function()loadstring(game:HttpGet("https://ayangwp.cn/api/v3/file/get/8628/%E9%9D%99?sign=uxlt7ravTFmP3TZLNgN7zImLHxJWhH93SEbKgFA_PRc%3D%3A0"))()end)

Button(Tab41,"模仿者", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/ttjy9808/obfloadstringmainmimic/main/README.md"))()end)
Button(Tab41,"战斗勇士", function()loadstring(game:HttpGet("https://projecthook.xyz/scripts/free.lua"))()end)
Button(Tab41,"战斗勇士英文", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/frkfx/Combat-Warriors/main/Script"))();end)
Button(Tab41,"火箭🚀", function()loadstring(game:HttpGet("https://ayangwp.cn/api/v3/file/get/9245/%E7%8C%AB%E9%80%9A%E7%94%A8.txt?sign=hrWROZdVfK2mtJcIFa3Tvbl-TojP1C86_Zd3q03qttc%3D%3A0"))()end)
Button(Tab41,"只因剑", function()loadstring(game:HttpGet('https://gist.githubusercontent.com/blox-hub-roblox/021bad62bbc6a0adc4ba4e625f9ad7df/raw/c89af6e1acf587d09e4ce4bc7510e7100e0c0065/swordWarrior.lua'))()end)
Button(Tab41,"自动刷金条(造船寻宝)", function()loadstring(game:HttpGet("https://pastebin.com/raw/Lyy77rnr"))()end)
Button(Tab41,"动画星期五", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/wally-rblx/funky-friday-autoplay/main/main.lua"))()end)
Button(Tab41,"宠物模拟器X", function()loadstring(game:HttpGet'https://raw.githubusercontent.com/RunDTM/ZeeroxHub/main/Loader.lua')()end)
Button(Tab41,"蜂群模拟器", function()loadstring(game:HttpGet("https://pastebin.com/raw/3A61hnGA"))()end)
Button(Tab41,"Evade", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/Babyhamsta/RBLX_Scripts/main/Evade/main.lua"))()end)
Button(Tab41,"Synapse X", function()loadstring(game:HttpGet("https://pastebin.com/raw/tWGxhNq0"))()end)
Button(Tab41,"tds查看兵", function()
  local Towers = game:GetService("Players").LocalPlayer.PlayerGui.Interface.Root.Inventory.View.Frame.Frame.Frame
  for _, v in pairs(Towers:GetDescendants()) do
    if v:IsA("ImageButton") then
      v.Visible = true
    end
  end
end)
Button(Tab41,"旧冬被遗弃", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/QiuShan-UX/UnicoX/refs/heads/main/%E6%97%A7%E5%86%ACScript--Forsaken.lua.txt"))()end)
Button(Tab41,"HT被遗弃", function()loadstring(game:HttpGet("https://pastebin.com/raw/pHN96bvq"))()end)
Button(Tab41,"X脚本被遗弃 作者孙笑川", function()X_SCRIPT = "XXXXXX"
loadstring(game:HttpGet("https://raw.githubusercontent.com/XSCRIPT-NB/XSCRIPT/refs/heads/main/X-SCRIPT"))()end)