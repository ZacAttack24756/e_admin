-- Adopted a new structure, one that is simular in function to Ulx Admin

if not e_admin then
    e_admin = {}

    -- Load all the good stuff here
    local function MasterLoadFiles(Files)
        local LongestLength = 0
        for i, File in pairs(Files) do
            if LongestLength < string.len(File) then
                LongestLength = string.len(File)
            end
        end
        LongestLength = math.max(LongestLength, 13)

        print("__" .. string.rep("_", LongestLength) .. "__")
        print("| Loading Files" .. string.rep(" ", LongestLength - 13) .. " |")
        print("|_" .. string.rep("_", LongestLength) .. "_|")
        for i, File in pairs(Files) do
            include(File)
            local Spaces = LongestLength - string.len(File)
            print("| Loaded " .. File .. string.rep(" ", Spaces) .. " |" )
        end
        print("|_" .. string.rep("_", LongestLength) .. "_|")
    end

    local LoadArray = {
        "Configuration.lua"
    }
    MasterLoadFiles(LoadArray)

    --"______________________________"
    --"| Loading Files              |"
    --"|____________________________|"
    --"| Loaded Configuration.lua   |"
    --"| Loaded Modules/test.lua    |"
    --"|____________________________|"
end
