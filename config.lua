woodchopper_wood = {
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

woodchopper_t1_ores = {
	"default:stone_with_coal"
}

woodchopper_t2_ores = {
	"default:stone_with_coal",
	"default:stone_with_copper",
	"default:stone_with_tin",
	"default:stone_with_iron",
	"default:stone_with_gold"
}

woodchopper_t3_ores = {
	"default:stone_with_coal",
	"default:stone_with_copper",
	"default:stone_with_tin",
	"default:stone_with_iron",
	"default:stone_with_gold",
	"default:stone_with_mese",
	"default:stone_with_diamond"
}

--[[Configures all the tools that can be used to activate the multi-dig
behaviour]]--
woodchopper_digging_tools = {
	axe_wood = woodchopper_wood,
	axe_stone = woodchopper_wood,
	axe_bronze = woodchopper_wood,
	axe_steel = woodchopper_wood,
	axe_mese = woodchopper_wood,
	axe_diamond = woodchopper_wood,
	axe_gold = woodchopper_wood,
	axe_iron = woodchopper_wood,
	pick_wood = woodchopper_t1_ores,
	pick_stone = woodchopper_t2_ores,
	pick_bronze = woodchopper_t3_ores,
	pick_steel = woodchopper_t3_ores,
	pick_mese = woodchopper_t3_ores,
	pick_diamond = woodchopper_t3_ores	
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
