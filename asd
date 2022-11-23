local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

local Window = Rayfield:CreateWindow({
	Name = "Bitcoin Miner ⛏️ [Beta]",
	LoadingTitle = "Bitcoin Miner ⛏️ [Beta]",
	LoadingSubtitle = "by VernyFx",
	ConfigurationSaving = {
		Enabled = true,
		FolderName = nil, -- Create a custom folder for your hub/game
		FileName = "Verny Hub BTC"
	},
        Discord = {
        	Enabled = false,
        	Invite = "zjVty9E3", -- The Discord invite code, do not include discord.gg/
        	RememberJoins = true -- Set this to false to make them join the discord every time they load it up
        },
	KeySystem = false, -- Set this to true to use our key system
	KeySettings = {
		Title = "Sirius Hub",
		Subtitle = "Key System",
		Note = "Join the discord (discord.gg/sirius)",
		FileName = "SiriusKey",
		SaveKey = true,
		GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
		Key = "Hello"
	}
})


local Tab = Window:CreateTab("Main", 4483362458) -- Title, Image

Rayfield:Notify({
    Title = "Success!",
    Content = "Successfully Loaded The Script!",
    Duration = 6.5,
    Image = 4483362458,
    Actions = { -- Notification Buttons
        Ignore = {
            Name = "Okay!",
            Callback = function()
                print("The user tapped Okay!")
            end
		},
	},
})

local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart

local Input = Tab:CreateInput({
	Name = "Input Bitcoin Limit",
	PlaceholderText = "Limit",
	RemoveTextAfterFocusLost = false,
	Callback = function(BTCL)
		_G.btclimit = BTCL;
	end,
})

local Input = Tab:CreateInput({
	Name = "Input Solaris Limit",
	PlaceholderText = "Limit",
	RemoveTextAfterFocusLost = false,
	Callback = function(SOLL)
		_G.solarlimit = SOLL;
	end,
})



local Toggle = Tab:CreateToggle({
	Name = "Auto Exchange Bitcoin",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(ABTC)
		_G.autobtc = ABTC;
	end,
})

task.spawn(function()
	while wait() do
		if _G.autobtc then
			if game:GetService("Players").LocalPlayer.leaderstats.BitCoins.Value > tonumber(_G.btclimit) then
				hrp.CFrame = game:GetService("Workspace")["Region_ExChang1"].Ad.CFrame
				local args = {
					[1] = true
				}
				game:GetService("ReplicatedStorage").Events.ExchangeMoney:FireServer(unpack(args))
				wait(5)
			end
		end
	end
end)


local Toggle = Tab:CreateToggle({
	Name = "Auto Exchange Solaris",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(ASOL)
		_G.autosol = ASOL;
	end,
})

task.spawn(function()
	while wait() do
		if _G.autosol then
			if game:GetService("Players").LocalPlayer.leaderstats.Solaris.Value > tonumber(_G.solarlimit) then
				hrp.CFrame = game:GetService("Workspace")["Region_ExChang1"].Ad.CFrame
				local args = {
					[1] = false
				}
				game:GetService("ReplicatedStorage").Events.ExchangeMoney:FireServer(unpack(args))
				wait(5)
			end
		end
	end
end)


local Slider = Tab:CreateSlider({
	Name = "Change Walk Speed ",
	Range = {50, 500},
	Increment = 10,
	Suffix = "Speed",
	CurrentValue = 50,
	Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(WS)
		_G.WS = WS;

		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = _G.WS
	end,
})



local Slider = Tab:CreateSlider({
	Name = "Change JumpPower",
	Range = {50, 500},
	Increment = 10,
	Suffix = "Power",
	CurrentValue = 50,
	Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(JP)
		_G.JP = JP;

		game.Players.LocalPlayer.Character.Humanoid.JumpPower = _G.JP
	end,
})

local Toggle = Tab:CreateToggle({
	Name = "Auto Claim Star every minute",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(AST)
		_G.autostar = AST;
	end,
})

task.spawn(function()
	while wait() do
		if _G.autostar then
			game:GetService("ReplicatedStorage").Events.ClaimFreeBoostStar:FireServer()
			wait(60)
		end
	end
end)


local Tab = Window:CreateTab("Boosts", 4483362458) -- Title, Image

