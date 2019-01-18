local Utils = {}

Utils.ObjInArray = function(Array, Obj)
    for _, v in pairs(Array) do
        if v == Obj then
            return true
        end
    end
    return false
end

return Utils
