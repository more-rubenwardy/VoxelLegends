armor = {}
armor.invs = {}

function armor.register_armor(name, def)
	minetest.register_craftitem(name .. "_chestplate", {
		description = def.description .. " Chestplate",
		inventory_image = def.tex .. "_chestplate.png",
		protection = def.protection,
		skin = def.skin .. "_chestplate.png",
	})
	minetest.register_craftitem(name .. "_cboots", {
		description = def.description .. " Boots",
		inventory_image = def.tex .. "_boots.png",
		protection = def.protection,
		skin = def.skin .. "_boots.png",
	})
	minetest.register_craftitem(name .. "_leggings", {
		description = def.description .. " Leggings",
		inventory_image = def.tex .. "_leggings.png",
		protection = def.protection,
		skin = def.skin .. "_leggings.png",
	})
end

function armor.update_armor(name, pl)
	local a = armor.invs[name]:get_list("main")
	local p = 100
	for k,v in pairs(a) do
		if v:get_definition() and v:get_definition().protection then
			p = p - v:get_definition().protection
		end
	end
	pl:set_armor_groups({fleshy = p})
end

default.inv_form = default.inv_form .. "list[detached:armor_%s;main;0,0;1,3;]"
default.inv_form = default.inv_form.. default.itemslot_bg(0,0,1,3)

minetest.register_on_joinplayer(function(player)
	if armor.invs[player:get_player_name()] then
		return
	end

	armor.invs[player:get_player_name()] = minetest.create_detached_inventory("armor_" .. player:get_player_name(), {
		on_put = function(inv, listname, index, stack, player) 
			armor.update_armor(player:get_player_name(), player)
		end,
		on_take = function(inv, listname, index, stack, player) 
			armor.update_armor(player:get_player_name(), player)
		end,
	})
	armor.invs[player:get_player_name()]:set_size("main", 3)
	
end)

armor.register_armor("armor:iron", {
	description = "Iron",
	tex = "armor_iron",
	protection = 15,
	skin = "armor_skin_iron"
})

armor.register_armor("armor:copper", {
	description = "Copper",
	tex = "armor_copper",
	protection = 20,
	skin = "armor_skin_copper"
})

armor.register_armor("armor:diamond", {
	description = "Diamond",
	tex = "armor_diamond",
	protection = 28,
	skin = "armor_skin_diamond"
})