local Toggle = Tab:CreateToggle({
	Name = "Auto Buy Mining Boost(All of These Are 15 Minutes)",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(ABB1)
		_G.ABB1 = ABB1
	end,
})

task.spawn(function()
	while wait() do
		if _G.ABB1 then
			local args = {
    [1] = "15 min Mining Boost"
}

game:GetService("ReplicatedStorage").Events.BuyBoost:FireServer(unpack(args))
		end
	end
end)



local Toggle = Tab:CreateToggle({
	Name = "Auto Buy Xp Boost(All of These Are 15 Minutes)",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(ABB2)
		_G.ABB2 = ABB2;
	end,
})

task.spawn(function()
	while wait() do
		if _G.ABB2 then
			local args = {
    [1] = "15 min Xp Boost"
}

game:GetService("ReplicatedStorage").Events.BuyBoost:FireServer(unpack(args))
		end
	end
end)

local Toggle = Tab:CreateToggle({
	Name = "Auto Buy Offline Mining Boost(All of These Are 15 Minutes)",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(ABB3)
		_G.ABB3 = ABB3;
	end,
})

task.spawn(function()
	while wait() do
		if _G.ABB3 then
			local args = {
    [1] = "15 min Offline Mining Boost"
}

game:GetService("ReplicatedStorage").Events.BuyBoost:FireServer(unpack(args))
		end
	end
end)


local Toggle = Tab:CreateToggle({
	Name = "Auto Buy Server Mining Boost(All of These Are 15 Minutes)",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(ABB4)
		_G.ABB4 = ABB4;
	end,
})

task.spawn(function()
	while wait() do
		if _G.ABB4 then
			local args = {
    [1] = "15 min Server Mining Boost"
}

game:GetService("ReplicatedStorage").Events.BuyBoost:FireServer(unpack(args))
		end
	end
end)

local Tab = Window:CreateTab("Buy/Upgrade Stuff", 4483362458) -- Title, Image

local Input = Tab:CreateInput({
	Name = "Input Card Number",
	PlaceholderText = "Number",
	RemoveTextAfterFocusLost = false,
	Callback = function(CANU)
		_G.cardnumber = CANU;
	end,
})

local Label = Tab:CreateLabel("Example: If you want to buy the budget graphic card then put 1")

local Label = Tab:CreateLabel("If you want the next card then put 2 and so on")

local cards = game:GetService("ReplicatedStorage").Icons:GetChildren()

local cardsTable = {}

for i,v in ipairs(cards) do
	if v:IsA("ImageLabel") then
		table.insert(cardsTable, v.Name)
	end
end

local Dropdown = Tab:CreateDropdown({
	Name = "Select Card",
	Options = cardsTable,
	CurrentOption = "Select Card",
	Flag = "Dropdown1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(SEC)
		_G.selectedcard = SEC;
	end,
})

local shops = game:GetService("Workspace").Shops:GetChildren()

local shopsTable = {}

for i,v in ipairs(shops) do
	if v:IsA("Model") then
		table.insert(shopsTable, v.Name)
	end
end

local Dropdown = Tab:CreateDropdown({
	Name = "Select Shop",
	Options = shopsTable,
	CurrentOption = "Option 1",
	Flag = "Dropdown1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(SELS)
		_G.selectedshop = SELS;
	end,
})

local Input = Tab:CreateInput({
	Name = "Input Buying Amount(Cards and everything)",
	PlaceholderText = "Input Amount",
	RemoveTextAfterFocusLost = false,
	Callback = function(AMT)
		_G.amount = AMT;
	end,
})


local Toggle = Tab:CreateToggle({
	Name = "Auto Buy Cards",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(ABC)
		_G.ABC = ABC;
	end,
})

task.spawn(function()
	while wait() do
		if _G.ABC then
			if _G.amount ~= nil then
				if _G.selectedshop ~= nil then
					if _G.selectedcard ~= nil then
						local args = {
    						[1] = _G.selectedcard,
    						[2] = workspace.Shops[_G.selectedshop].Shows:FindFirstChild(_G.cardnumber),
    						[3] = tonumber(_G.amount)
							}
						game:GetService("ReplicatedStorage").Events.BuyCard:FireServer(unpack(args))
					end
				end
			end
		end
	end
end)

