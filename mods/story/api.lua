-- form

story.talk_form = "size[8,7.5;]"
story.talk_form = story.talk_form..default.gui_colors
story.talk_form = story.talk_form..default.gui_bg
story.talk_form = story.talk_form.."image[0,0.0;3,8;story_player.png]"
story.talk_form = story.talk_form.."label[2.5,0;%s]"
story.talk_form = story.talk_form.."image[6,0.0;3,8;story_character_1.png]"

story.get_talk_form = function(text)
	return string.format(story.talk_form, text)
end

-- hud

story.hud = {}

minetest.register_on_joinplayer(function(player)
	if story.generator.players_storys[player:get_player_name()] and story.generator.players_storys[player:get_player_name()].pos then
		story.hud[player:get_player_name()] = player:hud_add({
			hud_elem_type = "waypoint",
			name = "story",
			text = "",
			number = 0x00FF00,
			world_pos = story.generator.players_storys[player:get_player_name()].pos
		})
	end

	story.hud[player:get_player_name()] = player:hud_add({
		hud_elem_type = "waypoint",
		name = "story",
		text = "",
		number = 0x00FF00,
		world_pos = {x=0,y=0,z=0}
	})
end)

-- procedural generation

story.generator = {}
story.generator.names = {"A", "B", "C", "D", "E", "F", "G"}
story.generator.file_paths = {minetest.get_modpath(minetest.get_current_modname()).."/parts/test"}
story.generator.parts = {}
story.generator.players_storys = {}

function story.generator.gen_next_step(player)
	if not places.pos then
		return
	end

	-- get a random place
	local keys = {}
	local i = 0
	for k,_ in pairs(places.pos) do
		keys[i] = k
		i= i+1
	end

	local p = places.pos[ keys[math.random( #keys)]]
	if not p then
		return
	end
	
	-- update waypoint
	player:hud_remove(story.hud[player:get_player_name()])
	story.hud[player:get_player_name()] = player:hud_add({
		hud_elem_type = "waypoint",
		name = "story",
		text = "",
		number = 0x00FF00,
		world_pos = p
	})

	-- add entity
	minetest.add_entity(p, "story:human")
	story.generator.players_storys[player:get_player_name()].pos = p
	story.generator.players_storys[player:get_player_name()].text = story.generator.parts[1]
end

function story.generator.new_player(player)
	-- adds a new entry to the story database
	story.generator.players_storys[player:get_player_name()] = {}
	story.generator.players_storys[player:get_player_name()].characters = { story.generator.names[math.random( #story.generator.names )],story.generator.names[math.random( #story.generator.names )]}
	story.generator.players_storys[player:get_player_name()].met_characters = {}
	story.generator.players_storys[player:get_player_name()].met_characters_num = 0
end

function story.generator.load_parts()
	-- testing
	local file = io.open(story.generator.file_paths[1], "r")
	story.generator.parts[1] = file:read()
	io.close(file)
end


function story.generator.gen_dialog(player)
	-- coming soon
	str = ""
	for i = 0, 10 do
		str = str
	end
	return str
end

minetest.register_on_newplayer(function(player)
	story.generator.new_player(player)
	story.generator.gen_next_step(player)
end)

-- human
minetest.register_entity("story:human", {
	hp_max = 50,
	physical = true,
	collisionbox = {-0.4,-1,-0.4, 0.4,1,0.4},
 	visual = "mesh",
 	visual_size = {x=1, y=1},
	textures = {"character.png",},
	mesh = "character.x",
	spritediv = {x=1, y=1},
	initial_sprite_basepos = {x=0, y=0},	
	is_visible = true,
	makes_footstep_sound = false,
	automatic_rotate = true,
	speed = 0,
	plname = nil,
	text = nil,

	on_rightclick = function(self, clicker)
		if not clicker or not clicker:is_player() then
			return
		end
		if not story.generator.players_storys[clicker:get_player_name()] then
			return
		end
		-- shows the dialog
		if story.generator.players_storys[clicker:get_player_name()].pos then
			if vector.distance(self.object:getpos(), story.generator.players_storys[clicker:get_player_name()].pos) < 3 then
				minetest.show_formspec(clicker:get_player_name(), "story:story", story.get_talk_form(story.generator.players_storys[clicker:get_player_name()].text))
				story.generator.gen_next_step(clicker)	
				-- TODO : delete npc after talking with it (or move it some where else)	
			end
		end
	end,

	on_step = function(self, dtime)
		-- nothing
	end,
})

minetest.register_craftitem("story:human", {
	description = "Human",
	inventory_image = "story_character_spawn.png",

	on_place = function(itemstack, placer, pointed_thing)
		if pointed_thing.type ~= "node" then
			return
		end
		local p = pointed_thing.above
		p.y = p.y + 0.5
		minetest.add_entity(p, "story:human")
		if not minetest.setting_getbool("creative_mode") then
			itemstack:take_item()
		end
		return itemstack
	end,
})

story.generator.load_parts()
