classes.skills = {}
classes.skills.all = {}

function classes.skills.register_skill(name, def)
	minetest.register_craftitem("classes:skill_" .. name, {
		description = def.description,
		inventory_image = def.img,
		class = def.class,
		on_use = function(itemstack, user, pointed_thing)
			if user == nil then return end
			if classes.selected[user:get_player_name()] == def.class then	
				if xp.player_levels[user:get_player_name()] and xp.player_levels[user:get_player_name()] > def.lvl-1 then
					def.on_use(itemstack, user, pointed_thing)
				else
					cmsg.push_message_player(user, "[info] You have to be level "..tostring(def.lvl).. " to use this skill!")	
				end					
				return nil
			else
				cmsg.push_message_player(user, "[info] You cant use this skill.")	
				return itemstack
			end
		end
	})
	
	table.insert(classes.skills.all, "classes:skill_" .. name)
end

minetest.register_craftitem("classes:skill_book", {
	description = "Skill Book",
	inventory_image = "classes_skills_book.png",
	on_use = function(itemstack, user, pointed_thing)
		if user == nil then return end
		user:get_inventory():add_item("main", classes.skills.all[math.random(#classes.skills.all)])
		itemstack:take_item()
		return itemstack
	end
})
table.insert(default.treasure_chest_items, "classes:skill_book")

classes.skills.register_skill("super_jump", {
	description = "Super Jump\nLevel: 15\nClass: thief\nTime: 7.0\nEffect: gravity = 0.1",
	img = "classes_skills_super_jump.png",
	class = "thief",
	lvl = 15,
	on_use = function(itemstack, user, pointed_thing)
		user:set_physics_override({
			gravity = 0.1,
		})
		cmsg.push_message_player(user, "[skill] + super jump")
		
		minetest.after(7.0, function(player)
			if not player or not player:is_player() then
				return
			end
			player:set_physics_override({
				gravity = 1,
			})
			cmsg.push_message_player(player, "[skill] - super jump")
		end, user)
	end
})

classes.skills.register_skill("lift", {
	description = "Lift\nLevel: 25\nClass: thief\nTime: 2.0\nEffect: gravity = -0.5",
	img = "classes_skills_smooth_fall.png",
	class = "thief",
	lvl = 25,
	on_use = function(itemstack, user, pointed_thing)
		user:set_physics_override({
			gravity = -0.5,
		})
		cmsg.push_message_player(user, "[skill] + lift")
		
		minetest.after(2.0, function(player)
			if not player or not player:is_player() then
				return
			end
			player:set_physics_override({
				gravity = 1,
			})
			cmsg.push_message_player(player, "[skill] - lift")
		end, user)
	end
})

classes.skills.register_skill("heal", {
	description = "Heal\nLevel: 13\nClass: farmer\nEffect: hp + 4",
	img = "classes_skills_heal.png",
	class = "farmer",
	lvl = 13,
	on_use = function(itemstack, user, pointed_thing)
		user:set_hp(user:get_hp()+4)
		cmsg.push_message_player(user, "[skill][hp] + 4")
	end
})

