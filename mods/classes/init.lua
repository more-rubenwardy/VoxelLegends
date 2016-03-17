classes = {}
classes.all_classes = {}
classes.selected = {}
classes.classes_file = minetest.get_worldpath() .. "/classes"

function classes.get_dmg(lvl)
	return lvl+2
end

classes.register_weapon = function(name,fromLevel,levels, def)
	if not def.damage then
		if def.damage_m and def.damage_d then
			def.damage = math.floor(classes.get_dmg(fromLevel)*def.damage_m-def.damage_d)
		end
	end
	for i = fromLevel, levels, 1 do
		minetest.register_tool("classes:"..name .. "_lvl_" .. tostring(i), {
			description = def.description.."\n For Level: ".. tostring(i).. "\n Damage: " .. tostring(def.damage+ i-fromLevel) .." \n Class: " .. def.class,
			inventory_image = def.inventory_image,
			wield_scale = def.wield_scale,
			tool_capabilities = {
				max_drop_level=3,
				damage_groups = {fleshy=def.damage+ i-fromLevel},
			},
			class = def.class,
    			on_use = function(itemstack, user, pointed_thing)
				if user == nil then return end
				if minetest.registered_tools[itemstack:get_name()].class then print(minetest.registered_tools[itemstack:get_name()].class) end
				if classes.selected[user:get_player_name()] == minetest.registered_tools[itemstack:get_name()].class then	
					if pointed_thing.type == "object" then
						if xp.player_levels[user:get_player_name()] and xp.player_levels[user:get_player_name()] > i-1 then
							pointed_thing.ref:punch(user, 10,minetest.registered_tools[itemstack:get_name()].tool_capabilities)
							itemstack:add_wear(300)
							print("[info]" .. user:get_player_name() .. " is fighting!")
						else
							cmsg.push_message_player(user, "[info] You have to be level "..tostring(i).. " to use this weapon!")	
						end					
						return itemstack
					end
				else
					cmsg.push_message_player(user, "[info] You cant use this weapon.")	
					return itemstack
				end
			end
		})
		if i < levels then
			minetest.register_craft({
				output = "classes:"..name .. "_lvl_" .. tostring(i+1),
				recipe = {
					{"classes:"..name .. "_lvl_" .. tostring(i), "potions:upgrading"},
				}
			})
		end
	end
	if def.recipe then
		minetest.register_craft({
			output = "classes:"..name .. "_lvl_" .. tostring(fromLevel),
			recipe = def.recipe,
		})
	end
	minetest.register_craft({
		output = "classes:"..name .. "_lvl_" .. tostring(i),
		recipe = {"classes:"..name .. "_lvl_" .. tostring(i), "classes:"..name .. "_lvl_" ..tostring(i)},
		type = "toolrepair",
	})
end

function classes.register_tool(name, def)
	minetest.register_craftitem("classes:" .. name, {
		description = def.description,
		inventory_image = def.inventory_image,
		class = def.class,
		wield_scale = def.wield_scale,
		on_use = function(itemstack, user, pointed_thing)
			if user == nil then return end
			if classes.selected[user:get_player_name()] == def.class then	
				if xp.player_levels[user:get_player_name()] and xp.player_levels[user:get_player_name()] > def.lvl-1 then
					def.on_use(itemstack, user, pointed_thing)
				else
					cmsg.push_message_player(user, "[info] You have to be level "..tostring(def.lvl).. " to use this tool!")	
				end					
				return nil
			else
				cmsg.push_message_player(user, "[info] You cant use this tool.")	
				return itemstack
			end
		end
	})
end

-- load save

function classes.load_selected_classes()
	local input = io.open(classes.classes_file, "r")
	if input then
		local str = input:read()
		if str then
			for k, v in str.gmatch(str,"(%w+)=(%w+)") do
    				classes.selected[k] = v
			end
		end
		io.close(input)
	end
end

