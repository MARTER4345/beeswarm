
--Anti-afk
	local vu = game:GetService("VirtualUser")
	game:GetService("Players").LocalPlayer.Idled:connect(function()
	vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
	wait(1)
	vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
	end)
repeat wait() until game.Players.LocalPlayer.Character 
--Rejoin on kick
	getgenv().rejoin = game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(child)
		if child.Name == 'ErrorPrompt' and child:FindFirstChild('MessageArea') and child.MessageArea:FindFirstChild("ErrorFrame") then
			game:GetService("TeleportService"):Teleport(game.PlaceId) --getgenv().rejoin:Disconnect() will disable script
		end
	end)
print("Anti-afk & rejoin on kick loaded.")
wait(1)

--claim hive
if _G.ClaimHive then
  hives = game.Workspace.Honeycombs:GetChildren() for i = #hives, 1, -1 do  v = game.Workspace.Honeycombs:GetChildren()[i] if v.Owner.Value == nil then game.ReplicatedStorage.Events.ClaimHive:FireServer(v.HiveID.Value) end end 
  wait (3)
  spawn(function()
    local haveclaim = game:GetService("Players").LocalPlayer.SpawnPos.Value
    if not haveclaim then
      while not haveclaim do
        wait(0.2) hives = game.Workspace.Honeycombs:GetChildren() for i = #hives, 1, -1 do  v = game.Workspace.Honeycombs:GetChildren()[i] if v.Owner.Value == nil then game.ReplicatedStorage.Events.ClaimHive:FireServer(v.HiveID.Value) end end 
      end
    else print("Hive claimed!") 
    end
    repeat wait() until game:GetService("Players").LocalPlayer.SpawnPos.Value --extra check
  end)
else print("Claiming hive disabled")
end
	
wait(2)

--Invisible, thanks kocmoc
spawn(function()
    local api = loadstring(game:HttpGet("https://raw.githubusercontent.com/not-weuz/xlpapi/main/api.lua"))()
    api.teleport(CFrame.new(0,0,0)) wait(1) if game.Players.LocalPlayer.Character:FindFirstChild('LowerTorso') then Root = game.Players.LocalPlayer.Character.LowerTorso.Root:Clone() game.Players.LocalPlayer.Character.LowerTorso.Root:Destroy() Root.Parent = game.Players.LocalPlayer.Character.LowerTorso api.teleport(game:GetService("Players").LocalPlayer.SpawnPos.Value) end
    print("Invisible")
end)
wait(5)

--Autorejoin
	if _G.RejoinTime then
	print("Auto rejoinning in ".._G.RejoinTime.." seconds!") --Timed autorejoin
	delay(_G.RejoinTime, function()
		if _G.RejoinTime then
			local tpservice= game:GetService("TeleportService")
			local plr = game.Players.LocalPlayer
			tpservice:Teleport(game.PlaceId, plr)
		end
	end)
	else print("Auto rejoinning disabled.")
	end

--webhook rtsg().Eggs.Snowflake & rtsg().Eggs.GingerbreadBear
--thanks kocmoc again
if _G.Webhook then
    function rtsg() tab = game.ReplicatedStorage.Events.RetrievePlayerStats:InvokeServer() return tab end
    local data = {
    ["content"] = "", 
    ["embeds"] = {
        {
            ["title"] = "**Snowflakes script. Made by beta.**",
            ["description"] = "Name: " .. game.Players.LocalPlayer.DisplayName..
            "\nInventory: **<:snowflake:894662074096058388>"..rtsg().Eggs.Snowflake.." snowflakes** and **<:gingerbear:894655872201027714>"..rtsg().Eggs.GingerbreadBear.." Gingerbread Bears**.",
            ["type"] = "rich",
            ["color"] = tonumber(0x7269da),
            ["image"] = {
                ["url"] = "http://www.roblox.com/Thumbs/Avatar.ashx?x=150&y=150&Format=Png&username=" ..
                    tostring(game:GetService("Players").LocalPlayer.Name)
            }
        }
    }
    }
    local newdata = game:GetService("HttpService"):JSONEncode(data)

    local headers = {
    ["content-type"] = "application/json"
    }
    request = http_request or request or HttpPost or syn.request
    local sendhook = {Url = _G.Webhook, Body = newdata, Method = "POST", Headers = headers}
    request(sendhook)
    print("Sent webhook successfully!")
