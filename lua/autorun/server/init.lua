Settings = {
    Prefix = "!"
}
Core = {}
Core.Commands = include("Modules/Command.lua")

function Chat(ply, text)
    if string.sub(text, 1, 1) == Main.Prefix then
        ply:PrintMessage(3, "Response: ".. string.sub(text, 2))
        ply:SendLua([[gui.OpenURL("https://google.com")]])
    end
end

hook.Add( "PlayerSay", "ChatHook", Chat)
