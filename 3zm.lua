--[[  3zm · BLACK · full build  ]]

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local RS = game:GetService("ReplicatedStorage")
local WS = game:GetService("Workspace")
local LP = Players.LocalPlayer
local Cam = WS.CurrentCamera

if getgenv()._3zm then pcall(getgenv()._3zm) end

-- ═══ UI (BLACK) ═══
local gui = Instance.new("ScreenGui")
gui.Name, gui.ResetOnSpawn, gui.IgnoreGuiInset = "3zm", false, true
gui.Parent = LP:WaitForChild("PlayerGui")

local win = Instance.new("Frame")
win.Size, win.Position = UDim2.fromOffset(470, 340), UDim2.new(0.5,-235,0.5,-170)
win.BackgroundColor3, win.BorderSizePixel = Color3.fromRGB(0,0,0), 0
win.Active = true
win.Parent = gui
Instance.new("UICorner", win).CornerRadius = UDim.new(0,10)
local st = Instance.new("UIStroke") st.Color, st.Thickness, st.Parent = Color3.fromRGB(30,30,30), 1, win

local hd = Instance.new("Frame")
hd.Size, hd.BackgroundColor3, hd.BorderSizePixel = UDim2.new(1,0,0,40), Color3.fromRGB(10,10,10), 0
hd.Parent = win
Instance.new("UICorner", hd).CornerRadius = UDim.new(0,10)

local brand = Instance.new("TextLabel")
brand.Size, brand.Position, brand.BackgroundTransparency = UDim2.new(0,80,1,0), UDim2.new(0,14,0,0), 1
brand.Text, brand.TextColor3, brand.TextSize, brand.Font = "3zm", Color3.fromRGB(240,240,240), 18, Enum.Font.GothamBold
brand.TextXAlignment = Enum.TextXAlignment.Left
brand.Parent = hd

local min = Instance.new("TextButton")
min.Size, min.Position, min.BackgroundColor3, min.BorderSizePixel = UDim2.fromOffset(26,26), UDim2.new(1,-70,0,7), Color3.fromRGB(35,35,35)
min.Text, min.TextColor3, min.Font = "-", Color3.new(1,1,1), Enum.Font.GothamBold
min.Parent = hd
Instance.new("UICorner", min).CornerRadius = UDim.new(0,5)

local cls = Instance.new("TextButton")
cls.Size, cls.Position, cls.BackgroundColor3, cls.BorderSizePixel = UDim2.fromOffset(26,26), UDim2.new(1,-36,0,7), Color3.fromRGB(180,40,40)
cls.Text, cls.TextColor3, cls.Font = "X", Color3.new(1,1,1), Enum.Font.GothamBold
cls.Parent = hd
Instance.new("UICorner", cls).CornerRadius = UDim.new(0,5)

local float = Instance.new("TextButton")
float.Size, float.Position = UDim2.fromOffset(52,52), UDim2.new(0,16,0.5,-26)
float.BackgroundColor3, float.BorderSizePixel = Color3.fromRGB(0,0,0), 0
float.Text, float.TextColor3, float.Font, float.TextSize = "3zm", Color3.fromRGB(240,240,240), Enum.Font.GothamBold, 13
float.Visible, float.Active = false, true
float.Parent = gui
Instance.new("UICorner", float).CornerRadius = UDim.new(1,0)
local fst = Instance.new("UIStroke") fst.Color, fst.Thickness, fst.Parent = Color3.fromRGB(70,70,70), 2, float

local side = Instance.new("Frame")
side.Size, side.Position, side.BackgroundColor3, side.BorderSizePixel = UDim2.new(0,112,1,-40), UDim2.new(0,0,0,40), Color3.fromRGB(0,0,0), 0
side.Parent = win
local sL = Instance.new("UIListLayout") sL.Padding = UDim.new(0,3) sL.Parent = side
local sP = Instance.new("UIPadding") sP.PaddingTop, sP.PaddingLeft, sP.PaddingRight = UDim.new(0,8), UDim.new(0,6), UDim.new(0,6) sP.Parent = side

