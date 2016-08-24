minetest.register_node("default:dirt", {
	description = "Dirt",
	tiles = {"default_dirt.png"},
	groups = {crumbly = 3},
	sounds = default.sounds.dirt(),
	drop = {
		max_items = 1,
		items = {
			{items = {'default:stone_item'},rarity = 5},
			{items = {'default:dirt'}},
		}
	},
})


minetest.register_node("default:dirt_with_snow", {
	description = "Dirt with Snow",
	tiles = {"default_snow.png", "default_dirt.png","default_dirt_with_snow.png"},
	groups = {crumbly = 3},
	sounds = default.sounds.dirt(),
})

minetest.register_node("default:sand", {
	description = "Sand",
	tiles = {"default_sand.png"},
	groups = {crumbly = 3, falling_node=1},
	sounds = default.sounds.dirt(),
})

minetest.register_node("default:clay", {
	description = "Clay",
	tiles = {"default_clay.png"},
	groups = {crumbly = 3},
	drop = 'default:clay_lump 4',
	sounds = default.node_sound_dirt_defaults(),
})

minetest.register_node("default:wet_grass", {
	description = "Wet Grass",
	tiles = {"default_grass_wet.png"},
	groups = {crumbly = 3},
	sounds = default.sounds.dirt(),
	drop = {
		max_items = 1,
		items = {
			{items = {'default:stone_item'},rarity = 5},
			{items = {'default:wet_grass'}},
		}
	},
})

minetest.register_node("default:dirt_with_grass_flowers", {
	description = "Grass with flowers",
	tiles = {"default_grass_flowers.png"},
	groups = {crumbly = 3},
	sounds = default.sounds.dirt(),
})

minetest.register_node("default:dirt_with_grass", {
	description = "Grass",
	tiles = {"default_grass.png"},
	groups = {crumbly = 3},
	sounds = default.sounds.dirt(),
	drop = {
		max_items = 1,
		items = {
			{items = {'default:stone_item'},rarity = 5},
			{items = {'default:grass'}},
		}
	},
})

minetest.register_node("default:dry_grass", {
	description = "dry Grass",
	tiles = {"default_dry_grass.png"},
	groups = {crumbly = 3},
	sounds = default.sounds.dirt(),
})

minetest.register_node("default:snow", {
	description = "Snow",
	tiles = {"default_snow.png"},
	groups = {crumbly = 3},
	sounds = default.sounds.dirt(),
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
	drop = {
		max_items = 1,
		items = {
			{items = {"default:sapling 2"},rarity = 3},
			{items = {'default:leaves_1'}},
		}
	},
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

minetest.register_alias("default:leaves", "default:leaves_1")

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

minetest.register_node("default:rope", {
	description = "Rope",
	tiles = {"default_rope.png"},
	groups = {snappy = 3},
	paramtype = "light",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
				{-0.1, -0.5, -0.1, 0.1, 0.5, 0.1},
			},
	},
	walkable = false,
	climbable = true,
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
local box_form = box_form..default.itemslot_bg(0,6.08,8,3)
local box_form = box_form.."listring[current_name;main]"
local box_form = box_form.."listring[current_player;main]"

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
	after_dig_node = default.drop_items,
})

