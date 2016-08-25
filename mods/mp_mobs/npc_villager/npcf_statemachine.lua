if not npcf.create_state then
	function npcf:create_state(name)
		if not name then
			error("[npcf] States must have a name, even if it's an empty name")
		end
		return {
			name = name,

			-- now in this state
			load = function(self) end,

			-- moving to another state
			unload = function(self) return true end,

			-- callbacks
			on_rightclick = function(self, npc, clicker) end,
			on_punch = function(self, npc, hitter) end,
			on_step = function(self, npc, dtime) end,
			on_activate = function(self, npc) end,
			on_destruct = function(self, npc) end,
			on_save = function(self, npc, to_save) end,
			on_update = function(self, npc) end,
			on_tell = function(self, npc, sender, message) end,
			on_receive_fields = function(self, npc, fields, sender) end,
		}
	end

	npcf.npc.npc_state = npcf:create_state("")

	function npcf.npc:set_state(state)
		if not self.npc_state or self.npc_state.unload(self) then
			self.npc_state = state
			self.npc_state.load(self)
		end
	end
end
