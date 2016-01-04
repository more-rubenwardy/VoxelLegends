story = {}

local modpath = minetest.get_modpath("story")
dofile(modpath.."/api.lua")

minetest.register_node("story:character_static", {
	description = "Static Character",
	tiles = {"character.png"},
	drawtype = "mesh",
	mesh = "character_static.obj",
	groups = {story = 1, quests =1},
	paramtype = "light",
	paramtype2 = "facedir",
	on_construct = function(pos)
		story.set_talk_form(pos, "Character", "")
	end,
	
})

minetest.register_craftitem("story:conversation", {
	description = "Set Conversation",
	inventory_image = "story_set_conversation.png",
	on_place = function(itemstack, placer, pointed_thing)
		if not placer or not placer:is_player() then
			return
		end
		if not pointed_thing or not pointed_thing.under then
			return
		end
		story.set_talk_form(pointed_thing.under)
	end,
})



