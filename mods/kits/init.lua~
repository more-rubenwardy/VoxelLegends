kits = {}
kits.all_kits = {}
function kits.register_kit(name, items)
	kits.all_kits[name] = items
end

function kits.select_kit(player, name)
	kit = kits.all_kits[name]
	for i, item in ipairs(kit) do
		player:get_inventory():add_item('main', item)
	end
end

minetest.register_chatcommand("kit", {
	params = "<name>",
	description = "Select your kit.",
	privs = {interact = true},
	func = function(plname , name)
		local player = minetest.get_player_by_name(plname)
		if kits.all_kits[name] then
			kits.select_kit(player, name)
			return true, "You selected ".. name
		else
			return true, "There is no kit named ".. name
		end
	end,
})

kits.register_kit("basic", {"default:log_3 10", "default:log_1 10"})
kits.register_kit("customer", {"default:coin 10", "default:log_3 1", "default:log_1 1"})
kits.register_kit("hard", {"default:log_3 1", "default:log_1 1"})
kits.register_kit("peasant", {"default:log_3 1", "default:log_1 1", "farming:bowl_with_water", "farming:bowl_with_water", "farming:bowl_with_water", "farming:wheat_seeds 10"})