local pages, tabs = {}, {}
local function switch(n)
  for k,p in pairs(pages) do p.Visible = (k==n) end
  for k,b in pairs(tabs) do b.BackgroundColor3 = (k==n) and Color3.fromRGB(25,25,25) or Color3.fromRGB(0,0,0) end
end

local function newTab(n)
  local b = Instance.new("TextButton")
  b.Size, b.BackgroundColor3, b.BorderSizePixel = UDim2.new(1,0,0,28), Color3.fromRGB(0,0,0), 0
  b.Text, b.TextColor3, b.TextSize, b.Font, b.TextXAlignment = n, Color3.fromRGB(180,180,180), 11, Enum.Font.GothamBold, Enum.TextXAlignment.Left
  b.Parent = side
  local p = Instance.new("UIPadding") p.PaddingLeft = UDim.new(0,8) p.Parent = b
  Instance.new("UICorner", b).CornerRadius = UDim.new(0,5)
  b.MouseButton1Click:Connect(function() switch(n) end)
  tabs[n] = b
  local pg = Instance.new("ScrollingFrame")
  pg.Size, pg.Position = UDim2.new(1,-112,1,-40), UDim2.new(0,112,0,40)
  pg.BackgroundTransparency, pg.BorderSizePixel, pg.ScrollBarThickness = 1, 0, 3
  pg.CanvasSize, pg.Visible = UDim2.new(0,0,0,0), false
  pg.Parent = win
  local l = Instance.new("UIListLayout") l.Padding, l.Parent = UDim.new(0,4), pg
  local pd = Instance.new("UIPadding") pd.PaddingTop, pd.PaddingLeft, pd.PaddingRight = UDim.new(0,8), UDim.new(0,8), UDim.new(0,8) pd.Parent = pg
  l:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function() pg.CanvasSize = UDim2.new(0,0,0,l.AbsoluteContentSize.Y+16) end)
  pages[n] = pg
  return pg
end

local function tog(pg, txt, def, cb)
  local f = Instance.new("Frame") f.Size, f.BackgroundColor3, f.BorderSizePixel = UDim2.new(1,-4,0,32), Color3.fromRGB(15,15,15), 0
  f.Parent = pg
  Instance.new("UICorner", f).CornerRadius = UDim.new(0,6)
  local s = Instance.new("UIStroke") s.Color, s.Parent = Color3.fromRGB(30,30,30), f
  local l = Instance.new("TextLabel") l.Size, l.Position, l.BackgroundTransparency = UDim2.new(1,-60,1,0), UDim2.new(0,10,0,0), 1
  l.Text, l.TextColor3, l.TextSize, l.Font, l.TextXAlignment = txt, Color3.fromRGB(200,200,200), 11, Enum.Font.Gotham, Enum.TextXAlignment.Left
  l.Parent = f
  local state = def
  local b = Instance.new("TextButton") b.Size, b.Position = UDim2.fromOffset(36,18), UDim2.new(1,-46,0.5,-9)
  b.BackgroundColor3, b.BorderSizePixel, b.Text, b.AutoButtonColor = state and Color3.fromRGB(200,200,200) or Color3.fromRGB(35,35,35), 0, "", false
  b.Parent = f
  Instance.new("UICorner", b).CornerRadius = UDim.new(1,0)
  local d = Instance.new("Frame") d.Size, d.BackgroundColor3, d.BorderSizePixel = UDim2.fromOffset(14,14), state and Color3.fromRGB(20,20,20) or Color3.fromRGB(220,220,220), 0
  d.Position = state and UDim2.new(1,-16,0.5,-7) or UDim2.new(0,2,0.5,-7)
  d.Parent = b
  Instance.new("UICorner", d).CornerRadius = UDim.new(1,0)
  b.MouseButton1Click:Connect(function()
    state = not state
    b.BackgroundColor3 = state and Color3.fromRGB(200,200,200) or Color3.fromRGB(35,35,35)
    d.BackgroundColor3 = state and Color3.fromRGB(20,20,20) or Color3.fromRGB(220,220,220)
    d.Position = state and UDim2.new(1,-16,0.5,-7) or UDim2.new(0,2,0.5,-7)
    if cb then cb(state) end
  end)
end

