building = {}
function building.register_schematic(name, f)
	minetest.register_craftitem("building:".. name, {
		description = "Schematic : " .. name,
		inventory_image = "building_stick.png",
		on_place = function(itemstack, placer, pointed_thing) 
			if f and pointed_thing.above then	
				minetest.place_schematic(pointed_thing.above, minetest.get_modpath("building").."/schematics/"..name..".mts", "0", {}, true)
			elseif pointed_thing.under then	
				minetest.place_schematic(pointed_thing.under, minetest.get_modpath("building").."/schematics/"..name..".mts", "0", {}, true)
			end
			return itemstack
		end,
	})
end

building.register_schematic("house", true)
building.register_schematic("house_with_garden", true)
building.register_schematic("farm", true)
building.register_schematic("latern", true)
building.register_schematic("tower", false)
building.register_schematic("road", false)
