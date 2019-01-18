local Utils = include("Modules/Utils.lua")
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
                if type(v2) == "table" then
                    -- Check the individual Command
                    -- Check if its a valid Category
                    if type(v2.Category) ~= "string" or Utils.ObjInArray(Cats, string.lower(v2.Category)) == false then
                        return nil
                    end

                    -- Check if Alliases are registered, if it is, remove it
                    if type(v2.Allias) ~= "table" then return nil end
                    for i3, v3 in pairs(v2.Allias) do
                        if Utils.ObjInArray(NameSpace, string.lower(v3)) == true or string.lower(v3) == string.lower(i2) then
                            table.remove(ArrayCmds[i1][i2].Allias, i3)
                        else
                            table.insert(NameSpace, string.lower(v3))
                        end
                    end
                end
            end
        end
    end
end

return InitUtils
