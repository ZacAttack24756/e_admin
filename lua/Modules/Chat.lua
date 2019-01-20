local Chat = {}
local Core = {}
Core.Settings = include("Configuration.lua")

local Prefix = string.sub(Core.Settings.Prefix, 1, 1)

Chat:OnChat = function( ply, text, team )
    local Text = string.explode(" ", text)

    if type(Text[1]) == "string" then
        if string.sub(Text, 1, 1) == Prefix then
            ply:PrintMessage(3, "Message Recived: ".. string.sub(text, 2))
            return "Test1234"
        end
    end
end

return Chat
