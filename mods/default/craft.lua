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
