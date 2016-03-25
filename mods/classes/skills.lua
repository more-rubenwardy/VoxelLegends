classes.skills = {}
classes.skills.all = {}

function classes.skills.register_skill(name, def)
	minetest.register_craftitem("classes:skill_" .. name, {
		description = def.description,
		inventory_image = def.inventory_image,
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
		
	end
})