local function sld(pg, txt, mn, mx, def, cb)
  local f = Instance.new("Frame") f.Size, f.BackgroundColor3, f.BorderSizePixel = UDim2.new(1,-4,0,44), Color3.fromRGB(15,15,15), 0
  f.Parent = pg
  Instance.new("UICorner", f).CornerRadius = UDim.new(0,6)
  local s = Instance.new("UIStroke") s.Color, s.Parent = Color3.fromRGB(30,30,30), f
  local l = Instance.new("TextLabel") l.Size, l.Position, l.BackgroundTransparency = UDim2.new(1,-80,0,16), UDim2.new(0,10,0,4), 1
  l.Text, l.TextColor3, l.TextSize, l.Font, l.TextXAlignment = txt, Color3.fromRGB(200,200,200), 10, Enum.Font.Gotham, Enum.TextXAlignment.Left
  l.Parent = f
  local v = Instance.new("TextLabel") v.Size, v.Position, v.BackgroundTransparency = UDim2.new(0,60,0,16), UDim2.new(1,-70,0,4), 1
  v.Text, v.TextColor3, v.TextSize, v.Font, v.TextXAlignment = tostring(def), Color3.fromRGB(230,230,230), 10, Enum.Font.GothamBold, Enum.TextXAlignment.Right
  v.Parent = f
  local tr = Instance.new("Frame") tr.Size, tr.Position, tr.BackgroundColor3, tr.BorderSizePixel = UDim2.new(1,-20,0,5), UDim2.new(0,10,0,26), Color3.fromRGB(35,35,35), 0
  tr.Parent = f
  Instance.new("UICorner", tr).CornerRadius = UDim.new(1,0)
  local fl = Instance.new("Frame") fl.Size, fl.BackgroundColor3, fl.BorderSizePixel = UDim2.new((def-mn)/(mx-mn),0,1,0), Color3.fromRGB(200,200,200), 0
  fl.Parent = tr
  Instance.new("UICorner", fl).CornerRadius = UDim.new(1,0)
  local h = Instance.new("TextButton") h.Size, h.Position, h.BackgroundTransparency, h.Text = UDim2.new(1,0,1,20), UDim2.new(0,0,0,-8), 1, ""
  h.Parent = tr
  local drag = false
  local function setX(x)
    local r = math.clamp((x - tr.AbsolutePosition.X)/tr.AbsoluteSize.X, 0, 1)
    local val = math.floor(mn + (mx-mn)*r + 0.5)
    fl.Size = UDim2.new(r,0,1,0)
    v.Text = tostring(val)
    if cb then cb(val) end
  end
  h.InputBegan:Connect(function(i) if i.UserInputType==Enum.UserInputType.Touch or i.UserInputType==Enum.UserInputType.MouseButton1 then drag=true setX(i.Position.X) end end)
  h.InputChanged:Connect(function(i) if drag and (i.UserInputType==Enum.UserInputType.Touch or i.UserInputType==Enum.UserInputType.MouseMovement) then setX(i.Position.X) end end)
  h.InputEnded:Connect(function() drag=false end)
end

local MA_pg = newTab("Macro")
local SA_pg = newTab("Silent Aim")
local GL_pg = newTab("Glitch")
local MV_pg = newTab("Movement")
local ES_pg = newTab("ESP")

-- ═══ MACRO / AHK ═══
local function LoadAHKsoru()
    _G.NamelessAHKRunning = nil
    pcall(function()
        local code = game:HttpGet("https://raw.githubusercontent.com/sykq0/Namelesssoru/refs/heads/main/ahk.lua")
        loadstring(code)()
    end)
end
local function UnloadAHKsoru()
    _G.NamelessAHKRunning = nil
    pcall(function()
        for _, parent in ipairs({LP:FindFirstChild("PlayerGui"), game:GetService("CoreGui")}) do
            if parent then
                for _, ch in pairs(parent:GetChildren()) do
                    if ch.Name:find("AHK_Soru") or ch.Name:find("namelessWare_AHK_Soru") then ch:Destroy() end
                end
            end
        end
    end)
end
local function LoadAHKCombo()
    _G.NamelessComboRunning = nil
    pcall(function()
        local code = game:HttpGet("https://raw.githubusercontent.com/sykq0/Namelesssoru/refs/heads/main/fetched-1.lua")
        loadstring(code)()
    end)
