if e_admin then
Command = {}

Command["Help"] = {
    Category = "User",
    Allias = {"?"},

    Desc = "Displays a list of commands you can run",
    LongDesc = [[
        Displays a list of commands you can run
        Shows a description of the command, with Allias
    ]],
    Usage = "[Command]",

    Permissions = {".cmds.user.help"},
    Main = function(plr, Args)

    end,
}

e_admin.Command = Command
end
