--[[
    Documentation for the Main Configuration File


    ---- Main Settings ----
    Prefix              [String]    :   The 1 character that will be the prefix for most chat commands
    Command             [Table]
        Categories      [Array:Tab] :   An Array of User Defined Categories
    Groups              [Array:Tab] :   The Main Group Startup Configuration (See Below)



	----    Group Making    ----

	Text in '[""]' is the group's name
	--> NOTE: Any "Non-Optional" items missing would delete the group through error checking
    --> NOTE: If any part of the group is incorrectly made, the group would be voided.
	[""] = {
		"Rank"			[Num]		:	The Ranking Number of the group (Higher number means Higher Priority) (This number can't be zero, or above 2^30)
        ~~ Optional ~~
		"Perms"			[Array:Str]	:	Core Permissions the group has (See Format Below)
		"Default"		[Bool]		:	Specifies if the player gets this rank for Free
        "RankLadder"	[Str]		:	The Name for the Rank Ladder for the group (None means the default). A player can only be in 1 Group per Ladder
		"Inheritance"	[Array:Str]	:	Group names this group 'inherits' permissions from. Specify "Rank" to inherit from any lower-ranking groups
        "Override"      [Str]       :   Define a specific Override (See Below)
	}

    -- Overrides --
    From Lowest Rights to Highest Rights
    - No Access                     :   
    - Administrator                 :   Full Access; Automatically given every permission
--]]
