pets.register_pet("wolf:wolf", {
	description  = "wolf",
	hp_max = 30,
	collisionbox = {-0.3,-0.5,-0.3, 0.3,0.1,0.3},
	mesh = "wolf_wolf.x",
	textures = {"wolf_black.png",},
	animations = {
		walk = {x=80, y=100},
		sit = {x=0, y=80}
	},
	food = "fishing:fish",
})
