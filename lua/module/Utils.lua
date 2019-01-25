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
Utils.GetIndexFromObj = function(Table, Obj)
    for i, v in pairs(Table) do
        if v == Obj then
            return i
        end
    end
    return nil
end
function DeepCopy(orig, copies)
    copies = copies or {}
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        if copies[orig] then
            copy = copies[orig]
        else
            copy = {}
            for orig_key, orig_value in next, orig, nil do
                copy[deepcopy(orig_key, copies)] = deepcopy(orig_value, copies)
            end
            copies[orig] = copy
            setmetatable(copy, DeepCopy(getmetatable(orig), copies))
        end
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end
Utils.TableCopy = function(Table) return DeepCopy(Table) end

-- Export anything to the Main Runtime
e_admin.Utils = Utils

end
