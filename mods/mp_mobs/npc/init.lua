dofile(minetest.get_modpath("npc") .. "/api.lua")

local civ, quest_giver

civ = npc.new("npc:civilean", {
	on_rightclick = function(self, clicker)
		civ.say(self, clicker, "Hi! <Random backstory>!")
	end
})

quest_giver = npc.extend(civ, "npc:quest_giver", {
	on_rightclick = function(self, clicker)
		civ.say(self, clicker, "Hi! Here is a quest to do!")
	end
})
