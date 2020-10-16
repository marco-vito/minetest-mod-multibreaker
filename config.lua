--[[Configures all the types os blocks in lists that are affect by the multibreak. By
default it aims towards wood and ores, but it coul teoretically be used for
other types of blocks.]]--
multibreaker_wood = {
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

multibreaker_t1_ores = {
	"default:stone_with_coal"
}

multibreaker_t2_ores = {
	"default:stone_with_coal",
	"default:stone_with_copper",
	"default:stone_with_tin",
	"default:stone_with_iron",
	"default:stone_with_gold"
}

multibreaker_t3_ores = {
	"default:stone_with_coal",
	"default:stone_with_copper",
	"default:stone_with_tin",
	"default:stone_with_iron",
	"default:stone_with_gold",
	"default:stone_with_mese",
	"default:stone_with_diamond"
}

--[[Configures all the tools that can be used to activate the multibreak
behaviour]]--
multibreaker_digging_tools = {
	axe_wood = multibreaker_wood,
	axe_stone = multibreaker_wood,
	axe_bronze = multibreaker_wood,
	axe_steel = multibreaker_wood,
	axe_mese = multibreaker_wood,
	axe_diamond = multibreaker_wood,
	axe_gold = multibreaker_wood,
	axe_iron = multibreaker_wood,
	pick_wood = multibreaker_t1_ores,
	pick_stone = multibreaker_t2_ores,
	pick_bronze = multibreaker_t3_ores,
	pick_steel = multibreaker_t3_ores,
	pick_mese = multibreaker_t3_ores,
	pick_diamond = multibreaker_t3_ores
}

--[[Determines how much of the durability of the toll will be diminished by
block affected by the multibreak behaviour. By default, 1 makes the regular
amount per block be applied to the tool; can be changed to 0 to not use the
durability of the tool in the multi-dig process; can be changed to anythin
bigger than 1 to make a multibreak cost a lot of tool resources.]]--
multibreaker_tool_wear_multiplier = 1

--[[Determines the max number of blocks affected by the multibreak. By default
20, to stop massive deflorestation.]]--
multibreaker_maximum_blocks_dug = 20

--[[Determines the action button that must be pressed to activate the multibreak
behaviour.]]--
multibreaker_activation_button = "sneak"
