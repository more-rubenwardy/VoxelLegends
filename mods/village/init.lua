minetest.register_on_generated(function(minp, maxp, seed)
	local vm, emin, emax = minetest.get_mapgen_object("voxelmanip")
	local area = VoxelArea:new{MinEdge=emin, MaxEdge=emax}
	local data = vm:get_data()

	local heightmap = minetest.get_mapgen_object("heightmap")

	local c_air = minetest.get_content_id("air")
	local c_stonebrick = minetest.get_content_id("default:stonebrick")
	local c_wood = minetest.get_content_id("default:wood")
	local c_wooden_planks = minetest.get_content_id("default:wooden_planks")
	local c_wooden_planks_2 = minetest.get_content_id("default:wooden_planks_2")
	local c_jungletree = minetest.get_content_id("default:jungle_tree")

	local c_glass = minetest.get_content_id("default:glass")

	local perlin1 = minetest.get_perlin(11,3, 0.5, 1)
	local perlin2 = minetest.get_perlin(11,3, 0.5, 100)

	local h_index = 0

	local first_height = math.floor(heightmap[1]/4)*4

	for z = minp.z, maxp.z do
		for x = minp.x, maxp.x do
			h_index = h_index+1
			for y = minp.y, maxp.y do
				local pos = area:index(x, y, z)
				-- TODO : I think this is very slow...
				local part = {x=math.floor(x/10)*10, y=math.floor(y/4)*4, z=math.floor(z/10)*10}
				local h_part = math.floor(heightmap[h_index]/4)*4

				local height = heightmap[h_index]
				if perlin2:get2d({x=part.x, y=part.z}) > 0.9 then
					if vector.equals({x=x, y=y, z=z}, part) then
						first_height = math.floor(heightmap[h_index]/4)*4
					end
					if math.abs(perlin1:get2d({x=part.x, y=part.z})) > 0.7 then
						if y < 8 + first_height and y > height then
							if y > -1 and x > part.x and z > part.z and x < part.x+9 and z < part.z+9 then
								-- walls
								if part.x+1 == x then
									data[pos] = c_wooden_planks
								end
								if part.z+1 == z then
									data[pos] = c_wooden_planks
								end

								if part.x+8 == x then
									data[pos] = c_wooden_planks
								end
								if part.z+8 == z then
									data[pos] = c_wooden_planks
								end

								-- roof/floor
								if part.y+3 == y then
									data[pos] = c_wooden_planks_2
								end
								
								-- jungletree
								if part.z+1 == z and part.x+1 == x then
									data[pos] = c_jungletree
								end
								if part.z+8 == z and part.x+1 == x then
									data[pos] = c_jungletree
								end
								if part.z+1 == z and part.x+8 == x then
									data[pos] = c_jungletree
								end
								if part.z+8 == z and part.x+8 == x then
									data[pos] = c_jungletree
								end
							elseif height == y then
								data[pos] = c_stonebrick
							else
								data[pos] = c_air
							end
						end
					else
						if height == y then
							data[pos] = c_stonebrick
						end
					end
				end
			end
		end
	end

	vm:set_data(data)
	--vm:set_lighting({day=0, night=0})
	vm:calc_lighting()
	vm:write_to_map(data)
	vm:update_liquids()
end)
