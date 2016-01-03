classes = {}
classes.all_classes = {}
classes.selected = {}
classes.classes_file = minetest.get_worldpath() .. "/classes"
classes.register_weapon = function(name,fromLevel,levels, def)
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
					return nil
				else
					minetest.chat_send_player(user:get_player_name(), "You cant use this item!")
					itemstack:take_item()
					return itemstack
				end
			end
		})
	end
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

classes.load_selected_classes()

classes.register_weapon("spear",0, 5, {
	description = "Spear",
	inventory_image = "classes_spear.png",
	wield_scale = {x = 2, y=2, z = 1},
	damage = 15,
	class = "warrior",
})

classes.register_weapon("chemical_spear",0, 7, {
	description = "Chemical Spear",
	inventory_image = "classes_chemical_spear.png",
	wield_scale = {x = 2, y=2, z = 1},
	damage = 17,
	class = "warrior",
})

classes.register_weapon("sword",20, 30, {
	description = "Sword",
	inventory_image = "classes_sword.png",
	wield_scale = {x = 1.5, y=1.5, z = 1},
	damage = 20,
	class = "warrior",
})


classes.register_weapon("hoe",0, 20, {
	description = "Hoe",
	inventory_image = "classes_hoe.png",
	wield_scale = {x = 1, y=1, z = 1},
	damage = 10,
	class = "farmer",
})

classes.register_weapon("pitchfork",20, 30, {
	description = "Pitchfork",
	inventory_image = "classes_pitchfork.png",
	wield_scale = {x = 1, y=1, z = 1},
	damage = 20,
	class = "farmer",
})

