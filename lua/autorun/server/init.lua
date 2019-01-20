---- Main Code ----
local Core = {}
Core.Settings = include("Configuration.lua")
Core.InitUtils = include("Modules/InitUtils.lua") -- Has a bunch of-you guessed it-Utils for this
Core.Commands = include("Modules/Command.lua") --Contains the bulk of the built in commands

function Chat(ply, text)
    if string.sub(text, 1, 1) == Core.Settings.Prefix then
        ply:PrintMessage(3, "Message Recived: ".. string.sub(text, 2))
        return "Test1234"
    end
end

hook.Add( "PlayerSay", "ChatHook", Chat)
