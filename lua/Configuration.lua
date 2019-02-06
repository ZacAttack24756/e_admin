---- Settings!! ----
local Settings = {
    Prefix = "!",
    Command = {
        Categories = {}
    },
    Addins = {
        ["bHud"] = {enabled = false},
        ["regenHealth"] = {enabled = false},
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