default.treasure_chest_items = {"money:coin", "money:silver_coin", "default:ruby"}
minetest.register_node("default:treasure_chest", {
	description = "Treasure Chest",
	tiles = {"default_treasure_chest.png"},
	groups = {choppy = 3},
	drop = "default:box",
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		inv:set_size("main", 8*4)
		local items = default.treasure_chest_items
		local item = items[math.random(#items)]
		inv:add_item("main", {name = item, count = math.random(1,3)})
		local item = items[math.random(#items)]
		inv:add_item("main", {name = item, count = math.random(1,3)})
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


local chest_formspec =
	"size[8,9]" ..
	default.gui_bg ..
	default.gui_bg_img ..
	default.gui_slots ..
	"list[current_name;main;0,0.3;8,4;]" ..
	"list[current_player;main;0,4.85;8,1;]" ..
	"list[current_player;main;0,6.08;8,3;8]" ..
	"listring[current_name;main]" ..
	"listring[current_player;main]" ..
	default.get_hotbar_bg(0,4.85)

local function get_locked_chest_formspec(pos)
	local spos = pos.x .. "," .. pos.y .. "," .. pos.z
	local formspec =
		"size[8,9]" ..
		default.gui_bg ..
		default.gui_bg_img ..
		default.gui_slots ..
		"list[nodemeta:" .. spos .. ";main;0,0.3;8,4;]" ..
		"list[current_player;main;0,4.85;8,1;]" ..
		"list[current_player;main;0,6.08;8,3;8]" ..
		"listring[nodemeta:" .. spos .. ";main]" ..
		"listring[current_player;main]" ..
		default.get_hotbar_bg(0,4.85)
 return formspec
end

local function has_locked_chest_privilege(meta, player)
	local name = ""
	if player then
		if minetest.check_player_privs(player, "protection_bypass") then
			return true
		end
		name = player:get_player_name()
	end
	if name ~= meta:get_string("owner") then
		return false
	end
	return true
end

minetest.register_node("default:chest", {
	description = "Chest",
	tiles = {"default_chest_top.png", "default_chest_top.png", "default_chest_side.png",
		"default_chest_side.png", "default_chest_side.png", "default_chest_front.png"},
	paramtype2 = "facedir",
	groups = {choppy = 2, oddly_breakable_by_hand = 2},
	legacy_facedir_simple = true,
	is_ground_content = false,
	sounds = default.node_sound_wood_defaults(),

	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", chest_formspec)
		local inv = meta:get_inventory()
		inv:set_size("main", 8*4)
	end,
	can_dig = function(pos,player)
		local meta = minetest.get_meta(pos);
		local inv = meta:get_inventory()
		return inv:is_empty("main")
	end,
	on_metadata_inventory_move = function(pos, from_list, from_index,
			to_list, to_index, count, player)
		minetest.log("action", player:get_player_name() ..
			" moves stuff in chest at " .. minetest.pos_to_string(pos))
	end,
    on_metadata_inventory_put = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name() ..
			" moves " .. stack:get_name() ..
			" to chest at " .. minetest.pos_to_string(pos))
	end,
    on_metadata_inventory_take = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name() ..
			" takes " .. stack:get_name() ..
			" from chest at " .. minetest.pos_to_string(pos))
	end,
	on_blast = function(pos)
		local drops = {}
		default.get_inventory_drops(pos, "main", drops)
		drops[#drops+1] = "default:chest"
		minetest.remove_node(pos)
		return drops
	end,
})

minetest.register_node("default:chest_locked", {
	description = "Locked Chest",
	tiles = {"default_chest_top.png", "default_chest_top.png", "default_chest_side.png",
		"default_chest_side.png", "default_chest_side.png", "default_chest_lock.png"},
	paramtype2 = "facedir",
	groups = {choppy = 2, oddly_breakable_by_hand = 2},
	legacy_facedir_simple = true,
	is_ground_content = false,
	sounds = default.node_sound_wood_defaults(),

	after_place_node = function(pos, placer)
		local meta = minetest.get_meta(pos)
		meta:set_string("owner", placer:get_player_name() or "")
		meta:set_string("infotext", "Locked Chest (owned by " ..
				meta:get_string("owner") .. ")")
	end,
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("owner", "")
		local inv = meta:get_inventory()
		inv:set_size("main", 8 * 4)
	end,
	can_dig = function(pos,player)
		local meta = minetest.get_meta(pos);
		local inv = meta:get_inventory()
		return inv:is_empty("main") and has_locked_chest_privilege(meta, player)
	end,
	allow_metadata_inventory_move = function(pos, from_list, from_index,
			to_list, to_index, count, player)
		local meta = minetest.get_meta(pos)
		if not has_locked_chest_privilege(meta, player) then
			return 0
		end
		return count
	end,
    allow_metadata_inventory_put = function(pos, listname, index, stack, player)
		local meta = minetest.get_meta(pos)
		if not has_locked_chest_privilege(meta, player) then
			return 0
		end
		return stack:get_count()
	end,
    allow_metadata_inventory_take = function(pos, listname, index, stack, player)
		local meta = minetest.get_meta(pos)
		if not has_locked_chest_privilege(meta, player) then
			return 0
		end
		return stack:get_count()
	end,
    on_metadata_inventory_put = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name() ..
			" moves " .. stack:get_name() ..
			" to locked chest at " .. minetest.pos_to_string(pos))
	end,
    on_metadata_inventory_take = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name() ..
			" takes " .. stack:get_name()  ..
			" from locked chest at " .. minetest.pos_to_string(pos))
	end,
	on_rightclick = function(pos, node, clicker)
		local meta = minetest.get_meta(pos)
		if has_locked_chest_privilege(meta, clicker) then
			minetest.show_formspec(
				clicker:get_player_name(),
				"default:chest_locked",
				get_locked_chest_formspec(pos)
			)
		end
	end,
	on_blast = function() end,
})

minetest.register_node("default:apple", {
	description = "Apple",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"default_apple.png"},
	inventory_image = "default_apple.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.2, -0.5, -0.2, 0.2, 0, 0.2}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "default:apple", param2 = 1})
		end
	end,
})


minetest.register_node("default:torch", {
	description = "Torch",
	drawtype = "torchlike",
	tiles = {
		{
			name = "default_torch_on_floor_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.0
			},
		},
		{
			name="default_torch_on_ceiling_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.0
			},
		},
		{
			name="default_torch_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.0
			},
		},
	},
	inventory_image = "default_torch_on_floor.png",
	wield_image = "default_torch_on_floor.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	is_ground_content = false,
	walkable = false,
	light_source = default.LIGHT_MAX - 1,
	selection_box = {
		type = "wallmounted",
		wall_top = {-0.1, 0.5 - 0.6, -0.1, 0.1, 0.5, 0.1},
		wall_bottom = {-0.1, -0.5, -0.1, 0.1, -0.5 + 0.6, 0.1},
		wall_side = {-0.5, -0.3, -0.1, -0.5 + 0.3, 0.3, 0.1},
	},
	groups = {choppy = 2, dig_immediate = 3, flammable = 1, attached_node = 1},
	legacy_wallmounted = true,
	sounds = default.node_sound_defaults(),
})

