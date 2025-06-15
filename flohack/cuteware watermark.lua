local RunService = game:GetService("RunService")

local ScreenGui = Instance.new("ScreenGui")
local Text = Instance.new("TextLabel")

ScreenGui.Enabled = true
ScreenGui.Parent = game:GetService("CoreGui")
Text.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Text.BorderSizePixel = 1
Text.BorderColor3 = Color3.fromRGB(30, 60, 150)
Text.Size = UDim2.new(0, 225, 0, 20)
Text.Font = Enum.Font.Ubuntu
Text.TextColor3 = Color3.fromRGB(255, 255, 255)
Text.TextSize = 14
Text.Position = UDim2.new(1, -229, 0, -30)
Text.Parent = ScreenGui
RunService.RenderStepped:Connect(function()
    Text.Text = "cuteware | " .. os.date("%H:%M:%S") .. " | " .. game.Players.LocalPlayer.Name --// @nam why not do local client = game.players.localplayer (syfm)
    if Text.TextBounds.X > 210 then
		Text.TextSize = Text.TextSize - 1
	end
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

