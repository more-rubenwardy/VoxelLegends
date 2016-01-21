-- story quests

quests = {}
quests.player_quests = {}

function quests.add_quest(player, quest)
	if not quests.player_quests[player] then
		quests.player_quests[player] = {}
	end

	table.insert(quests.player_quests[player], quest)
end

minetest.register_on_dignode(function(pos, oldnode, digger)
	if not quests.player_quests[digger:get_player_name()] then
		return
	end
	table.foreach(quests.player_quests[digger:get_player_name()], function(k, v)
		if v.quest_type == "dignode" and newnode.name == v.node then
			v.progress = v.progress + 1
			if v.v.progress > (v.max-1) and v.done == false then
				xp.add_xp(player, v.xp)
				v.done = true
			end
		end
	end)
end)

minetest.register_on_placenode(function(pos, newnode, placer, oldnode, itemstack, pointed_thing)
	if not quests.player_quests[placer:get_player_name()] then
		return
	end
	table.foreach(quests.player_quests[placer:get_player_name()], function(k, v)
		if v.quest_type == "placenode" and newnode.name == v.node then
			v.progress = v.progress + 1
			if v.v.progress > (v.max-1) and v.done == false then
				xp.add_xp(player, v.xp)
				v.done = true
			end
		end
	end)
end)

minetest.register_on_newplayer(function(player)
	quests.player_quests[player:get_player_name()] = {}
end)

-- side quests

minetest.register_node("quests:quest_block", {
	description = "Quest Block",
	tiles = {"quests_block.png"},	
	groups = {quest = 1, cracky = 3},
	on_punch = function(pos, node, player, pointed_thing)
		
		local meta = minetest.get_meta(pos)
		if meta:get_string("item") ~= "" then
			return
		end
		local items = {"default:dirt", "default:sand", "default:iron_lump", "default:stone_item", "default:string"}
		local item = items[math.random(5)]
		if minetest.registered_nodes[item] then
			meta:set_string("infotext", "Bring me some " .. minetest.registered_nodes[item].description .. ", pls :)")
		else
			meta:set_string("infotext", "Bring me some " .. minetest.registered_craftitems[item].description .. ", pls :)")
		end
		meta:set_string("item", item)
	end,

	on_rightclick = function(pos, node, player, itemstack, pointed_thing)
		local meta = minetest.get_meta(pos)
		print(itemstack)
		print(itemstack:to_table())
		if not itemstack or not itemstack:to_table() then
			return
		end
		if itemstack:to_table().name == meta:get_string("item") then
			meta:set_string("infotext", "Thank you!")
			xp.add_xp(player, math.random(3, 30))
			minetest.add_particlespawner({
				amount = 500,
				time = 5,
				minpos = {x=pos.x, y=pos.y, z=pos.z},
				maxpos = {x=pos.x, y=pos.y, z=pos.z},
				minvel = {x=-2, y=0, z=-2},
				maxvel = {x=2, y=0, z=2},
				minacc = {x=-2, y=0, z=-2},
				maxacc = {x=2, y=0, z=2},
				minexptime = 5,
				maxexptime = 5,
				minsize = 1,
				maxsize = 1,
				collisiondetection = false,
				vertical = false,
				texture = "default_xp.png",
			})
			minetest.remove_node(pos)
		else
			meta:set_string("infotext", "That isnt the item I am searching for..")
		end
	end,
})

minetest.register_node("quests:map", {
	description = "Map",
	tiles = {"quests_map_top.png", "quests_map_top.png", "quests_map.png", "quests_map.png", "quests_map.png", "quests_map.png"},	
	groups = {quest = 1, cracky = 3},
	on_punch = function(pos, node, player, pointed_thing)
		xp.add_xp(player, math.random(3, 30))
		minetest.add_particlespawner({
			amount = 500,
			time = 5,
			minpos = {x=pos.x, y=pos.y, z=pos.z},
			maxpos = {x=pos.x, y=pos.y, z=pos.z},
			minvel = {x=-2, y=0, z=-2},
			maxvel = {x=2, y=0, z=2},
			minacc = {x=-2, y=0, z=-2},
			maxacc = {x=2, y=0, z=2},
			minexptime = 5,
			maxexptime = 5,
			minsize = 1,
			maxsize = 1,
			collisiondetection = false,
			vertical = false,
			texture = "default_xp.png",
		})
		minetest.remove_node(pos)
	end,
})

minetest.register_node("quests:ray", {
	description = "Ray",
	tiles = {"quests_glowing_ray.png"},
	groups = {ray=1},
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "nodebox",
	light_source = 7,
	node_box = {
		type = "fixed",
		fixed = {
				{-0.2, -0.5, -0.2, 0.2, 0.5, 0.2},
			},
	},
})
