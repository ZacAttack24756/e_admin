if e_admin then
if e_admin.RunningConfig and e_admin.RunningConfig.Addins then
if e_admin.RunningConfig.Modules["regenHealth"] and e_admin.RunningConfig.Modules["regenHealth"].Enabled == true then

local Config = {}

local function ReloadConfig()
	Config = e_admin.RunningConfig.Modules["regenHealth"]
end

local function Tick()
	for k, v in ipairs(player.GetAll()) do
		local hp = v:Health()
		local maxhp = v:GetMaxHealth()

		-- Creates the Datafield if it wasn't there before
		if type(v:GetLastDamagedTime) ~= "function" or type(v:SetLastDamagedTime) ~= "function" then
			e_admin.Utils.EntityDataField(v, "m_flLastDamageTime", "LastDamagedTime", FORCE_NUMBER)
		end

		if v:Alive() and hp < maxhp and v:GetLastDamagedTime() <= -(Config.tickTime) then
			v:SetHealth(math.min(maxhp, hp + Config.tickHealth))
			v:SetLastDamagedTime(0)
		end
	end
end

ReloadConfig()
Timer.Create("e_adReloadConfig", 20, 0, ReloadConfig)
hook.Add("Tick", "Regeneration.Tick", Tick)

end
end
end
