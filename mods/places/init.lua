places = {}
places.pos = {}
places.places_file = minetest.get_worldpath() .. "/places"
function places.register_place(name, pos)
	places.pos[name] = pos
end

function places.load_places()
	local input = io.open(places.places_file, "r")
	if input then
		local str = input:read()
		if str then
			print("[INFO] places string : " .. str)
			if minetest.deserialize(str) then
				places.pos = minetest.deserialize(str)
			end
		else 
			print("[WARNING] places file is empty")
		end
		io.close(input)
	else
		print("[error] couldnt find places file")
	end
end

function places.save_places()
	if places.pos then
		local output = io.open(places.places_file, "w")
		local str = minetest.serialize(places.pos)
		output:write(str)
		io.close(output)
	end
end

minetest.register_chatcommand("setplace", {
	params = "<name>",
	description = "Set a place",
	privs = {},
	func = function(name, text)
		if places.pos[text] then 
			return true, "There already is a place named " .. text
		end	
		local player = minetest.get_player_by_name(name)
		if player then	
			local pos = player:getpos()
			pos = {x=math.floor(pos.x), y=math.floor(pos.y), z=math.floor(pos.z)}
			places.pos[text] = pos
			places.save_places()
			return true, "Added a place named " .. text
		end
		return true, "Error couldnt find player " .. name
	end,
})

minetest.register_on_joinplayer(function(player)
	if places.pos then
		for k, v in pairs(places.pos) do 
			player:hud_add({
				hud_elem_type = "waypoint",
				name = k,
				text = "",
				number = 255,
				world_pos = v
			})
		end
	end
end)

places.load_places()
