minetest.register_node("default:dirt", {
	description = "Dirt",
	tiles = {"default_dirt.png"},
	groups = {crumbly = 3},
})


minetest.register_node("default:dirt_with_snow", {
	description = "Dirt with Snow",
	tiles = {"default_snow.png", "default_dirt.png","default_dirt_with_snow.png"},
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

minetest.register_node("default:dry_grass", {
	description = "dry Grass",
	tiles = {"default_dry_grass.png"},
	groups = {crumbly = 3},
})

minetest.register_node("default:snow", {
	description = "Snow",
	tiles = {"default_snow.png"},
	groups = {crumbly = 3},
})

minetest.register_node("default:ice", {
	description = "Ice",
	tiles = {"default_ice.png"},
	groups = {crumbly = 3},
})

minetest.register_node("default:leaves_1", {
	description = "Leaves",
	paramtype = "light",
	drawtype = "allfaces",
	tiles = {"default_leaves_1.png"},
	groups = {crumbly = 3, leaves = 1},
	walkable = false,
	climbable = true,
})

minetest.register_node("default:leaves_2", {
	description = "Leaves",
	paramtype = "light",
	drawtype = "allfaces",
	tiles = {"default_leaves_2.png"},
	groups = {crumbly = 3, leaves = 1},
	walkable = false,
	climbable = true,
})

minetest.register_node("default:leaves_3", {
	description = "Leaves",
	paramtype = "light",
	drawtype = "allfaces",
	tiles = {"default_leaves_3.png"},
	groups = {crumbly = 3, leaves = 1},
	walkable = false,
	climbable = true,
})

minetest.register_node("default:leaves_4", {
	description = "Leaves",
	paramtype = "light",
	drawtype = "allfaces",
	tiles = {"default_leaves_4.png"},
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


-- box

local box_form = "size[8,9]"
local box_form = box_form..default.gui_colors
local box_form = box_form..default.gui_bg
local box_form = box_form.."list[current_name;main;0,0.3;8,4;]" 
local box_form = box_form..default.itemslot_bg(0,0.3,8,4)
local box_form = box_form.."list[current_player;main;0,4.85;8,1;]" 
local box_form = box_form..default.itemslot_bg(0,4.85,8,1)
local box_form = box_form.."list[current_player;main;0,6.08;8,3;8]" 
local box_form = box_form..default.itemslot_bg(0,6,8,3)

minetest.register_node("default:box", {
	description = "Box",
	tiles = {"default_wooden_planks.png", "default_wooden_planks.png", "default_box_side.png", "default_box_side.png", "default_box_side.png", "default_box_front.png"},
	groups = {choppy = 3},
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
				{-0.4, -0.5, -0.4, 0.4, 0.2, 0.4},
			},
	},
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", box_form)
		meta:set_string("infotext", "Box")
		local inv = meta:get_inventory()
		inv:set_size("main", 8*4)
	end,

})

minetest.register_node("default:treasure_chest", {
	description = "Treasure Chest",
	tiles = {"default_treasure_chest.png"},
	groups = {choppy = 3},
	drop = "default:box",
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		inv:set_size("main", 8*4)
		local items = {"default:dirt", "default:sand", "default:iron_lump", "default:stone_item", "default:coin", "default:gold_lump", "default:coal_lump"}
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

minetest.register_node("default:lamp", {
	description = "Lamp",
	tiles = {"default_lamp.png"},
	light_source = 14,
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
	post_effect_color = {a=50, r=0, g=64, b=200},
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

-- wood

minetest.register_node("default:wood", {
	description = "Wood",
	tiles = {"default_wood.png"},
	groups = {choppy = 3},
})

minetest.register_node("default:wooden_planks", {
	description = "Wooden Planks",
	tiles = {"default_wooden_planks.png"},
	groups = {choppy = 3},
})

-- log

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

-- plants

minetest.register_node("default:plant_grass", {
	description = "Grass (Plant)",
	tiles = {"default_plant_grass.png"},
	drawtype = "plantlike",
	paramtype = "light",
	inventory_image = "default_plant_grass.png",
	buildable_to = true,
	walkable = false,
	groups = {crumbly = 3, plant = 1},
})

minetest.register_node("default:flower_1", {
	description = "Flower",
	tiles = {"default_flower_1.png"},
	drawtype = "plantlike",
	paramtype = "light",
	inventory_image = "default_flower_1.png",
	buildable_to = true,
	walkable = false,
	groups = {crumbly = 3, plant = 1},
})

minetest.register_node("default:flower_2", {
	description = "Flower (glowing)",
	tiles = {"default_flower_2.png"},
	drawtype = "plantlike",
	paramtype = "light",
	inventory_image = "default_flower_2.png",
	light_source = 10,
	buildable_to = true,
	walkable = false,
	groups = {crumbly = 3, plant = 1},
})

-- frames

minetest.register_node("default:frame", {
	description = "Frame",
	tiles = {"default_frame.png"},
	drawtype = "allfaces",
	paramtype = "light",
	groups = {choppy = 3},
})

minetest.register_node("default:frame_with_wood", {
	description = "Frame with Wood",
	tiles = {"default_wood.png^default_frame.png"},
	groups = {choppy = 3},
})

minetest.register_node("default:frame_with_stonebrick", {
	description = "Frame with Stonebrick",
	tiles = {"default_stonebrick.png^default_frame.png"},
	groups = {choppy = 3},
})

minetest.register_node("default:frame_with_log", {
	description = "Frame with Log",
	tiles = {"default_log.png^default_frame.png"},
	groups = {choppy = 3},
})

-- glass

minetest.register_node("default:glass", {
	description = "Glass",
	tiles = {"default_glass.png"},
	drawtype = "glasslike",
	paramtype = "light",
	groups = {crumbly = 3},
})

minetest.register_node("default:glass_with_wood", {
	description = "Glass with Wood",
	tiles = {"default_wood.png^default_glass.png"},
	groups = {crumbly = 3},
})

minetest.register_node("default:glass_with_log", {
	description = "Glass with Log",
	tiles = {"default_log.png^default_glass.png"},
	groups = {crumbly = 3},
})

minetest.register_node("default:glass_with_stonebrick", {
	description = "Glass with Stonebrick",
	tiles = {"default_stonebrick.png^default_glass.png"},
	groups = {crumbly = 3},
})

-- floor

default.register_floor = function(color)
	minetest.register_node("default:floor_"..color, {
		description = color.." Floor",
		tiles = {"default_floor.png^[colorize:"..color..":120"},
		groups = {crumbly=3},
	})
end

default.register_floor("red")
default.register_floor("green")
default.register_floor("yellow")
default.register_floor("brown")
default.register_floor("white")
default.register_floor("black")

-- wool

default.register_wool = function(color)
	minetest.register_node("default:wool_"..color, {
		description = color.." Wool",
		tiles = {"default_wool.png^[colorize:"..color..":120"},
		groups = {crumbly=3},
	})
end

default.register_wool("red")
default.register_wool("green")
default.register_wool("yellow")
default.register_wool("brown")
default.register_wool("white")
default.register_wool("black")

-- stone

minetest.register_node("default:stone", {
	description = "Stone",
	tiles = {"default_stone.png"},
	groups = {cracky = 3, stone= 1},
	drop = "default:stone_item 5",
})

minetest.register_node("default:desert_stone", {
	description = "Desert Stone",
	tiles = {"default_stone.png^[colorize:orange:50"},
	groups = {cracky = 3},
	drop = "default:stone_item 5",
})

minetest.register_node("default:stone_tile", {
	description = "Stone Tile",
	tiles = {"default_stone_tile.png"},
	groups = {cracky = 3},
})

minetest.register_node("default:small_stone_tiles", {
	description = "Small Stone Tiles",
	tiles = {"default_small_stone_tile.png"},
	groups = {cracky = 3},
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

minetest.register_node("default:gravel", {
	description = "Gravel",
	tiles = {"default_gravel.png"},
	groups = {crumbly = 2, falling_node=1},
	drop = {
		max_items = 1,
		items = {
			{items = {'farming:wheat_seeds'},rarity = 5},
			{items = {'default:plant_grass'}},
		}
	}
})

-- ores

minetest.register_node("default:stone_with_coal", {
	description = "Stone with Coal",
	tiles = {"default_stone_with_coal.png"},
	groups = {cracky = 2},
	drop = "default:coal_lump",
})

minetest.register_node("default:stone_with_iron", {
	description = "Stone with Iron",
	tiles = {"default_stone_with_iron.png"},
	groups = {cracky = 2},
	drop = "default:iron_lump",
})

minetest.register_node("default:stone_with_gold", {
	description = "Stone with Gold",
	tiles = {"default_stone_with_gold.png"},
	groups = {cracky = 1},
	drop = "default:gold_lump",
})

minetest.register_node("default:stone_with_diamond", {
	description = "Stone with Diamond",
	tiles = {"default_stone_with_diamond.png"},
	groups = {cracky = 1},
	drop = "default:diamond",
})

minetest.register_node("default:stone_with_ruby", {
	description = "Stone with Ruby",
	tiles = {"default_stone_with_ruby.png"},
	groups = {cracky = 1},
	drop = "default:ruby",
})

-- rail


minetest.register_node("default:rail", {
	description = "Rail",
	drawtype = "raillike",
	tiles = {"default_rail.png", "default_rail_curve.png",
		"default_rail_t.png", "default_rail_cross.png"},
	inventory_image = "default_rail.png",
	wield_image = "default_rail.png",
	paramtype = "light",
	walkable = false,
	groups = {choppy = 1, attached_node = 1},
})

minetest.register_node("default:wire", {
	description = "Wire",
	drawtype = "raillike",
	tiles = {"default_wire.png", "default_wire_curve.png",
		"default_wire_t.png", "default_wire_cross.png"},
	inventory_image = "default_wire.png",
	wield_image = "default_wire.png",
	paramtype = "light",
	walkable = false,
	groups = {choppy = 1, attached_node = 1},
})