local Input = Tab:CreateInput({
	Name = "Input Cards Name",
	PlaceholderText = "Name",
	RemoveTextAfterFocusLost = false,
	Callback = function(SEC2)
		_G.selectedcard2 = SEC2
	end,
})

local Toggle = Tab:CreateToggle({
	Name = "Auto Buy Cards(text box cards)",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(ABC2)
		_G.ABC2 = ABC2;
	end,
})

task.spawn(function()
	while wait() do
		if _G.ABC2 then
			if _G.amount ~= nil then
				if _G.selectedshop ~= nil then
					if _G.selectedcard2 ~= nil then
						local args = {
    						[1] = _G.selectedcard2,
    						[2] = workspace.Shops[_G.selectedshop].Shows:FindFirstChild(_G.cardnumber),
    						[3] = tonumber(_G.amount)
							}
						game:GetService("ReplicatedStorage").Events.BuyCard:FireServer(unpack(args))
					end
				end
			end
		end
	end
end)

local Tab = Window:CreateTab("Change Stuff", 4483362458) -- Title, Image


local Toggle = Tab:CreateToggle({
	Name = "Auto Overclock",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(CH1)
		_G.change1 = CH1;
	end,
})

task.spawn(function()
	while wait() do
		if _G.change1 then
			game:GetService("ReplicatedStorage").Events.ActivateOverclock:FireServer()
			wait(1560)
		end
	end
end)

local Toggle = Tab:CreateToggle({
	Name = "Auto Change Algorithm(every 1minute)",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(CH2)
		_G.change2 = CH2;
	end,
})

task.spawn(function()
	while wait() do
		if _G.change2 then
			local args = {
				[1] = 3
			}
			game:GetService("ReplicatedStorage").Events.AlgoChang:FireServer(unpack(args))
			wait(60)
		end
	end
end)

local Tab = Window:CreateTab("Teleports", 4483362458) -- Title, Image

local teleports = game:GetService("Workspace").Teleports:GetChildren()

local tpTable = {}

for i,v in ipairs(teleports) do
	if v:IsA("Part") then
		table.insert(tpTable, v.Name)
	end
end

local Dropdown = Tab:CreateDropdown({
	Name = "Select Place",
	Options = tpTable,
	CurrentOption = "Select Place",
	Flag = "Dropdown1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(TELARE)
		_G.teleportarea = TELARE;
	end,
})

local Button = Tab:CreateButton({
	Name = "Teleport To Selected Area",
	Callback = function()
		hrp.CFrame = game:GetService("Workspace").Teleports[_G.teleportarea].CFrame
	end,
})

local Button = Tab:CreateButton({
	Name = "Delete All Barriers",
	Callback = function()
		for i,v in ipairs(game:GetService("Workspace").LevelWalls:GetChildren()) do
			if v:IsA("Part") then
			v:Destroy()
		end
	end
end,
})

local Tab = Window:CreateTab("Quest", 4483362458) -- Title, Image


local Button = Tab:CreateButton({
	Name = "Auto Do 4 Quests",
	Callback = function()
		hrp.CFrame = game:GetService("Workspace").QuestStuff.Fish.Hitbox.CFrame
		wait(1)
		fireclickdetector(game:GetService("Workspace").QuestStuff.Fish.Hitbox.ClickDetector, 1)
		wait(1)
		hrp.CFrame = game:GetService("Workspace").QuestStuff.Diamond.Hitbox.CFrame
		wait(1)
		fireclickdetector(game:GetService("Workspace").QuestStuff.Diamond.Hitbox, 1)
		wait(1)
		hrp.CFrame = game:GetService("Workspace").QuestStuff.Key.Hitbox.CFrame
		wait(1)
		fireclickdetector(game:GetService("Workspace").QuestStuff.Key.Hitbox.ClickDetector, 1)
		wait(1)
		hrp.CFrame = game:GetService("Workspace").QuestStuff.Model["Colour me!"].Body.Hitbox.CFrame
		wait(1)
		fireclickdetector(game:GetService("Workspace").QuestStuff.Model["Colour me!"].Body.Hitbox.ClickDetector, 1)
	end,
})

local Tab = Window:CreateTab("Codes", 4483362458) -- Title, Image

