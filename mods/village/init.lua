village = {}
village.houses = {}
village.num = 1

function village.facedir_to_text_1(f)
	local all = {[0]="0",[3]="90",[2]="180",[1]="270",[4]="360"}
	local o = all[f]
	return o
end

function village.facedir_to_text_2(f)
	local all = {[2]="0",[1]="90",[0]="180",[3]="270",[4]="360"}
	local o = all[f]
	return o
end

--main func

function village.gen(pos)
	village.road(pos)
	village.road(pos)
	village.road(pos)
	village.road(pos)
end

function village.road(pos)
	local path_house_1 = minetest.get_modpath("village") .. "/schematics/house_1.mts"
	local path_house_2 = minetest.get_modpath("village") .. "/schematics/house_2.mts"
	local path_road = minetest.get_modpath("village") .. "/schematics/road.mts"
	
	local facedir = math.random(0,2)
	local dir = minetest.facedir_to_dir(facedir)

	pos = vector.add(pos, vector.multiply(dir, 6))

	for x=0,3,1 do
		minetest.place_schematic({x = pos.x+(dir.x*6*x), y = pos.y - 1, z = pos.z+(dir.z*6*x)}, path_road, 0, nil, true)
		if dir.x < 0 then
			minetest.place_schematic({x = pos.x+(dir.x*6*x), y = pos.y - 1, z = pos.z+(dir.z*6*x)+6},   village.houses[ math.random( #village.houses ) ] , village.facedir_to_text_2(facedir), 0, nil, true)
			minetest.place_schematic({x = pos.x+(dir.x*6*x), y = pos.y - 1, z = pos.z+(dir.z*6*x)-6},   village.houses[ math.random( #village.houses ) ], village.facedir_to_text_1(facedir), 0, nil, true)
		elseif dir.x > 0 then
			minetest.place_schematic({x = pos.x+(dir.x*6*x), y = pos.y - 1, z = pos.z+(dir.z*6*x)+6},   village.houses[ math.random( #village.houses ) ], village.facedir_to_text_1(facedir), 0, nil, true)
			minetest.place_schematic({x = pos.x+(dir.x*6*x), y = pos.y - 1, z = pos.z+(dir.z*6*x)-6},   village.houses[ math.random( #village.houses ) ], village.facedir_to_text_2(facedir), 0, nil, true)
		elseif dir.z > 0 then
			minetest.place_schematic({x = pos.x+(dir.x*6*x)+6, y = pos.y - 1, z = pos.z+(dir.z*6*x)},   village.houses[ math.random( #village.houses ) ], village.facedir_to_text_1(facedir), 0, nil, true)
			minetest.place_schematic({x = pos.x+(dir.x*6*x)-6, y = pos.y - 1, z = pos.z+(dir.z*6*x)},   village.houses[ math.random( #village.houses ) ], village.facedir_to_text_2(facedir), 0, nil, true)
		else
			minetest.place_schematic({x = pos.x+(dir.x*6*x)+6, y = pos.y - 1, z = pos.z+(dir.z*6*x)},  village.houses[ math.random( #village.houses ) ], village.facedir_to_text_2(facedir), 0, nil, true)
			minetest.place_schematic({x = pos.x+(dir.x*6*x)-6, y = pos.y - 1, z = pos.z+(dir.z*6*x)},   village.houses[ math.random( #village.houses ) ], village.facedir_to_text_1(facedir), 0, nil, true)		
		end
	end
	minetest.place_schematic({x = pos.x+(dir.x*6*4), y = pos.y - 1, z = pos.z+(dir.z*6*4)}, path_road, 0, nil, true)

	if math.random(2) == 1 then
		village.road(vector.add(pos, vector.multiply(dir, 6*4)))
	end
end

function village.register_house(f)
	table.insert(village.houses, minetest.get_modpath("village") .. "/schematics/"..f)
end

village.register_house("house_1.mts")
village.register_house("house_2.mts")
village.register_house("garden.mts")
village.register_house("farm.mts")

minetest.register_node("village:spawn", {
	description = "Village",
	tiles = {"village_spawn.png"},
	groups = {crumbly = 3},
})

minetest.register_abm({
	nodenames = {"village:spawn"},
	interval = 1.0,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		minetest.set_node(pos, {name = "air"})
		village.gen(pos)
		if not places.pos["village_" .. tostring(village.num)] then
			places.pos["village_" .. tostring(village.num)] = {x=pos.x, y=pos.y, z=pos.z}
			village.num = village.num +1
			places.save_places()
		else
			-- TODO : save village num
			village.num = village.num +10
			if not places.pos["village_" .. tostring(village.num)] then
				places.pos["village_" .. tostring(village.num)] = {x=pos.x, y=pos.y, z=pos.z}
				village.num = village.num +1
				places.save_places()
			end
		end
	end,
})

minetest.register_decoration({
	deco_type = "simple",
	place_on = {"default:grass"},
	sidelen = 16,
	noise_params = {offset=0, scale=0.0001, spread={x=100, y=100, z=100}, seed=354, octaves=3, persist=0.7},
	biomes = {
		"grassland"
	},
	y_min = 6,
	y_max = 20,
	decoration = "village:spawn",
})


-- after start game
minetest.register_on_joinplayer(function(player)
	if not places.pos["home_village"] and minetest.get_player_privs(player:get_player_name()).server then
		minetest.chat_send_player(player:get_player_name(), "Choose a point for the home village!")
		minetest.chat_send_player(player:get_player_name(), "Try to find a grassland biome - the start is much easier there :)")
		minetest.chat_send_player(player:get_player_name(), "The biome should be flat.")
		player:get_inventory():add_item("main", "village:create_start_game")
	end
end)

minetest.register_craftitem("village:create_start_game", {
	description = "Create Home Village",
	inventory_image = "village_create.png",
 
	on_place = function(itemstack, placer, pointed_thing)
		if pointed_thing.type == "node" then
			village.gen(pointed_thing.above)
			itemstack:take_item()
			places.pos["home_village"] = pointed_thing.above
			placer:setpos(pointed_thing.above)
			places.save_places()
		end
		return itemstack
	end,
})

