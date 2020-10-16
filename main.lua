--[[This mod allows the player to destroy multiple pieces of adjacent wood or
ore, without going through the painfull task of doing it block by block. In
terms of logic, it creates a recursive funtion that checks for adjacent pieces
of destroyable material and break every piece it finds. Some paramenters were
included to stop the total destruction of a map.]]--

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
	for k, v in pairs(multibreaker_digging_tools) do
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
local function dig_neighbours_block(pos, blocks, tool, dig_params)
	if blocks_dug_in_iteration >= multibreaker_maximum_blocks_dug then
		return
	end
	local list_pos = minetest.find_nodes_in_area({x=pos.x+1, y=pos.y+1, z=pos.z+1}, {x=pos.x-1, y=pos.y-1, z=pos.z-1}, blocks)

	for i=1, #list_pos do
		if list_pos[i] then
			if blocks_dug_in_iteration >= multibreaker_maximum_blocks_dug then
				return
			end
			minetest.dig_node(list_pos[i])
      local wear = (dig_params.wear  * multibreaker_tool_wear_multiplier)
      tool:add_wear(wear)
			blocks_dug_in_iteration = blocks_dug_in_iteration + 1
			dig_neighbours_block(list_pos[i], blocks, tool, dig_params)
		end
	end
end

--[[The main function that controls the logic, determines that the multibreak
behaviour can only be used during a configurable action, and while a
configurable tool from a given set is held by the player]]--
minetest.register_on_dignode(function(pos, oldnode, digger)
	minetest.chat_send_all("Dug node: " .. oldnode.name .. " with " .. digger:get_wielded_item():get_name())
	if(digger:is_player()) then
		if(digger:get_player_control()[multibreaker_activation_button]) then
      local tool = digger:get_wielded_item()
			local item = tool:get_name()
			if contains(multibreaker_digging_tools, item) then
				local tot = get_table_of_tool(item)
				if contains(get_table_of_tool(item), oldnode.name) then
					blocks_dug_in_iteration = 0
          local dig_params = minetest.get_dig_params(minetest.registered_nodes[oldnode.name].groups, tool:get_tool_capabilities())
					dig_neighbours_block(pos, get_table_of_tool(item), tool, dig_params)
          digger:set_wielded_item(tool)
				end
			end
		end
	end
end)
