character_editor = {}
character_editor.characters = {}
character_editor.mesh = {}

character_editor.shirts = {"character_editor_red_shirt.png", "character_editor_blue_shirt.png", "character_editor_yellow_shirt.png"}

function character_editor.update_character(player)
	local name = player:get_player_name()
	player:set_properties({
		mesh = character_editor.mesh[name],
		textures = {table.concat(character_editor.characters[name], "^")},
		visual = "mesh",
		visual_size = {x=1, y=1},
	})
	print(table.concat(character_editor.characters[name], "^"))
end

function character_editor.set_mesh(player, mesh)
	local name = player:get_player_name()
	character_editor.mesh[name] = mesh
	character_editor.update_character(player)
end

function character_editor.set_texture(player, pos, texture)
	local name = player:get_player_name()
	if not character_editor.characters[name] then
		character_editor.characters[name] = {}
	end

	character_editor.characters[name][pos] = texture
	print(character_editor.characters[name][pos])
	character_editor.update_character(player)
end

minetest.register_chatcommand("shirt", {
	params = "<name>",
	description = "[TEST CMD] Select your shirt",
	privs = {interact = true},
	func = function(plname , name)
		local player = minetest.get_player_by_name(plname)
		if character_editor.shirts[tonumber(name)] then
			character_editor.set_texture(player, 2, character_editor.shirts[tonumber(name)])
			return true, "You selected ".. name
		else
			return true, "There is no shirt named ".. name
		end
	end,
})

minetest.register_on_joinplayer(function(player)
	character_editor.mesh[player:get_player_name()] = "character.x"
	character_editor.characters[player:get_player_name()] = {}
	character_editor.set_texture(player, 1, "character.png")
end)


