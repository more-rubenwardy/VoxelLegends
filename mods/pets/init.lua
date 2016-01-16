pets = {}
pets.players_pets = {}

local function get_velocity(v, yaw, y)
	local x = -math.sin(yaw) * v
	local z =  math.cos(yaw) * v
	return {x = x, y = y, z = z}
end

function pets.register_pet(name, def)
	minetest.register_entity(name, {
		hp_max = def.hp_max,
		physical = true,
		collisionbox = def.collisionbox,
	 	visual = "mesh",
	 	visual_size = {x=1, y=1},
		mesh = def.mesh,
		textures = def.textures,
		spritediv = {x=1, y=1},
		initial_sprite_basepos = {x=0, y=0},	
		is_visible = true,
		makes_footstep_sound = false,
		automatic_rotate = true,
		speed = 0,
		pl = nil,

		on_rightclick = function(self, clicker)
			if not clicker or not clicker:is_player() then
				return
			end
			if pets.players_pets[clicker:get_player_name()] then
				cmsg.push_message_player(clicker, "[pet] You already have a pet!")
			else
				pets.players_pets[clicker:get_player_name()] = name
				cmsg.push_message_player(clicker, "[pet] + ".. def.description)
				self.pl = clicker
			end
		end,

		on_step = function(self, dtime)
			if self.pl ~= nil then
				if self.pl:getpos() then
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
					if vector.distance(self.object:getpos(), self.pl:getpos()) > 15 then 
						local vec = self.pl:getpos()
						vec.x = vec.x + math.random(-3, 3)
						vec.z = vec.z + math.random(-3, 3)
						vec.y = vec.y + 3
						self.object:setpos(vec)
					end
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

	minetest.register_craftitem(name, {
		description = def.description,
		inventory_image = "pets_"..def.description.."_spawn.png",

		on_place = function(itemstack, placer, pointed_thing)
			if pointed_thing.type ~= "node" then
				return
			end
			minetest.add_entity(pointed_thing.above, name)
			if not minetest.setting_getbool("creative_mode") then
				itemstack:take_item()
			end
			return itemstack
		end,
	})
end 

pets.register_pet("pets:pig", {
	description  = "pig",
	hp_max = 30,
	collisionbox = {-0.5,-0.5,-0.5, 0.5,0.5,0.5},
	mesh = "pets_pig.x",
	textures = {"pets_pig.png",},
})
