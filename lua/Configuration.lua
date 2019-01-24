---- Settings!! ----
local Settings = {
    Prefix = "!",
    Command = {
        Categories = {}
    },
    Groups = {
        ["user"] = {
            Rank = 1,
            Perms = {".cmds.generic"},
            Default = true
        },
        ["operator"] = {
            Rank = (2^30),
            Override = ""
        }
    }
}

if e_admin then
    e_admin.ConfigFile = Settings
end
