minetest.register_node("torch:torch", {
	description = "Torch",
	tiles = {"torch_wood.png"},
	drawtype = "mesh",
	mesh = "torch_torch.obj",
	groups = {crumbly = 3},
	paramtype = "light",
	paramtype2 = "facedir",
	light_source = 14,
	walkable = false,
	inventory_image = "torch_torch_inv.png",
	--wield_image = "torch_torch_inv.png",
})

minetest.register_abm({
	nodenames = {"torch:torch"},
	interval = 10.0,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		pos.y = pos.y + 0.2
		minetest.add_particlespawner({
			amount = 10,
			time = 10,
			minpos = pos,
			maxpos = pos,
			minvel = {x=0, y=0.1, z=0},
			maxvel = {x=0, y=0, z=0},
			minacc = {x=0, y=0, z=0},
			maxacc = {x=0, y=0, z=0},
			minexptime = 1,
			maxexptime = 1,
			minsize = 1,
			maxsize = 1,
			collisiondetection = false,
			vertical = false,
			texture = "torch_flame.png",
		})
		minetest.add_particlespawner({
			amount = 50,
			time = 10,
			minpos = pos,
			maxpos = pos,
			minvel = {x=0, y=0.5, z=0},
			maxvel = {x=0, y=0, z=0},
			minacc = {x=0, y=0, z=0},
			maxacc = {x=0, y=0, z=0},
			minexptime = 1,
			maxexptime = 1,
			minsize = 3,
			maxsize = 3,
			collisiondetection = false,
			vertical = false,
			texture = "torch_smoke.png",
		})
	end,
})

minetest.register_craft({
	output = "torch:torch",
	recipe = {
		{"", "default:coal_lump", ""},
		{"", "default:string_strong", ""},
		{"", "default:stick", ""},
	}
})
