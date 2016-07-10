default = {}

local modpath = minetest.get_modpath("default")

LIGHT_MAX = 14
default.LIGHT_MAX = LIGHT_MAX

dofile(modpath.."/functions.lua")
dofile(modpath.."/player.lua")
dofile(modpath.."/craftitems.lua")
dofile(modpath.."/nodes.lua")
dofile(modpath.."/tools.lua")
dofile(modpath.."/craft.lua")
dofile(modpath.."/mapgen.lua")
