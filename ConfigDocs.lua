--[[
    Documentation for the Startup Configuration File

    ---- Main Settings ----

    Prefix              [String]    :   The 1 character that will be the prefix for most chat commands, Is Case Sensitive
    Command             [Table]
        Categories      [Array:Tab] :   An Array of User Defined Categories
    Groups              [Array:Tab] :   The Main Group Startup Configuration (See "Group Making")
    Chat                [Tab]       :   A Table containing settings related to chat (See "Chat Options")


	----    Group Making    ----

	Text in '[""]' is the group's name
	--> NOTE: Any "Non-Optional" items missing would delete the group through error checking
    --> NOTE: If any part of the group is incorrectly made, the group would be voided.
	[""] = {
		"Rank"			[Num]		:	The Ranking Number of the group (Higher number means Higher Priority) (This number can't be lower than zero, or above 2^30)
        ~~ Optional ~~
		"Perms"			[Array/Str]	:	Core Permissions the group has (See Format Below)
		"Default"		[Bool]		:	Specifies if the player gets this rank for Free
        "RankLadder"	[Str]		:	The Name for the Rank Ladder for the group (None means the default). A player can only be in 1 Group per Ladder
		"Inheritance"	[Array/Str]	:	Group names this group 'inherits' permissions from. Specify "Rank" to inherit from any lower-ranking groups
        "TargetNumber"  [Num]       :   A number specifing ranks this rank can target, Can be configured on command basis, but this is the default for all
        "TargetTable"   [Tab]       :   An table that is specific TargetNumbers for certian commands with this group
        "Options"       [Table]     :   Options (Only applies to the "Default" rank)
        {
            "Override"      [Str]   :   Define a specific Permission Override (See "Permission Overrides")
            "Aquisition"    [Str]   :   Define a specific Aquisition Setting (See "Aquisition Options")
            "IconName"      [Str]   :   An Icon that will be associated with this group ( http://www.famfamfam.com/lab/icons/silk/previews/index_abc.png )
            "RankDisplay"   [Str]   :   Text that shows up if a player has the rank
            "ColorDisplay"  [...]   :   The Color of the RankDisplay
        }
	}

    -- Permission Overrides --
    From Lowest Rights to Highest Rights
    - NoAccess                      :   No Access; Removes any privilages from this Group, and Negates any Inheritaed ranks
    - Administrator                 :   Full Access; Automatically given every permission

    -- Aquisition Options --
    (WHo is permitted to give this group to users)
    - Administrator                 :   This group is only able to be granted to users by an Administrator
    - Console                       :   This group is only able to be granted to users by the server console

    ----    Chat Options    ----
    {
        "DisplayFormat" [Array]     :   An Array of what shows up when someone chats, See Format Below
        FORMAT: "{PLAYERNAME}" -> Name of the player; "{RANKDISPLAY}" -> RankDisplay, shown above
    }
--]]
