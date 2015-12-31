minetest.register_craftitem("potions:healing", {
	description = "Potion of Healing",
	inventory_image = "potions_red.png",
 
	on_drop = function(itemstack, dropper, pos)
		if not dropper or not dropper:is_player() then
			return
		end
		dropper:set_hp(dropper:get_hp()+10)
		itemstack:take_item()
		return itemstack
	end,

	on_use = function(itemstack, user, pointed_thing)
		if not user or not user:is_player() then
			return
		end
		user:set_hp(user:get_hp()+10)
		itemstack:take_item()
		return itemstack
	end,
})

minetest.register_craftitem("potions:jumping", {
	description = "Potion of Jumping",
	inventory_image = "potions_blue.png",
 
	on_drop = function(itemstack, dropper, pos)
		if not dropper or not dropper:is_player() then
			return
		end
		dropper:set_physics_override({
			gravity = 0.1,
		})
		

		minetest.after(10.0, function(pl)
			if not pl or not pl:is_player() then
				return
			end
			pl:set_physics_override({
				gravity = 1,	
			})
		end, dropper)
		itemstack:take_item()
		return itemstack
	end,

	on_use = function(itemstack, user, pointed_thing)
		if not user or not user:is_player() then
			return
		end
		user:set_physics_override({
			gravity = 0.1,
		})

		minetest.after(10.0, function(pl)
			if not pl or not pl:is_player() then
				return
			end
			pl:set_physics_override({
				gravity = 1,	
			})
		end, user)
		itemstack:take_item()
		return itemstack
	end,
})

minetest.register_craftitem("potions:running", {
	description = "Potion of Running",
	inventory_image = "potions_yellow.png",
 
	on_drop = function(itemstack, dropper, pos)
		if not dropper or not dropper:is_player() then
			return
		end
		dropper:set_physics_override({
			speed = 3,
		})
		

		minetest.after(10.0, function(pl)
			if not pl or not pl:is_player() then
				return
			end
			pl:set_physics_override({
				speed = 1,	
			})
		end, dropper)
		itemstack:take_item()
		return itemstack
	end,

	on_use = function(itemstack, user, pointed_thing)
		if not user or not user:is_player() then
			return
		end
		user:set_physics_override({
			speed = 3,
		})

		minetest.after(10.0, function(pl)
			if not pl or not pl:is_player() then
				return
			end
			pl:set_physics_override({
				speed = 1,	
			})
		end, user)
		itemstack:take_item()
		return itemstack
	end,
})
