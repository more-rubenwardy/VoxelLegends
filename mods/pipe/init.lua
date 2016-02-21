local pipe_form = "size[8,6]"
local pipe_form = pipe_form..default.gui_colors
local pipe_form = pipe_form..default.gui_bg
local pipe_form = pipe_form.."list[current_name;main;3,0.3;2,1;]" 
local pipe_form = pipe_form..default.itemslot_bg(3,0.3,2,1)
local pipe_form = pipe_form.."list[current_player;main;0,1.85;8,1;]" 
local pipe_form = pipe_form..default.itemslot_bg(0,1.85,8,1)
local pipe_form = pipe_form.."list[current_player;main;0,3.08;8,3;8]" 
local pipe_form = pipe_form..default.itemslot_bg(0,3.08,8,3)

minetest.register_node("pipe:pipe", {
	description = "Pipe",
	tiles = {"pipe_top.png", "pipe_side.png"},
	groups = {choppy = 3},
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
				{-0.1, -0.1, -0.5, 0.1, 0.1, 0.5},
			},
	},
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", pipe_form)
		meta:set_string("infotext", "Pipe")
		local inv = meta:get_inventory()
		inv:set_size("main", 2)
	end,
})

minetest.register_abm({
	nodenames = {"pipe:pipe"},
	interval = 1.0,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local meta = minetest.get_meta(pos)
		local dir = vector.multiply(minetest.facedir_to_dir(minetest.get_node({x = pos.x, y= pos.y, z=pos.z}).param2), -1)
		local next_pos = vector.add(pos, dir)
		local inv = meta:get_inventory()
		local next_meta = minetest.get_meta(next_pos)
		local next_inv = next_meta:get_inventory()
		
		if next_inv:room_for_item("main", inv:get_list("main")[1]) and not inv:get_list("main")[1]:is_empty() then
			next_inv:add_item("main", inv:get_list("main")[1])
			inv:remove_item("main", inv:get_list("main")[1])
		end
		if next_inv:room_for_item("main", inv:get_list("main")[2]) and not inv:get_list("main")[2]:is_empty() then
			next_inv:add_item("main", inv:get_list("main")[2])
			inv:remove_item("main", inv:get_list("main")[2])
		end	
	end,
})

minetest.register_node("pipe:pump", {
	description = "Pump",
	tiles = {"pipe_pump_top.png", "pipe_pump_top.png", "pipe_pump_side_alt.png", "pipe_pump_side.png", "pipe_pump_front.png", "pipe_pump_front.png"},
	groups = {choppy = 3},
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0, 0.5},
			},
	},
})

minetest.register_abm({
	nodenames = {"pipe:pump"},
	interval = 1.0,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local meta = minetest.get_meta(pos)
	
		local next_dir = vector.multiply(minetest.facedir_to_dir(minetest.get_node({x = pos.x, y= pos.y, z=pos.z}).param2), -1)
		local dir = minetest.facedir_to_dir(minetest.get_node({x = pos.x, y= pos.y, z=pos.z}).param2)

		local last_pos = vector.add(pos, dir)
		local next_pos = vector.add(pos, next_dir)

		local next_meta = minetest.get_meta(next_pos)
		local last_meta = minetest.get_meta(last_pos)

		local last_inv = last_meta:get_inventory()
		local next_inv = next_meta:get_inventory()
	
		local item_pos = 1

		if not last_inv:get_list("main") then
			return 
		end
		
		for k,v in pairs(last_inv:get_list("main")) do
			if not v:is_empty() then
				item_pos = k
			end
		end

		
		if next_inv:room_for_item("main", last_inv:get_list("main")[item_pos]) and not last_inv:get_list("main")[item_pos]:is_empty() then
			next_inv:add_item("main", last_inv:get_list("main")[item_pos])
			last_inv:remove_item("main", last_inv:get_list("main")[item_pos])
		end	
	end,
})
