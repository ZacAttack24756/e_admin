--[[
    ---- Main Settings ----

]]--

--[[
	----    Group Making    ----

	Text in "[]" is the group's name
	Within the group, a lot of things can occur.
	--> NOTE: Any "Non-Optional" items missing would delete the group through error checking
	[] = {
		"Rank"			[Num]		:	The Ranking Number of the group (Higher number means Higher Priority)
		"Perms"			[Array:Str]	:	Core Permissions the group has (See Format Below)
		~~ Optional ~~
		"Default"		[Bool]		:	Specifies if the player gets this rank for Free
        "RankLadder"	[Str]		:	The Name for the Rank Ladder for the group (None means the default). A player can only be in 1 Group per Ladder
		"Inheritance"	[Array:Str]	:	Group names this group 'inherits' permissions from. Specify "Rank" to inherit from any lower-ranking groups
		"RobloxGroup"   [Array:Tab]	:	Array of Tables which specify what roblox group and rank can get this group. (Refer Below)
		{
			~ All Required ~
			"ID"         [Num]		:	Group ID which is being targeted
			"Cond"       [Str]		:	The LUA Condition for rank. Structured as follows: ( GroupRank __Cond__ ReqRank ) ; ( Ex: 30 >= 25 )
			"Rank"       [Num]		:	The Required Group Rank to recive this group
		}
		"RobloxTeam"	[Array:Obj]	:	An in-game team that would recive this Group ( Directly refer to the team, Ex: "game.Teams.Team1" (Without "") ). NOTE: The Roblox team needs to be in the game BEFORE this script is initialized
	}
--]]

--[[
	---- Example Settings ----

local Settings = {
	Groups = {
		{
			Rank = 1,
			Perms = {
				".door.asd",
				".door.bte",
			},
		},
	}
}

--]]
