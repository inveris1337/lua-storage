--// Hi ball do not paste it plz \\--
--// Custom AA or wtv nigga
--// UNREADABLE SOURCE.CC

--// Coding style took from stormy ;3


local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

local yaw_base = {
    {"camera" , true},
    {"custom", false},
    {"spin", false},
    {"jitter", false},
    {"sway", false},
}

local pitch_table = {
    {"disabled", true},
    {"default", false} ,
    {"zero", false},
    {"down", false},
    {"up", false},
    {"random", false},
}
ui:createdropdown({tab = "scripts", subsection = "custom scripts", name = "yaw base", flag = "yaw_base_aa", values = yaw_base, multichoice = false, tooltip = "Bro @NamHvH make Anti Aim Lua"})
ui:createdropdown({tab = "scripts", subsection = "custom scripts", name = "pitch", flag = "pitch_aa", values = pitch_table, multichoice = false, tooltip = "Bro @NamHvH make Anti Aim Lua"})
ui:createslider({tab = "scripts", subsection = "custom scripts", name = "yaw offset", suffix = "°", flag = "yaw_offset_aa", value = 0, minimum = -180, maximum = 180, tooltip = "bro Yaw OFFSET NIGGA"})
ui:createslider({tab = "scripts", subsection = "custom scripts", name = "jitter offset", suffix = "°", flag = "jitter_offset_aa", value = 0, minimum = 0, maximum = 90, tooltip = "bro jitter OFFSET 50"})
ui:createslider({tab = "scripts", subsection = "custom scripts", name = "jitter steps", flag = "jitter_steps_aa", suffix = "°", value = 2, minimum = 2, maximum = 10, tooltip = "How much ways for jitter to go (bad code to be honest)"})
ui:createslider({tab = "scripts", subsection = "custom scripts", name = "spin speed", suffix = "%", flag = "spinspeed_aa", value = 0, minimum = 0, maximum = 500, tooltip = "bro spin 50"})
--// sway aa
ui:createslider({tab = "scripts", subsection = "custom scripts", name = "sway range", suffix = "°", flag = "sway_range_aa", value = 60, minimum = -180, maximum = 180, tooltip = "bro spin 50"})
ui:createslider({tab = "scripts", subsection = "custom scripts", name = "sway speed", suffix = "%", flag = "sway_speed_aa", value = 30, minimum = 0, maximum = 500, tooltip = "bro spin 50"})
--// randomization
ui:createslider({tab = "scripts", subsection = "custom scripts", name = "min randomization", suffix = "°", flag = "random_min_aa", value = 0, minimum = -180, maximum = 180, tooltip = "bro gift 50"})
ui:createslider({tab = "scripts", subsection = "custom scripts", name = "max randomization", suffix = "°", flag = "random_max_aa", value = 0, minimum = -180, maximum = 180, tooltip = "bro gift 50"})
ui:createslider({tab = "scripts", subsection = "custom scripts", name = "randomization speed", suffix = "°", flag = "random_speed_aa", value = 0, minimum = 0, maximum = 500, tooltip = "bro gift 50"})

--// pasted from my universal uhh universal anti aim script i did that for fun
local settings = {
    aa = {
        yawbase = "camera",
        spinspeed = ui.flags.jitter_offset_aa.value or 100,
        jitteroffset = ui.flags.jitter_offset_aa.value or 90,
        swayrange = ui.flags.sway_range_aa.value or 60,
        swayspeed = ui.flags.sway_speed_aa.value or 30,
		yawangles = ui.flags.yaw_offset_aa.value or 0,
        jittersteps = ui.flags.jitter_steps_aa.value,
        random_min = ui.flags.random_min_aa.value or 0,
        random_max = ui.flags.random_max_aa.value or 0,
        random_speed = ui.flags.random_speed_aa.value or 0,
        ["pitch"] = "disabled",
    }
}
--// useless but nigga i wanna feel cool
local function YROTATION(cframe)
    local x, y, z = cframe:ToOrientation()
    return CFrame.new(cframe.Position) * CFrame.Angles(0,y,0)
end
local function XYROTATION(cframe)
    local x, y, z = cframe:ToOrientation()
    return CFrame.new(cframe.Position) * CFrame.Angles(x,y,0)
end

local function degtorad(deg)
    return math.rad(deg)
end




