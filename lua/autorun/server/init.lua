---- Settings!! ----
local Settings = {
    Prefix = "!", -- Chat prefix for normal commands
    Command = {
        Categories = {"User"} -- New Categories (Not )
    }
}

---- Main Code ----
local Core = {}
Core.InitUtils = include("Modules/InitUtils.lua") -- Has a bunch of-you guessed it-Utils for this
Core.Commands = include("Modules/Command.lua") --Contains the bulk of the built in commands

function Chat(ply, text)
    if string.sub(text, 1, 1) == Main.Prefix then
        ply:PrintMessage(3, "Message Recived: ".. string.sub(text, 2))
    end
end

hook.Add( "PlayerSay", "ChatHook", Chat)
