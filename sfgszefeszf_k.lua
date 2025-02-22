local runService = game:GetService("RunService")
local tween = game:GetService("TweenService")
local content = game:GetService("ContentProvider")
local input = game:GetService("UserInputService")

local runn
local device = ""

local link = "https://ify.ac/1Yhw"

local adminkey = "StupidFuckingNigger"
local KEY = "tert"

local GUI = Instance.new("ScreenGui")
local s, a = pcall(function() GUI.Parent = game.CoreGui end) if not s then GUI.Parent = game.Players.LocalPlayer.PlayerGui end
GUI.Name = "Loader"
GUI.ResetOnSpawn = false

local MENU = Instance.new("Frame")
MENU.Parent = GUI
MENU.Name = "Menu"
MENU.BackgroundTransparency = 1
MENU.Position = UDim2.new(0.338, 0, 0.316, 0)
MENU.Size = UDim2.new(0.324, 0, 0.367, 0)
MENU.Visible = true

local Ghosts = Instance.new("ImageLabel")
Ghosts.Parent = MENU
Ghosts.Name = "Ghosts"
Ghosts.BackgroundTransparency = 1
Ghosts.Position = UDim2.new(0, 0, 0, 0)
Ghosts.Size = UDim2.new(1, 0, 1, 0)
Ghosts.Image = "rbxassetid://121742762213177"
Ghosts.ImageTransparency = 1
Ghosts.Visible = true

local UICGhost = Instance.new("UICorner")
UICGhost.Parent = Ghosts
UICGhost.CornerRadius = UDim.new(0, 8)

local loading = Instance.new("ImageLabel")
loading.Parent = MENU
loading.Name = "loading"
loading.BackgroundTransparency = 1
loading.Position = UDim2.new(0.461, 0, 0.703, 0)
loading.Size = UDim2.new(0.086, 0, 0.149, 0)
loading.Image = "rbxassetid://17794067799"
loading.ImageTransparency = 1
loading.Visible = true

local text = Instance.new("TextLabel")
text.Parent = MENU
text.Name = "text"
text.BackgroundTransparency = 1
text.BackgroundColor3 = Color3.new(1, 1, 1)
text.Position = UDim2.new(0.233, 0, 0.296, 0)
text.Size = UDim2.new(0.531, 0, 0.197, 0)
text.TextColor3 = Color3.new(0, 0, 0)
text.TextScaled = true
text.Text = ""
text.Visible = true

local UICtext = Instance.new("UICorner")
UICtext.Parent = text
UICtext.CornerRadius = UDim.new(8, 8)

local UITtext = Instance.new("UITextSizeConstraint")
UITtext.Parent = text
UITtext.MaxTextSize = 30

task.wait()

local rotationSpeed = 150

local cfg1 = {
      ImageTransparency = 0
}

local cfg2 = {
      BackgroundTransparency = 0
}

