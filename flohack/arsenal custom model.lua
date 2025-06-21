local Model_Knife = game:GetObjects("rbxassetid://117572249121970")[1]
local Model_Weapon  = game:GetObjects("rbxassetid://88495560407776")[1]
Model_Weapon.Parent = game.CoreGui
Model_Knife.Parent = game.CoreGui
for i, v in pairs(Model_Knife.Knives:GetChildren()) do
    if v:IsA("Model") then
        if v:FindFirstChild("fire4") then
            local stab_anim = v:FindFirstChild("fire4"):Clone()
            stab_anim.Parent = v
            stab_anim.Name = "stab"
        elseif v:FindFirstChild("fire3") and not v:FindFirstChild("fire4") then
            local stab_anim = v:FindFirstChild("fire3"):Clone()
            stab_anim.Parent = v
            stab_anim.Name = "stab"
        elseif v:FindFirstChild("fire4") and v:FindFirstChild("fire3") then
            local stab_anim = v:FindFirstChild("fire4"):Clone()
            stab_anim.Parent = v
            stab_anim.Name = "stab"
        else
            print("fire4, fire3 doesn't exist in" .. " " .. v.Name)
            v:Destroy()
        end
    end
end
for i, v in pairs(Model_Weapon.Guns:GetChildren()) do
    if v:FindFirstChild("Flash") then
        print(v.Name .. " already have a flash something idk")
    else
        local joints = Instance.new("Part")
        joints.Transparency = 1
        joints.Size = Vector3.new(0.05, 0.06, 0.05)
        joints.CanCollide = false
        joints.Parent = v
        joints.Name = "Flash"
    end
end

local weps = {
    { "USP", false },
    { "P2000", false },
    { "Glock", false },
    { "DualBerettas", false },
    { "P250", false },
    { "FiveSeven", false },
    { "Tec9", false },
    { "XM", true },
    { "CZ", false },
    { "DesertEagle", false },
    { "R8", false },
    { "MP9", false },
    { "MAC10", false },
    { "MP7-SD", false },
    { "MP7", false },
    { "UMP", false },
    { "P90", false },
    { "Bizon", false },
    { "M4A4", false },
    { "M4A1", false },
    { "AK47", false },
    { "Famas", false },
    { "Galil", false },
    { "AUG", false },
    { "SG", false },
    { "AWP", false },
    { "Scout", false },
    { "G3SG1", false }
}
local tlb = {}
for i, v in ipairs(Model_Knife.Knives:GetChildren()) do
    table.insert(tlb, {v.Name, false})
end
if tlb[1] then
    tlb[1][2] = true
end
local tlb_wep = {}
for _, v in ipairs(Model_Weapon.Guns:GetChildren()) do
    table.insert(tlb_wep, {v.Name, false})
end
if tlb_wep[1] then
    tlb_wep[1][2] = true
end
ui:createdropdown({tab = "scripts", subsection = "custom scripts", name = "custom knife model", flag = "custom_knife_model_arsenal", values = tlb, multichoice = false, tooltip = "Bro change knife"})
local VarAF
ui.flags.custom_knife_model_arsenal.changed:Connect(function()
    local selected
    for i, v in next, (ui.flags.custom_knife_model_arsenal.value) do
        if v then
            selected = i
        end
    end
    if not selected then return end
    VarAF = selected
end)
ui:createbutton({tab = "scripts", subsection = "custom scripts", name = "apply custom knife model", flag = "apply_custom_model", confirmation = false})
ui:createdropdown({tab = "scripts", subsection = "custom scripts", name = "custom weapon model", flag = "custom_wep_model_arsenal", values = tlb_wep, multichoice = false, tooltip = "Bro change model"})
ui:createdropdown({tab = "scripts", subsection = "custom scripts", name = "weapon to change", flag = "wep_model_to_change", values = weps, multichoice = false, tooltip = "Bro change model"})
ui:createbutton({tab = "scripts", subsection = "custom scripts", name = "apply custom weapon model", flag = "apply_custom_model_weps", confirmation = false})
local wep_custom
ui.flags.custom_wep_model_arsenal.changed:Connect(function()
    local selected
    for i, v in next, (ui.flags.custom_wep_model_arsenal.value) do
        if v then
            selected = i
        end
    end
    if not selected then return end
    wep_custom = selected
end)
local wep_to_change
ui.flags.wep_model_to_change.changed:Connect(function()
    local selected
    for i, v in next, (ui.flags.wep_model_to_change.value) do
        if v then
            selected = i
        end
    end
    if not selected then return end
    wep_to_change = selected
end)
ui.flags.apply_custom_model.pressed:Connect(function()
    local TKnife = Model_Knife.Knives[VarAF]:Clone()
    local CTKnife = Model_Knife.Knives[VarAF]:Clone()

    local rep_storage = game:GetService("ReplicatedStorage")
    local viewmodels = rep_storage.Viewmodels

    viewmodels:FindFirstChild("v_CT Knife").Parent = nil
    viewmodels:FindFirstChild("v_T Knife").Parent = nil
        
    --// set up
    TKnife.Name = "v_T Knife"
    CTKnife.Name = "v_CT Knife"
        
    CTKnife.Parent = viewmodels
    TKnife.Parent = viewmodels
    --// end of the setup
end)
ui.flags.apply_custom_model_weps.pressed:Connect(function()
    local Weapon = Model_Weapon.Guns[wep_custom]:Clone()

    local rep_storage = game:GetService("ReplicatedStorage")
    local viewmodels = rep_storage.Viewmodels

    viewmodels:FindFirstChild("v_".. wep_to_change):Destroy()
        
    --// set up
    Weapon.Name = "v_" .. wep_to_change
    Weapon.Parent = viewmodels
    --// end of the setup
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