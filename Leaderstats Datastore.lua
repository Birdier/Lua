local Datastore = game:GetService("DataStoreService")
local GoalsStorage = Datastore:GetDataStore("GoalsData")
local WinsStorage = Datastore:GetDataStore("WinsData")

game.Players.PlayerAdded:Connect(function(Player)
	local Data = Instance.new("Folder", Player)
	Data.Name = "leaderstats"
	local Goals = Instance.new("IntValue", Data)
	Goals.Name = "Goals"
	local Wins = Instance.new("IntValue", Data)
	Wins.Name = "Wins"
	
	local Currentgoals = GoalsStorage:GetAsync(Player.UserId)
	print(Currentgoals)
	
	local Currentwins = WinsStorage:GetAsync(Player.UserId)
	print(Currentwins)
	
	if Currentgoals == nil then
		Currentgoals = 0
	end
	
	if Currentwins == nil then
		Currentwins = 0
	end
	
	Goals.Value = Currentgoals
	
	Wins.Value = Currentwins
	
	Goals.Changed:Connect(function(NewValue)
		GoalsStorage:SetAsync(Player.UserId, NewValue)
	end)
	
	Wins.Changed:Connect(function(NewValue)
		WinsStorage:SetAsync(Player.UserId, NewValue)
	end)
end)

--Made by CommanderAdurite
--Inspired by EZBlox
