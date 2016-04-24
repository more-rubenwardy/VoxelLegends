function default.drop_items(pos, oldnode, oldmetadata, digger)
	local meta = minetest.get_meta(pos)
	meta:from_table(oldmetadata)
	local inv = meta:get_inventory()
	for i = 1, inv:get_size("main") do
		local stack = inv:get_stack("main", i)
		if not stack:is_empty() then
			local p = {	x = pos.x + math.random(0, 5)/5 - 0.5,
					y = pos.y, 
					z = pos.z + math.random(0, 5)/5 - 0.5
				  }
			minetest.add_item(p, stack)
		end
	end
end

default.sounds = {}

function default.sounds.wood(t)
	t = t or {}
	t.dug = table.dug or
			{name = "default_wood_1", gain = 0.25}
	t.place = table.place or
			{name = "default_wood_1", gain = 0.7}
	t.footstep = t.footstep or
			{name = "default_stone_2", gain = 0.1}
	return t
end

function default.sounds.stone(t)
	t = t or {}
	t.dug = table.dug or
			{name = "default_stone_2", gain = 0.2}
	t.place = table.place or
			{name = "default_stone_1", gain = 0.5}
	t.footstep = t.footstep or
			{name = "default_stone_2", gain = 0.2}
	return t
end

function default.sounds.dirt(t)
	t = t or {}
	t.dug = table.dug or
			{name = "default_dirt_1", gain = 0.25}
	t.place = table.place or
			{name = "default_dirt_1", gain = 0.5}
	t.footstep = t.footstep or
			{name = "default_dirt_1", gain = 0.1}
	return t
end
