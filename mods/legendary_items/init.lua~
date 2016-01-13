legendary_items = {}
legendary_items.register_rare_weapon = function(name, forlevel, def)
	minetest.register_tool(":legendary_items:"..name, {
		description = def.description.."\n For Level: ".. tostring(forlevel).. "\n Damage: " .. tostring(def.damage) .. "\n Rare Item",
		inventory_image = def.inventory_image,
		wield_scale = def.wield_scale,
		tool_capabilities = {
			max_drop_level=3,
			damage_groups = {fleshy=def.damage},
		},
	})
end

-- rare

legendary_items.register_rare_weapon("old_hammer", 3, {
	description = "Old Hammer",
	inventory_image = "legendary_items_old_hammer.png",
	wield_scale = {x = 2, y = 2, z =1},
	damage = 20,
})

legendary_items.register_rare_weapon("old_hammer_lvl_5", 5, {
	description = "Old Hammer",
	inventory_image = "legendary_items_old_hammer.png",
	wield_scale = {x = 2, y = 2, z =1},
	damage = 28,
})

legendary_items.register_rare_weapon("old_hammer_lvl_30", 30, {
	description = "Old Hammer",
	inventory_image = "legendary_items_old_hammer.png",
	wield_scale = {x = 2, y = 2, z =1},
	damage = 40,
})

legendary_items.register_rare_weapon("old_hammer_lvl_60", 60, {
	description = "Old Hammer",
	inventory_image = "legendary_items_old_hammer.png",
	wield_scale = {x = 2, y = 2, z =1},
	damage = 75,
})

legendary_items.register_rare_weapon("old_hammer_lvl_100", 100, {
	description = "Old Hammer",
	inventory_image = "legendary_items_old_hammer.png",
	wield_scale = {x = 2, y = 2, z =1},
	damage = 150,
})

-- super rare

minetest.register_craftitem("legendary_items:paper", {
	description = "The Legendary Paper",
	inventory_image = "legendary_items_paper.png",
})

minetest.register_craftitem("legendary_items:paper_green", {
	description = "Green Paper (rare)",
	inventory_image = "legendary_items_paper_green.png",
})

minetest.register_craftitem("legendary_items:teleporting", {
	description = "Stick of Teleporting",
	inventory_image = "legendary_items_tp.png",
	on_place = function(itemstack, placer, pointed_thing)
		if not placer or not placer:is_player() then
			return
		end
		placer:setpos(pointed_thing.above)
		minetest.add_particlespawner({
			amount = 50,
			time = 1,
			minpos = {x=pointed_thing.above.x, y=pointed_thing.above.y, z=pointed_thing.above.z},
			maxpos = {x=pointed_thing.above.x, y=pointed_thing.above.y, z=pointed_thing.above.z},
			minvel = {x=-2, y=-2, z=-2},
			maxvel = {x=2, y=4, z=2},
			minacc = {x=-2, y=-2, z=-2},
			maxacc = {x=2, y=4, z=2},
			minexptime = 1,
			maxexptime = 1,
			minsize = 1,
			maxsize = 1,
			collisiondetection = false,
			vertical = false,
			texture = "heart.png",
		})
	end,
})

minetest.register_tool("legendary_items:sword", {
	description = "The Legendary Sword",
	inventory_image = "legendary_items_sword.png",
	wield_scale = {x = 2, y=2, z = 1},
	tool_capabilities = {
		max_drop_level=3,
		damage_groups = {fleshy=50},
	},
	on_place = function(itemstack, placer, pointed_thing)
		if not placer or not placer:is_player() then
			return
		end
		placer:set_hp(placer:get_hp()+8)
		minetest.add_particlespawner({
			amount = 50,
			time = 1,
			minpos = {x=pointed_thing.above.x, y=pointed_thing.above.y, z=pointed_thing.above.z},
			maxpos = {x=pointed_thing.above.x, y=pointed_thing.above.y, z=pointed_thing.above.z},
			minvel = {x=-2, y=-2, z=-2},
			maxvel = {x=2, y=4, z=2},
			minacc = {x=-2, y=-2, z=-2},
			maxacc = {x=2, y=4, z=2},
			minexptime = 1,
			maxexptime = 1,
			minsize = 1,
			maxsize = 1,
			collisiondetection = false,
			vertical = false,
			texture = "heart.png",
		})
	end,
})


