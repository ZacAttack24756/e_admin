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
    LongestLength = math.max(LongestLength, 15)
    local N1 = (LongestLength - 7)/2
    local N2 = (LongestLength - 13)/2
    local N3 = math.floor(LongestLength * 1.5)

    print("__" .. string.rep("_", N3) .. "__")
    print("| " .. string.rep(" ", math.floor(N1)) .. "e_admin" .. string.rep(" ", math.ceil(N1)) .. " |")
    print("| " .. string.rep(" ", math.floor(N2)) .. "Loading Files" .. string.rep(" ", math.ceil(N2)) .. " |")
    print("|_" .. string.rep("_", N3) .. "_|")
    for i, File in pairs(Files) do
        if type(File) == "string" then
            local Spaces = LongestLength - string.len(File)
            if string.sub(File, 1, 4) == "func" then
                include(File)()

                print("| Executed " .. File .. string.rep(" ", Spaces - 2) .. " |")
            elseif string.sub(File, 1, 6) == "module" then
                include(File)

                print("| Loaded " .. File .. string.rep(" ", Spaces) .. " |" )
            else
                include(File)

                print("| Mounted " .. File .. string.rep(" ", Spaces - 1) .. " |")
            end
        end
    end
    print("|_" .. string.rep("_", N3) .. "_|")
end

-- An array that specifies in what order files should be loaded
local LoadLibrary = {
    "lua/defConfig.lua", -- Has Default Configuration
    "func/config.lua", -- Quickly setup the configuration so nothing dies
    "module/Utils.lua", -- Contains a plethora of helper functions
    "module/InitUtils.lua", -- Contains functions used in this script's initalization
    "module/Command.lua", -- Contains all of this script's built in commands
    "module/Chat.lua", -- Contains all of the functons for chat
}
MasterLoadFiles(LoadLibrary)

--"_________________________________"
--"| Loading Files                 |"
--"|_______________________________|"
--"| Mounted lua/defConfig.lua     |"
--"| Mounted Configuration.lua     |"
--"| Executed func/PrepConfig.lua  |"
--"| Loaded module/Utils.lua       |"
--"| Loaded module/InitUtils.lua   |"
--"| Loaded module/Command.lua     |"
--"| Loaded module/Chat.lua        |"
--"|_______________________________|"
end
