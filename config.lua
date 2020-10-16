--[[Configures all the types os blocks that are affect by the multibreak. By
default it aims towards wood, but it coul teoretically be used for other types
of blocks.]]--
woodchopper_diggable_blocks = {
	"default:tree",
	"default:jungletree",
	"default:pine_tree",
	"default:acacia_tree",
	"default:aspen_tree",
	"mcl_core:tree",
	"mcl_core:darktree",
	"mcl_core:acaciatree",
	"mcl_core:sprucetree",
	"mcl_core:birchtree",
	"mcl_core:jungletree"
}

--[[Configures all the tools that can be used to activate the multibreak
behaviour]]--
woodchopper_digging_tools = {
	"default:axe_wood",
	"default:axe_stone",
	"default:axe_bronze",
	"default:axe_steel",
	"default:axe_mese",
	"default:axe_diamond"
}

--[[Determines how much of the durability of the toll will be diminished by
block affected by the multibreak behaviour. By default, 1 makes the regular
amount per block be applied to the tool; can be changed to 0 to not use the
durability of the tool in the multi-dig process; can be changed to anythin
bigger than 1 to make a multibreak cost a lot of tool resources.]]--
multibreak_tool_wear = 10

--[[Determines the max number of blocks affected by the multi-dig. By default
20, to stop massive deflorestation.]]--
woodchopper_maximum_blocks_dug = 100

--[[Determines the action button that must be pressed to activate the multi-dig
behaviour.]]--
woodchopper_activation_button = "sneak"
