Main = {
    Prefix = "!"
}

function Chat(ply, text)
    if string.sub(text, 1, 1) == Main.Prefix then
        ply:PrintMessage(3, "Response: ".. string.sub(text, 2))
        ply:SendLua([[gui.OpenURL("http://google.com")]])
    end
end

hook.Add( "PlayerSay", "ChatHook", Chat)
