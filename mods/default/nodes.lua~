minetest.register_node("default:dirt", {
	description = "Dirt",
	tiles = {"default_dirt.png"},
	groups = {crumbly = 3},
})

minetest.register_node("default:sand", {
	description = "Sand",
	tiles = {"default_sand.png"},
	groups = {crumbly = 3},
})

minetest.register_node("default:grass", {
	description = "Grass",
	tiles = {"default_grass.png"},
	groups = {crumbly = 3},
})

minetest.register_node("default:stone", {
	description = "Stone",
	tiles = {"default_stone.png"},
	groups = {cracky = 3},
	drop = "default:stone_item 5",
})

minetest.register_node("default:stonebrick", {
	description = "Stonebrick",
	tiles = {"default_stonebrick.png"},
	groups = {cracky = 3},
})

minetest.register_node("default:wet_stone", {
	description = "Wet Stone",
	tiles = {"default_wet_stone.png"},
	groups = {cracky = 3},
	drop = {"default:stone_item 5"},
})

minetest.register_node("default:stone_with_iron", {
	description = "Stone with Iron",
	tiles = {"default_stone_with_iron.png"},
	groups = {cracky = 2},
	drop = {"default:stone_item 2", "default:iron_lump"},
})

minetest.register_node("default:wood", {
	description = "Wood",
	tiles = {"default_wood.png"},
	groups = {choppy = 3},
})

minetest.register_node("default:leaves_1", {
	description = "leaves",
	paramtype = "light",
	drawtype = "allfaces",
	tiles = {"default_leaves_1.png"},
	groups = {crumbly = 3, leaves = 1},
	walkable = false,
	climbable = true,
})

minetest.register_node("default:stones_on_floor", {
	description = "Stones on Floor",
	tiles = {"default_stones_on_floor.png"},
	groups = {snappy = 3},
	paramtype = "light",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
				{-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5},
			},
	},
	drop = "default:stone_item 2",

})

minetest.register_node("default:log_1", {
	description = "Log (thick)",
	tiles = {"default_log.png"},
	groups = {choppy = 3},
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
				{-0.4, -0.5, -0.4, 0.4, 0.5, 0.4},
			},
	},

})

minetest.register_node("default:log_2", {
	description = "Log",
	tiles = {"default_log.png"},
	groups = {choppy = 3},
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
				{-0.3, -0.5, -0.3, 0.3, 0.5, 0.3},
			},
	},

})

minetest.register_node("default:log_3", {
	description = "Log (thin)",
	tiles = {"default_log.png"},
	groups = {choppy = 3},
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
				{-0.2, -0.5, -0.2, 0.2, 0.5, 0.2},
			},
	},
})



minetest.register_node("default:box", {
	description = "Box",
	tiles = {"default_log.png"},
	groups = {choppy = 3},
	paramtype = "light",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
				{-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5},
				{-0.5, -0.5, -0.5, -0.4375, 0.5, 0.5},
				{-0.5, -0.5, -0.5, 0.5, 0.5, -0.4375},
				{-0.5, -0.5, 0.4375, 0.5, 0.5, 0.5},
				{0.4375, -0.5, -0.5, 0.5, 0.5, 0.5},
			},
	},

})

minetest.register_node("default:treasure_chest", {
	description = "Treasure Chest",
	tiles = {"default_treasure_chest.png"},
	groups = {choppy = 3},
	drop = "default:stick 2",
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		inv:set_size("main", 8*4)
		local items = {"default:dirt", "default:sand", "default:iron_lump", "default:stone_item", "default:coin"}
		local item = items[math.random(5)]
		inv:add_item("main", {name = item, count = math.random(2,10)})
		local item = items[math.random(5)]
		inv:add_item("main", {name = item, count = math.random(2,10)})
	end,
	after_dig_node = function(pos, oldnode, oldmetadata, digger)
		local meta = minetest.get_meta(pos)
		meta:from_table(oldmetadata)
		local inv = meta:get_inventory()
		for i = 1, inv:get_size("main") do
			local stack = inv:get_stack("main", i)
			if not stack:is_empty() then
				local p = {	x = pos.x + math.random(0, 5)/5 - 0.5,
						y = pos.y, 
						z = pos.z + math.random(0, 5)/5 - 0.5
					  }
				minetest.add_item(p, stack)
			end
		end
	end
})

