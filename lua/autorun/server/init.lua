---- Main Code ----
local Core = {}
Core.Settings = include("Configuration.lua")
Core.InitUtils = include("Modules/InitUtils.lua") -- Has a bunch of-you guessed it-Utils for this
Core.Chat = include("Modules/Chat.lua")
Core.Commands = {}

local Commands = include("Modules/Command.lua") --Contains the bulk of the built in commands

-- Initalize Commands


hook.Add( "PlayerSay", "ChatHook", Core.Chat) -- Add the chat hook
