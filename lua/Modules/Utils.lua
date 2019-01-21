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

return Utils
