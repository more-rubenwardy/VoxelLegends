stairs = {}
function stairs.register_stair_and_slab(name, base)
	if not minetest.registered_nodes[base] then 
		return
	end

	minetest.register_node(name.."_slab", {
		description = minetest.registered_nodes[base].description .. " Slab",
		tiles = minetest.registered_nodes[base].tiles,
		groups = minetest.registered_nodes[base].groups,
		paramtype = "light",
		drawtype = "nodebox",
		node_box = {
			type = "fixed",
			fixed = {
					{-0.5, -0.5, -0.5, 0.5, 0, 0.5},
				},
		},
		sounds = minetest.registered_nodes[base].sounds or nil,
	})
	minetest.register_node(name.."_stair", {
		description = minetest.registered_nodes[base].description .. " Stair",
		tiles = minetest.registered_nodes[base].tiles,
		groups = minetest.registered_nodes[base].groups,
		paramtype = "light",
		paramtype2 = "facedir",
		drawtype = "nodebox",
		node_box = {
			type = "fixed",
			fixed = {
					{-0.5, -0.5, -0.5, 0.5, 0, 0.5},
					{-0.5, -0.5, 0, 0.5, 0.5, 0.5},
				},
		},
		sounds = minetest.registered_nodes[base].sounds or nil,
	})

	minetest.register_node(name.."_stair_corner_1", {
		description = minetest.registered_nodes[base].description .. " Corner",
		tiles = minetest.registered_nodes[base].tiles,
		groups = minetest.registered_nodes[base].groups,
		paramtype = "light",
		paramtype2 = "facedir",
		drawtype = "nodebox",
		node_box = {
			type = "fixed",
			fixed = {
					{-0.5, -0.5, -0.5, 0.5, 0, 0.5},
					{-0.5, -0.5, 0, 0.5, 0.5, 0.5},
					{0, -0.5, -0.5, 0.5, 0.5, 0.5},
				},
		},
		sounds = minetest.registered_nodes[base].sounds or nil,
	})

	minetest.register_node(name.."_stair_corner_2", {
		description = minetest.registered_nodes[base].description .. " Corner",
		tiles = minetest.registered_nodes[base].tiles,
		groups = minetest.registered_nodes[base].groups,
		paramtype = "light",
		paramtype2 = "facedir",
		drawtype = "nodebox",
		node_box = {
			type = "fixed",
			fixed = {
					{-0.5, -0.5, -0.5, 0.5, 0, 0.5},
					{0, -0.5, 0, 0.5, 0.5, 0.5},
				},
		},
		sounds = minetest.registered_nodes[base].sounds or nil,
	})

	minetest.register_node(name.."_wall", {
		description = minetest.registered_nodes[base].description .. " Wall",
		tiles = minetest.registered_nodes[base].tiles,
		groups = minetest.registered_nodes[base].groups,
		paramtype = "light",
		paramtype2 = "facedir",
		drawtype = "nodebox",
		node_box = {
			type = "fixed",
			fixed = {
					{-0.5, -0.5, 0, 0.5, 0.5, 0.5},
				},
		},
		sounds = minetest.registered_nodes[base].sounds or nil,
	})

	minetest.register_node(name.."_wall_corner_1", {
		description = minetest.registered_nodes[base].description .. " Corner",
		tiles = minetest.registered_nodes[base].tiles,
		groups = minetest.registered_nodes[base].groups,
		paramtype = "light",
		paramtype2 = "facedir",
		drawtype = "nodebox",
		node_box = {
			type = "fixed",
			fixed = {
					{-0.5, -0.5, 0, 0.5, 0.5, 0.5},
					{0, -0.5, -0.5, 0.5, 0.5, 0.5},
				},
		},
		sounds = minetest.registered_nodes[base].sounds or nil,
	})

	minetest.register_node(name.."_wall_corner_2", {
		description = minetest.registered_nodes[base].description .. " Corner",
		tiles = minetest.registered_nodes[base].tiles,
		groups = minetest.registered_nodes[base].groups,
		paramtype = "light",
		paramtype2 = "facedir",
		drawtype = "nodebox",
		node_box = {
			type = "fixed",
			fixed = {
					{0, -0.5, 0, 0.5, 0.5, 0.5},
				},
		},
		sounds = minetest.registered_nodes[base].sounds or nil,
	})
	minetest.register_craft({
		output = name.."_stair 3",
		recipe = {
			{base, ""},
			{base, base},
		}
	})
	minetest.register_craft({
		output = name.."_slab 4",
		recipe = {
			{base, base},
		}
	})
end

stairs.register_stair_and_slab("stairs:stonebrick", "default:stonebrick")
stairs.register_stair_and_slab("stairs:stone_tile", "default:stone_tile")
stairs.register_stair_and_slab("stairs:stone", "default:stone")
stairs.register_stair_and_slab("stairs:cobble", "default:cobble")
stairs.register_stair_and_slab("stairs:brick", "default:brick")
stairs.register_stair_and_slab("stairs:basalt", "lava:basalt")
stairs.register_stair_and_slab("stairs:wood", "default:wood")
stairs.register_stair_and_slab("stairs:wooden_planks", "default:wooden_planks")
