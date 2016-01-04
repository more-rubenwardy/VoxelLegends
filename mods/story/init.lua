story = {}

local modpath = minetest.get_modpath("story")
dofile(modpath.."/api.lua")

minetest.register_node("story:character_static", {
	description = "Static Character",
	tiles = {"character.png"},
	drawtype = "mesh",
	mesh = "character_static.obj",
	groups = {crumbly = 3},
	paramtype = "light",
	paramtype2 = "facedir",
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", story.talk_form)
		meta:set_string("infotext", "Character")
		local inv = meta:get_inventory()
		inv:set_size("main", 8*4)
	end,
})