RunService.Heartbeat:Connect(function()
    task.wait() --// bro delay removal
        settings.aa.swayrange = ui.flags.sway_range_aa.value or 0
        settings.aa.swayspeed = ui.flags.sway_speed_aa.value or 0
        settings.aa["spinspeed"] = ui.flags.spinspeed_aa.value or 0
        settings.aa["yawangles"] = ui.flags.yaw_offset_aa.value or 0
        settings.aa["jitteroffset"] = ui.flags.jitter_offset_aa.value or 0
        settings.aa.jittersteps  = ui.flags.jitter_steps_aa.value or 0
        settings.aa.random_min  = ui.flags.random_min_aa.value or 0
        settings.aa.random_max  = ui.flags.random_max_aa.value or 0
        settings.aa.random_speed = ui.flags.random_speed_aa.value or 0
    
        local LowerTorso = LocalPlayer.Character:FindFirstChild("LowerTorso")
        local Root = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        local CamCFrame = Camera.CFrame
        local CamLook = CamCFrame.LookVector
        local PlayerIsAlive = false
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") and LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0 and LocalPlayer.Character:FindFirstChild("UpperTorso") then
            PlayerIsAlive = true
        else
            PlayerIsAlive = false
        end
            local aa = settings.aa
            local aayaw = CamCFrame:ToOrientation() --// the camera nigga i hate fixing this

            if aa.yawbase == "camera" then
                aayaw = math.rad(0) --// PASTED FROM THE SPIN SHIT.. (atp ion care nigga jsut use this it pmo..)
            elseif aa.yawbase == "custom" then
                local angle = math.sin(tick() * settings.aa.random_speed) * (settings.aa.random_max - settings.aa.random_min) / 2 + (settings.aa.random_max + settings.aa.random_min) / 2
                aayaw = degtorad(angle)
             elseif aa.yawbase == "spin" then
                aayaw = math.rad((tick() * aa.spinspeed * 60) % 360)
            elseif aa.yawbase == "jitter" then
            local steps = aa.jittersteps
            local maxOff = aa.jitteroffset
            -- generate diddy bluds lmfao from -maxOff to +maxOff
            local i = math.random(0, steps-1)
            local angle = -maxOff + (2 * maxOff) * (i / (steps-1)) -- SHTU THEFUCK UP
            aayaw = degtorad(angle)
            elseif aa.yawbase == "sway" then
                local swayangle = math.sin(tick() * aa.swayspeed) * aa.swayrange
                aayaw = degtorad(swayangle)
            end
            if PlayerIsAlive then
                if aa.yawbase then
                    LowerTorso.Root.C0 = CFrame.new(LowerTorso.Root.C0.Position) * CFrame.Angles(0, aayaw + degtorad(settings.aa.yawangles), 0)
                    Root.CFrame = YROTATION(CFrame.new(Root.Position, Root.Position + Vector3.new(CamLook.X, 0, CamLook.Z).Unit) * CFrame.Angles(0, aayaw + degtorad(settings.aa.yawangles), 0))
                end
            end
        if settings.aa["pitch"] ~= "disabled" then
            local Pitch --// oh HELL NAWH NIGGA ELSEIF time..
            if settings.aa["pitch"] == "up" then
                Pitch = 1
            elseif settings.aa["pitch"] == "down" then
                Pitch = -1
            elseif settings.aa["pitch"] == "zero" then
                Pitch = 0
            elseif settings.aa["pitch"] == "random" then
                Pitch = math.random(-10, 10)
            end
            game.ReplicatedStorage.Events.ControlTurn:FireServer(Pitch, LocalPlayer.Character:FindFirstChild("Climbing") and true or false)
        end
    end)

--// finally the ui set up

ui.flags.yaw_base_aa.changed:Connect(function()
    local val
    for i, v in next, (ui.flags.yaw_base_aa.value) do
        if v then
            val = i
        end
    end
    if not val then return end
    settings.aa["yawbase"] = val
     --// debugging
    print("string " .. val)
    print("table " .. settings.aa["yawbase"])
end)
ui.flags.pitch_aa.changed:Connect(function()
    local val
    for i, v in next, (ui.flags.pitch_aa.value) do
        if v then
            val = i
        end
    end
    if not val then return end
    settings.aa["pitch"] = val
    --// debugging
    print("string " .. val)
    print("table " .. settings.aa["pitch"])
end)

--// INSTALLING DIDDYS (SOLARA STEALS UR MALWARE 😂😂😂😂)
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