end

--godmode, so you won't lose invisibility status
print("godmode")
local bssapi = loadstring(game:HttpGet("https://raw.githubusercontent.com/not-weuz/xlpapi/main/bssapi.lua"))()
    bssapi:Godmode(true)

--Remove collide decors, remove annoying hitboxes
print("Removing decorations. This should take around 20 seconds")
spawn(function()
	for _, part in next, workspace:FindFirstChild("FieldDecos"):GetDescendants() do if part:IsA("BasePart") then part.CanCollide = false part.Transparency = part.Transparency < 0.5 and 0.5 or part.Transparency task.wait() end end
	for _, part in next, workspace:FindFirstChild("Decorations"):GetDescendants() do if part:IsA("BasePart") and (part.Parent.Name == "Bush" or part.Parent.Name == "Blue Flower") then part.CanCollide = false part.Transparency = part.Transparency < 0.5 and 0.5 or part.Transparency task.wait() end end
	for i,v in next, workspace.Decorations.Misc:GetDescendants() do if v.Parent.Name == "Mushroom" then v.CanCollide = false v.Transparency = 0.5 end end
end)

--Tp to gingerbread, input token ids into rares = {} section
print("tp rares")
local farmingrares = false
local kocmoc = {
    rares = {"6077173317","1674871631","8277901755","2863468407","8055428094","2545746569","2495935291","2495936060","2504978518","2584584968","2542899798","8054996680","5144657109","4935580111","3030569073","2319943273","2028603146","1471848094","1471849394","1471850677","4520739302","8277778300","8277780065","8277781666","8277783113","1987253833","1987257040","1987255318","6134473023","2863122826","8310376128","2306224708","2529092020","2676715441"}
}

task.spawn(function() while task.wait(0.001) do
for k,v in next, game.workspace.Collectibles:GetChildren() do 
    if v.CFrame.YVector.Y == 1 then if v.Transparency == 0 then 
        decal = v:FindFirstChildOfClass("Decal") 
    for e,r in next, kocmoc.rares do 
        if decal.Texture == r or decal.Texture == "rbxassetid://"..r 
        then 
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame 
		break end end end end end
end end)


--Auto wealthclock
spawn(function()
	while wait(1) do
	game:GetService("ReplicatedStorage").Events.ToyEvent:FireServer("Wealth Clock") end end)

--AUTOFARMING MAIN
print("Autofarming") 
--changes a bit of api
local snowapi = loadstring(game:HttpGet("https://raw.githubusercontent.com/MARTER4345/beeswarm/main/snowflake/snowapi.lua"))()
function Tween(time,pos)
		pcall(function()
			workspace.Gravity = 0
			game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(time, Enum.EasingStyle.Linear), {CFrame = pos}):Play() wait(time)
			workspace.Gravity = 196.19999694824
		end)
	end

	wait(0.1)


	function Repeat()
		if _G.SnowflakesEnabled then --TOGGLE ADDED, WOOOO!
			local snowflakepos = snowapi.getclosestpart(game.Workspace.Particles.Snowflakes,"descendants").CFrame
				Tween(_G.TweenSpeed,snowflakepos) pcall(function()
				wait(_G.WaitValue)

				Repeat()
			end)
		else print("Farming snowflakes ended. Retrying...")
			wait(_G.WaitValue*5)

			Repeat()
		end
	end
	wait(_G.WaitValue)

	Repeat()

