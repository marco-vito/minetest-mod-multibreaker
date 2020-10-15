local function contains(list, x)
    for _, v in pairs(list) do
        if v == x then return true end
    end
    return false
end

local blocks_dug_in_iteration = 0

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

minetest.register_on_dignode(function(pos, oldnode, digger)
	if(digger:is_player()) then
		if(digger:get_player_control()[woodchopper_activation_button]) then
			if contains(woodchopper_diggable_blocks, oldnode.name) then
				blocks_dug_in_iteration = 0
				dig_neighbours_block(pos)
			end
		end
	end
end)
