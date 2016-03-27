classes.skills = {}
classes.skills.all = {}
classes.skills.energy = {}
classes.skills.energy_hud = {}


minetest.register_on_joinplayer(function(player)
	if not player then
		return
	end
	classes.skills.energy_hud[player:get_player_name()] = player:hud_add({
		hud_elem_type = "statbar",
		position = {x=0.5,y=1.0},
		size = {x=16, y=16},
	   	offset = {x=-(32*5), y=-(48*2+32+8)},
		text = "classes_skills_energy.png",
		number = 0,
	})
	classes.skills.energy[player:get_player_name()] = 40
end)

function classes.skills.change_energy(player, v)
	classes.skills.energy[player:get_player_name()] = classes.skills.energy[player:get_player_name()] + v
	local val = 0
	if classes.skills.energy[player:get_player_name()] > 39 then
		val = 0
	else
		val = classes.skills.energy[player:get_player_name()]
	end
	player:hud_change(classes.skills.energy_hud[player:get_player_name()], "number",val)
end

local timer = 0
minetest.register_globalstep(function(dtime)
	timer = timer + dtime;
	if timer >=0.5 then
		for _, player in pairs(minetest.get_connected_players()) do
			if classes.skills.energy[player:get_player_name()] < 40 then
				classes.skills.change_energy(player, 1)
				if classes.skills.energy[player:get_player_name()] > 39 then
					cmsg.push_message_player(player, "[energy] Your energy is full!")
				end	
			end
		end
		timer = 0
	end
end)

function classes.skills.register_skill(name, def)
	minetest.register_craftitem("classes:skill_" .. name, {
		description = def.description,
		inventory_image = def.img,
		class = def.class,
		on_use = function(itemstack, user, pointed_thing)
			if user == nil then return end
			if classes.selected[user:get_player_name()] == def.class then	
				if xp.player_levels[user:get_player_name()] and xp.player_levels[user:get_player_name()] > def.lvl-1 then
					if classes.skills.energy[user:get_player_name()] > def.energy -1 then
						def.on_use(itemstack, user, pointed_thing)
						classes.skills.change_energy(user, -def.energy)
					else
						cmsg.push_message_player(user, "[WARNING] You dont have enought energy to use this skill!")	
					end
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
	description = "Super Jump\nLevel: 15\nClass: thief\nTime: 7.0\nEffect: gravity = 0.1\nEnergy: 10",
	img = "classes_skills_super_jump.png",
	class = "thief",
	lvl = 15,
	energy = 10,
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
	description = "Lift\nLevel: 25\nClass: thief\nTime: 2.0\nEffect: gravity = -0.5\nEnergy: 20",
	img = "classes_skills_lift.png",
	class = "thief",
	lvl = 25,
	energy = 20,
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
	description = "Heal\nLevel: 13\nClass: farmer\nEffect: hp + 4\nEnergy: 15",
	img = "classes_skills_heal.png",
	class = "farmer",
	lvl = 13,
	energy = 15,
	on_use = function(itemstack, user, pointed_thing)
		user:set_hp(user:get_hp()+4)
		cmsg.push_message_player(user, "[skill][hp] + 4")
	end
})