minetest.register_node("default:glass", {
	description = "Glass",
	tiles = {"default_glass.png"},
	drawtype = "glasslike",
	paramtype = "light",
	groups = {crumbly = 3},
})

minetest.register_node("default:present", {
	description = "Present",
	tiles = {"default_present_top.png", "default_present_top.png", "default_present_side.png", "default_present_side.png", "default_present_side.png", "default_present_side.png"},
	groups = {crumbly = 3},
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
				{-0.4, -0.5, -0.4, 0.4, 0, 0.4},
			},
	},
	paramtype = "light",
})

minetest.register_node("default:present_big", {
	description = "Present (big)",
	tiles = {"default_present_top.png", "default_present_top.png", "default_present_side.png", "default_present_side.png", "default_present_side.png", "default_present_side.png"},
	groups = {crumbly = 3},
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
				{-0.4, -0.5, -0.4, 0.4, 0.4, 0.4},
			},
	},
	paramtype = "light",
})


minetest.register_node("default:ladder", {
	description = "Ladder",
	drawtype = "signlike",
	tiles = {"default_ladder.png"},
	inventory_image = "default_ladder.png",
	wield_image = "default_ladder.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	climbable = true,
	is_ground_content = false,
	selection_box = {
		type = "wallmounted",
	},
	groups = {crumbly = 3},
	legacy_wallmounted = true,
})
-- flowing and sources

minetest.register_node("default:water_source", {
	description = "Water Source",
	drawtype = "liquid",
	tiles = {"default_water.png"},
	walkable = false,
	pointable = false,
	diggable = false,
	buildable = false,
	buildable_to = true,
	paramtype = "light",
	alpha = 160,
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "default:water_flowing",
	liquid_alternative_source = "default:water_source",
	liquid_viscosity = 3,
	groups = {liquid=3, water = 1},
	post_effect_color = {a=100, r=0, g=64, b=200},
})

minetest.register_node("default:water_flowing", {
	description = "Water Flowing",
	tiles = {"default_water.png"},
	special_tiles = {
		{
			name = "default_water.png",
			backface_culling = false,
		},
		{
			name = "default_water.png",
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
	liquid_alternative_flowing = "default:water_flowing",
	liquid_alternative_source = "default:water_source",
	liquid_viscosity = 3,
	groups = {liquid=3, not_in_creative_inventory=1, water = 1},
	post_effect_color = {a=100, r=0, g=64, b=200},
})

-- plants

minetest.register_node("default:plant_grass", {
	description = "Grass (Plant)",
	tiles = {"default_plant_grass.png"},
	drawtype = "plantlike",
	paramtype = "light",
	invetory_image = "default_plant_grass.png",
	builtable = false,
	walkable = false,
	groups = {crumbly = 3, plant = 1},
})

minetest.register_node("default:flower_1", {
	description = "Flower",
	tiles = {"default_flower_1.png"},
	drawtype = "plantlike",
	paramtype = "light",
	invetory_image = "default_flower_1.png",
	builtable = false,
	walkable = false,
	groups = {crumbly = 3, plant = 1},
})

minetest.register_node("default:flower_2", {
	description = "Flower (glowing)",
	tiles = {"default_flower_2.png"},
	drawtype = "plantlike",
	paramtype = "light",
	invetory_image = "default_flower_2.png",
	light_source = 10,
	builtable = false,
	walkable = false,
	groups = {crumbly = 3, plant = 1},
})
