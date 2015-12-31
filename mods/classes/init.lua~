classes = {}
classes.register_weapon = function(name,levels, def)
	for i = 0, levels, 1 do
		minetest.register_tool("classes:"..name .. "_lvl_" .. tostring(i), {
			description = def.description.."\n Level: ".. tostring(i).. "\n Damage: " .. tostring(def.damage+ i) .." \n Class: " .. def.class,
			inventory_image = def.inventory_image,
			wield_scale = def.wield_scale,
			tool_capabilities = {
				max_drop_level=3,
				damage_groups = {fleshy=def.damage+ i},
			},
		})
	end
end

classes.register_weapon("spear", 5, {
	description = "Spear",
	inventory_image = "classes_spear.png",
	wield_scale = {x = 2, y=2, z = 1},
	damage = 15,
	class = "warrior",
})

classes.register_weapon("chemical_spear", 7, {
	description = "Chemical Spear",
	inventory_image = "classes_chemical_spear.png",
	wield_scale = {x = 2, y=2, z = 1},
	damage = 17,
	class = "warrior",
})

classes.register_weapon("hoe", 20, {
	description = "Hoe",
	inventory_image = "classes_hoe.png",
	wield_scale = {x = 1, y=1, z = 1},
	damage = 10,
	class = "farmer",
})

