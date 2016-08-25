-- Copyright (C) 2016  rubenwardy
--
-- This library is free software; you can redistribute it and/or
-- modify it under the terms of the GNU Lesser General Public
-- License as published by the Free Software Foundation; either
-- version 2.1 of the License, or (at your option) any later version.
--
-- This library is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-- Lesser General Public License for more details.
--
-- You should have received a copy of the GNU Lesser General Public
-- License along with this library; if not, write to the Free Software
-- Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA

npc_villager = {
	INNKEEPER = "INNKEEPER",
	FARMER = "FARMER",
}

dofile(minetest.get_modpath("npc_villager") .. "/npcf_statemachine.lua")
dofile(minetest.get_modpath("npc_villager") .. "/states.lua")

npcf:register_npc("npc_villager:villager", {
	description = "Villager",
	textures = {"npcf_info_skin.png"},
	metadata = {
		infotext = "Infotext."
	},
	title = {
		text = "Villager",
		color = "#00aaff",
	},
	inventory_image = "npcf_info_inv.png",
	on_rightclick = function(self, clicker)
		print("[npc_villager] on_rightclick!")
		local npc = npcf.npcs[self.npc_id]
		local state = npc.npc_state
		return state and state.on_rightclick and state:on_rightclick(npc, clicker)
	end,
	on_punch = function(self, hitter)
		print("[npc_villager] on_punch!")
		local npc = npcf.npcs[self.npc_id]
		local state = npc.npc_state
		return state and state.on_punch and state:on_punch(npc, hitter)
	end,
	on_step = function(self, dtime)
		print("[npc_villager] on_step!")
		local npc = npcf.npcs[self.npc_id]
		local state = npc.npc_state
		return state and state.on_step and state:on_step(npc, dtime)
	end,
	on_activate = function(self)
		print("[npc_villager] on_activate!")
		if not self.set_state then
			print(" - no self.set_state")
		end
		local npc = npcf.npcs[self.npc_id]
		local state = npc.npc_state
		return state and state.on_activate and state:on_activate(npc)
	end,
	on_construct = function(npc)
		if not npc.set_state then
			error("[npc_villager] npc.set_state does not exist!")
		end
		npc:set_state(npc_villager.create_idle_state())

		-- TODO: implement auto spawning and remove this
		npc.role = npc_villager.INNKEEPER

		local state = npc.npc_state
		return state and state.on_construct and state:on_construct(npc)
	end,
	on_destruct = function(npc)
		print("[npc_villager] on_destruct!")
		local state = npc.npc_state
		return state and state.on_destruct and state:on_destruct(npc)
	end,
	on_save = function(npc, to_save)
		print("[npc_villager] on_save!")
		local state = npc.npc_state
		return state and state.on_save and state:on_save(npc, to_save)
	end,
	on_update = function(npc)
		print("[npc_villager] on_update")
		local state = npc.npc_state
		return state and state.on_update and state:on_update(npc)
	end,
	on_tell = function(npc, sender, message)
		print("[npc_villager] on_tell")
		local state = npc.npc_state
		return state and state.on_tell and state:on_tell(npc, sender, message)
	end,
	on_receive_fields = function(self, fields, sender)
		print("[npc_villager] on_receive_fields")
		local npc = npcf.npcs[self.npc_id]
		local state = npc.npc_state
		return state and state.on_receive_fields and state:on_receive_fields(npc, fields, sender)
	end
})
