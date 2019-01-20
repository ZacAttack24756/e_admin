local Chat = {}
local Core = {}
Core.Settings = include("Configuration.lua")

Chat:OnChat = function( ply, text, team )
    if string.sub(text, 1, 1) == Core.Settings.Prefix then
        ply:PrintMessage(3, "Message Recived: ".. string.sub(text, 2))
        return "Test1234"
    end
end

return Chat
