--[[Configures all the types os blocks that are affect by the multi-dig. By
default it aims towards wood, but it coul teoretically be used for other types
of blocks.]]--
woodchopper_diggable_blocks = {
	"default:tree",
	"default:jungletree",
	"default:pine_tree",
	"default:acacia_tree",
	"default:aspen_tree"
}

--[[Configures all the tools that can be used to activate the multi-dig
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
block affected by the multi-dig behaviour. By default, 1 per block; can be
changed to 0 to not use durability of the tool in the multi-dig process]]--
woodchopper_tool_use_per_block = 1

--[[Determines the max number of blocks affected by the multi-dig. By default
20, to stop massive deflorestation.]]--
woodchopper_maximum_blocks_dug = 20

--[[Determines the action button that must be pressed to activate the multi-dig
behaviour.]]--
woodchopper_activation_button = "sneak"
