if e_admin then
local Utils = e_admin.Utils
local InitUtils = {}

-- Compilies a usable list of commands for the system to use;
-- Also does error checking
InitUtils.CompileCmds = function(ArrayCmds, Categories)
    local Cats = {}
    local Cmds = {}
    local NameSpace = {}

    -- Reserves ze Categories
    for i, v in pairs(Categories) do
        if type(v) == "string" and Utils.ObjInArray(Cats, string.lower(v)) == false then
            table.insert(Cats, string.lower(v))
        end
    end

    for i1, v1 in pairs(ArrayCmds) do
        if type(v1) == "table" then
            -- Check the Command Group
            for i2, v2 in pairs(v1) do
                if type(i2) == "string" and type(v2) == "table" then
                    -- Check the individual Command
                    -- Check if its a valid Category
                    if type(v2.Category) ~= "string" or Utils.ObjInArray(Cats, string.lower(v2.Category)) == false then
                        return nil
                    end

                    -- Check if Alliases are registered, if it is, remove it
                    if type(v2.Allias) ~= "table" then return nil end
                    for i3, v3 in pairs(v2.Allias) do
                        if type(v3) ~= "string" then
                            table.remove(ArrayCmds[i1][i2].Allias, i3)
                        elseif Utils.ObjInArray(NameSpace, string.lower(v3)) == true or string.lower(v3) == string.lower(i2) then
                            table.remove(ArrayCmds[i1][i2].Allias, i3)
                        else
                            table.insert(NameSpace, string.lower(v3))
                        end
                    end

                    -- Check for string types with the required thingies ainfiungieu
                    if type(Desc) ~= "string" or type(LongDesc) ~= "string" or type(Usage) ~= "string" then
                        return nil
                    end

                    -- Check if Permission is valid, else override it with
                    local Found = string.match(v2.Permission, "[%.%w|%*]*")
                    if type(Found) ~= "string" or Found == "" then
                        ArrayCmds[i1][i2].Permission = ".cmds.generic"
                    end

                    -- Finally, Check if the function is valid
                    if type(v2.Main) ~= "function" then
                        return nil
                    end

                    -- Register the command in NameSpace, then add to Cmds
                    table.insert(NameSpace, string.lower(i2))
                    Cmds[i2] = v2
                end
            end
        end
    end

    return Cmds
end


local MTable = {}
MTable.__index = MTable
-- Insert Meta things here

-- Easy User Management --
function MTable:GetUsers()
    local Copy = Utils.TableCopy(self.Users)
    return Copy
end
function MTable:AddUser(SteamID)
    if type(SteamID) == "string" then
        table.insert(self.Users, SteamID)
        return true
    end
    return false
end
function MTable:RemoveUser(SteamID)
    if type(SteamID) == "string" and Utils.ObjInTable(self.Users, SteamID) then
        local Index = Utils.GetIndexFromObj(self.Users, SteamID)
        if type(Index) == "number" then
            table.remove(SteamID, Index)
            return true
        end
    end
    return false
end

function MTable:GroupHasPerm(Perm)
	for i1, v1 in pairs(self.Perms) do
        -- Checks if the current permission for the target permission
		if v1 == Perm then
			return true
		elseif string.match(v1, Perm) == Perm then
			return true
		end

		-- Split each into it's components
		local VComp = {}
		for v2 in string.gmatch(v1, "(%.[%w]*)") do
			table.insert(VComp, v2)
		end
		local PComp = {}
		for v2 in string.gmatch(Perm, "(%.[%w]*)") do
			table.insert(PComp, v2)
		end

		-- Compare them Side by Side
		for i2, v2 in pairs(PComp) do
            -- If the node between both is the same
			if VComp[v2] == PComp[v2] then
				if table.getn(VComp) == i2 then
					return true
				end
                -- Continue
            -- If the node that is given is an all permissions node
			elseif VComp[v2] == ".*" then
				return true
            -- If
			else
				return false
			end
		end

		return false
	end
end

InitUtils.CreateGroup = function(GroupName, Data)
	-- Checks the main Table, and The required things
	if type(GroupName) ~= "string" or GroupName == "" then return "Name is not a string!" end
	if type(Data) ~= "table" then return "Data is not a Table!" end
	if type(Data.Rank) ~= "number" and Data.Rank >= 0 and Data.Rank =< 2^31 then return "Data.Rank is not a number!" end

	----    Required Error Checking Done    ----

	-- Main Meta Tabling
	local Content = {}
    Content.Users = {}
	Content.Name = GroupName
    Content.Rank = Data.Rank

	-- Permission Filtering (Every permission has to have ".<blabla>.<blabla>" etc)
	Content.Perms = {}
    if type(Data.Perms) == "table" then
    	for _, value in pairs(Data.Perms) do
    		local Pattern = "[%.%w|%*]*"
    		local Found = string.match(value, Pattern)

    		-- If theres a match
    		if type(Found) == "string" and Found ~= "" then
    			-- Passes a "-" along
    			if string.sub(value, 1, 1) == "-" then
    				Found = "-" .. Found
    			end

    			table.insert(Content.Perms, Found)
    		end
    	end
    end

	Content.Default = false
	if type(Data.Default) == "bool" then
		Content.Default = Data.Default
	end

	Content.RankLadder = "Default"
	if type(Data.RankLadder) == "string" and (Data.RankLadder ~= "" or string.lower(Data.RankLadder) ~= "default") then
		Content.RankLadder = Data.RankLadder
	end

	Content.Inheritance = {}
	if type(Data.Inheritance) == "string" and Data.Inheritance ~= GroupName then
		Content.Inheritance = {Data.Inheritance}
	elseif type(Data.Inheritance) == "table" then
		for _, v in pairs(Data.Inheritance) do
			if type(v) == "string" and v ~= GroupName then
				table.insert(Content.Inheritance, v)
			end
		end
	end

    Content.Options = {}
    Content.Options.TargetDefault = 0
    Content.Options.TargetTable = {}
    if type(Data.Options) == "table" then
        if type(Data.TargetNumber) == "number" then
            local Num = Data.TargetNumber
            if Num >= 0 and Num < 2^31 then
                Content.TargetDefault = Num
            end
        end
        if type(Data.TargetTable) == "table" then
            for index, value in pairs(Data.TargetTable) do
                if type(index) == "string" and type(value) == "number" then
                    if Utils.IndexInTable(Content.TargetTable, index) == false then
                        if value >= 0 and Num < 2^31 then
                            Content.TargetTable[index] = value
                        end
                    end
                end
            end
        end
        if type(Data.Options.Override) then
            local O = Data.Options.Override
            if (O == "NoAccess" or O == "Administrator") then
                Content.Options.Override = O
            end
        end
        if type(Data.Options.Aquisition) then
            local A = Data.Options.Aquisition
            if (A == "Administrator" or O == "Console") then
                Content.Options.Aquisition = A
            end
        end
    end

    if Content.RankLadder == "Default" and type(Data.DefOptions) == "table" then
        -- Insert stuff here
    end

	-- Creates Table, and returns it
	local self = setmetatable(Content, MTable)
	return self
end

e_admin.InitUtils = InitUtils

end
