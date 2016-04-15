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
