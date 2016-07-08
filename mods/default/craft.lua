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
default.craft_form_v2 = default.craft_form_v2.."list[current_name;main;0,0;2,3;]"
default.craft_form_v2 = default.craft_form_v2..default.itemslot_bg(0,0,2,3)
default.craft_form_v2 = default.craft_form_v2.."list[current_player;craft;2.5,0;3,3;]"
default.craft_form_v2 = default.craft_form_v2..default.itemslot_bg(2.5,0,3,3)
default.craft_form_v2 = default.craft_form_v2.."list[current_player;craftpreview;6,1;1,1;]"
default.craft_form_v2 = default.craft_form_v2..default.itemslot_bg(6,1,1,1)

minetest.register_node("default:workbench_v2", {
	description = "Workbench V2",
	tiles = {"default_workbench_v2_top.png", "default_small_stone_tile.png"},
	groups = {choppy = 3},
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", default.craft_form_v2)
		meta:set_string("infotext", "Workbench V2")
		local inv = meta:get_inventory()
		inv:set_size("main", 3*2)
	end,
	after_dig_node = default.drop_items,
})

-- crafts

-- wood

minetest.register_craft({
	output = "default:twig 3",
	recipe = {
		{"group:leaves"},
	}
})

minetest.register_craft({
	output = "default:stick",
	recipe = {
		{"default:twig"},
	}
})

minetest.register_craft({
	output = "default:stick 2",
	recipe = {
		{"default:wood"},
	}
})

minetest.register_craft({
	output = "default:wood 3",
	recipe = {
		{"default:log_1"},
	}
})

minetest.register_craft({
	output = "default:wood 2",
	recipe = {
		{"default:log_2"},
	}
})

minetest.register_craft({
	output = "default:stick 4",
	recipe = {
		{"default:log_3"},
	}
})

minetest.register_craft({
	output = "default:wooden_planks",
	recipe = {
		{"default:frame", "default:wood"},
	}
})

minetest.register_craft({
	output = "default:wooden_planks_2",
	recipe = {
		{"default:frame", "default:wood" , "default:wood"},
	}
})

minetest.register_craft({
	output = "default:frame 2",
	recipe = {
		{"default:stick", "default:stick", "default:stick"},
		{"default:stick", "default:stick", "default:stick"},
	}
})

minetest.register_craft({
	output = "default:ladder",
	recipe = {
		{"default:stick", "", "default:stick"},
		{"default:string_strong", "default:stick", "default:string_strong"},
		{"default:stick", "", "default:stick"},
	}
})

minetest.register_craft({
	output = "default:jungle_wood 2",
	recipe = {
		{"default:jungle_tree"},
	}
})

minetest.register_craft({
	output = "default:wooden_planks_jungle",
	recipe = {
		{"default:frame", "default:jungle_wood"},
	}
})

minetest.register_craft({
	output = "default:wooden_planks_2_jungle",
	recipe = {
		{"default:frame", "default:jungle_wood", "default:jungle_wood"},
	}
})

--box
minetest.register_craft({
	output = "default:box 4",
	recipe = {
		{"", "default:wood", ""},
		{"default:wood", "default:frame", "default:wood"},
		{"", "default:wood", ""},
	}
})

-- stone

minetest.register_craft({
	output = "default:stone_tile",
	recipe = {
		{"default:stone_item", "default:stone_item"},
		{"default:stone_item", "default:stone_item"},
	}
})

minetest.register_craft({
	output = "default:small_stone_tiles 4",
	recipe = {
		{"default:stone_tile", "default:stone_tile"},
		{"default:stone_tile", "default:stone_tile"},
	}
})

minetest.register_craft({
	output = "default:stonebrick 4",
	recipe = {
		{"default:small_stone_tiles", "default:small_stone_tiles"},
		{"default:small_stone_tiles", "default:small_stone_tiles"},
	}
})

minetest.register_craft({
	output = "default:cobble 2",
	recipe = {
		{"default:stone_item", "default:stone_item", "default:stone_item"},
		{"default:stone_item", "default:stone_item", "default:stone_item"},
		{"default:stone_item", "default:stone_item", "default:stone_item"},
	}
})

-- coal


minetest.register_craft({
	output = "default:coal_dust 3",
	recipe = {
		{"default:coal_lump"},
	}
})


minetest.register_craft({
	output = "default:coal_lump",
	recipe = {
		{"default:coal_dust", "default:coal_dust", "default:coal_dust"},
	}
})

minetest.register_craft({
	output = "default:coalblock",
	recipe = {
		{"default:coal_lump", "default:coal_lump", "default:coal_lump"},
		{"default:coal_lump", "default:coal_lump", "default:coal_lump"},
		{"default:coal_lump", "default:coal_lump", "default:coal_lump"},
	}
})

minetest.register_craft({
	output = "default:coalblock_glowing",
	recipe = {
		{"default:coalblock", "torch:torch"},
	}
})


--lamp

minetest.register_craft({
	output = "default:lamp 4",
	recipe = {
		{"", "default:glass", ""},
		{"default:glass", "default:coal_lump", "default:glass"},
		{"", "default:glass", ""},
	}
})

--workbench

minetest.register_craft({
	output = "default:workbench",
	recipe = {
		{"default:wood", "default:wood", "default:wood"},
	}
})

minetest.register_craft({
	output = "default:workbench_v2",
	recipe = {
		{"default:stone_tile", "default:stone_tile", "default:stone_tile"},
	}
})


-- string

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
	output = "default:string_strong",
	recipe = {
		{"default:liana"},
	}
})

-- rope

minetest.register_craft({
	output = "default:rope",
	recipe = {
		{"", "default:string_strong", ""},
		{"", "default:string_strong", ""},
		{"", "default:string_strong", ""},
	}
})



-- grass

minetest.register_craft({
	output = "default:plant_grass 3",
	recipe = {
		{"default:dirt_with_grass"},
	}
})

-- tools

minetest.register_craft({
	output = "default:simple_hammer",
	recipe = {
		{"", "default:log_1", ""},
		{"", "default:string_strong", ""},
		{"", "default:stick", ""},
	}
})

minetest.register_craft({
	output = "default:axe_stone",
	recipe = {
		{"", "default:stone_item", ""},
		{"", "default:string_strong", ""},
		{"", "default:stick", ""},
	}
})

minetest.register_craft({
	output = "default:shovel",
	recipe = {
		{"", "furnace:iron_plate", ""},
		{"", "default:string_strong", ""},
		{"", "default:stick", ""},
	}
})

minetest.register_craft({
	output = "default:flint_pick",
	recipe = {
		{"default:flint", "default:flint", "default:flint"},
		{"", "default:string_strong", ""},
		{"", "default:stick", ""},
	}
})

minetest.register_craft({
	output = "default:pick",
	recipe = {
		{"", "furnace:iron_rod", ""},
		{"", "default:string_strong", ""},
		{"", "default:stick", ""},
	}
})

minetest.register_craft({
	output = "default:pick_copper",
	recipe = {
		{"", "furnace:copper_rod", ""},
		{"", "default:string_strong", ""},
		{"", "default:stick", ""},
	}
})

minetest.register_craft({
	output = "default:pick_diamond",
	recipe = {
		{"", "furnace:diamond_rod", ""},
		{"", "default:string_strong", ""},
		{"", "default:stick", ""},
	}
})

minetest.register_craft({
	output = "default:axe",
	recipe = {
		{"default:blade", "furnace:iron_plate", ""},
		{"", "default:string_strong", ""},
		{"", "default:stick", ""},
	}
})
