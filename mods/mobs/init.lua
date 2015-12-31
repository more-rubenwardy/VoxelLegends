local function get_velocity(v, yaw, y)
	local x = -math.sin(yaw) * v
	local z =  math.cos(yaw) * v
	return {x = x, y = y, z = z}
end

minetest.register_entity("mobs:angry_block", {
	hp_max = 30,
	physical = true,
	collisionbox = {-0.5,-0.5,-0.5, 0.5,0.5,0.5},
 	visual = "cube",
 	visual_size = {x=1, y=1},
	textures = {"mobs_angry_block_top.png", "mobs_angry_block_top.png", "mobs_angry_block.png", "mobs_angry_block.png", "mobs_angry_block.png", "mobs_angry_block.png"},
	spritediv = {x=1, y=1},
	initial_sprite_basepos = {x=0, y=0},	
	is_visible = true,
	makes_footstep_sound = false,
	automatic_rotate = true,
	speed = 0,
	pl = nil,

	on_punch = function(self, puncher, time_from_last_punch, tool_capabilities, direction)
		if not puncher or not puncher:is_player() then
			return
		end
		self.pl = puncher
	end,

	on_step = function(self, dtime)
		if math.random(0, 50) == 15 then 
			self.object:setvelocity({x=math.random(-2, 2), y=-1, z=math.random(-2, 2)})
			
			if self.pl ~= nil then
				self.pl:set_hp(self.pl:get_hp()-3)
				if vector.distance(self.object:getpos(), self.pl:getpos()) > 5 then 
					self.pl = nil
				end
			end
		end
	end,
})

minetest.register_craftitem("mobs:angry_block", {
	description = "Angry Block",
	inventory_image = "[inventorycube{mobs_angry_block_top.png{mobs_angry_block.png{mobs_angry_block.png",

	on_place = function(itemstack, placer, pointed_thing)
		if pointed_thing.type ~= "node" then
			return
		end
		minetest.add_entity(pointed_thing.above, "mobs:angry_block")
		if not minetest.setting_getbool("creative_mode") then
			itemstack:take_item()
		end
		return itemstack
	end,
})