minetest.register_node("default:lamp", {
	description = "Lamp",
	tiles = {"default_lamp.png"},
	light_source = 14,
	groups = {crumbly = 3},
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
	sounds = default.sounds.wood(),
})

minetest.register_node("default:wooden_planks", {
	description = "Wooden Planks",
	tiles = {"default_wooden_planks.png"},
	groups = {choppy = 3},
	sounds = default.sounds.wood(),
})

minetest.register_node("default:wooden_planks_2", {
	description = "Wooden Planks",
	tiles = {"default_wooden_planks_2.png"},
	groups = {choppy = 3},
	sounds = default.sounds.wood(),
})

minetest.register_node("default:jungle_wood", {
	description = "Jungle Wood",
	tiles = {"default_jungle_wood.png"},
	groups = {choppy = 3},
	sounds = default.sounds.wood(),
})

minetest.register_node("default:wooden_planks_jungle", {
	description = "Wooden Planks (Jungle wood)",
	tiles = {"default_wooden_planks_jungle.png"},
	groups = {choppy = 3},
	sounds = default.sounds.wood(),
})

minetest.register_node("default:wooden_planks_2_jungle", {
	description = "Wooden Planks (Jungle wood)",
	tiles = {"default_wooden_planks_2_jungle.png"},
	groups = {choppy = 3},
	sounds = default.sounds.wood(),
})

-- log

minetest.register_alias("default:tree", "default:log_1")

minetest.register_node("default:log", {
	description = "Log",
	tiles = {"default_log_top.png","default_log_top.png","default_log.png"},
	groups = {choppy = 3},
	sounds = default.sounds.wood(),
})

minetest.register_node("default:log_1", {
	description = "Log (thick)",
	tiles = {"default_log_top.png","default_log_top.png","default_log.png"},
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
	sounds = default.sounds.wood(),
})

minetest.register_node("default:log_2", {
	description = "Log",
	tiles = {"default_log_top.png","default_log_top.png","default_log.png"},
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
	sounds = default.sounds.wood(),
})

minetest.register_node("default:log_3", {
	description = "Log (thin)",
	tiles = {"default_log_top.png","default_log_top.png","default_log.png"},
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
	sounds = default.sounds.wood(),
})

minetest.register_node("default:jungle_tree", {
	description = "Jungle Tree",
	tiles = {"default_jungle_tree_top.png", "default_jungle_tree_top.png", "default_jungle_tree.png"},
	groups = {choppy = 3},
	sounds = default.sounds.wood(),
})

-- plants

minetest.register_node("default:sapling", {
	description = "Sapling",
	tiles = {"default_sapling.png"},
	drawtype = "plantlike",
	paramtype = "light",
	inventory_image = "default_sapling.png",
	buildable_to = true,
	walkable = false,
	groups = {crumbly = 3, sapling = 1},
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -0.4, 0.5},
	},
})

