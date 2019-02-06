if e_admin then
if e_admin.RunningConfig and e_admin.RunningConfig.Addins then
if e_admin.RunningConfig.Modules["regenHealth"] and e_admin.RunningConfig.Modules["regenHealth"].Enabled == true then

local function HPRegen()
	local Config = e_admin.RunningConfig.Modules["regenHealth"]

	for k, v in pairs(player.GetAll()) do
		local hp = v:Health()
		local hpDif = v:GetMaxHealth() - hp
		if hpDif >= Config.tickHealth then
			v:SetHealth(hp + Config.tickHealth)
		elseif hpDif < Config.tickHealth then
			v:SetHealth(hp + hpdif)
		end
	end
end

timer.Simple(e_admin.RunningConfig.Modules["regenHealth"].tickTime, HPRegen)

end
end
end