function classes.save_selected_classes()
	if classes.selected then
		local output = io.open(classes.classes_file, "w")
		local str = ""
		for k, v in pairs(classes.selected) do 
			str = str .. k .. "=" .. v .. ","
		end
		str = str:sub(1, #str - 1)
		output:write(str)
		io.close(output)
	end
end

-- cmd

minetest.register_chatcommand("class", {
	params = "<class>",
	description = "Set your class to <class>",
	privs = {},
	func = function(name, text)
		if classes.selected[name] then 
			return true, "Your class is : ".. classes.selected[name] .. "\nYou cant switch your class. If you want to player an other class, you should ask an admin :)"
		end		
		if classes.all_classes[text] then
			classes.selected[name] = text
			minetest.chat_send_all(name .. " is now a " .. text)
			classes.save_selected_classes()
			return true, "Your class is now "..text
		else
			return true, "You cant be a "..text
		end
	end,
})

minetest.register_chatcommand("myclass", {
	params = "",
	description = "This command will show you your class",
	privs = {},
	func = function(name, text)
		if classes.selected[name] == nil then return true, "You havent coosen your class, yet!" end
		return true, "Your class is "..classes.selected[name]
	end,
})


classes.register_class = function(name)
	classes.all_classes[name] = true
end


classes.register_class("farmer")
classes.register_class("warrior")
classes.register_class("thief")
classes.register_class("healer")

classes.load_selected_classes()

classes.register_weapon("spear",2, 12, {
	description = "Spear",
	inventory_image = "classes_spear.png",
	wield_scale = {x = 2, y=2, z = 1},
	damage_m = 1.0,
	damage_d = 0,
	class = "warrior",
	recipe = {
		{"", "default:flint", ""},
		{"", "default:string_strong", ""},
		{"", "default:stick", ""},
	}
})

classes.register_weapon("chemical_spear",5, 17, {
	description = "Chemical Spear",
	inventory_image = "classes_chemical_spear.png",
	wield_scale = {x = 2, y=2, z = 1},
	damage_m = 1.1,
	damage_d = -1,
	class = "warrior"
})

classes.register_tool("shield", {
	description = "Shield",
	inventory_image = "classes_shield.png",
	wield_scale = {x = 2, y=2, z = 1},
	class = "warrior",
	lvl = 5,
	on_use = function(itemstack, user, pointed_thing)
		user:set_armor_groups({friendly = 0})
		user:set_physics_override({
			speed = 0.3,
		})
		cmsg.push_message_player(user, "[armor] + shield")
		
		minetest.after(3.0, function(player)
			if not player or not player:is_player() then
				return
			end
			armor.update_armor(player:get_player_name(), player)
			player:set_physics_override({
				speed = 1,
			})
			cmsg.push_message_player(player, "[armor] - shield")
		end, user)
	end
})

classes.register_weapon("sword",20, 30, {
	description = "Sword",
	inventory_image = "classes_sword.png",
	wield_scale = {x = 1.5, y=1.5, z = 1},
	damage_m = 1.0,
	damage_d = 0,
	class = "warrior",
	recipe = {
		{"", "default:blade", ""},
		{"", "default:string_strong", ""},
		{"", "furnace:iron_rod", ""},
	}
})


classes.register_weapon("hoe",2, 20, {
	description = "Hoe",
	inventory_image = "classes_hoe.png",
	wield_scale = {x = 1, y=1, z = 1},
	damage_m = 0.9,
	damage_d = 1,
	class = "farmer",
	recipe = {
		{"", "furnace:iron_rod", "default:blade"},
		{"", "default:string_strong", ""},
		{"", "default:stick", ""},
	}
})

classes.register_weapon("pitchfork",15, 30, {
	description = "Pitchfork",
	inventory_image = "classes_pitchfork.png",
	wield_scale = {x = 1, y=1, z = 1},
	damage_m = 0.95,
	damage_d = 0,
	class = "farmer",
	recipe = {
		{"furnace:iron_rod", "furnace:iron_rod", "furnace:iron_rod"},
		{"", "default:string_strong", ""},
		{"", "default:stick", ""},
	}
})

classes.register_weapon("stick",2, 30, {
	description = "Stick",
	inventory_image = "classes_stick.png",
	wield_scale = {x = 1, y=1, z = 1},
	damage_m = 0.8,
	damage_d = 1,
	class = "thief",
	recipe = {
		{"", "default:stick", ""},
		{"", "default:stick", ""},
	}
})

classes.register_weapon("long_stick",20, 60, {
	description = "Long Stick",
	inventory_image = "classes_stick.png",
	wield_scale = {x = 2, y=2, z = 1},
	damage_m = 0.8,
	damage_d = 1,
	class = "thief",
	recipe = {
		{"", "default:stick", ""},
		{"", "default:stick", ""},
		{"", "default:stick", ""},
	}
})

