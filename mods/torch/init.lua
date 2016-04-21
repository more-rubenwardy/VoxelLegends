minetest.register_node("torch:torch", {
	description = "Torch",
	tiles = {"torch_torch_floor.png", "torch_torch_ceiling.png", "torch_torch_wall.png"},
	drawtype = "torchlike",
	groups = {crumbly = 3},
	paramtype = "light",
	paramtype2 = "wallmounted",
	light_source = 14,
	walkable = false,
	inventory_image = "torch_torch_inv.png",
	legacy_wallmounted = true,
	selection_box = {
		type = "wallmounted",
		wall_top = {-0.1, 0.5 - 0.6, -0.1, 0.1, 0.5, 0.1},
		wall_bottom = {-0.1, -0.5, -0.1, 0.1, -0.5 + 0.6, 0.1},
		wall_side = {-0.5, -0.3, -0.1, -0.5 + 0.3, 0.3, 0.1},
	},
	wield_image = "torch_torch_inv.png",
})

minetest.register_craft({
	output = "torch:torch 4",
	recipe = {
		{"", "default:coal_lump", ""},
		{"", "default:string_strong", ""},
		{"", "default:stick", ""},
	}
})
