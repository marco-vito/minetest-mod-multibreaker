--[[This mod allows the player to cut multiple pieces of adjacent wood, without
going through the painfull task of building towers next to tree to get to the
stumps too high to reach. In terms of logic, it creates a recursive funtion
that checks for adjacent pieces of choppable material and break every piece it
finds. Some paramenters were included to stop the total destruction of a
forest.]]--

--[[Small function to check if a list contains a given element]]--
local function contains(list, x)
    for _, v in pairs(list) do
        if v == x then return true end
    end
    return false
end

--[[A variable used to determine the maximum amounts of blocks cut in a single
action by the player]]--
local blocks_dug_in_iteration = 0

--[[This function digs all the blocks of a given type that are adjacent to the
block the player interact with]]--
local function dig_neighbours_block(pos)
	if blocks_dug_in_iteration >= woodchopper_maximum_blocks_dug then
		return
	end
	local list_pos = minetest.find_nodes_in_area({x=pos.x+1, y=pos.y+1, z=pos.z+1}, {x=pos.x-1, y=pos.y-1, z=pos.z-1}, woodchopper_diggable_blocks)

	for i=1, #list_pos do
		if list_pos[i] then
			if blocks_dug_in_iteration >= woodchopper_maximum_blocks_dug then
				return
			end
			minetest.dig_node(list_pos[i])
			blocks_dug_in_iteration = blocks_dug_in_iteration + 1
			dig_neighbours_block(list_pos[i])
		end
	end
end

--[[The main function that controls the logic, determines that the multi-cut
behaviour can only be used during a configurable action, and while a
configurable tool from a given set is held by the player]]--
minetest.register_on_dignode(function(pos, oldnode, digger)
	if(digger:is_player()) then
		if(digger:get_player_control()[woodchopper_activation_button]) then
      if contains(woodchopper_digging_tools, get_wielded_item()) then
  			if contains(woodchopper_diggable_blocks, oldnode.name) then
  				blocks_dug_in_iteration = 0
  				dig_neighbours_block(pos)
  			end
      end
		end
	end
end)