minetest.register_abm({
	nodenames = {"default:sapling"},
	neighbors = {"default:dirt_with_grass", "default:dirt"},
	interval = 1.0,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		minetest.set_node(pos, {name = "air"})
		if math.random(2) == 1 then
			local path = minetest.get_modpath("default") .. "/schematics/tree2.mts"
			minetest.place_schematic({x = pos.x - 1, y = pos.y - 0, z = pos.z - 1}, path, 0, nil, false)
		else
			local path = minetest.get_modpath("default") .. "/schematics/tree1.mts"
			minetest.place_schematic({x = pos.x - 2, y = pos.y - 0, z = pos.z - 2}, path, 0, nil, false)
		end
	end,
})

minetest.register_node("default:plant_grass", {
	description = "Grass (Plant)",
	tiles = {"default_plant_grass.png"},
	drawtype = "plantlike",
	paramtype = "light",
	inventory_image = "default_plant_grass.png",
	buildable_to = true,
	walkable = false,
	groups = {crumbly = 3, plant = 1},
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -0.4, 0.5},
	},
})

minetest.register_node("default:plant_grass_2", {
	description = "Grass (Plant)",
	tiles = {"default_plant_grass_2.png"},
	drawtype = "plantlike",
	paramtype = "light",
	inventory_image = "default_plant_grass_2.png",
	buildable_to = true,
	walkable = false,
	groups = {crumbly = 3, plant = 1},
	drop = "default:plant_grass",
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -0.4, 0.5},
	},
})

minetest.register_node("default:plant_grass_3", {
	description = "Grass (Plant)",
	tiles = {"default_plant_grass_3.png"},
	drawtype = "plantlike",
	paramtype = "light",
	inventory_image = "default_plant_grass_3.png",
	buildable_to = true,
	walkable = false,
	groups = {crumbly = 3, plant = 1},
	drop = "default:plant_grass",
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -0.4, 0.5},
	},
})

minetest.register_node("default:plant_grass_4", {
	description = "Grass (Plant)",
	tiles = {"default_plant_grass_4.png"},
	drawtype = "plantlike",
	paramtype = "light",
	inventory_image = "default_plant_grass_4.png",
	buildable_to = true,
	walkable = false,
	groups = {crumbly = 3, plant = 1},
	drop = "default:plant_grass",
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -0.4, 0.5},
	},
})

minetest.register_node("default:plant_grass_5", {
	description = "Grass (Plant)",
	tiles = {"default_plant_grass_5.png"},
	drawtype = "plantlike",
	paramtype = "light",
	inventory_image = "default_plant_grass_5.png",
	buildable_to = true,
	walkable = false,
	groups = {crumbly = 3, plant = 1},
	drop = "default:plant_grass",
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -0.4, 0.5},
	},
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
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -0.4, 0.5},
	},
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
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -0.4, 0.5},
	},
})

minetest.register_node("default:mushroom", {
	description = "Mushroom",
	tiles = {"default_mushroom.png"},
	drawtype = "plantlike",
	paramtype = "light",
	inventory_image = "default_mushroom_inv.png",
	buildable_to = true,
	walkable = false,
	groups = {crumbly = 3, plant = 1},
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -0.4, 0.5},
	},
})

minetest.register_abm({
	nodenames = {"default:mushroom"},
	neighbors = {"default:dirt"},
	interval = 20,
	chance = 2,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local p = {x = pos.x + math.random(-1,1), y = pos.y, z = pos.z + math.random(-1,1)}
		local under = vector.new(p.x, p.y-1, p.z)
		if minetest.get_node(p).name == "air" and minetest.get_node(under).name == "default:dirt" then
			minetest.set_node(p, {name = "default:mushroom"})
		end
	end,
})

minetest.register_node("default:liana", {
	description = "Liana",
	drawtype = "signlike",
	tiles = {"default_liana.png"},
	inventory_image = "default_liana.png",
	wield_image = "default_liana.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	climbable = true,
	is_ground_content = false,
	selection_box = {
		type = "wallmounted",
	},
	groups = {crumbly = 3, plant = 1},
	legacy_wallmounted = true,
})


