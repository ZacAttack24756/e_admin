local Utils = {}

-- Simple, yet widely used book of helper functions
function ObjInArray(Array, Obj)
    for _, v in pairs(Array) do
        if v == Obj then
            return true
        end
    end
    return false
end
Utils.ObjInArray = ObjInArray
-- Very important with permissions

Utils.GroupHasPermission = function(Groups, GroupName Permission)
    local Previous = {}
    local function Loop(GN, P)
        local TargetGroup = Groups[GN]
        if type(TargetGroup) == "table" then
            -- Cycle through Group's Own Permissions
            local CheckThis = TargetGroup:GroupHasPerm(P)

            if CheckThis == true then
                return true
            else
                local Result = false
                for _, v in pairs(rawget(TargetGroup, "Inheritance"))  do
                    if ObjInArray(Previous, v) == false and type(Groups[v]) == "table" and Result == false then
                        table.insert(Previous, v)
                        Result = Loop(GN)
                    end
                end
                return Result
            end
        end
        return false
    end

    Loop()
end

return Utils
