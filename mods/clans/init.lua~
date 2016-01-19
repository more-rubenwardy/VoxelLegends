clans = {}
clans.all_clans = {}
clans.clans_file = minetest.get_worldpath() .. "/clans"

function clans.create_clan(plname, clan_name)
	clans.all_clans[clan_name] = {plname}
	clans.save_clans()
end

function clans.add_member(clan_name, plname)
	table.insert(clans.all_clans[clan_name], plname)
	clans.save_clans()
end

function clans.load_clans()
	local input = io.open(clans.clans_file, "r")
	if input then
		local str = input:read()
		if str then
			if minetest.deserialize(str) then
				clans.all_clans = minetest.deserialize(str)
			end
		end
		io.close(input)
	end
end

function clans.save_clans()
	if clans.all_clans then
		local output = io.open(clans.clans_file, "w")
		local str = minetest.serialize(clans.all_clans)
		output:write(str)
		io.close(output)
	end
end

clans.load_clans()

minetest.register_chatcommand("create_clan", {
	params = "<name>",
	description = "Creates a clan",
	privs = {},
	func = function(name, text)
		if clans.all_clans[text] then 
			return true, "There already is a clan named " .. text
		end	
		local player = minetest.get_player_by_name(name)
		if player then	
			clans.create_clan(name, text)
			return true, "Added a clan named " .. text
		end
		return true, "Error couldnt find player " .. name
	end,
})

minetest.register_chatcommand("join_clan", {
	params = "<name>",
	description = "Join a clan",
	privs = {},
	func = function(name, text)
		if not clans.all_clans[text] then 
			return true, "There is no clan named " .. text
		end	
		local player = minetest.get_player_by_name(name)
		if player then	
			clans.add_member(text, name)
			return true, "Joined clan " .. text
		end
		return true, "Error couldnt find player " .. name
	end,
})


