---- Settings!! ----
local Settings = {
    Prefix = "!",
    Command = {
        Categories = {}
    },
    Modules = {
        ["bHud"] = {Enabled = false},
        ["regenHealth"] = {Enabled = false},
    },
    Groups = {
        ["user"] = {
            Rank = 1,
            Perms = {".cmds.generic"},
            Default = true
        },
        ["operator"] = {
            Rank = (2^30),
        }
    }
}

return Settings
