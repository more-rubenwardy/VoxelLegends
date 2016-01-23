local furnace_form = "size[8,9]"
local furnace_form = furnace_form..default.gui_colors
local furnace_form = furnace_form..default.gui_bg
local furnace_form = furnace_form.."list[current_name;main;2,0.3;4,4;]" 
local furnace_form = furnace_form..default.itemslot_bg(2,0.3,4,4)
local furnace_form = furnace_form.."list[current_player;main;0,4.85;8,1;]" 
local furnace_form = furnace_form..default.itemslot_bg(0,4.85,8,1)
local furnace_form = furnace_form.."list[current_player;main;0,6.08;8,3;8]" 
local furnace_form = furnace_form..default.itemslot_bg(0,6,8,3)

minetest.register_node("furnace:furnace", {
	description = "Furnace",
	tiles = {"furnace_stone_tile.png", "furnace_stone_tile.png", "furnace_stone_tile.png", "furnace_stone_tile.png","furnace_stone_tile.png","furnace_stone_front.png"},
	groups = {cracky = 2},
	paramtype2 = "facedir",
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec",furnace_form)
		meta:set_string("infotext", "Furnace");
		local inv = meta:get_inventory()
		inv:set_size("main", 4*4)
	end,
})

minetest.register_abm({
	nodenames = {"furnace:furnace"},
	neighbors = {"group:pattern"},
	interval = 10.0,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local mymeta = minetest.get_meta(pos)
		pos.y = pos.y - 1
		if minetest.get_node(pos).name == "lava:lava_source" then
			local dir = vector.multiply(minetest.facedir_to_dir(minetest.get_node({x = pos.x, y= pos.y+1, z=pos.z}).param2), -1)
			local patternpos = vector.add(pos, dir)
	
			local pattern = minetest.get_node(patternpos).name
			if pattern == "furnace:pattern_rod" then
				local myinv = mymeta:get_inventory()
				if myinv:contains_item("main", {name = "default:iron_lump"}) then
					minetest.get_meta(patternpos):get_inventory():add_item("main", {name = "furnace:iron_rod"})
					myinv:remove_item("main", {name = "default:iron_lump"})
				elseif myinv:contains_item("main", {name = "default:gold_lump"}) then
					minetest.get_meta(patternpos):get_inventory():add_item("main", {name = "furnace:gold_rod"})
					myinv:remove_item("main", {name = "default:gold_lump"})
				end
			end
			if pattern == "furnace:pattern_blade" then
				local myinv = mymeta:get_inventory()
				if myinv:contains_item("main", {name = "default:iron_lump"}) then
					minetest.get_meta(patternpos):get_inventory():add_item("main", {name = "default:blade"})
					myinv:remove_item("main", {name = "default:iron_lump"})
				end
			end
		end
	end,
})

local pattern_form = "size[8,9]"
local pattern_form = pattern_form..default.gui_colors
local pattern_form = pattern_form..default.gui_bg
local pattern_form = pattern_form.."list[current_name;main;0,0.3;8,4;]" 
local pattern_form = pattern_form..default.itemslot_bg(0,0.3,8,4)
local pattern_form = pattern_form.."list[current_player;main;0,4.85;8,1;]" 
local pattern_form = pattern_form..default.itemslot_bg(0,4.85,8,1)
local pattern_form = pattern_form.."list[current_player;main;0,6.08;8,3;8]" 
local pattern_form = pattern_form..default.itemslot_bg(0,6,8,3)

minetest.register_node("furnace:pattern_rod", {
	description = "Pattern for a Rod",
	tiles = {"furnace_pattern_rod.png", "default_wooden_planks.png"},
	groups = {snappy = 3, pattern = 1},
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec",pattern_form)
		meta:set_string("infotext", "Pattern");
		local inv = meta:get_inventory()
		inv:set_size("main", 8*4)
	end,

})

minetest.register_node("furnace:pattern_blade", {
	description = "Pattern for a blade",
	tiles = {"furnace_pattern_blade.png", "default_wooden_planks.png"},
	groups = {snappy = 3, pattern = 1},
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec",pattern_form)
		meta:set_string("infotext", "Pattern");
		local inv = meta:get_inventory()
		inv:set_size("main", 8*4)
	end,

})

minetest.register_craftitem("furnace:iron_rod", {
	description = "Iron Rod",
	inventory_image = "furnace_iron_rod.png",
})

minetest.register_craftitem("furnace:gold_rod", {
	description = "Gold Rod",
	inventory_image = "furnace_gold_rod.png",
})

minetest.register_craftitem("furnace:diamond_rod", {
	description = "Diamond Rod",
	inventory_image = "furnace_diamond_rod.png",
})

-- crafting

minetest.register_craft({
	output = "furnace:furnace",
	recipe = {
		{"default:stonebrick", "default:stonebrick", "default:stonebrick"},
		{"default:stonebrick", "", "default:stonebrick"},
		{"default:stonebrick", "default:stonebrick", "default:stonebrick"},
	}
})

minetest.register_craft({
	output = "furnace:pattern_rod",
	recipe = {
		{"default:stonebrick", "", "default:stonebrick"},
		{"default:stonebrick", "default:stonebrick", "default:stonebrick"},
		{"default:wood", "default:wood", "default:wood"},
	}
})

minetest.register_craft({
	output = "furnace:pattern_blade",
	recipe = {
		{"default:stonebrick", "default:stonebrick", "default:stonebrick"},
		{"default:stonebrick", "default:stonebrick", "default:stonebrick"},
		{"default:wood", "default:wood", "default:wood"},
	}
})

minetest.register_craft({
	output = "default:pick",
	recipe = {
		{"", "furnace:iron_rod", ""},
		{"", "default:string_strong", ""},
		{"", "default:log_3", ""},
	}
})
