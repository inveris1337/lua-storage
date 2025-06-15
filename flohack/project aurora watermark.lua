local cur_date = os.date("*t")

local watermark = Instance.new("ScreenGui")
watermark.Name = "_watermark_"
watermark.DisplayOrder = 1.88e+09
watermark.ResetOnSpawn = false

local watermark1 = Instance.new("Frame")
watermark1.Name = "Watermark"
watermark1.Active = true
watermark1.BorderColor3 = Color3.fromRGB(0, 0, 0)
watermark1.BorderSizePixel = 0
watermark1.Position = UDim2.fromOffset(10, 10)
watermark1.Size = UDim2.fromOffset(364, 22)
watermark1.ZIndex = 200

local frame = Instance.new("Frame")
frame.Name = "Frame"
frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
frame.BorderColor3 = Color3.fromRGB(22, 22, 22)
frame.Size = UDim2.fromScale(1, 1)
frame.ZIndex = 201

local frame1 = Instance.new("Frame")
frame1.Name = "Frame"
frame1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
frame1.BackgroundTransparency = 1
frame1.BorderSizePixel = 0
frame1.Position = UDim2.fromOffset(1, 1)
frame1.Size = UDim2.new(1, -2, 1, -2)
frame1.ZIndex = 202

local imageLabel = Instance.new("ImageLabel")
imageLabel.Name = "ImageLabel"
imageLabel.AnchorPoint = Vector2.new(0, 0.5)
imageLabel.BackgroundTransparency = 1
imageLabel.Image = "rbxassetid://140198300701593"
imageLabel.Position = UDim2.new(0, 5, 0.5, 0)
imageLabel.Size = UDim2.fromOffset(13, 13)
imageLabel.ZIndex = 203
imageLabel.Parent = frame1

local textLabel = Instance.new("TextLabel")
textLabel.Name = "TextLabel"
textLabel.BackgroundTransparency = 1
textLabel.Font = Enum.Font.SourceSans
textLabel.Position = UDim2.fromOffset(17, 0)
textLabel.RichText = true
textLabel.Size = UDim2.new(1, -28, 1, 0)
textLabel.TextColor3 = Color3.fromRGB(215, 215, 215)
textLabel.TextSize = 15
textLabel.TextXAlignment = Enum.TextXAlignment.Left
textLabel.ZIndex = 203
textLabel.Parent = frame1

frame1.Parent = frame

local frame2 = Instance.new("Frame")
frame2.Name = "Frame"
frame2.BackgroundColor3 = Color3.fromRGB(255, 37, 37)
frame2.BorderColor3 = Color3.fromRGB(255, 37, 37)
frame2.BorderSizePixel = 0
frame2.Position = UDim2.new(0, -1, 1, 0)
frame2.Size = UDim2.new(1, 2, 0, 2)
frame2.ZIndex = 202
frame2.Parent = frame

frame.Parent = watermark1
watermark1.Parent = watermark

watermark.Parent = gethui()

local RunService = game:GetService("RunService")
--// THANKS A RANDOM NIGA IN DEVFORUM
local Stats = game:GetService("Stats")
local FrameRateManager = Stats and Stats:FindFirstChild("FrameRateManager")
local RenderAverage = FrameRateManager and FrameRateManager:FindFirstChild("RenderAverage")


local function GetFramerate(): number
	return math.floor((1000 / RenderAverage:GetValue()) + 0.5)
end



RunService.RenderStepped:Connect(function()
	textLabel.Text = 
		"  <font color=\"#FF2525\">Aurora Legacy</font> <font color=\"#3f3f3f\" size=\"9\">v2.3.0</font> " ..
		GetFramerate() .. " fps 〡" ..
		math.floor(game:GetService("Players").LocalPlayer.Ping.Value)
 .. " ms 〡" ..
		os.date("%I:%M") .. " 〡" ..
		os.date("%A") .. ", " .. os.date("%B") .. " " .. cur_date.day
end)


  local final = Vector2.new(game:GetService("Players").LocalPlayer:GetMouse().X - ui.objects.backborder.absoluteposition.x, game:GetService("Players").LocalPlayer:GetMouse().Y - ui.objects.backborder.absoluteposition.y)
  ui:setsize(final)
  ui.flags.configname:setvalue("reset")
  ui.flags.loadconfig.pressed:Fire()
  ui.flags.loadconfig.pressed:Connect(function()
      for i = 1, 3 do
          ui.flags.resetuilayout.pressed:Fire()
      end
      ui:setsize(final)
  end)
  for i = 1, 3 do
      ui.flags.resetuilayout.pressed:Fire()
  end
