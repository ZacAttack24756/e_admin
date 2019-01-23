local Chat = {}
local Core = {}
Core.Settings = include("Configuration.lua")

local Prefix = string.sub(Core.Settings.Prefix, 1, 1)

Chat.OnChat = function( ply, text, team )
    local Table = string.Explode(" ", text)

    if type(Table[1]) == "string" and string.sub(Table[1], 1, 1) == Prefix then
        local First = string.sub(Table[1], 2)

        ply:PrintMessage(3, "Message Recived: ".. string.concat(Table, " ", 2))
        return "Test1234"
    end
end

return Chat
