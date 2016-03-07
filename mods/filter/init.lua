filter = {}
filter.materials = {}

local filter_form = "size[8,6]"
local filter_form = filter_form..default.gui_colors
local filter_form = filter_form..default.gui_bg
local filter_form = filter_form.."list[current_name;main;3.5,0.3;1,1;]" 
local filter_form = filter_form..default.itemslot_bg(3.5,0.3,1,1)
local filter_form = filter_form.."list[current_player;main;0,1.85;8,1;]" 
local filter_form = filter_form..default.itemslot_bg(0,1.85,8,1)
local filter_form = filter_form.."list[current_player;main;0,3.08;8,3;8]" 
local filter_form = filter_form..default.itemslot_bg(0,3.08,8,3)

function filter.register_material(name, drops)
	filter.materials[name] = drops
end

filter.register_material("default:sand", {"default:stone_item", "default:stick", "default:sandstone"})
filter.register_material("default:dirt", {"default:stone_item", "default:stick", "default:twig", "default:flint"})
filter.register_material("default:gravel", {"default:diamond", "default:ruby", "default:twig", "default:stone_item", "default:flint", "default:flint", "default:flint"})

minetest.register_node("filter:filter", {
	description = "Filter",
	tiles = {"filter_filter_top.png", "filter_filter.png"},
	groups = {crumbly=3},
	on_punch = function(pos, node, player, pointed_thing)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		local item = inv:get_stack("main", 1)
		print("[filter] item : " .. item:to_string())
		if item:get_count() == 1 then
			if filter.materials[item:get_name()] then
				local mat = filter.materials[item:get_name()]
				inv:set_stack("main", 1, {name = mat[math.random(1, #mat)]})
			else
				meta:set_string("infotext", "[filter] This wont work...")
			end
		else
			meta:set_string("infotext", "[filter] Put only one item in the filter!")
		end
	end,
	
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", filter_form)
		meta:set_string("infotext", "Filter")
		local inv = meta:get_inventory()
		inv:set_size("main", 1)
	end,
})

minetest.register_craft({
	output = "filter:filter",
	recipe = {
		{"default:string_strong", "default:string_strong", "default:string_strong"},
		{"default:string_strong", "default:string_strong", "default:string_strong"},
		{"furnace:iron_rod", "furnace:iron_plate", "furnace:iron_rod"},
	}
})
