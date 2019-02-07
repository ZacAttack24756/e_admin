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

-- https://forum.facepunch.com/f/gmoddev/nfom/Health-Regeneration/1/
local DF_READ = 1
local DF_WRITE = 2
local DF_BOTH = 3
Utils.EntityDataField = function( ent, key, name, force, fl )
    fl = fl or DF_BOTH

    if bit.band( fl, DF_READ ) ~= 0 then
        ent[ "Get" .. name ] = function( e )
            local res = e:GetSaveTable( )[ key ]

            if force == FORCE_NUMBER then
                return tonumber( res )
            elseif force == FORCE_STRING then
                return tostring( res )
            elseif force == FORCE_BOOL then
                return tobool( res )
            else
                return res
            end
        end
    end

    if bit.band( fl, DF_WRITE ) ~= 0 then
        ent[ "Set" .. name ] = function( e, v )
            if force == FORCE_NUMBER then
                e:SetSaveValue( key, tonumber( v ) or 0 )
            elseif force == FORCE_STRING then
                e:SetSaveValue( key, tostring( v ) )
            elseif force == FORCE_BOOL then
                e:SetSaveValue( key, tobool( v ) )
            else
                e:SetSaveValue( key, v )
            end
        end
    end
end

-- Export anything to the Main Runtime
e_admin.Utils = Utils

end
