minetest.register_alias("mapgen_dirt", "default:dirt")
minetest.register_alias("mapgen_dirt_with_grass", "default:grass")
minetest.register_alias("mapgen_water_source", "default:water_source")
minetest.register_alias("mapgen_river_water_source", "default:water_source")

minetest.register_alias("mapgen_desert_stone", "default:desert_stone")
minetest.register_alias("mapgen_sand", "default:sand")
minetest.register_alias("mapgen_desert_sand", "default:sand")

minetest.register_alias("mapgen_tree", "default:log_1")
minetest.register_alias("mapgen_leaves", "default:leaves_1")

minetest.register_alias("mapgen_dirt_with_snow", "default:dirt_with_snow")
minetest.register_alias("mapgen_snowblock", "default:snow")
minetest.register_alias("mapgen_snow", "default:snow")
minetest.register_alias("mapgen_ice", "default:ice")
minetest.register_alias("mapgen_sandstone", "default:desert_stone")

minetest.register_alias("mapgen_gravel", "default:gravel")
minetest.register_alias("mapgen_stone", "default:stone")

minetest.register_alias("mapgen_cobble", "default:stonebrick")
minetest.register_alias("mapgen_stair_cobble", "default:stonebrick")
minetest.register_alias("mapgen_mossycobble", "default:stonebrick")
minetest.register_alias("mapgen_sandstonebrick", "default:stonebrick")
minetest.register_alias("mapgen_stair_sandstonebrick", "default:stonebrick")

minetest.register_biome({
      name = "tundra",
      node_top = "default:dirt_with_snow",
      node_filler = "default:dirt",
      depth_filler = 2,
      depth_top = 1,
      y_min = 1,
      y_max = 55,
      heat_point = 15,
      humidity_point = 35,
})

minetest.register_biome({
	name = "grassland",
	node_top = "default:grass",
	depth_top = 1,
	node_filler = "default:dirt",
	depth_filler = 0,
	y_min = 6,
	y_max = 31000,
	heat_point = 45,
	humidity_point = 30,
})

minetest.register_biome({
	name = "forest",
	node_top = "default:grass",
	depth_top = 1,
	node_filler = "default:dirt",
	depth_filler = 0,
	y_min = 6,
	y_max = 31000,
	heat_point = 25,
	humidity_point = 35,
})

minetest.register_biome({
	name = "beach",
	node_top = "default:sand",
	depth_top = 1,
	node_filler = "default:sand",
	depth_filler = 2,
	y_min = -112,
	y_max = 5,
	heat_point = 45,
	humidity_point = 30,
})

minetest.register_biome({
	name = "swamp",
	node_top = "default:dirt",
	depth_top = 1,
	node_filler = "default:dirt",
	depth_filler = 2,
	node_stone = "default:wet_stone",
	y_min = -3,
	y_max = 4,
	heat_point = 95,
	humidity_point = 90,
})


minetest.register_biome({
      name = "savanna",
      node_top = "default:dry_grass",
      node_filler = "default:dirt",
      depth_filler = 2,
      depth_top = 1,
      y_min = 1,
      y_max = 55,
      heat_point = 60,
      humidity_point = 25,
})

minetest.register_biome({
      name = "savanna",
      node_top = "default:dry_grass",
      node_filler = "default:dirt",
      depth_filler = 2,
      depth_top = 1,
      y_min = 1,
      y_max = 55,
      heat_point = 60,
      humidity_point = 25,
})

minetest.register_biome({
      name = "desert",
      node_top = "default:sand",
      node_filler = "default:desert_stone",
      depth_filler = 2,
      depth_top = 1,
      y_min = 1,
      y_max = 256,
      heat_point = 80,
      humidity_point = 20,
})
-- deco

minetest.register_decoration({
	deco_type = "simple",
	place_on = {"default:grass"},
	sidelen = 16,
	noise_params = {
		offset = -0.015,
		scale = 0.5,
		spread = {x=200, y=200, z=200},
		seed = 329,
		octaves = 3,
		persist = 0.6
	},
	biomes = {
		"grassland"
	},
	y_min = 0,
	y_max = 31000,
	decoration = "default:plant_grass",
})

minetest.register_decoration({
	deco_type = "simple",
	place_on = {"default:sand"},
	sidelen = 16,
	noise_params = {
		offset = -0.015,
		scale = 0.05,
		spread = {x=200, y=200, z=200},
		seed = 329,
		octaves = 3,
		persist = 0.6
	},
	biomes = {
		"beach"
	},
	y_min = 0,
	y_max = 31000,
	decoration = "default:plant_grass",
})

-- ores

minetest.register_ore({
	ore_type        = "blob",
	ore             = "default:gravel",
	wherein         = {"default:stone"},
	clust_scarcity  = 16 * 16 * 16,
	clust_size      = 5,
	y_min           = -31000,
	y_max           = 31000,
	noise_threshold = 0.0,
	noise_params    = {
		offset = 0.5,
		scale = 0.2,
		spread = {x = 5, y = 5, z = 5},
		seed = 766,
		octaves = 1,
		persist = 0.0
	},
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "default:stone_with_coal",
	wherein        = "default:stone",
	clust_scarcity = 24 * 24 * 24,
	clust_num_ores = 27,
	clust_size     = 6,
	y_min          = -31000,
	y_max          = 30,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "default:stone_with_iron",
	wherein        = "default:stone",
	clust_scarcity = 9*9*9,
	clust_num_ores = 5,
	clust_size     = 3,
	y_min          = -31000,
	y_max          = 2,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "default:stone_with_gold",
	wherein        = "default:stone",
	clust_scarcity = 9*9*9,
	clust_num_ores = 5,
	clust_size     = 3,
	y_min          = -31000,
	y_max          = -256,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "default:stone_with_diamond",
	wherein        = "default:stone",
	clust_scarcity = 36 * 36 * 36,
	clust_num_ores = 3,
	clust_size     = 2,
	y_min          = -31000,
	y_max          = -256,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "default:stone_with_ruby",
	wherein        = "default:stone",
	clust_scarcity = 17*17*17,
	clust_num_ores = 4,
	clust_size     = 5,
	y_min          = -31000,
	y_max          = -256,
})