local function register_sign(material, desc, def)
	minetest.register_node("default:sign_wall_" .. material, {
		description = desc .. " Sign",
		drawtype = "nodebox",
		tiles = {"default_sign_wall_" .. material .. ".png"},
		inventory_image = "default_sign_" .. material .. ".png",
		wield_image = "default_sign_" .. material .. ".png",
		paramtype = "light",
		paramtype2 = "wallmounted",
		sunlight_propagates = true,
		is_ground_content = false,
		walkable = false,
		node_box = {
			type = "wallmounted",
			wall_top    = {-0.4375, 0.4375, -0.3125, 0.4375, 0.5, 0.3125},
			wall_bottom = {-0.4375, -0.5, -0.3125, 0.4375, -0.4375, 0.3125},
			wall_side   = {-0.5, -0.3125, -0.4375, -0.4375, 0.3125, 0.4375},
		},
		groups = def.groups,
		legacy_wallmounted = true,
		sounds = def.sounds,

		on_construct = function(pos)
			--local n = minetest.get_node(pos)
			local meta = minetest.get_meta(pos)
			meta:set_string("formspec", "field[text;;${text}]")
		end,
		on_receive_fields = function(pos, formname, fields, sender)
			--print("Sign at "..minetest.pos_to_string(pos).." got "..dump(fields))
			local player_name = sender:get_player_name()
			if minetest.is_protected(pos, player_name) then
				minetest.record_protection_violation(pos, player_name)
				return
			end
			local meta = minetest.get_meta(pos)
			if not fields.text then return end
			minetest.log("action", (player_name or "") .. " wrote \"" ..
				fields.text .. "\" to sign at " .. minetest.pos_to_string(pos))
			meta:set_string("text", fields.text)
			meta:set_string("infotext", '"' .. fields.text .. '"')
		end,
	})
end

register_sign("wood", "Wooden", {
	sounds = default.node_sound_wood_defaults(),
	groups = {choppy = 2, attached_node = 1, flammable = 2, oddly_breakable_by_hand = 3}
})

register_sign("steel", "Steel", {
	sounds = default.node_sound_defaults(),
	groups = {cracky = 2, attached_node = 1}
})


-- straw

minetest.register_node("default:straw", {
	description = "Straw",
	tiles = {"default_straw_top.png", "default_straw_top.png", "default_straw_side.png"},
	groups = {crumbly = 3},
})


-- frames

minetest.register_node("default:frame", {
	description = "Frame",
	tiles = {"default_frame.png", "default_frame_detail.png"},
	drawtype = "glasslike_framed_optional",
	paramtype = "light",
	groups = {choppy = 3},
})

-- glass

minetest.register_node("default:glass", {
	description = "Glass",
	drawtype = "glasslike_framed_optional",
	tiles = {"default_glass.png", "default_glass_detail.png"},
	inventory_image = minetest.inventorycube("default_glass.png"),
	paramtype = "light",
	groups = {crumbly = 3},
})

-- wool

default.register_wool = function(color)
	minetest.register_node("default:wool_"..color, {
		description = color.." Wool",
		tiles = {"default_wool.png^[colorize:"..color..":150"},
		groups = {crumbly=3},
	})
end

default.register_wool("red")
default.register_wool("green")
default.register_wool("yellow")
default.register_wool("white")
default.register_wool("black")

-- stone

minetest.register_node("default:stone", {
	description = "Stone",
	tiles = {"default_stone.png"},
	groups = {cracky = 3, stone= 1},
	drop = {
		max_items = 1,
		items = {
			{items = {'default:flint'},rarity = 5},
			{items = {"default:stone_item 5"}},
		}
	},
	sounds = default.sounds.stone(),
})

minetest.register_node("default:desert_stone", {
	description = "Desert Stone",
	tiles = {"default_stone.png^[colorize:orange:50"},
	groups = {cracky = 3},
	drop = "default:stone_item 5",
	sounds = default.sounds.stone(),
})

minetest.register_node("default:andesite", {
	description = "Andesite",
	tiles = {"default_andesite.png"},
	groups = {cracky = 3},
	sounds = default.sounds.stone(),
})

minetest.register_node("default:cobble", {
	description = "Cobble",
	tiles = {"default_cobble.png"},
	groups = {cracky = 3},
	sounds = default.sounds.stone(),
})

minetest.register_node("default:stone_tile", {
	description = "Stone Tile",
	tiles = {"default_stone_tile.png"},
	groups = {cracky = 3},
	sounds = default.sounds.stone(),
})

minetest.register_node("default:small_stone_tiles", {
	description = "Small Stone Tiles",
	tiles = {"default_small_stone_tile.png"},
	groups = {cracky = 3},
	sounds = default.sounds.stone(),
})

minetest.register_node("default:stonebrick", {
	description = "Stonebrick",
	tiles = {"default_stonebrick.png"},
	groups = {cracky = 3},
	sounds = default.sounds.stone(),
})

