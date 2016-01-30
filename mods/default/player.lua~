function default.itemslot_bg(x,y,w,h)
	local imgs = ""
	for i = 0, w-1,1 do
		for j=0, h-1,1 do
			imgs = imgs .."image["..x+i..","..y+j..";1,1;gui_itemslot_bg.png]"
		end
	end
	return imgs
end

default.gui_bg = "bgcolor[#a88e69FF;false]"
default.gui_colors = "listcolors[#00000000;#10101030;#00000000;#68B259;#FFF]"

default.inv_form = "size[8,7.5;]"
default.inv_form = default.inv_form..default.gui_colors
default.inv_form = default.inv_form..default.gui_bg
default.inv_form = default.inv_form.."list[current_player;main;0,3.5;8,4;]"
default.inv_form = default.inv_form..default.itemslot_bg(0,3.5,8,4)
default.inv_form = default.inv_form.."list[current_player;craft;1,1;3,1;]"
default.inv_form = default.inv_form..default.itemslot_bg(1,1,3,1)
default.inv_form = default.inv_form.."list[current_player;craftpreview;5,1;1,1;]"
default.inv_form = default.inv_form..default.itemslot_bg(5,1,1,1)

default.craft_form = "size[8,7.5;]"
default.craft_form = default.craft_form..default.gui_colors
default.craft_form = default.craft_form..default.gui_bg
default.craft_form = default.craft_form.."list[current_player;main;0,3.5;8,4;]"
default.craft_form = default.craft_form..default.itemslot_bg(0,3.5,8,4)
default.craft_form = default.craft_form.."list[current_player;craft;1.5,0;3,3;]"
default.craft_form = default.craft_form..default.itemslot_bg(1.5,0,3,3)
default.craft_form = default.craft_form.."list[current_player;craftpreview;5,1;1,1;]"
default.craft_form = default.craft_form..default.itemslot_bg(5,1,1,1)



minetest.register_on_joinplayer(function(player)
	player:hud_set_hotbar_image("gui_hotbar.png")
	player:hud_set_hotbar_selected_image("gui_hotbar_selected.png")
	player:set_inventory_formspec(default.inv_form)
	
	player:set_properties({
		mesh = "character.x",
		textures = {"character.png"},
		visual = "mesh",
		visual_size = {x=1, y=1},
	})
	-- player:set_animation({ x= 25, y= 60,}, 30, 0)
	-- player:set_local_animation({x=0, y=20},{x= 25, y=60}, {x= 25, y=60}, {x= 25, y=60}, 30)
	-- default.player_anim[player:get_player_name()] = "stand"

	-- Testing of HUD elements
	player:hud_add({
		hud_elem_type = "waypoint",
		name = "spawn",
		text = "",
		number = 255,
		world_pos = {x=0,y=0,z=0}
	})
end)