end
local function UnloadAHKCombo()
    _G.NamelessComboRunning = nil
    pcall(function()
        for _, parent in ipairs({LP:FindFirstChild("PlayerGui"), game:GetService("CoreGui")}) do
            if parent then
                for _, ch in pairs(parent:GetChildren()) do
                    if ch.Name:find("AHK_Combo") or ch.Name:find("namelessWare_AHK_Combo") then ch:Destroy() end
                end
            end
        end
    end)
end

tog(MA_pg, "Enable AHK Soru", false, function(v) if v then LoadAHKsoru() else UnloadAHKsoru() end end)
tog(MA_pg, "Enable AHK Combo", false, function(v) if v then LoadAHKCombo() else UnloadAHKCombo() end end)

-- ═══ SILENT AIM ═══
local saPlayers, saNpcs = false, false
local aimMode, fov, maxR, predict = "360", 400, 1000, 0.12
local tPos, cache, scanT = nil, {}, 0

local function alive(m)
  if not m or not m.Parent then return false end
  local h, r = m:FindFirstChildOfClass("Humanoid"), m:FindFirstChild("HumanoidRootPart")
  return h and r and h.Health > 0
end

local function scan()
  local out = {}
  if saPlayers then for _,p in ipairs(Players:GetPlayers()) do if p~=LP and alive(p.Character) then out[#out+1]=p.Character end end end
  if saNpcs then local en = WS:FindFirstChild("Enemies") if en then for _,m in ipairs(en:GetChildren()) do if m:IsA("Model") and alive(m) then out[#out+1]=m end end end end
  return out
end

local function pick()
  if not Cam then return nil end
  if tick()-scanT>0.15 then scanT=tick() cache=scan() end
  local vs = Cam.ViewportSize
  local cx, cy = vs.X/2, vs.Y/2
  local my = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
  if not my then return nil end
  local best, bd = nil, fov
  for _,m in ipairs(cache) do
    local hrp = m:FindFirstChild("HumanoidRootPart")
    if hrp then
      local dir = hrp.Position - my.Position
      if dir.Magnitude <= maxR then
        local ok = true
        if aimMode=="180" and my.CFrame.LookVector:Dot(dir.Unit)<0 then ok=false end
        if ok then
          local v = Cam:WorldToViewportPoint(hrp.Position)
          if v.Z>0 then
            local d = (Vector2.new(v.X,v.Y)-Vector2.new(cx,cy)).Magnitude
            if (aimMode~="FOV" or d<=fov) and d<bd then best,bd = m,d end
          end
        end
      end
    end
  end
  return best
end

local function face(pos)
  local ch = LP.Character if not ch or not pos then return end
  local hrp = ch:FindFirstChild("HumanoidRootPart") if not hrp then return end
  local cur = hrp.Position
  local look = Vector3.new(pos.X, cur.Y, pos.Z) - cur
  if look.Magnitude < 0.001 then return end
  hrp.CFrame = CFrame.lookAt(cur, cur + look.Unit, Vector3.new(0,1,0))
  local hum = ch:FindFirstChildOfClass("Humanoid") if hum then hum.AutoRotate = true end
end

RunService.RenderStepped:Connect(function()
  if not (saPlayers or saNpcs) then tPos=nil return end
  local m = pick()
  if m then
    local hrp = m:FindFirstChild("HumanoidRootPart")
    if hrp then
      local v = hrp.AssemblyLinearVelocity or Vector3.zero
      tPos = (v.Magnitude<5) and hrp.Position or (hrp.Position + v*predict)
    else tPos=nil end
  else tPos=nil end
end)

UIS.InputBegan:Connect(function(i, gp)
  if gp then return end
  local map = {[Enum.KeyCode.Z]="Z",[Enum.KeyCode.X]="X",[Enum.KeyCode.C]="C",[Enum.KeyCode.V]="V",[Enum.KeyCode.F]="F"}
  local k = map[i.KeyCode]
  if k and tPos then task.spawn(function() face(tPos) end) end
end)

task.spawn(function()
  local pg = LP:WaitForChild("PlayerGui",10)
  local main = pg and pg:WaitForChild("Main",10)
  local sk = main and main:WaitForChild("Skills",10)
  if not sk then return end
  local keys = {"Z","X","C","V","F"}
  local function hook(b)
    if b:GetAttribute("3h") then return end
    b:SetAttribute("3h", true)
    if table.find(keys,b.Name) then
      b.Activated:Connect(function() if tPos then task.spawn(function() face(tPos) end) end end)
    end
  end
  for _,wf in ipairs(sk:GetChildren()) do if wf:IsA("GuiObject") then for _,b in ipairs(wf:GetChildren()) do if b:IsA("ImageButton") or b:IsA("TextButton") then hook(b) end end end end
  sk.ChildAdded:Connect(function(wf) if wf:IsA("GuiObject") then for _,b in ipairs(wf:GetChildren()) do if b:IsA("ImageButton") or b:IsA("TextButton") then hook(b) end end end end)
end)

task.spawn(function()
  local mi = RS:WaitForChild("Mouse",15)
  if not mi then return end
  local ok, mm = pcall(require, mi)
  if not ok or type(mm)~="table" then return end
  local rH, rT = rawget(mm,"Hit"), rawget(mm,"Target")
  local mt = getrawmetatable(mm)
  if mt then setreadonly(mt,false) else mt={} setmetatable(mm,mt) end
  rawset(mm,"Hit",nil) rawset(mm,"Target",nil)
  mt.__index = newcclosure(function(t,k)
    if tPos and (saPlayers or saNpcs) then
      if k=="Hit" then return CFrame.new(tPos) end
      if k=="Target" then return nil end
    end
    if k=="Hit" then return rH end
    if k=="Target" then return rT end
    return rawget(t,k)
  end)
  if mt then setreadonly(mt,true) end
end)

task.spawn(function()
  local mt = getrawmetatable(game)
  if not mt then return end
  local old = mt.__namecall
  setreadonly(mt,false)
  mt.__namecall = newcclosure(function(self, ...)
    local m, args = getnamecallmethod(), {...}
    if args[1]=="TAP" then return old(self, ...) end
    if tPos and (saPlayers or saNpcs) and (m=="FireServer" or m=="InvokeServer") then
      if m=="FireServer" and typeof(args[1])=="Vector3" then args[1]=tPos
      elseif m=="InvokeServer" then
        if typeof(args[1])=="Vector3" then args[1]=tPos
        elseif typeof(args[2])=="Vector3" then args[2]=tPos end
      end
    end
    return old(self, table.unpack(args))
  end)
  setreadonly(mt,true)
end)

tog(SA_pg, "Player Silent Aim", false, function(v) saPlayers=v end)
tog(SA_pg, "NPC Silent Aim", false, function(v) saNpcs=v end)
sld(SA_pg, "FOV", 50, 800, fov, function(v) fov=v end)
sld(SA_pg, "Max Range", 100, 3000, maxR, function(v) maxR=v end)
sld(SA_pg, "Prediction x100", 0, 50, 12, function(v) predict=v/100 end)

-- ═══ SORU AUTO AIM ═══
local soruOn, soruRange, soruFov = false, 300, 100
local soruTpos, soruT = nil, 0

local function soruPick()
  local my = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
  if not my then return nil end
  local vs = Cam.ViewportSize
  local cx, cy = vs.X/2, vs.Y/2
  local best, bd = nil, math.huge
  for _,p in ipairs(Players:GetPlayers()) do
    if p ~= LP and p.Character then
      local h = p.Character:FindFirstChildOfClass("Humanoid")
      local r = p.Character:FindFirstChild("HumanoidRootPart")
      if h and r and h.Health > 0 then
        local d = (r.Position - my.Position).Magnitude
        if d <= soruRange then
          local v = Cam:WorldToViewportPoint(r.Position)
          if v.Z and v.Z > 0 and (Vector2.new(v.X,v.Y) - Vector2.new(cx,cy)).Magnitude <= soruFov then
            if d < bd then best, bd = r, d end
          end
        end
      end
    end
  end
  return best
end

RunService.Heartbeat:Connect(function()
  if not soruOn then soruTpos = nil return end
  if tick() - soruT < 0.2 then return end
  soruT = tick()
  local hrp = soruPick()
  if hrp then
    local v = hrp.AssemblyLinearVelocity or Vector3.zero
    soruTpos = (v.Magnitude < 5) and hrp.Position or (hrp.Position + v*0.15)
  else
    soruTpos = nil
  end
end)

task.spawn(function()
  local mt = getrawmetatable(game)
  if not mt then return end
  local old = mt.__namecall
  setreadonly(mt, false)
  mt.__namecall = newcclosure(function(self, ...)
    local m, args = getnamecallmethod(), {...}
    if soruOn and soruTpos and (m == "FireServer" or m == "InvokeServer") then
      for i = 1, #args do
        if typeof(args[i]) == "Vector3" and args[i].Magnitude > 0 then
          args[i] = soruTpos
        end
      end
    end
    return old(self, table.unpack(args))
  end)
  setreadonly(mt, true)
end)

tog(SA_pg, "Soru Auto Aim", false, function(v) soruOn = v end)
sld(SA_pg, "Soru Range", 50, 500, soruRange, function(v) soruRange = v end)
sld(SA_pg, "Soru FOV", 10, 800, soruFov, function(v) soruFov = v end)

-- ═══ GLITCH ═══
local boostCfg = {
  Sang = {anim="14418367908", power=400, dur=0.9, on=false, charging=false, cs=0},
  Dia  = {anim="14414815375", power=250, dur=0.3, on=false, charging=false, cs=0},
  Dtal = {anim="18839089313", power=400, dur=0.9, on=false, charging=false, cs=0}
}

local function fireBoost(b)
  local ch = LP.Character
  local hrp = ch and ch:FindFirstChild("HumanoidRootPart")
  local hum = ch and ch:FindFirstChildOfClass("Humanoid")
  if not hrp or not hum then return end
  local dir = Cam.CFrame.LookVector
  hum.PlatformStand = true
  local att = Instance.new("Attachment", hrp)
  local lv = Instance.new("LinearVelocity", hrp)
  lv.MaxForce = 9999999
  lv.VelocityConstraintMode = Enum.VelocityConstraintMode.Vector
  lv.VectorVelocity = dir * b.power
  lv.Attachment0 = att
  local active = true
  local endT = tick() + b.dur
  local conn
  local function stop()
    if not active then return end
    active = false
    if lv then lv:Destroy() end
    if att then att:Destroy() end
    if hum then hum.PlatformStand = false end
    if conn then conn:Disconnect() end
  end
  local pg = LP:FindFirstChild("PlayerGui")
  local main = pg and pg:FindFirstChild("Main")
  local dc = main and main:FindFirstChild("DmgCounter")
  local lbl = dc and dc:FindFirstChild("Text")
  local startT = lbl and lbl.Text or ""
  if lbl then
    conn = lbl:GetPropertyChangedSignal("Text"):Connect(function()
      local t = lbl.Text
      if t~=startT and t~="" and t~="0" then stop() end
    end)
  end
  while active and tick()<endT do task.wait() end
  stop()
end

RunService.Heartbeat:Connect(function()
  local ch = LP.Character
  local hum = ch and ch:FindFirstChildOfClass("Humanoid")
  if not hum then return end
  for _,b in pairs(boostCfg) do
    if b.on then
      local isC = false
      for _,a in pairs(hum:GetPlayingAnimationTracks()) do
        if a.Animation and a.Animation.AnimationId:find(b.anim) then isC=true break end
      end
      if isC then
        if not b.charging then b.charging=true b.cs=tick() end
      else
        if b.charging then
          if (tick()-b.cs) >= 1.0 then task.spawn(function() fireBoost(b) end) end
          b.charging=false b.cs=0
        end
      end
    end
  end
end)

tog(GL_pg, "Sanguine Z", false, function(v) boostCfg.Sang.on=v end)
sld(GL_pg, "Sanguine Power", 100, 5000, 400, function(v) boostCfg.Sang.power=v end)
tog(GL_pg, "Diamond Z", false, function(v) boostCfg.Dia.on=v end)
sld(GL_pg, "Diamond Power", 100, 5000, 250, function(v) boostCfg.Dia.power=v end)
tog(GL_pg, "DTalon Z", false, function(v) boostCfg.Dtal.on=v end)
sld(GL_pg, "DTalon Power", 100, 5000, 400, function(v) boostCfg.Dtal.power=v end)

tog(GL_pg, "Fake Headless", false, function(v)
  local ch = LP.Character if not ch then return end
  local head = ch:FindFirstChild("Head")
  if head then head.Transparency = v and 1 or 0 end
end)

-- ═══ MOVEMENT ═══
local flyOn, flySpd, flyConn = false, 50, nil
local spdOn, spdVal = false, 50
local nocOn, nocConn = false, nil

local function startFly()
  if flyConn then flyConn:Disconnect() end
  flyOn = true
  flyConn = RunService.Stepped:Connect(function()
    local ch = LP.Character
    local hrp = ch and ch:FindFirstChild("HumanoidRootPart")
    local hum = ch and ch:FindFirstChildOfClass("Humanoid")
    if not flyOn or not hrp or not hum then return end
    local md = hum.MoveDirection
    local dir = Vector3.zero
    if md.Magnitude>0 then
      local rel = Cam.CFrame:VectorToObjectSpace(md)
      dir = ((Cam.CFrame.RightVector*rel.X) + (Cam.CFrame.LookVector*-rel.Z)).Unit
    end
    hum.PlatformStand = true
    hrp.CFrame = hrp.CFrame + (dir * (flySpd/10))
    hrp.Velocity = Vector3.zero
  end)
end

local function stopFly()
  flyOn = false
  if flyConn then flyConn:Disconnect(); flyConn=nil end
  local ch = LP.Character local hum = ch and ch:FindFirstChildOfClass("Humanoid")
  if hum then hum.PlatformStand = false end
end

RunService.Heartbeat:Connect(function()
  if not spdOn then return end
  local ch = LP.Character local hum = ch and ch:FindFirstChildOfClass("Humanoid")
  if hum then hum.WalkSpeed = spdVal end
end)

tog(MV_pg, "Fly", false, function(v) if v then startFly() else stopFly() end end)
sld(MV_pg, "Fly Speed", 10, 500, flySpd, function(v) flySpd=v end)
tog(MV_pg, "NoClip", false, function(v)
  nocOn = v
  if v then
    if nocConn then nocConn:Disconnect() end
    nocConn = RunService.Stepped:Connect(function()
      if not nocOn then return end
      local ch = LP.Character
      if ch then for _,p in pairs(ch:GetDescendants()) do if p:IsA("BasePart") then p.CanCollide=false end end end
    end)
  else if nocConn then nocConn:Disconnect(); nocConn=nil end end
end)
tog(MV_pg, "Speed", false, function(v)
  spdOn = v
  if not v then local ch=LP.Character local hum=ch and ch:FindFirstChildOfClass("Humanoid") if hum then hum.WalkSpeed=16 end end
end)
sld(MV_pg, "Speed Value", 16, 500, spdVal, function(v) spdVal=v end)

-- ═══ ESP ═══
local espOn, eBox, eName, eDist, eHP = false, true, true, true, true
local drawings, espConn = {}, nil
local function clearESP() for _,d in pairs(drawings) do pcall(function() d:Remove() end) end drawings={} end
local function renderESP()
  clearESP()
  if not espOn then return end
  local my = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
  for _,pl in ipairs(Players:GetPlayers()) do
    if pl~=LP and pl.Character then
      local hrp = pl.Character:FindFirstChild("HumanoidRootPart")
      local hum = pl.Character:FindFirstChildOfClass("Humanoid")
      if hrp and hum and hum.Health>0 then
        local sp, onS = Cam:WorldToViewportPoint(hrp.Position)
        if onS then
          local dist = my and (hrp.Position-my.Position).Magnitude or 0
          local sz = Vector2.new(2000/math.max(dist,1), 4000/math.max(dist,1))
          if eBox then
            local tl = Vector2.new(sp.X-sz.X/2, sp.Y-sz.Y/2)
            local tr = Vector2.new(sp.X+sz.X/2, sp.Y-sz.Y/2)
            local bl = Vector2.new(sp.X-sz.X/2, sp.Y+sz.Y/2)
            local br = Vector2.new(sp.X+sz.X/2, sp.Y+sz.Y/2)
            local function ln(a,b) local l=Drawing.new("Line") l.Visible=true l.Color=Color3.fromRGB(255,255,255) l.Thickness=1 l.From=a l.To=b table.insert(drawings,l) end
            ln(tl,tr) ln(tr,br) ln(br,bl) ln(bl,tl)
          end
          if eName then
            local t=Drawing.new("Text") t.Visible=true t.Text=pl.Name t.Color=Color3.fromRGB(255,255,255) t.Size=13 t.Center=true t.Position=Vector2.new(sp.X, sp.Y-sz.Y/2-15) t.Font=2
            table.insert(drawings,t)
          end
          if eDist then
            local t=Drawing.new("Text") t.Visible=true t.Text=math.floor(dist).."m" t.Color=Color3.fromRGB(220,220,220) t.Size=12 t.Center=true t.Position=Vector2.new(sp.X, sp.Y+sz.Y/2+2) t.Font=2
            table.insert(drawings,t)
          end
          if eHP then
            local ratio = math.clamp(hum.Health/hum.MaxHealth, 0, 1)
            local w = sz.X
            local bg = Drawing.new("Square") bg.Visible=true bg.Color=Color3.new(0,0,0) bg.Filled=true bg.Size=Vector2.new(w,4) bg.Position=Vector2.new(sp.X-w/2, sp.Y+sz.Y/2+12)
            table.insert(drawings,bg)
            local fg = Drawing.new("Square") fg.Visible=true fg.Color=Color3.new(1-ratio,ratio,0) fg.Filled=true fg.Size=Vector2.new(w*ratio,4) fg.Position=Vector2.new(sp.X-w/2, sp.Y+sz.Y/2+12)
            table.insert(drawings,fg)
          end
        end
      end
    end
  end
end

tog(ES_pg, "Enable ESP", false, function(v)
  espOn = v
  if v then
    if espConn then espConn:Disconnect() end
    espConn = RunService.RenderStepped:Connect(renderESP)
  else
    if espConn then espConn:Disconnect(); espConn=nil end
    clearESP()
  end
end)
tog(ES_pg, "Box", true, function(v) eBox=v end)
tog(ES_pg, "Name", true, function(v) eName=v end)
tog(ES_pg, "Distance", true, function(v) eDist=v end)
tog(ES_pg, "Health", true, function(v) eHP=v end)

-- ═══ SETUP ═══
switch("Silent Aim")

local drag, st2, sp2
hd.InputBegan:Connect(function(i) if i.UserInputType==Enum.UserInputType.Touch or i.UserInputType==Enum.UserInputType.MouseButton1 then drag=true st2=i.Position sp2=win.Position end end)
hd.InputChanged:Connect(function(i) if drag and (i.UserInputType==Enum.UserInputType.Touch or i.UserInputType==Enum.UserInputType.MouseMovement) then local d=i.Position-st2 win.Position=UDim2.new(sp2.X.Scale,sp2.X.Offset+d.X,sp2.Y.Scale,sp2.Y.Offset+d.Y) end end)
hd.InputEnded:Connect(function() drag=false end)

min.MouseButton1Click:Connect(function() win.Visible=false float.Visible=true end)
float.MouseButton1Click:Connect(function() float.Visible=false win.Visible=true end)

local drag2, st3, sp3
float.InputBegan:Connect(function(i) if i.UserInputType==Enum.UserInputType.Touch or i.UserInputType==Enum.UserInputType.MouseButton1 then drag2=true st3=i.Position sp3=float.Position end end)
float.InputChanged:Connect(function(i) if drag2 and (i.UserInputType==Enum.UserInputType.Touch or i.UserInputType==Enum.UserInputType.MouseMovement) then local d=i.Position-st3 float.Position=UDim2.new(sp3.X.Scale,sp3.X.Offset+d.X,sp3.Y.Scale,sp3.Y.Offset+d.Y) end end)
float.InputEnded:Connect(function() drag2=false end)

cls.MouseButton1Click:Connect(function()
  if gui then gui:Destroy() end
  getgenv()._3zm = nil
end)

getgenv()._3zm = function() if gui then gui:Destroy() end end

print("[3zm] loaded | black theme")
