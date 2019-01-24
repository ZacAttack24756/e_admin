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
        if type(File) == "string" then
            local Spaces = math.max(LongestLength - string.len(File), 2)
            if string.sub(File, 1, 9) == "Coroutine" then
                include(File)()

                print("| Executed " .. File .. string.rep(" ", Spaces - 2) .. " |")
            elseif string.sub(File, 1, 6) == "Module" then
                include(File)

                print("| Loaded " .. File .. string.rep(" ", Spaces) .. " |" )
            else
                include(File)

                print("| Mounted " .. File .. string.rep(" ", Spaces - 1) .. " |")
            end
        elseif type(File) == "function" then
            File()
        end
    end
    print("|_" .. string.rep("_", LongestLength) .. "_|")
end

local ConfigFunction = function()
    e_admin.RunningConfig = e_admin.ConfigFile
end

-- An array that specifies in what order files should be loaded
local LoadLibrary = {
    "Configuration.lua", -- Contains the Configuration scripted in
    ConfigFunction, -- Quickly setup the configuration so nothing dies
    "Module/Utils.lua", -- Contains a plethora of helper functions
    "Module/InitUtils.lua", -- Contains functions used in this script's initalization
    "Module/Command.lua", -- Contains all of this script's built in commands
    "Module/Chat.lua", -- Contains all of the functons for chat
}
MasterLoadFiles(LoadLibrary)

--"_________________________________"
--"| Loading Files                 |"
--"|_______________________________|"
--"| Mounted Configuration.lua     |"
--"| Loaded Module/Utils.lua       |"
--"| Loaded Module/InitUtils.lua   |"
--"| Loaded Module/Command.lua     |"
--"|_______________________________|"
end