local Button = Tab:CreateButton({
	Name = "Redeem All Codes",
	Callback = function()
		local args = {
			[1] = "AnotherBlock"
		}
		game:GetService("ReplicatedStorage").Events.CodeRedem:InvokeServer(unpack(args))
		wait(1)
		local args = {
			[1] = "PlantWalls"
		}
		game:GetService("ReplicatedStorage").Events.CodeRedem:InvokeServer(unpack(args))
		wait(1)
		local args = {
			[1] = "BoostOnSign"
		}
		game:GetService("ReplicatedStorage").Events.CodeRedem:InvokeServer(unpack(args))
		wait(1)
		local args = {
			[1] = "GrassWall"
		}
		game:GetService("ReplicatedStorage").Events.CodeRedem:InvokeServer(unpack(args))
		wait(1)
		local args = {
			[1] = "AnotherBoost"
		}
		game:GetService("ReplicatedStorage").Events.CodeRedem:InvokeServer(unpack(args))
		wait(1)
		local args = {
			[1] = "BtrBoost"
		}
		game:GetService("ReplicatedStorage").Events.CodeRedem:InvokeServer(unpack(args))
		wait(1)
		local args = {
			[1] = "UpBoost"
		}
		game:GetService("ReplicatedStorage").Events.CodeRedem:InvokeServer(unpack(args))
		wait(1)
		local args = {
			[1] = "GreenWall"
		}
		game:GetService("ReplicatedStorage").Events.CodeRedem:InvokeServer(unpack(args))
		wait(1)
	end,
})


local Tab = Window:CreateTab("Webhook", 4483362458) -- Title, Image

local Input = Tab:CreateInput({
	Name = "Input Discord URL",
	PlaceholderText = "Discord URL",
	RemoveTextAfterFocusLost = false,
	Callback = function(WEBTEXT)
		_G.webhook = WEBTEXT;
	end,
})


local Toggle = Tab:CreateToggle({
	Name = "Enable Bitcoin Stat Webhook",
	CurrentValue = false,
	Flag = "WebHook", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(WEBTOG)
		_G.webhooktoggle = WEBTOG;

HttpService = game:GetService("HttpService")

Webhook_URL = _G.webhook
	end,
})

task.spawn(function()
	while wait() do
		if _G.webhooktoggle then
			if _G.webhook ~= nil then
				local responce = syn.request(
				{
					Url = Webhook_URL,
					Method = 'POST',
					Headers = {
						['Content-Type'] = 'application/json'
					},
					Body = HttpService:JSONEncode({
						["content"] = "",
						["embeds"] = {{
							["title"] = "**Your Bitcoins Has Increased!!!**",
							["description"] = game:GetService("Players").LocalPlayer.leaderstats.BitCoins.Value.." Bitcoin",
							["type"] = "rich",
							["color"] = tonumber(0xffffff),
							["fields"] = {
								{
									["name"] = "Username:",
									["value"] = game.Players.LocalPlayer.DisplayName,
									["inline"] = true
								}
							}
						}}
					})
				}
				)
			end
		end
		wait(120)
	end
end)

local Toggle = Tab:CreateToggle({
	Name = "Enable Solaris Stat Webhook",
	CurrentValue = false,
	Flag = "WebHook", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(WEBTOG2)
		_G.webhooktoggle2 = WEBTOG2;

HttpService = game:GetService("HttpService")

Webhook_URL = _G.webhook
	end,
})

task.spawn(function()
	while wait() do
		if _G.webhooktoggle2 then
			if _G.webhook ~= nil then
				local responce = syn.request(
				{
					Url = Webhook_URL,
					Method = 'POST',
					Headers = {
						['Content-Type'] = 'application/json'
					},
					Body = HttpService:JSONEncode({
						["content"] = "",
						["embeds"] = {{
							["title"] = "**Your Solaris Has Increased!!!**",
							["description"] = game:GetService("Players").LocalPlayer.leaderstats.Solaris.Value.." Solaris",
							["type"] = "rich",
							["color"] = tonumber(0xffffff),
							["fields"] = {
								{
									["name"] = "Username:",
									["value"] = game.Players.LocalPlayer.DisplayName,
									["inline"] = true
								}
							}
						}}
					})
				}
				)
			end
		end
		wait(120)
	end
end)



local Toggle = Tab:CreateToggle({
	Name = "Enable Level Stat Webhook",
	CurrentValue = false,
	Flag = "WebHook", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(WEBTOG3)
		_G.webhooktoggle3 = WEBTOG3;

HttpService = game:GetService("HttpService")

Webhook_URL = _G.webhook
	end,
})

