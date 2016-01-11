minetest.register_node("furnace:furnace", {
	description = "Furnace",
	tiles = {"furnace_stone_tile.png", "furnace_stone_tile.png", "furnace_stone_tile.png", "furnace_stone_tile.png","furnace_stone_tile.png","furnace_stone_front.png"},
	groups = {cracky = 2},
	paramtype2 = "facedir",
})

minetest.register_abm({
	nodenames = {"furnace:furnace"},
	neighbors = {"group:pattern"},
	interval = 1.0,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local lavapos = pos
		lavapos.y = lavapos.y - 2
		if minetest.get_node(lavapos).name == "lava:lava_source" then
			local patternpos = pos
			patternpos.y = patternpos.y + 1
			
			local p = {	
					x = pos.x + math.random(0, 5)/5 - 0.5,
					y = pos.y + 3, 
					z = pos.z + math.random(0, 5)/5 - 0.5
				  }
	
			local pattern = minetest.get_node(patternpos).name
			if pattern == "furnace:pattern_rod" then
				minetest.add_item(p, {name = "furnace:iron_rod"})
				print("rod")
			end
		end
	end,
})

minetest.register_node("furnace:pattern_rod", {
	description = "Pattern for a Rod",
	tiles = {"furnace_pattern_rod.png", "default_wooden_planks.png"},
	groups = {snappy = 3, pattern = 1},

})

minetest.register_craftitem("furnace:iron_rod", {
	description = "Iron Rod",
	inventory_image = "furnace_iron_rod.png",
})

minetest.register_craftitem("furnace:gold_rod", {
	description = "Gold Rod",
	inventory_image = "furnace_gold_rod.png",
})

minetest.register_craftitem("furnace:diamond_rod", {
	description = "Diamond Rod",
	inventory_image = "furnace_diamond_rod.png",
})
