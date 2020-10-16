--[[This mod allows the player to cut multiple pieces of adjacent wood, without
going through the painfull task of building towers next to tree to get to the
stumps too high to reach. In terms of logic, it creates a recursive funtion
that checks for adjacent pieces of choppable material and break every piece it
finds. Some paramenters were included to stop the total destruction of a
forest.]]--

--[[Small function to check if a list contains a given element]]--
local function contains(list, x)
    for k, v in pairs(list) do
		if string.match(x, k) then return true end
		local b = k == x
		if not b then b = v == x end
		if b then return true end
    end
    return false
end

local function get_table_of_tool(str)
	for k, v in pairs(woodchopper_digging_tools) do
		if string.match(str, k) then
			return v
		end
    end
	return nil
end

--[[A variable used to determine the maximum amounts of blocks cut in a single
action by the player]]--
local blocks_dug_in_iteration = 0

--[[This function digs all the blocks of a given type that are adjacent to the
block the player interact with]]--
local function dig_neighbours_block(pos, blocks)
	if blocks_dug_in_iteration >= woodchopper_maximum_blocks_dug then
		return
	end
	local list_pos = minetest.find_nodes_in_area({x=pos.x+1, y=pos.y+1, z=pos.z+1}, {x=pos.x-1, y=pos.y-1, z=pos.z-1}, blocks)

	for i=1, #list_pos do
		if list_pos[i] then
			if blocks_dug_in_iteration >= woodchopper_maximum_blocks_dug then
				return
			end
			minetest.dig_node(list_pos[i])
			blocks_dug_in_iteration = blocks_dug_in_iteration + 1
			dig_neighbours_block(list_pos[i], blocks)
		end
	end
end

--[[The main function that controls the logic, determines that the multi-cut
behaviour can only be used during a configurable action, and while a
configurable tool from a given set is held by the player]]--
minetest.register_on_dignode(function(pos, oldnode, digger)
	minetest.chat_send_all("Dug node: " .. oldnode.name .. " with " .. digger:get_wielded_item():get_name())
	if(digger:is_player()) then
		if(digger:get_player_control()[woodchopper_activation_button]) then
			local item = digger:get_wielded_item():get_name()
			if contains(woodchopper_digging_tools, item) then
				local tot = get_table_of_tool(item)
				if contains(get_table_of_tool(item), oldnode.name) then
					minetest.chat_send_all("bloop")
					blocks_dug_in_iteration = 0
					dig_neighbours_block(pos, get_table_of_tool(item))
				end
			end
		end
	end
end)
