local knife_models = {
    {"Kogti", true},
    {"Banana Obama", false},
    {"Pillow", false},
    {"Megu", false},
    {"Stillet", false},
    {"Sausage", false},
    {"NoMadFix", false},
    {"Gold Ring", false},
    {"Talon", false},
    {"Stillet Stocked", false},
    {"Dirt Block", false},
    {"Classic Knife", false},
    {"Skeleton Knife", false},
    {"Katana", false},
    {"Atlast Knife", false},
    {"Valor Knife", false},
    {"Staff", false},
    {"Kruk", false},
    {"Minecraft Sword", false},
    {"Valor Knife V2", false},
    {"Frame Picture", false},
    {"Skin Changer Protest", false},
    {"Glow Stick", false},
    {"Boxfun", false},
    {"Gordons Kitchen Knifes", false},
    {"Coal Sword", false},
    {"ACT Trophy", false},
    {"Da Melee", false},
    {"Ban Hammer", false},
    {"Very Long Bat", false},
    {"Crucible", false},
    {"Bloxy", false},
    {"Crowbar", false},
    {"Ham", false},
    {"Burger", false},
    {"Old Karambit", false},
    {"Old Karambit Twitch", false},
    {"Old Butterfly Knife", false},
    {"Old Butterfly Knife Sapphire", false},
    {"Old Butterfly Knife Twitch", false},
    {"Old Butterfly Knife Ruby", false},
    {"Old Gut Knife", false},
    {"Flip Knife", false},
    {"Old Huntsman Knife", false},
    {"Old Huntsman Knife | Ruby", false},
    {"Old Bayonet, but with new bayonet animations", false},
    {"Pickaxe", false},
    {"Pathbringer", false},
    {"Talon Knife", false},
    {"Shadow Daggers", false},
    {"Heywe Cube", false},
    {"CSGO M9 Bayonet Autotronic", false},
    {"CSGO M9 Bayonet Nebula", false},

}


