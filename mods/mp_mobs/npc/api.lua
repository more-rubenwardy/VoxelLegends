npc = {
}

function npc.new(name, def)
	if not name or not def then
		error("Incorrect params to npc.new(name, def)")
	end

	return npc.extend(npc.prototype, name, def)
end

function npc.extend(parent, name, def)
	if not parent or not name or not def then
		error("Incorrect params to NPC. npc.extend(parent, name, def)")
	end

	local tmp = {}
	for key, value in pairs(parent) do
		tmp[key] = value
	end
	for key, value in pairs(def) do
		tmp[key] = value
	end
	print(dump(tmp))
	mobs:register_mob(name, tmp)
	mobs:register_egg(name, name, "default_stone.png", 1)

	return tmp
end

npc.prototype = {
	type = "npc",
	passive = false,
	damage = 3,
	attack_type = "dogfight",
	attacks_monsters = true,
	pathfinding = true,
	hp_min = 10,
	hp_max = 20,
	armor = 100,
	collisionbox = {-0.35,-1.0,-0.35, 0.35,0.8,0.35},
	visual = "mesh",
	mesh = "mobs_basic_npc.b3d",
	drawtype = "front",
	textures = {
		{"mobs_npc.png"},
		{"mobs_npc2.png"}, -- female by nuttmeg20
	},
	child_texture = {
		{"mobs_npc_baby.png"}, -- derpy baby by AmirDerAssassine
	},
	makes_footstep_sound = true,
	sounds = {},
	walk_velocity = 2,
	run_velocity = 3,
	jump = true,
	drops = {
		{name = "default:wood", chance = 1, min = 1, max = 3},
		{name = "default:apple", chance = 2, min = 1, max = 2},
		{name = "default:axe_stone", chance = 5, min = 1, max = 1},
	},
	water_damage = 0,
	lava_damage = 2,
	light_damage = 0,
	-- follow = {"farming:bread", "mobs:meat", "default:diamond"},
	view_range = 15,
	owner = "",
	order = "stand",
	fear_height = 3,
	animation = {
		speed_normal = 30,
		speed_run = 30,
		stand_start = 0,
		stand_end = 79,
		walk_start = 168,
		walk_end = 187,
		run_start = 168,
		run_end = 187,
		punch_start = 200,
		punch_end = 219,
	},
	say = function(self, clicker, msg)
		minetest.chat_send_player(clicker:get_player_name(), msg)
	end
}
