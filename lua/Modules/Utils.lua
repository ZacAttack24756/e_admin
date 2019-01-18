local Utils = {}

-- Simple, yet widely used
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
Utils.CheckGroupPerm = function(Groups, GroupName, Permission)
    local Previous = {}
    local function Loop(GN, P)
        local TargetGroup = Groups[GN]
        if type(TargetGroup) =="table" then
            local CheckThis = TargetGroup:GroupHasPerm(Permission)
            if CheckThis == true then
                return true
            else
                local Result = false
                for _, v in pairs(rawget(TargetGroup, "Inheritance"))  do
                    if ObjectInArray(Previous, v) == false and type(Groups[v]) == "table" then
                        table.insert(Previous, v)
                        Result = Result or Loop()
                    end
                end
                return Result
            end
        end
    end
end

return Utils