ui:createdropdown({tab = "scripts", subsection = "custom scripts", name = "custom knife model", flag = "custom_knife_model", values = knife_models, multichoice = false, tooltip = "Bro change knife"})
local VarAF
local cur_asset
ui.flags.custom_knife_model.changed:Connect(function()
    local selected
    for i, v in next, (ui.flags.custom_knife_model.value) do
        if v then
            selected = i
        end
    end
    if not selected then return end
    VarAF = selected
    print(VarAF)
    if VarAF == "Kogti" then cur_asset = "rbxassetid://7160973139"
    elseif VarAF == "Banana Obama" then cur_asset = "rbxassetid://7160993313"
    elseif VarAF == "Pillow" then cur_asset = "rbxassetid://7161018687"
    elseif VarAF == "Megu" then cur_asset = "rbxassetid://7161024042"
    elseif VarAF == "Stillet" then cur_asset = "rbxassetid://7161029620"
    elseif VarAF == "Sausage" then cur_asset = "rbxassetid://7161045678"
    elseif VarAF == "NoMadFix" then cur_asset = "rbxassetid://7161049979"
    elseif VarAF == "Gold Ring" then cur_asset = "rbxassetid://7161100828"
    elseif VarAF == "Talon" then cur_asset = "rbxassetid://7161116966"
    elseif VarAF == "Stillet Stocked" then cur_asset = "rbxassetid://7161120469"
    elseif VarAF == "Dirt Block" then cur_asset = "rbxassetid://7161134543"
    elseif VarAF == "Classic Knife" then cur_asset = "rbxassetid://7161142540"
    elseif VarAF == "Skeleton Knife" then cur_asset = "rbxassetid://7161149241"
    elseif VarAF == "Katana" then cur_asset = "rbxassetid://7161172680"
    elseif VarAF == "Atlast Knife" then cur_asset = "rbxassetid://7161226974"
    elseif VarAF == "Valor Knife" then cur_asset = "rbxassetid://7161230940"
    elseif VarAF == "Staff" then cur_asset = "rbxassetid://7259218667"
    elseif VarAF == "Kruk" then cur_asset = "rbxassetid://7374148548"
    elseif VarAF == "Minecraft Sword" then cur_asset = "rbxassetid://7917769386"
    elseif VarAF == "Valor Knife V2" then cur_asset = "rbxassetid://9471029205"
    elseif VarAF == "Frame Picture" then cur_asset = "rbxassetid://9480170879"
    elseif VarAF == "Skin Changer Protest" then cur_asset = "rbxassetid://6836941645"
    elseif VarAF == "Glow Stick" then cur_asset = "rbxassetid://6781157125"
    elseif VarAF == "Boxfun" then cur_asset = "rbxassetid://6562607282"
    elseif VarAF == "Gordons Kitchen Knifes" then cur_asset = "rbxassetid://6768617400"
    elseif VarAF == "Coal Sword" then cur_asset = "rbxassetid://6551664161"
    elseif VarAF == "ACT Trophy" then cur_asset = "rbxassetid://6558497759"
    elseif VarAF == "Da Melee" then cur_asset = "rbxassetid://6558482294"
    elseif VarAF == "Ban Hammer" then cur_asset = "rbxassetid://6558454823"
    elseif VarAF == "Very Long Bat" then cur_asset = "rbxassetid://6557159354"
    elseif VarAF == "Crucible" then cur_asset = "rbxassetid://6557167291"
    elseif VarAF == "Bloxy" then cur_asset = "rbxassetid://6557196365"
    elseif VarAF == "Crowbar" then cur_asset = "rbxassetid://6557257013"
    elseif VarAF == "Ham" then cur_asset = "rbxassetid://6565691328"
    elseif VarAF == "Burger" then cur_asset = "rbxassetid://6557148153"
    elseif VarAF == "Heywe Cube" then cur_asset = "rbxassetid://6562139237"
    elseif VarAF == "Old Karambit" then cur_asset = "rbxassetid://6476897690"
    elseif VarAF == "Old Karambit Twitch" then cur_asset = "rbxassetid://6569305303"
    elseif VarAF == "Old Butterfly Knife" then cur_asset = "rbxassetid://6422093888"
    elseif VarAF == "Old Butterfly Knife Sapphire" then cur_asset = "rbxassetid://6568018757"
    elseif VarAF == "Old Butterfly Knife Twitch" then cur_asset = "rbxassetid://6557295747"
    elseif VarAF == "Old Butterfly Knife Ruby" then cur_asset = "rbxassetid://6559368966"
    elseif VarAF == "Old Gut Knife" then cur_asset = "rbxassetid://6477596645"
    elseif VarAF == "Flip Knife" then cur_asset = "rbxassetid://6421375318"
    elseif VarAF == "Old Huntsman Knife" then cur_asset = "rbxassetid://6565837869"
    elseif VarAF == "Old Huntsman Knife Ruby" then cur_asset = "rbxassetid://6553852233"
    elseif VarAF == "Old Bayonet, but with new bayonet animations" then cur_asset = "rbxassetid://6570650309"
    elseif VarAF == "Pickaxe" then cur_asset = "rbxassetid://6478215819"
    elseif VarAF == "Pathbringer" then cur_asset = "rbxassetid://6500095467"
    elseif VarAF == "Talon Knife" then cur_asset = "rbxassetid://6669716399"
    elseif VarAF == "Shadow Daggers" then cur_asset = "rbxassetid://6487384650"
    elseif VarAF == "CSGO M9 Bayonet Autotronic" then cur_asset = "rbxassetid://6590565396"
    elseif VarAF == "CSGO M9 Bayonet Nebula" then cur_asset = "rbxassetid://6597109573"    
    end
end)




ui:createbutton({tab = "scripts", subsection = "custom scripts", name = "apply custom knife model", flag = "apply_custom_model", confirmation = false})

ui.flags.apply_custom_model.pressed:Connect(function()
    local TKnife = game:GetObjects(cur_asset)[1]
    local CTKnife = game:GetObjects(cur_asset)[1]

    local rep_storage = game:GetService("ReplicatedStorage")
    local viewmodels = rep_storage.Viewmodels

    viewmodels:FindFirstChild("v_CT Knife").Parent = archivefolder
    viewmodels:FindFirstChild("v_T Knife").Parent = archivefolder
        
    --// set up
    TKnife.Name = "v_T Knife"
    CTKnife.Name = "v_CT Knife"
        
    CTKnife.Parent = viewmodels
    TKnife.Parent = viewmodels
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
