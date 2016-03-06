mobs = {}
function mobs.get_velocity(v, yaw, y)
	local x = -math.sin(yaw) * v
	local z =  math.cos(yaw) * v
	return {x = x, y = y, z = z}
end

function mobs.register_mob(name, def)
	minetest.register_entity(name, {
		hp_max = def.hp,
		physical = true,
		collisionbox = def.collisionbox,
	 	visual = "mesh",
		mesh = def.mesh,
	 	visual_size = {x=1, y=1},
		textures = def.textures,
		spritediv = {x=1, y=1},
		initial_sprite_basepos = {x=0, y=0},	
		is_visible = true,
		makes_footstep_sound = false,
		automatic_rotate = true,
		speed = 0,
		on_step = function(self, dtime)
			if math.random(0, 50) == 15 then 
				self.object:setvelocity({x=math.random(-2, 2), y=-4, z=math.random(-2, 2)})
				
				local all_objects = minetest.get_objects_inside_radius(self.object:getpos(), def.range)
				local _,obj
				for _,obj in ipairs(all_objects) do
					if obj:is_player() then
						print("[mob] PUNCH")
						obj:punch(self.object, 10, def.dmg, nil) 
					end
				end
			end
		end,
	})

	minetest.register_craftitem(name, {
		description = def.description,
		inventory_image = "mobs_spawn.png",

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

mobs.register_mob("mobs:angry_player", {
	mesh = "character.x",
	textures = {"character.png",},
	hp = 40,
	dmg = {
		full_punch_interval = 0.9,
		max_drop_level = 0,
		groupcaps = {
		},
		damage_groups = {friendly=3},
	},
	collisionbox = {-0.3, -1, -0.3, 0.3, 0.5, 0.3},
	description = "Angry Player",
	range = 3,
})
