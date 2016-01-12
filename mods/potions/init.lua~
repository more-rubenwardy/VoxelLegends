minetest.register_craftitem("potions:healing", {
	description = "Potion of Healing",
	inventory_image = "potions_red.png",
 
	on_drop = function(itemstack, dropper, pos)
		if not dropper or not dropper:is_player() then
			return
		end
		cmsg.push_message_player(dropper, "[hp] + 10")
		dropper:set_hp(dropper:get_hp()+10)
		itemstack:take_item()
		return itemstack
	end,

	on_use = function(itemstack, user, pointed_thing)
		if not user or not user:is_player() then
			return
		end
		cmsg.push_message_player(user, "[hp] + 10")
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
		cmsg.push_message_player(dropper, "[effect] + jump")
		

		minetest.after(10.0, function(pl)
			if not pl or not pl:is_player() then
				return
			end
			pl:set_physics_override({
				gravity = 1,	
			})
			cmsg.push_message_player(pl, "[effect] - jump")
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
		cmsg.push_message_player(user, "[effect] + jump")

		minetest.after(10.0, function(pl)
			if not pl or not pl:is_player() then
				return
			end
			pl:set_physics_override({
				gravity = 1,	
			})
			cmsg.push_message_player(pl, "[effect] - jump")
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
		cmsg.push_message_player(dropper, "[effect] + speed")
		

		minetest.after(10.0, function(pl)
			if not pl or not pl:is_player() then
				return
			end
			pl:set_physics_override({
				speed = 1,	
			})
			cmsg.push_message_player(pl, "[effect] - speed")
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
		cmsg.push_message_player(user, "[effect] + speed")

		minetest.after(10.0, function(pl)
			if not pl or not pl:is_player() then
				return
			end
			pl:set_physics_override({
				speed = 1,	
			})
			cmsg.push_message_player(pl, "[effect] - speed")
		end, user)
		itemstack:take_item()
		return itemstack
	end,
})

minetest.register_craftitem("potions:upgrading", {
	description = "Potion of Upgrading",
	inventory_image = "potions_green.png",
})
