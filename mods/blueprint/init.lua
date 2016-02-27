blueprint = {}
blueprint.all = {}

function blueprint.register_blueprint(name, def)
	table.insert(def.materials, "blueprint:"..name)
	table.insert(blueprint.all, "blueprint:"..name)

	minetest.register_craftitem(":blueprint:"..name, {
		description = "Blueprint : " .. def.description,
		inventory_image = "blueprint_blueprint.png^[colorize:"..def.color..":80",
	})

	minetest.register_craft({
		type = "shapeless",
		output = def.out,
		recipe = def.materials,
		replacements = {
			{"blueprint:"..name, "blueprint:"..name}
		}
	})
end

minetest.register_craftitem("blueprint:empty", {
	description = "Empty Blueprint",
	inventory_image = "blueprint_empty.png",
})
