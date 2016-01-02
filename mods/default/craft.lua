-- workbench

minetest.register_node("default:workbench", {
	description = "Workbench v1",
	tiles = {"default_workbench_top.png", "default_wooden_planks.png"},
	groups = {choppy = 3},
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", default.craft_form)
		meta:set_string("infotext", "Workbench")
		local inv = meta:get_inventory()
		inv:set_size("main", 8*4)
	end,
})

default.craft_form_v2 = "size[8,7.5;]"
default.craft_form_v2 = default.craft_form_v2..default.gui_colors
default.craft_form_v2 = default.craft_form_v2..default.gui_bg
default.craft_form_v2 = default.craft_form_v2.."list[current_player;main;0,3.5;8,4;]"
default.craft_form_v2 = default.craft_form_v2..default.itemslot_bg(0,3.5,8,4)
default.craft_form_v2 = default.craft_form_v2.."list[current_name;craftadd;0,0;1,3;]"
default.craft_form_v2 = default.craft_form_v2..default.itemslot_bg(0,0,1,3)
default.craft_form_v2 = default.craft_form_v2.."list[current_player;craft;1.5,0;3,3;]"
default.craft_form_v2 = default.craft_form_v2..default.itemslot_bg(1.5,0,3,3)
default.craft_form_v2 = default.craft_form_v2.."list[current_player;craftpreview;5,1;1,1;]"
default.craft_form_v2 = default.craft_form_v2..default.itemslot_bg(5,1,1,1)

minetest.register_node("default:workbench_v2", {
	description = "Workbench V2",
	tiles = {"default_workbench_v2_top.png", "default_small_stone_tile.png"},
	groups = {choppy = 3},
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", default.craft_form_v2)
		meta:set_string("infotext", "Workbench V2")
		local inv = meta:get_inventory()
		inv:set_size("craftadd", 3)
	end,
})

-- crafts

minetest.register_craft({
	output = "default:string_strong",
	recipe = {
		{"default:string", "default:string", "default:string"},
	}
})

minetest.register_craft({
	output = "default:string",
	recipe = {
		{"group:plant", "group:plant", "group:plant"},
	}
})

minetest.register_craft({
	output = "default:plant_grass",
	recipe = {
		{"default:grass"},
	}
})

minetest.register_craft({
	output = "default:basic_hammer",
	recipe = {
		{"", "default:log_1", ""},
		{"", "default:string_strong", ""},
		{"", "default:log_3", ""},
	}
})

minetest.register_craft({
	output = "default:axe_stone",
	recipe = {
		{"", "default:stone_item", ""},
		{"", "default:string_strong", ""},
		{"", "default:log_3", ""},
	}
})
