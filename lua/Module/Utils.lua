if e_admin then

local Utils = {}

Utils.ObjInArray = function(Array, Obj)
    for _, v in pairs(Array) do
        if v == Obj then
            return true
        end
    end
    return false
end
Utils.IndexInTable = function(Table, Index)
    for i, _ in pairs(Table) do
        if i == Index then
            return true
        end
    end
    return false
end

-- Export anything to the Main Runtime
e_admin.Utils = Utils

end