minetest.register_node("default:mossy_stonebrick", {
	description = "Mossy Stonebrick",
	tiles = {"default_mossy_stonebrick.png"},
	groups = {cracky = 3},
	sounds = default.sounds.stone(),
})

minetest.register_node("default:wet_stone", {
	description = "Wet Stone",
	tiles = {"default_wet_stone.png"},
	groups = {cracky = 3},
	drop = {"default:stone_item 5"},
	sounds = default.sounds.stone(),
})

minetest.register_node("default:sandstone", {
	description = "Sandstone",
	tiles = {"default_sandstone.png"},
	groups = {cracky = 3},
	sounds = default.sounds.stone(),
})

minetest.register_node("default:compressed_sandstone", {
	description = "Compressed Sandstone",
	tiles = {"default_compressed_sandstone.png"},
	groups = {cracky = 3},
	sounds = default.sounds.stone(),
})

minetest.register_node("default:sandstone_brick", {
	description = "Sandstone Brick",
	tiles = {"default_sandstone_brick.png"},
	groups = {cracky = 3},
	sounds = default.sounds.stone(),
})

minetest.register_node("default:gravel", {
	description = "Gravel",
	tiles = {"default_gravel.png"},
	groups = {crumbly = 2, falling_node=1},
	drop = {
		max_items = 1,
		items = {
			{items = {'default:flint'},rarity = 5},
			{items = {'default:gravel'}},
		}
	}
})

--brick

minetest.register_node("default:brick", {
	description = "Brick",
	tiles = {"default_brick.png"},
	groups = {cracky = 3},
	sounds = default.sounds.stone(),
})

-- ores

minetest.register_node("default:stone_with_coal", {
	description = "Stone with Coal",
	tiles = {"default_stone_with_coal.png"},
	groups = {cracky = 2},
	drop = "default:coal_lump",
	sounds = default.sounds.stone(),
})

minetest.register_node("default:stone_with_iron", {
	description = "Stone with Iron",
	tiles = {"default_stone_with_iron.png"},
	groups = {cracky = 2},
	sounds = default.sounds.stone(),
})

minetest.register_node("default:stone_with_copper", {
	description = "Stone with Copper",
	tiles = {"default_stone_with_copper.png"},
	groups = {cracky = 1},
	sounds = default.sounds.stone(),
})

minetest.register_node("default:stone_with_zinc", {
	description = "Stone with Zinc",
	tiles = {"default_stone_with_zinc.png"},
	groups = {cracky = 1},
	sounds = default.sounds.stone(),
})

minetest.register_node("default:stone_with_silver", {
	description = "Stone with Silver",
	tiles = {"default_stone_with_silver.png"},
	groups = {hard = 3},
	sounds = default.sounds.stone(),
})

minetest.register_node("default:stone_with_gold", {
	description = "Stone with Gold",
	tiles = {"default_stone_with_gold.png"},
	groups = {cracky = 1},
	sounds = default.sounds.stone(),
})

minetest.register_node("default:stone_with_diamond", {
	description = "Stone with Diamond",
	tiles = {"default_stone_with_diamond.png"},
	groups = {hard = 2},
	drop = "default:diamond",
	sounds = default.sounds.stone(),
})

minetest.register_node("default:stone_with_ruby", {
	description = "Stone with Ruby",
	tiles = {"default_stone_with_ruby.png"},
	groups = {hard = 1},
	drop = "default:ruby",
	sounds = default.sounds.stone(),
})

-- coalblock

minetest.register_node("default:coalblock", {
	description = "Coalblock",
	tiles = {"default_coalblock.png"},
	groups = {cracky = 2},
	sounds = default.sounds.stone(),
})

minetest.register_node("default:coalblock_glowing", {
	description = "Glowing Coalblock",
	tiles = {"default_coalblock_glowing.png"},
	light_source = 7,
	groups = {cracky = 2},
	sounds = default.sounds.stone(),
})

--quartz

minetest.register_node("default:quartz", {
	description = "Quartz",
	tiles = {"default_quartz.png"},
	groups = {cracky = 2},
	sounds = default.sounds.stone(),
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

-- fences

default.register_fence("default:fence_wood", {
	material = "default:wood",
})

default.register_fence("default:fence_cobble", {
	material = "default:cobble",
})

default.register_fence("default:fence_jungle_wood", {
	material = "default:jungle_wood",
})

default.register_fence("default:fence_quartz", {
	material = "default:quartz",
})

-- alias
minetest.register_alias("default:dirt_with_grass", "default:grass")
minetest.register_alias("default:dirt_with_dry_grass", "default:dry_grass")