task.spawn(function()
	while wait() do
		if _G.webhooktoggle3 then
			if _G.webhook ~= nil then
				local responce = syn.request(
				{
					Url = Webhook_URL,
					Method = 'POST',
					Headers = {
						['Content-Type'] = 'application/json'
					},
					Body = HttpService:JSONEncode({
						["content"] = "",
						["embeds"] = {{
							["title"] = "**Your Level Has Increased!!!**",
							["description"] = game:GetService("Players").LocalPlayer.leaderstats.Level.Value.." Level",
							["type"] = "rich",
							["color"] = tonumber(0xffffff),
							["fields"] = {
								{
									["name"] = "Username:",
									["value"] = game.Players.LocalPlayer.DisplayName,
									["inline"] = true
								}
							}
						}}
					})
				}
				)
			end
		end
		wait(120)
	end
end)




	local Toggle = Tab:CreateToggle({
		Name = "Enable Bitcoin Value Webhook",
		CurrentValue = false,
		Flag = "WebHook", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
		Callback = function(WEBTOG4)
			_G.webhooktoggle4 = WEBTOG4;
	
	HttpService = game:GetService("HttpService")
	
	Webhook_URL = _G.webhook
		end,
	})
	
	task.spawn(function()
		while wait() do
			if _G.webhooktoggle4 then
				if _G.webhook ~= nil then
					local responce = syn.request(
					{
						Url = Webhook_URL,
						Method = 'POST',
						Headers = {
							['Content-Type'] = 'application/json'
						},
						Body = HttpService:JSONEncode({
							["content"] = "",
							["embeds"] = {{
								["title"] = "**The Exchange Rates Just Changed**",
								["description"] = game:GetService("ReplicatedStorage").BtcVal.Value.." Bitcoin Value",
								["type"] = "rich",
								["color"] = tonumber(0xffffff),
								["fields"] = {
									{
										["name"] = "Username:",
										["value"] = game.Players.LocalPlayer.DisplayName,
										["inline"] = true
									}
								}
							}}
						})
					}
					)
				end
			end
			wait(60)
		end
	end)






	local Toggle = Tab:CreateToggle({
		Name = "Enable Solaris Value Webhook",
		CurrentValue = false,
		Flag = "WebHook", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
		Callback = function(WEBTOG5)
			_G.webhooktoggle5 = WEBTOG5;
	
	HttpService = game:GetService("HttpService")
	
	Webhook_URL = _G.webhook
		end,
	})
	
	task.spawn(function()
		while wait() do
			if _G.webhooktoggle5 then
				if _G.webhook ~= nil then
					local responce = syn.request(
					{
						Url = Webhook_URL,
						Method = 'POST',
						Headers = {
							['Content-Type'] = 'application/json'
						},
						Body = HttpService:JSONEncode({
							["content"] = "",
							["embeds"] = {{
								["title"] = "**The Exchange Rates Just Changed**",
								["description"] = game:GetService("ReplicatedStorage").SolVal.Value.." Solaris Value",
								["type"] = "rich",
								["color"] = tonumber(0xffffff),
								["fields"] = {
									{
										["name"] = "Username:",
										["value"] = game.Players.LocalPlayer.DisplayName,
										["inline"] = true
									}
								}
							}}
						})
					}
					)
				end
			end
			wait(60)
		end
	end)

local Tab = Window:CreateTab("Credits", 4483362458) -- Title, Image

local Paragraph = Tab:CreateParagraph({Title = "Credits Below", Content = "!KatagiriYuuchi#7765"})

local Paragraph = Tab:CreateParagraph({Title = "Join My Discord Server", Content = "https://discord.gg/zjVty9E3"})

local Button = Tab:CreateButton({
	Name = "Copy Discord Link",
	Callback = function()
		setclipboard("https://discord.gg/zjVty9E3")
		wait(0.5)
		Rayfield:Notify({
			Title = "Success!",
			Content = "Successfully copied discord link!",
			Duration = 6.5,
			Image = 4483362458,
			Actions = { -- Notification Buttons
				Ignore = {
					Name = "Okay!",
					Callback = function()
						print("The user tapped Okay!")
					end
				},
			},
		})
	end,
})

