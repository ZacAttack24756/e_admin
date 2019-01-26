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
    local N1 = math.floor(LongestLength * 1.45)
    local N2 = (LongestLength - 7)/1.3
    local N3 = (LongestLength - 13)
    local N4 = (LongestLength - 10)/1.225

    print("")
    print("╔" .. string.rep("═", N1) .. "╗")
    print("║ " .. string.rep(" ", math.floor(N2)) .. "e_admin" .. string.rep(" ", math.ceil(N2)) .. " ║")
    print("║ " .. string.rep(" ", math.floor(N3)) .. "Loading Files" .. string.rep(" ", math.ceil(N3)) .. " ║")
    print("╠" .. string.rep("═", N1) .. "╣")
    for i, File in pairs(Files) do
        if type(File) == "string" then
            local Spaces = LongestLength - string.len(File)
            if string.sub(File, 1, 4) == "func" then
                include(File)()

                print("║ Executed " .. File .. string.rep(" ", Spaces - 2) .. " ║")
            elseif string.sub(File, 1, 6) == "module" then
                include(File)

                print("║ Loaded " .. File .. string.rep(" ", Spaces) .. " ║" )
            else
                include(File)

                print("║ Mounted " .. File .. string.rep(" ", Spaces - 1) .. " ║")
            end
        end
    end
    print("╠" .. string.rep("═", N1) .. "╣")
    print("║ " .. string.rep(" ", math.floor(N2)) .. "e_admin" .. string.rep(" ", math.ceil(N2)) .. " ║")
    print("║ " .. string.rep(" ", math.floor(N4)) .. "Initalized" .. string.rep(" ", math.ceil(N4)) .. " ║")
    print("╚" .. string.rep("═", N1) .. "╝")
    print("")
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

--[[
    ╔═════════════════════════════╗
    ║           e_admin           ║
    ║        Loading Files        ║
    ╠═════════════════════════════╣
    ║ Mounted lua/defConfig.lua   ║
    ║ Executed func/config.lua    ║
    ║ Loaded module/Utils.lua     ║
    ║ Loaded module/InitUtils.lua ║
    ║ Loaded module/Command.lua   ║
    ║ Loaded module/Chat.lua      ║
    ╠═════════════════════════════╣
    ║           e_admin           ║
    ║         Initalized          ║
    ╚═════════════════════════════╝
]]--
end