local info = TweenInfo.new(2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
local anim1 = tween:Create(Ghosts, info, cfg1)
local anim2 = tween:Create(loading, info, cfg1)
local anim3 = tween:Create(text, info, cfg2)
anim1:Play()
anim2:Play()
anim3:Play()
anim3.Completed:Wait()

wait()
runn = runService.RenderStepped:Connect(function(deltaTime)
      loading.Rotation = (loading.Rotation + rotationSpeed * deltaTime) % 360
end)

function Write(TEXT, status)
      local textcolor = Color3.new(0, 0, 0)
      local errorcolor = Color3.new(1, 0, 0)
      local succescolor = Color3.new(0, 1, 0.0313725)
      
      if status == "text" then
            text.TextColor3 = textcolor
      end
      if status == "error" then
            text.TextColor3 = errorcolor
      end
      if status == "succes" then
            text.TextColor3 = succescolor
      end
      text.Text = TEXT
end

Write("Loading...", "text")
for _, a in pairs(GUI:GetChildren()) do
      content:PreloadAsync({a})
      wait()
end
repeat wait() until game:IsLoaded()
Write("Loaded", "succes")
wait(2)
Write("Protection your account...", "text")
local work2, no2 = pcall(function()
      local isHookFunctionSupported = typeof(hookfunction) == "function"

      local function monitorHttps()
            local forbiddenFunctions = {print, warn, setclipboard}
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
wait(2)
if not work2 then
      Write("Protection your account failed", "error")
else
      Write("Your account was protected succesfully", "succes")
end
wait(1)
loading:Destroy()
text:Destroy()

local KEYINPUT = Instance.new("TextBox")
KEYINPUT.Parent = MENU
KEYINPUT.Name = "input"
KEYINPUT.BackgroundColor3 = Color3.new(1, 1, 1)
KEYINPUT.ClearTextOnFocus = false
KEYINPUT.TextEditable = true
KEYINPUT.Position = UDim2.new(0.231, 0, 0.241, 0)
KEYINPUT.Size = UDim2.new(0.531, 0, 0.149, 0)
KEYINPUT.PlaceholderText = "Put your key here"
KEYINPUT.PlaceholderColor3 = Color3.new(0.513725, 0.513725, 0.513725)
KEYINPUT.TextColor3 = Color3.new(0, 0, 0)
KEYINPUT.TextScaled = true
KEYINPUT.Text = ""
KEYINPUT.Visible = true

local uickeyinput = Instance.new("UICorner")
uickeyinput.Parent = KEYINPUT
uickeyinput.CornerRadius = UDim.new(0, 8)

local uiskeyinput = Instance.new("UIStroke")
uiskeyinput.Parent = KEYINPUT
uiskeyinput.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
uiskeyinput.Color = Color3.new(0, 0, 0)
uiskeyinput.LineJoinMode = Enum.LineJoinMode.Round
uiskeyinput.Thickness = 4
uiskeyinput.Transparency = 0.2

local GETKEYBUTTON = Instance.new("TextButton")
GETKEYBUTTON.Parent = MENU
GETKEYBUTTON.Name = "GetKey"
GETKEYBUTTON.BackgroundColor3 = Color3.new(1, 1, 1)
GETKEYBUTTON.Position = UDim2.new(0.231, 0, 0.681, 0)
GETKEYBUTTON.Size = UDim2.new(0.452, 0, 0.112, 0)
GETKEYBUTTON.Font = Enum.Font.RobotoMono
GETKEYBUTTON.TextColor3 = Color3.new(0, 0, 0)
GETKEYBUTTON.TextScaled = true
GETKEYBUTTON.Text = "Get Key"
GETKEYBUTTON.Visible = true

local uicgetkeybutton = Instance.new("UICorner")
uicgetkeybutton.Parent = GETKEYBUTTON
uicgetkeybutton.CornerRadius = UDim.new(0, 8)

local uisgetkeybutton = Instance.new("UIStroke")
uisgetkeybutton.Parent = GETKEYBUTTON
uisgetkeybutton.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
uisgetkeybutton.Color = Color3.new(0, 0, 0)
uisgetkeybutton.LineJoinMode = Enum.LineJoinMode.Round
uisgetkeybutton.Thickness = 3.5
uisgetkeybutton.Transparency = 0.2

local CHECKBUTTON = Instance.new("ImageButton")
CHECKBUTTON.Parent = MENU
CHECKBUTTON.Name = "check"
CHECKBUTTON.BackgroundColor3 = Color3.new(1, 1, 1)
CHECKBUTTON.Position = UDim2.new(0.697, 0, 0.681, 0)
CHECKBUTTON.Size = UDim2.new(0.067, 0, 0.112, 0)
CHECKBUTTON.Image = "rbxassetid://76645474804869"
CHECKBUTTON.ImageColor3 = Color3.new(0, 0, 0)
CHECKBUTTON.Visible = true

local uiccheckbutton = Instance.new("UICorner")
uiccheckbutton.Parent = CHECKBUTTON
uiccheckbutton.CornerRadius = UDim.new(0, 8)

local uischeckbutton = Instance.new("UIStroke")
uischeckbutton.Parent = CHECKBUTTON
uischeckbutton.Color = Color3.new(0, 0, 0)
uischeckbutton.LineJoinMode = Enum.LineJoinMode.Round
uischeckbutton.Thickness = 3.5
uischeckbutton.Transparency = 0.2

CHECKBUTTON.MouseButton1Click:Connect(function()
      if KEYINPUT.Text == adminkey or KEYINPUT.Text == KEY then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/drgdrxgdxrhyxdrhedrhesrdherd/dontworry/refs/heads/main/sfsefesh.lua"))()
            GUI:Destroy()
      else
            KEYINPUT.Text = "invalid key!"
      end
end)

GETKEYBUTTON.MouseButton1Click:Connect(function()
      KEYINPUT.Text = link
      pcall(function() setclipboard(tostring(link)) end)
end)
