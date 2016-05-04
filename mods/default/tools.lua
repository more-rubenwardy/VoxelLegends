minetest.register_item(":", {
	type = "none",
	wield_image = "wieldhand.png",
	wield_scale = {x=1,y=1,z=2.5},
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level = 0,
		groupcaps = {
			crumbly = {times={[2]=3.00, [3]=0.70}, uses=0, maxlevel=1},
			snappy = {times={[3]=0.40}, uses=0, maxlevel=1},
			oddly_breakable_by_hand = {times={[1]=3.50,[2]=2.00,[3]=0.70}, uses=0}
		},
		damage_groups = {fleshy=2},
	}
})


minetest.register_tool("default:simple_hammer", {
	description = "Simple Hammer\n For Level: - \n Damage: 8",
	inventory_image = "default_basic_hammer.png",
	tool_capabilities = {
		max_drop_level=3,
		groupcaps= {
			cracky={times={[2]=2.00, [3]=1.00}, uses=10, maxlevel=1},
			choppy={times={[2]=1.50, [3]=1.00}, uses=20, maxlevel=1}
		},
		damage_groups = {fleshy=8},
	}
})

minetest.register_tool("default:flint_pick", {
	description = "Flint Pick\n For Level: - \n Damage: 8",
	inventory_image = "default_flint_pick.png",
	tool_capabilities = {
		max_drop_level=3,
		groupcaps= {
			cracky={times={[2]=1.50, [3]=0.80}, uses=50, maxlevel=1},
			choppy={times={[2]=1.50, [3]=1.00}, uses=20, maxlevel=1}
		},
		damage_groups = {fleshy=8},
	}
})

minetest.register_tool("default:axe_stone", {
	description = "Stone Axe\n For Level: - \n Damage: 5",
	inventory_image = "default_axe_stone.png",
	tool_capabilities = {
		max_drop_level=3,
		groupcaps= {
			cracky={times={[3]=1.50}, uses=5, maxlevel=1},
			choppy={times={[2]=3.50, [3]=1.10}, uses=10, maxlevel=1}
		},
		damage_groups = {fleshy=5},
	}
})

minetest.register_tool("default:axe", {
	description = "Axe\n For Level: - \n Damage: 13",
	inventory_image = "default_axe.png",
	tool_capabilities = {
		max_drop_level=3,
		groupcaps= {
			choppy={times={[1]=1.00, [2]=0.40, [3]=0.30}, uses=70, maxlevel=1}
		},
		damage_groups = {fleshy=13},
	}
})

minetest.register_tool("default:saw", {
	description = "Saw\n For Level: - \n Damage: 13",
	inventory_image = "default_saw.png",
	tool_capabilities = {
		max_drop_level=3,
		groupcaps= {
			choppy={times={[1]=0.30, [2]=0.20, [3]=0.10}, uses=70, maxlevel=1}
		},
		damage_groups = {fleshy=13},
	}
})

minetest.register_tool("default:pick", {
	description = "Pick\n For Level: - \n Damage: 20",
	inventory_image = "default_pick.png",
	tool_capabilities = {
		max_drop_level=3,
		groupcaps= {
			cracky={times={[1]=1.90, [2]=0.50, [3]=0.30}, uses=50, maxlevel=1},
			choppy={times={[2]=3.50, [3]=1.10}, uses=50, maxlevel=1}
		},
		damage_groups = {fleshy=20},
	}
})

minetest.register_tool("default:shovel", {
	description = "Shovel\n For Level: - \n Damage: 7",
	inventory_image = "default_shovel.png",
	tool_capabilities = {
		max_drop_level=3,
		groupcaps= {
			crumbly={times={[1]=0.90, [2]=0.40, [3]=0.20}, uses=100, maxlevel=1}
		},
		damage_groups = {fleshy=7},
	}
})

minetest.register_tool("default:blade", {
	description = "Blade\n Level: - \n Damage: 10",
	inventory_image = "default_blade.png",
	tool_capabilities = {
		max_drop_level=3,
		groupcaps= {
			leaves={times={[1]=0.50}, uses=1000, maxlevel=1}
		},
		damage_groups = {fleshy=10},
	}
})

minetest.register_tool("default:knife", {
	description = "Knife\n Level: - \n Damage: 12",
	inventory_image = "default_knife.png",
	tool_capabilities = {
		max_drop_level=3,
		groupcaps= {
			leaves={times={[1]=0.10}, uses=1000, maxlevel=1},
			choppy={times={[3]=2.00}, uses=50, maxlevel=1}
		},
		damage_groups = {fleshy=12},
	}
})

minetest.register_tool("default:knife_big", {
	description = "Knife (big)\n Level: - \n Damage: 15",
	inventory_image = "default_knife.png",
	wield_scale = {x = 1.5, y=1.5, z = 1},
	tool_capabilities = {
		max_drop_level=3,
		groupcaps= {
			leaves={times={[1]=0.05}, uses=1000, maxlevel=1},
			choppy={times={[3]=2.00}, uses=50, maxlevel=1}
		},
		damage_groups = {fleshy=15},
	}
})

minetest.register_tool("default:shears", {
	description = "Shears",
	inventory_image = "default_shears.png",
	tool_capabilities = {
		max_drop_level=3,
		groupcaps= {
			leaves={times={[1]=0.10}, uses=1000, maxlevel=1},
			choppy={times={[3]=2.00}, uses=50, maxlevel=1}
		}
	}
})
