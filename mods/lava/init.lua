minetest.register_node("lava:lava_source", {
	description = "Lava Source",
	drawtype = "liquid",
	tiles = {"lava_lava.png"},
	walkable = false,
	pointable = false,
	diggable = false,
	buildable = false,
	buildable_to = true,
	paramtype = "light",
	alpha = 160,
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "lava:lava_flowing",
	liquid_alternative_source = "lava:lava_source",
	liquid_viscosity = 6,
	groups = {liquid=3, lava = 1},
	post_effect_color = {a=100, r=200, g=64, b=0},
	damage_per_second = 4 * 2,
	light_source = 10,
})

minetest.register_node("lava:lava_flowing", {
	description = "Lava Flowing",
	tiles = {"lava_lava.png"},
	special_tiles = {
		{
			name = "lava_lava.png",
			backface_culling = false,
		},
		{
			name = "lava_lava.png",
			backface_culling = true,
		},
	},
	walkable = false,
	drawtype = "flowingliquid",
	pointable = false,
	diggable = false,
	buildable = false,
	buildable_to = true,
	alpha = 160,
	drowning = 1,
	paramtype = "light",
	liquidtype = "flowing",
	liquid_alternative_flowing = "lava:lava_flowing",
	liquid_alternative_source = "lava:lava_source",
	liquid_viscosity = 6,
	groups = {liquid=3, not_in_creative_inventory=1, lava = 1},
	post_effect_color = {a=100, r=200, g=64, b=0},
	damage_per_second = 4 * 2,
	light_source = 10,
})

minetest.register_node("lava:basalt", {
	description = "Basalt",
	tiles = {"lava_basalt.png"},
	groups = {cracky = 3, stone = 1},
})

minetest.register_abm({
	nodenames = {"group:lava"},
	neighbors = {"group:water"},
	interval = 1.0,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		minetest.set_node(pos, {name = "lava:basalt"})
	end,
})

minetest.register_alias("mapgen_lava_source", "lava:lava_source")
