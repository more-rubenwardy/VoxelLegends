local function get_velocity(v, yaw, y)
	local x = -math.sin(yaw) * v
	local z =  math.cos(yaw) * v
	return {x = x, y = y, z = z}
end

minetest.register_entity("pets:pig", {
	hp_max = 30,
	physical = true,
	collisionbox = {-0.5,-0.5,-0.5, 0.5,0.5,0.5},
 	visual = "mesh",
 	visual_size = {x=1, y=1},
	mesh = "pets_pig.x",
	textures = {"pets_pig.png",},
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
		cmsg.push_message_player(puncher, "[pet] pig")
	end,

	on_step = function(self, dtime)
		if self.pl ~= nil then
			if vector.distance(self.object:getpos(), self.pl:getpos()) > 2 then 
				local vec = vector.direction(self.object:getpos(), self.pl:getpos())
				vec.y = vec.y * 10
				self.object:setvelocity(vector.multiply(vec, 3))
				local yaw = math.atan(vec.z/vec.x)+math.pi/2
				yaw = yaw+(math.pi/2)
				if self.pl:getpos().x > self.object:getpos().x then
					yaw = yaw+math.pi
				end
				self.object:setyaw(yaw)
			end
		else
			if math.random(0, 50) == 15 then 
				local vec = {x=math.random(-3, 3), y=-4, z=math.random(-3, 3)}
				self.object:setvelocity(vec)
				local yaw = math.atan(vec.z/vec.x)+math.pi/2
				yaw = yaw+(math.pi/2)
				if vec.x + self.object:getpos().x > self.object:getpos().x then
					yaw = yaw+math.pi
				end
				self.object:setyaw(yaw)
			end
		end
	end,
})

minetest.register_craftitem("pets:pig", {
	description = "Pig",
	inventory_image = "pets_pig_spawn.png",

	on_place = function(itemstack, placer, pointed_thing)
		if pointed_thing.type ~= "node" then
			return
		end
		minetest.add_entity(pointed_thing.above, "pets:pig")
		if not minetest.setting_getbool("creative_mode") then
			itemstack:take_item()
		end
		return itemstack
	end,
})
