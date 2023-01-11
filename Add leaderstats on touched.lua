--Adds "Goals" leaderstats when touched (+1 per touch)--
local part = workspace["Red Goal line"]--Enter models name, if it is not in workspace just type like Lighting.example or Lighting["example part 1"]
local debs = {}

part.Touched:Connect(function(hit)
	local plr = game.Players:GetPlayerFromCharacter(hit.Parent)
	if not plr or debs[plr.Name] then return end
	debs[plr.Name] = true
	local value = plr.leaderstats.Goals
	value.Value += 1
	wait(5)
	debs[plr.Name] = nil
end)
